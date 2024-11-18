package br.com.tcc.vanApp.model;

import java.io.Serializable;
import java.util.Objects;

public class BairroLinhaID implements Serializable{
	
	private Integer idLinhas;
	private Integer idBairros;
	
	public BairroLinhaID() {
		super();
	}
	public BairroLinhaID(Integer idLinhas, Integer idBairros) {
		super();
		this.idLinhas = idLinhas;
		this.idBairros = idBairros;
	}
	public Integer getIdLinhas() {
		return idLinhas;
	}
	public void setIdLinhas(Integer idLinhas) {
		this.idLinhas = idLinhas;
	}
	public Integer getIdBairros() {
		return idBairros;
	}
	public void setIdBairros(Integer idBairros) {
		this.idBairros = idBairros;
	}
	@Override
	public int hashCode() {
		return Objects.hash(idBairros, idLinhas);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BairroLinhaID other = (BairroLinhaID) obj;
		return Objects.equals(idBairros, other.idBairros) && Objects.equals(idLinhas, other.idLinhas);
	}
}
