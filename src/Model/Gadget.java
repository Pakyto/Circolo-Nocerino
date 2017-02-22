package Model;

import java.io.Serializable;

public class Gadget extends Articolo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	public Gadget(){
		super();
	}

	public String getCodice(){
		return super.getCodice();
	}
	
	public String getDescrizione(){
		return super.getDescrizione();
	}

	public double getPrezzo(){
		return super.getPrezzo();
	}
	
	public int getQuantità(){
		return super.getQuantità();
	}
	
	@Override
	public String toString() {
		return super.toString();
	}

	@Override
	public boolean equals(Object o) {
		return super.equals(o);
	}
	
	
}
