package Model;

import java.sql.SQLException;
import java.util.Collection;

public interface ProductModel {
	public void doSave(Articolo product) throws SQLException;          //salva i dati dell'oggetto corrente nel database

	public boolean doDelete(String code) throws SQLException;   //cancella dal database i dati dell'oggetto corrente
	
	public <T> T doRetrieveByKey(String code) throws SQLException;  //restituisce un oggetto Articolo (recupera i dati dell'articolo attraverso il codice)
	
	public <T> Collection<T> doRetrieveAll(String order) throws SQLException;  //restituisce l'intera collezione di articoli
}
