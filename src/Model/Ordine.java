package Model;

import java.io.Serializable;
import java.util.Date;

public class Ordine implements Serializable {
	private static final long serialVersionUID = 1L;

	int id;
	Date data;
	double importo;
	boolean spedito;
	String username;
	
	public Ordine(){
		id=0;
		data=null;
		importo=0;
		spedito=false;
		username="";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public double getImporto() {
		return importo;
	}

	public void setImporto(double importo) {
		this.importo = importo;
	}

	public boolean isSpedito() {
		return spedito;
	}

	public void setSpedito(boolean spedito) {
		this.spedito = spedito;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Ordine [id=" + id + ", data=" + data + ", importo=" + importo + ", spedito=" + spedito + ", username="
				+ username + "]";
	}
	
	
	
}
