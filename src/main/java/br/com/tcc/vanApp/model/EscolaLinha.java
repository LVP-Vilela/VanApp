package br.com.tcc.vanApp.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;

@Entity
@IdClass(EscolaLinhaID.class )
@Table(name="escolas_linhas")
public class EscolaLinha {
	
	@Id
	@Column(name = "id_linhas")
	private Integer idLinhas;
	
	@Id
	@Column(name = "id_escolas")
	private Integer idEscolas;

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
		EscolaLinha other = (EscolaLinha) obj;
		return Objects.equals(idEscolas, other.idEscolas) && Objects.equals(idLinhas, other.idLinhas);
	}

}
