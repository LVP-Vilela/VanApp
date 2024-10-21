package br.com.tcc.vanApp.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.tcc.vanApp.model.Linha;

public interface ILinha extends CrudRepository<Linha,Integer>{
	
	List<Linha> findByCnhCondutor(String cnhCondutor);
}
