package Control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ConnectionPool.ConnessioneCircolo;

public class CheckLogin {
	public static boolean validate(String name, String pass) throws SQLException {	
		boolean status = false;
		
		ConnessioneCircolo connection=new ConnessioneCircolo();
		connection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ps=connection.prepareStatement("select * from socio where Username=? and password=?");
		ps.setString(1, name);
		ps.setString(2, pass);
		rs=ps.executeQuery();
		status=rs.next();  //status è falso se non esiste il determinato utente, vero altrimenti
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return status;
	}
}
