package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ConnectionPool.ConnessioneCircolo;

@WebServlet("/Registrationservlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("Username");
		String nome = req.getParameter("Nome");
		String cognome = req.getParameter("Cognome");
		String datanascita = req.getParameter("Data di nascita");
		String codicefiscale = req.getParameter("CodiceFiscale");
		String email = req.getParameter("Email");
		String tipo = req.getParameter("Tipo");
		String telefono = req.getParameter("Telefono");
		String città = req.getParameter("Citta");
		String password = req.getParameter("Password");
		String indirizzo = req.getParameter("Indirizzo");

		ConnessioneCircolo connection = new ConnessioneCircolo();
		try {
			connection.getConnection();
			System.out.println("Connessione OK");

			String sql = "INSERT INTO SOCIO"
					+ "(Username,Nome,DataNascita,Cognome,CodiceFiscale,Email,Tipo,Telefono,Città,Indirizzo,Password)"
					+ "VALUES('" + username + "','" + nome + "','" + datanascita + "','" + cognome + "','"
					+ codicefiscale + "','" + email + "','" + tipo + "','" + telefono + "','" + città + "','" +indirizzo +"','" + password
					+ "')";

			Statement stmt = null;
			stmt = connection.createStatement();
			stmt.executeUpdate(sql);
			connection.close();
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogin");
			dispatcher.forward(req, resp);

		} catch (SQLException e) {
			PrintWriter out = resp.getWriter();

			out.println("<script>");
			out.println("alert('ERRORE username già esistente')");
			out.println("window.history.back()");
			out.println("</script>");
			e.printStackTrace();
		}

	}
}
