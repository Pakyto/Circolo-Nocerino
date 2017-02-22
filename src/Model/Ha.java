package Model;

import java.io.Serializable;

public class Ha implements Serializable {
	private static final long serialVersionUID = 1L;

	int codice;
	int id;
	int quantit�;
	
	public Ha(){
		codice=0;
		id=0;
		quantit�=0;
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

	public int getQuantit�() {
		return quantit�;
	}

	public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
	}
	
	@Override
	public String toString() {
		return "Ha [codice=" + codice + ", id=" + id + ", quantit�=" + quantit� + "]";
	}

}
