package ConnectionPool;

import java.sql.*;
import java.sql.Statement;
import java.sql.Connection;
import com.mysql.jdbc.PreparedStatement;
 
 
public class ConnessioneCircolo {
    private static Connection connessione;
     
    public ConnessioneCircolo(){
        try{
            Class.forName("com.mysql.jdbc.Driver");     //INSTANZAZIONE DEL DRIVER CON COMANDO newIstance();
        }
        catch(ClassNotFoundException e){
            System.out.print("ClassNotFoundException:" + e.getMessage());   
        }
    }  
      
    public Statement createStatement() throws SQLException{
    	return connessione.createStatement();
    }
    
    public PreparedStatement prepareStatement(String sql) throws SQLException{
    	return (PreparedStatement) connessione.prepareStatement(sql);
    }
    
    public void getConnection(){
        try{
        	String url= "jdbc:mysql://mysql3.gear.host:3306/circolo";
        	connessione = DriverManager.getConnection(url,"circolo","Cw8t9kHK??n0");
        	System.out.println("Connessione OK \n");
        }
        catch(SQLException e){
        	System.out.println("Connessione fallita \n");
        	System.out.println(e);
        }
    }
    public void close() throws SQLException{
    	connessione.close();
    	System.out.println("Connessione chiusa \n");

    }
}


