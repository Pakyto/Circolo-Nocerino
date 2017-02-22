package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import ConnectionPool.ConnessioneCircolo;
import Model.Articolo;
import Model.Cart;

import java.math.BigDecimal;

@WebServlet("/Ordine")
public class Ordine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Ordine() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cart cart=(Cart)request.getSession().getAttribute("carrello");   //viene preso il carrello dalla sessione

		String azione = request.getParameter("azione");
		String username = request.getParameter("Username");

		try {
			if (azione.equalsIgnoreCase("checkout")) {
				ConnessioneCircolo conn = new ConnessioneCircolo();
				PreparedStatement pr = null;
				String insert = "INSERT INTO FATTURA(ID, Data, Importo, Spedito, Username) VALUES (0, ?, ?, 'NO', ?)";
				conn.getConnection();
				pr = conn.prepareStatement(insert);
				java.util.Date utilDate = new java.util.Date();
				java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
				
				float tot = Float.parseFloat(request.getParameter("Totale"));
				BigDecimal d = BigDecimal.valueOf(tot);
				
				pr.setDate(1, sqlDate);
				pr.setBigDecimal(2, d);
				pr.setString(3, username);
			
				pr.executeUpdate();

				String select="SELECT DISTINCT ID FROM FATTURA WHERE USERNAME=?";
				pr=conn.prepareStatement(select);
				pr.setString(1, username);
				ResultSet rs=pr.executeQuery();
				int id=0;
				while(rs.next()){
					id=rs.getInt("id");
				}
				
				for(Articolo art:cart.getItems()){
					insert = "INSERT INTO HA(Codice,ID,Quantità) VALUES (?,?, ?)";
					pr = conn.prepareStatement(insert);
					pr.setString(1, art.getCodice());
					pr.setInt(2, id);
					pr.setInt(3, cart.getOrder(art));
					pr.executeUpdate();
				}
				conn.close();
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
				dispatcher.forward(request, response);			
			}
			
			if(azione.equalsIgnoreCase("cancella")){
				String descrizione=request.getParameter("id");
				cart.delete(descrizione);    //viene richiamato il metodo delete della classe carrello
				response.sendRedirect("/PROGETTO_CIRCOLO/Cart.jsp");
			}
			
			if(azione.equalsIgnoreCase("modifica")){
				int idfatt=Integer.parseInt(request.getParameter("id"));
				System.out.println(idfatt);
				ConnessioneCircolo con=new ConnessioneCircolo();
				con.getConnection();
				String update="UPDATE FATTURA set SPEDITO='SI' WHERE id=?";
				PreparedStatement prs=con.prepareStatement(update);
				prs.setInt(1, idfatt);
				prs.executeUpdate();
				con.close();
				response.sendRedirect("/PROGETTO_CIRCOLO/ordine.jsp");
									
			}
			
		} catch (SQLException e) {
			System.out.println("ERRORE" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
