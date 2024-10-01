package br.com.tcc.vanApp.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;

@Entity
@IdClass( CelularID.class )
@Table(name="celular")
public class Celular {
	
	@Id
	@Column(name = "CNH")
	private String cnh;

	@Id
	@Column(name = "Celular")
	private String celular;

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
		Celular other = (Celular) obj;
		return Objects.equals(celular, other.celular) && Objects.equals(cnh, other.cnh);
	}
	
}
