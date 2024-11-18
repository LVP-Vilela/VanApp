package br.com.tcc.vanApp.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;

@Entity
@IdClass(BairroLinhaID.class )
@Table(name="bairros_linhas")
public class BairroLinha {
	
	@Id
	@Column(name = "IdLinhas")
	private Integer idLinhas;
	
	@Id
	@Column(name = "IdBairros")
	private Integer idBairros;

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
		BairroLinha other = (BairroLinha) obj;
		return Objects.equals(idBairros, other.idBairros) && Objects.equals(idLinhas, other.idLinhas);
	}
}
