package Control;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 	 
	    public void doGet(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	 
	    }
	    
	    public void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        								              // vengono presi gli attributi dalla form jsp
	        String user = req.getParameter("Username");
	        String pw = req.getParameter("Password");
	        
	     // Stampa a console
	        System.out.println("user Name-" + user);
	        System.out.println("user Pass-" + pw);
	    
	        PrintWriter out =resp.getWriter();
			

	        try {
				if(CheckLogin.validate(user, pw)){                    //crea la sessione utente 
					HttpSession session = req.getSession(true);
					session.setAttribute("Username", user);         
					session.setAttribute("Password",pw);
					if(user != null){
						System.out.println("Utente loggato");
						session.setMaxInactiveInterval(600);           //10 minuti
					}else{
							System.out.println("Utente non loggato");
						}
					 out.println("<script>");
					 out.println("alert('SEI ENTRATO!')");
					 out.println("window.open('http://localhost:8080/PROGETTO_CIRCOLO/HomePage/homepage.jsp','_self')");
					 out.println("</script>");
				}
				else{
					out.println("<script>");
		            out.println("alert('USERNAME O PASSWORD NON VALIDI !')");
		            out.println("window.history.back()");
		            out.println("</script>");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
}
