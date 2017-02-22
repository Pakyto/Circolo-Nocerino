package Model;

import java.io.Serializable;

public class Biglietto extends Articolo implements Serializable {
	private static final long serialVersionUID = 1L;
	String nome;
	
	public Biglietto(){
		super();
	}

	public String getCodice(){
		return super.getCodice();
	}
	
	public double getPrezzo(){
		return super.getPrezzo();
	}
	
	public String getDescrizione(){
		return super.getDescrizione();
	}
	
	public int getQuantità(){
		return super.getQuantità();
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		return "Biglietto [nome=" + nome + "]";
	}

	@Override
	public boolean equals(Object o) {
		return super.equals(o);
	}

	
}
