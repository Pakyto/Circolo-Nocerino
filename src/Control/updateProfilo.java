package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ConnectionPool.ConnessioneCircolo;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class qwed
 */
@WebServlet("/update")
public class updateProfilo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProfilo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String azione = request.getParameter("azione");
		String username = request.getParameter("Username");
		System.out.println(azione);
		System.out.println(username);
		try{
			if(azione.equalsIgnoreCase("modifica")){
				ConnessioneCircolo conn = new ConnessioneCircolo();
				PreparedStatement pr = null;
				String update = "UPDATE SOCIO set Email=?, Password=? WHERE Username=?";
				conn.getConnection();
				pr=conn.prepareStatement(update);
				pr.setString(1, request.getParameter("Email"));
				pr.setString(2, request.getParameter("Password"));
				pr.setString(3, username);
				
				pr.executeUpdate();
				response.sendRedirect("/PROGETTO_CIRCOLO/profilo.jsp");
			}
			
		}catch(SQLException e){
			System.out.println("ERRORE"+e.getMessage());
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
