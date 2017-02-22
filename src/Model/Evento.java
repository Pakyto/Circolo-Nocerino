package Model;

import java.io.Serializable;
import java.util.Date;

public class Evento implements Serializable{
	private static final long serialVersionUID = 1L;
	
	String nome;
	Date data;
	String descrizione;
	
	public Evento(){
		nome="";
		data=null;
		descrizione="";
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	@Override
	public String toString() {
		return "Evento [nome=" + nome + ", data=" + data + ", descrizione=" + descrizione + "]";
	}
	
	

}
