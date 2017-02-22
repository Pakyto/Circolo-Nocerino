package Model;

import java.io.Serializable;

public class Acquisto implements Serializable {
	private static final long serialVersionUID = 1L;
	
	String username;
	int id;
	
	public Acquisto(){
		username="";
		id=0;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Acquisto [username=" + username + ", id=" + id + "]";
	}
	
	
	
}
