package Model;

import java.io.Serializable;

public class Articolo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	String codice;
	String descrizione;
	int quantit�;
	double prezzo;
	
	public Articolo(){
		codice="";
		descrizione="";
		quantit�=0;
		prezzo=0;
	}

	public String getCodice(){
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getQuantit�() {
		return quantit�;
	}

	public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	@Override
	public String toString() {
		return "Articolo [codice=" + codice + ", descrizione=" + descrizione + ", quantit�=" + quantit� + ", prezzo=" + prezzo
				+ "]";
	}
	
	public boolean equals(Object o){
		if(!(o instanceof Articolo))
			return false;
		Articolo a=(Articolo)o;
		return a.getDescrizione().equals(this.getDescrizione());
	}
	
}
