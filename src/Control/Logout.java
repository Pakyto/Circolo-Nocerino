package Control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		session.removeAttribute("username");
		session.removeAttribute("password");
		session.invalidate();
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('SEI USCITO!')");
		out.println("window.open('http://localhost:8080/PROGETTO_CIRCOLO/HomePage/homepage.jsp','_self')");
		out.println("</script>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
