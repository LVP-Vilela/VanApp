package br.com.tcc.vanApp.model;

import java.util.Objects;

public class EmailID {

	private String cnh;
	private String email;
	
	public String getCnh() {
		return cnh;
	}
	
	public void setCnh(String cnh) {
		this.cnh = cnh;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(cnh, email);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EmailID other = (EmailID) obj;
		return Objects.equals(cnh, other.cnh) && Objects.equals(email, other.email);
	}
	
	
}
