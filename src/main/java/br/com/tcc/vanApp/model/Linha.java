package br.com.tcc.vanApp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="linhas")
public class Linha {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private int id;
	
	@Column(name = "Possui_Vagas")
	private int possuiVagas;
	
	@Column(name = "Periodo")
	private String periodo;
	
	@Column(name = "CNH_Condutor")
	private String cnhCondutor;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPossuiVagas() {
		return possuiVagas;
	}

	public void setPossuiVagas(int possuiVagas) {
		this.possuiVagas = possuiVagas;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String getCnhCondutor() {
		return cnhCondutor;
	}

	public void setCnhCondutor(String cnhCondutor) {
		this.cnhCondutor = cnhCondutor;
	}
	
}
