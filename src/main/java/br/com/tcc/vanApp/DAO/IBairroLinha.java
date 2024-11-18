package br.com.tcc.vanApp.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.tcc.vanApp.model.BairroLinha;
import br.com.tcc.vanApp.model.BairroLinhaID;

public interface IBairroLinha extends CrudRepository<BairroLinha,BairroLinhaID>{
	List<BairroLinha> findByIdLinhas(Integer idLinhas);
}
