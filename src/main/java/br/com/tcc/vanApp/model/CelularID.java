package br.com.tcc.vanApp.model;

import java.io.Serializable;
import java.util.Objects;

public class CelularID implements Serializable{

	private String cnh;
	private String celular;
	
	public CelularID(String cnh, String celular) {
		super();
		this.cnh = cnh;
		this.celular = celular;
	}
	public CelularID() {
		super();
	}
	public String getCnh() {
		return cnh;
	}
	public void setCnh(String cnh) {
		this.cnh = cnh;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(celular, cnh);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CelularID other = (CelularID) obj;
		return Objects.equals(celular, other.celular) && Objects.equals(cnh, other.cnh);
	}
	
	
	
}
