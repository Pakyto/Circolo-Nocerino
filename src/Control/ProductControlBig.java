package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import ConnectionPool.ConnessioneCircolo;
import Model.Articolo;
import Model.Cart;
import Model.ProductModel;
import Model.ProductModelDM;


@WebServlet("/productbig")
public class ProductControlBig extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static ProductModel model=new ProductModelDM();

	
    public ProductControlBig() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cart carrello=(Cart)request.getSession().getAttribute("carrello");    //creazione oggetto carrello
		if(carrello==null){
			carrello=new Cart();
			request.getSession().setAttribute("carrello",carrello);
		}
		
		String azione= request.getParameter("azione");
		
		try{
			if(azione!=null){
				if(azione.equalsIgnoreCase("aggiungialCarrello")){     
					String id=request.getParameter("id");
					int quantità=Integer.parseInt(request.getParameter("quantita"));
					PrintWriter o=response.getWriter();

					ConnessioneCircolo connessione=new ConnessioneCircolo();
					connessione.getConnection();
					String select="SELECT Quantità FROM ARTICOLO WHERE Codice=?";
					PreparedStatement prs=connessione.prepareStatement(select);
					prs.setString(1, id);
					ResultSet rs=prs.executeQuery();
					int qt=0;
					while(rs.next()){
						qt=rs.getInt("Quantità");
					}
					connessione.close();
					if(quantità>qt){
						o.println("<script>");
			            o.println("alert('la quantità scelta è maggiore di quella disponibile !')");
			            o.println("window.history.back()");
			            o.println("</script>");
					}
					
					else{
						carrello.add(model.doRetrieveByKey(id),quantità);    //viene aggiunto un articolo al carrello attraverso il suo id
					
						request.getSession().getAttribute("carrello");
						request.setAttribute("carrello", carrello);
						response.sendRedirect("/PROGETTO_CIRCOLO/Cart.jsp");
					}
					
				}else if(azione.equalsIgnoreCase("dettagli")){
					String id=request.getParameter("id");
					request.removeAttribute("biglietto");
					request.setAttribute("biglietto", model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Biglietto.jsp");
					dispatcher.forward(request, response);
					
				}else if(azione.equalsIgnoreCase("cancella")){        //viene cancellato un articolo dal database
					String id=request.getParameter("id");
					model.doDelete(id);
					response.sendRedirect("/PROGETTO_CIRCOLO/Biglietto.jsp");
					
				}else if(azione.equalsIgnoreCase("inserisci")){      //inserimento di un nuovo articolo
					String codice=request.getParameter("Codice");
					String nome=request.getParameter("Nome");
					String descrizione=request.getParameter("Descrizione");
					String quantità=request.getParameter("Quantita");
					String prezzo=request.getParameter("Prezzo");
					System.out.println("cod"+codice);
					
					int qt=Integer.parseInt(quantità);
					double prz=Double.parseDouble(prezzo);
					
					ConnessioneCircolo connection=new ConnessioneCircolo();
					connection.getConnection();
					String insertSQL = "INSERT INTO ARTICOLO(Codice, Descrizione, Quantità, Prezzo) VALUES (?, ?, ?, ?)";
					
					PreparedStatement preparedStmt=connection.prepareStatement(insertSQL);
					preparedStmt.setString(1,codice);
					preparedStmt.setString(2, descrizione);
					preparedStmt.setInt(3, qt);
					preparedStmt.setDouble(4, prz);
					preparedStmt.executeUpdate();
					
					insertSQL="INSERT INTO BIGLIETTO (Codice,Nome) VALUES(?,?)";
					preparedStmt=connection.prepareStatement(insertSQL);
					preparedStmt.setString(1, codice);
					preparedStmt.setString(2, nome);
					preparedStmt.executeUpdate();
					connection.close();
					response.sendRedirect("/PROGETTO_CIRCOLO/Biglietto.jsp");

				}else if(azione.equalsIgnoreCase("modifica")){    //viene aggiornato un prodotto
					String id=request.getParameter("id");
					request.removeAttribute("biglietto");
					request.setAttribute("biglietto", model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Biglietto.jsp");
					dispatcher.forward(request, response);
				
				}else if(azione.equalsIgnoreCase("confermamodifica")){
					String id=request.getParameter("id");
					ConnessioneCircolo connection=new ConnessioneCircolo();
					PreparedStatement preparedStatement = null;
					connection.getConnection();
					String updateSQL="UPDATE ARTICOLO set Descrizione=?,Prezzo=?,Quantità=?  WHERE Codice=?";
					preparedStatement=connection.prepareStatement(updateSQL);
					preparedStatement.setString(1, request.getParameter("Descrizione"));
					preparedStatement.setString(2, request.getParameter("Prezzo"));
					preparedStatement.setString(3, request.getParameter("Quantita"));
					preparedStatement.setString(4, id);
					
					preparedStatement.executeUpdate();
					
					updateSQL="UPDATE BIGLIETTO set Nome=? WHERE Codice=?";
					preparedStatement=connection.prepareStatement(updateSQL);
					preparedStatement.setString(1, request.getParameter("Nome"));
					preparedStatement.setString(2, id);
					preparedStatement.executeUpdate();
					connection.close();
					response.sendRedirect("/PROGETTO_CIRCOLO/Biglietto.jsp");

				}
			}
		}catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
}
