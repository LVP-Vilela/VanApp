package br.com.tcc.vanApp.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.tcc.vanApp.model.EscolaLinha;
import br.com.tcc.vanApp.model.EscolaLinhaID;

public interface IEscolaLinha extends CrudRepository<EscolaLinha,EscolaLinhaID>{

	List<EscolaLinha> findByIdLinhas(Integer idLinhas);
	
}
