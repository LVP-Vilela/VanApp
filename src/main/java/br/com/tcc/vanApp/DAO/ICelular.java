package br.com.tcc.vanApp.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.tcc.vanApp.model.Celular;
import br.com.tcc.vanApp.model.CelularID;

public interface ICelular extends CrudRepository<Celular,CelularID>{

	List<Celular> findByCnh(String cnh);

}
