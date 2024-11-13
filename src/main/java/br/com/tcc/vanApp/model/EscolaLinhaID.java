package br.com.tcc.vanApp.model;

import java.io.Serializable;
import java.util.Objects;

public class EscolaLinhaID implements Serializable{

	private Integer idLinhas;
	private Integer idEscolas;
	
	public EscolaLinhaID() {
		super();
	}
	public EscolaLinhaID(Integer idLinhas, Integer idEscolas) {
		super();
		this.idLinhas = idLinhas;
		this.idEscolas = idEscolas;
	}
	public Integer getIdLinhas() {
		return idLinhas;
	}
	public void setIdLinhas(Integer idLinhas) {
		this.idLinhas = idLinhas;
	}
	public Integer getIdEscolas() {
		return idEscolas;
	}
	public void setIdEscolas(Integer idEscolas) {
		this.idEscolas = idEscolas;
	}
	@Override
	public int hashCode() {
		return Objects.hash(idEscolas, idLinhas);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EscolaLinhaID other = (EscolaLinhaID) obj;
		return Objects.equals(idEscolas, other.idEscolas) && Objects.equals(idLinhas, other.idLinhas);
	}
}
