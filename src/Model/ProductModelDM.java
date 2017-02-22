package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import com.mysql.jdbc.PreparedStatement;

import ConnectionPool.ConnessioneCircolo;

public class ProductModelDM implements ProductModel {
	
	private static final String TABLE_NAME = "articolo";
		
	@Override
	public void doSave(Articolo product) throws SQLException {
	}

	@Override
	public boolean doDelete(String code) throws SQLException {
		ConnessioneCircolo connection=new ConnessioneCircolo();
		PreparedStatement preparedStatement = null;
		int result=0;
		String deleteSQL=null;
		int n=code.length();
		
		if(code.endsWith("e")){                //CANCELLAZIONE EVENTO
			code=code.substring(0, n-1);
			deleteSQL="DELETE FROM EVENTO WHERE NOME=? ";
			connection.getConnection();		
			preparedStatement=connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);
			result = preparedStatement.executeUpdate();
		}
		
		String x=code.substring(0, 2);
		if(x.equalsIgnoreCase("AB")){        //CANCELLAZIONE ABBIGLIAMENTO
			deleteSQL="DELETE ABBIGLIAMENTO,ARTICOLO FROM abbigliamento INNER JOIN articolo where abbigliamento.codice=?"
					+ "and articolo.codice=abbigliamento.codice";
			connection.getConnection();
			preparedStatement=connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);
			result = preparedStatement.executeUpdate();
		}
		
		if(x.equalsIgnoreCase("BI")){   //CANCELLAZIONE BIGLIETTO
			deleteSQL="DELETE BIGLIETTO,ARTICOLO FROM biglietto INNER JOIN articolo WHERE biglietto.codice=?"
					+ "and articolo.codice=biglietto.codice";
			connection.getConnection();
			preparedStatement=connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);
			result=preparedStatement.executeUpdate();
		}
		
		if(x.equalsIgnoreCase("GD")){  //CANCELLAZIONE GADGET
			deleteSQL="DELETE GADGET,ARTICOLO FROM gadget INNER JOIN articolo WHERE gadget.codice=?"
					+ "and articolo.codice=gadget.codice";
			connection.getConnection();
			preparedStatement=connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);
			result=preparedStatement.executeUpdate();
		}
		connection.close();
		return (result != 0);
	}		
	

	@Override
	public <T> T doRetrieveByKey(String code) throws SQLException {   //restituisce un oggetto in base all'id
		ConnessioneCircolo connection=new ConnessioneCircolo();
		PreparedStatement preparedStatement = null;		
		connection.getConnection();
		String selectSQL="";

		int n=code.length();
		if(code.endsWith("e")){    //evento
		   code=code.substring(0, n-1);
		   selectSQL="SELECT * FROM EVENTO WHERE Nome=?";
		   Evento ev=new Evento();
		   preparedStatement=connection.prepareStatement(selectSQL);
		   preparedStatement.setString(1, code);
		   ResultSet rs=preparedStatement.executeQuery();
		   
		   while(rs.next()){
			   ev.setNome(rs.getString("nome"));
			   ev.setDescrizione(rs.getString("descrizione"));
			   ev.setData(rs.getDate("data"));
		   }
		   return (T) ev;      //restituisce l'evento  che abbiamo selezionato
		}
		
		else{
		char d=code.charAt(0);
		if(d=='B'){
			 selectSQL = "SELECT b.nome,a.* FROM articolo as a , biglietto as b WHERE b.codice=? and a.codice =b.codice";
			 Biglietto art=new Biglietto();
			 preparedStatement=connection.prepareStatement(selectSQL);
			 preparedStatement.setString(1, code);
				ResultSet rs = preparedStatement.executeQuery();

				while(rs.next()){
					art.setCodice(rs.getString("codice"));
					art.setNome(rs.getString("nome"));
					art.setDescrizione(rs.getString("descrizione"));
					art.setPrezzo(rs.getDouble("prezzo"));
					art.setQuantità(rs.getInt("quantità"));
				}
				return (T) art;
		}
		if(d=='A'){
			 selectSQL = "SELECT a.* FROM articolo as a , abbigliamento as ab WHERE a.codice=? and a.codice =ab.codice";
			 Abbigliamento art=new Abbigliamento();
			 preparedStatement=connection.prepareStatement(selectSQL);
			 preparedStatement.setString(1, code);
			 ResultSet rs = preparedStatement.executeQuery();

				while(rs.next()){
					art.setCodice(rs.getString("codice"));
					art.setDescrizione(rs.getString("descrizione"));
					art.setPrezzo(rs.getDouble("prezzo"));
					art.setQuantità(rs.getInt("quantità"));
				}
				return (T) art;  
		}
		if(d=='G'){
			 selectSQL = "SELECT a.* FROM articolo as a , gadget as g WHERE g.codice=? and a.codice =g.codice";
			 Gadget art=new Gadget();
			 preparedStatement=connection.prepareStatement(selectSQL);
			 preparedStatement.setString(1, code);
				ResultSet rs = preparedStatement.executeQuery();

				while(rs.next()){
					art.setCodice(rs.getString("codice"));
					art.setDescrizione(rs.getString("descrizione"));
					art.setPrezzo(rs.getDouble("prezzo"));
					art.setQuantità(rs.getInt("quantità"));
				}
				return (T) art;
		}
		connection.close();
		}
		connection.close();
		return null;
	}

	
	@Override
	public <T> Collection<T> doRetrieveAll(String order) throws SQLException {  //restituisce elenco eventi,biglietto,abbigliamento,soci
		ConnessioneCircolo connection=new ConnessioneCircolo();
		PreparedStatement preparedStatement = null;		
		connection.getConnection();
		Collection<T> products = new LinkedList<T>();     //collezione di prodotti che possono essere eventi,biglietti o articoli
		String selectSQL="";
		
		if(order.equals("biglietto")){
			 selectSQL = "SELECT b.Nome,a.* FROM articolo as a,biglietto as b where a.codice=b.codice";
			 preparedStatement=connection.prepareStatement(selectSQL);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					Biglietto art=new Biglietto();
					art.setCodice(rs.getString("codice"));
					art.setNome(rs.getString("nome"));
					art.setDescrizione(rs.getString("descrizione"));
					art.setPrezzo(rs.getDouble("prezzo"));
					art.setQuantità(rs.getInt("quantità"));
					products.add((T) art);
				}
		}
		
		if(order.equals("abbigliamento")){
			 selectSQL = "SELECT a.* FROM articolo as a , abbigliamento as ab WHERE a.codice =ab.codice";
			 preparedStatement=connection.prepareStatement(selectSQL);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					Abbigliamento art=new Abbigliamento();
					art.setCodice(rs.getString("codice"));
					art.setDescrizione(rs.getString("descrizione"));
					art.setPrezzo(rs.getDouble("prezzo"));
					art.setQuantità(rs.getInt("quantità"));
					products.add((T) art);
				}
		}
		
		if(order.equals("gadget")){
			 selectSQL = "SELECT a.* FROM articolo as a , gadget as g WHERE a.codice =g.codice";
			 preparedStatement=connection.prepareStatement(selectSQL);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					Gadget art=new Gadget();
					art.setCodice(rs.getString("codice"));
					art.setDescrizione(rs.getString("descrizione"));
					art.setPrezzo(rs.getDouble("prezzo"));
					art.setQuantità(rs.getInt("quantità"));
					products.add((T) art);
				}
		}
		
		if(order.equals("evento")){
			 selectSQL = "SELECT * FROM EVENTO";
			 preparedStatement=connection.prepareStatement(selectSQL);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					Evento ev=new Evento();
					ev.setNome(rs.getString("nome"));
					ev.setDescrizione(rs.getString("descrizione"));
					ev.setData(rs.getDate("data"));
					products.add((T) ev);
				}
		}
		
		if(order.equals("socio")){
			selectSQL="SELECT Username,Nome,DataNascita,Cognome,CodiceFiscale,Email,Tipo,Telefono,Città,Indirizzo FROM SOCIO";
			preparedStatement=connection.prepareStatement(selectSQL);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()){
				Socio s=new Socio();
				s.setUsername(rs.getString("username"));
				s.setNome(rs.getString("nome"));
				s.setDatanascita(rs.getDate("DataNascita"));
				s.setCognome(rs.getString("cognome"));
				s.setCodicefiscale(rs.getString("codicefiscale"));
				s.setEmail(rs.getString("email"));
				s.setTipo(rs.getString("tipo"));
				s.setTelefono(rs.getString("telefono"));
				s.setCittà(rs.getString("città"));
				s.setIndirizzo(rs.getString("indirizzo"));
				products.add((T) s);
			}
			
		}
		
		connection.close();
		return products;
	}

}
