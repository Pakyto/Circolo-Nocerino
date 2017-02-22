package Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Catalogo implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private List<Articolo>articoli=new ArrayList<Articolo>();
	
	public List<Articolo>getArticoli(){
		return articoli;
	}
	
	public void empty(){
		this.articoli=new ArrayList<Articolo>();
	}
}
