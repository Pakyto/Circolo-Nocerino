package Model;

import java.io.Serializable;

public class Abbigliamento extends Articolo implements Serializable{
	private static final long serialVersionUID = 1L;

	String codice;
	
	public Abbigliamento(){
		super();
	}

	public String getCodice() {
		return super.getCodice();
	}

	public void setCodice(String codice) {
		super.setCodice(codice);
	}

	@Override
	public boolean equals(Object o) {
		return super.equals(o);
	}

	@Override
	public String toString() {
		return super.toString()+"Abbigliamento [codice=" + codice + "]";
	}
	
}
