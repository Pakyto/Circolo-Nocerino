package Model;
import java.io.Serializable;
import java.util.Date;

public class Socio implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	String username;
	String nome;
	String cognome;
	String codicefiscale;
	Date datanascita;
	String email;
	String tipo;
	String telefono;
	String città;
	String password;
	String indirizzo;
	
	public Socio(){
		username="";
		nome="";
		cognome="";
		codicefiscale="";
		email="";
		tipo="";
		telefono="";
		città="";
		password="";
		indirizzo="";
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getCodicefiscale() {
		return codicefiscale;
	}

	public void setCodicefiscale(String codicefiscale) {
		this.codicefiscale = codicefiscale;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCittà() {
		return città;
	}

	public void setCittà(String città) {
		this.città = città;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public Date getDatanascita() {
		return datanascita;
	}

	public void setDatanascita(Date datanascita) {
		this.datanascita = datanascita;
	}
	
	@Override
	public String toString() {
		return "Socio [username=" + username + ", nome=" + nome + ", cognome=" + cognome + ", codicefiscale="
				+ codicefiscale + ", email=" + email + ", tipo=" + tipo + ", telefono=" + telefono + ", città=" + città
				+ ", password=" + password + "]";
	}
	
}


