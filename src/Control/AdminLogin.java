package Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet(name = "/ProtectPage", urlPatterns = { "/admin" }, initParams = {
		@WebInitParam(name = "passwordFile", value = "passwords.properties") })
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties passwords;
	private String passwordFile;
    
	public AdminLogin() {
        super();
    }

   

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			passwordFile = config.getInitParameter("passwordFile");

			generatePasswords();

			passwords = new Properties();
			passwords.load(new FileInputStream(passwordFile));
		} catch (IOException ioe) {
		}
	}
    
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String authorization = request.getHeader("Authorization");

		if (authorization == null) {
			askForPassword(response);
		} else {
			String userInfo = authorization.substring(6).trim();
			BASE64Decoder decoder = new BASE64Decoder();
			String nameAndPassword = new String(decoder.decodeBuffer(userInfo));
			int index = nameAndPassword.indexOf(":");
			String user = nameAndPassword.substring(0, index);
			String password = nameAndPassword.substring(index + 1);
			String realPassword = passwords.getProperty(user);
			if ((realPassword != null) && (realPassword.equals(password))) {
				HttpSession s=request.getSession();
				s.setAttribute("username", user);
				s.setAttribute("password", password);				
				response.sendRedirect("/PROGETTO_CIRCOLO/HomePage/homepage.jsp");
			} else {
				askForPassword(response);
			}	
		}
	}
	
	private void askForPassword(HttpServletResponse response) {
		response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		response.setHeader("WWW-Authenticate", "BASIC realm=\"privileged-few\"");
	}
	
	private void generatePasswords() {
		Properties passwords = new Properties();
		passwords.put("root", "Password_00");
		try {
			FileOutputStream out = new FileOutputStream(passwordFile);
			passwords.store(out, "Passwords");
		} catch (FileNotFoundException e) {
		} catch (IOException ie) {
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
