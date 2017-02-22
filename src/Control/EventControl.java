package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import ConnectionPool.ConnessioneCircolo;
import Model.Evento;
import Model.ProductModel;
import Model.ProductModelDM;

/**
 * Servlet implementation class EventControl
 */
@WebServlet("/EventControl")
public class EventControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static ProductModel model=new ProductModelDM();

	
    public EventControl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azione=request.getParameter("azione");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("nome");   //nome evento
		System.out.println("name"+name);
		try{
			
			if(azione.equalsIgnoreCase("inserisci")){
				ConnessioneCircolo connection=new ConnessioneCircolo();
				PreparedStatement preparedStatement = null;
				String insertSQL="INSERT INTO EVENTO VALUES(?,?,?)";
				connection.getConnection();		
				preparedStatement=connection.prepareStatement(insertSQL);
				preparedStatement.setString(1, request.getParameter("Nome"));
				preparedStatement.setString(2, request.getParameter("Data"));
				preparedStatement.setString(3, request.getParameter("Descrizione"));
				
				preparedStatement.executeUpdate();
				connection.close();
				response.sendRedirect("/PROGETTO_CIRCOLO/Eventi.jsp");
			}
			
			if(azione.equalsIgnoreCase("cancella")){
				name=name+("e");
				if(model.doDelete(name)){     //collegato a PRODUCT MODEL	
					response.sendRedirect("/PROGETTO_CIRCOLO/Eventi.jsp");
					}
			}
			
			if(azione.equalsIgnoreCase("modifica")){
				name=name+("e");
				request.removeAttribute("evento");              //svuotiamo per poi riempire l'oggetto evento
				request.setAttribute("evento", model.doRetrieveByKey(name)); //setta il nuovo attributo evento,gli viene passato il nome evento
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Eventi.jsp");
				dispatcher.forward(request, response);
			}
			
			if(azione.equalsIgnoreCase("confermamodifica")){
				ConnessioneCircolo connection=new ConnessioneCircolo();
				PreparedStatement preparedStatement = null;
				String updateSQL="UPDATE EVENTO set Nome=?,Descrizione=?,Data=? WHERE Nome=? ";
				connection.getConnection();		
				preparedStatement=connection.prepareStatement(updateSQL);
				preparedStatement.setString(1, request.getParameter("Nome"));
				preparedStatement.setString(2, request.getParameter("Descrizione"));
				preparedStatement.setString(3, request.getParameter("Data"));
				preparedStatement.setString(4, name);

				preparedStatement.executeUpdate();
				connection.close();
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Eventi.jsp");
				dispatcher.forward(request, response);				
				
			}
			
		}catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
