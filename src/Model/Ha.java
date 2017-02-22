package Model;

import java.io.Serializable;

public class Ha implements Serializable {
	private static final long serialVersionUID = 1L;

	int codice;
	int id;
	int quantità;
	
	public Ha(){
		codice=0;
		id=0;
		quantità=0;
	}

	public int getCodice() {
		return codice;
	}

	public void setCodice(int codice) {
		this.codice = codice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantità() {
		return quantità;
	}

	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}
	
	@Override
	public String toString() {
		return "Ha [codice=" + codice + ", id=" + id + ", quantità=" + quantità + "]";
	}

}
