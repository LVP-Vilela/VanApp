package br.com.tcc.vanApp.DAO;

import org.springframework.data.repository.CrudRepository;

import br.com.tcc.vanApp.model.Email;
import br.com.tcc.vanApp.model.EmailID;

public interface IEmail extends CrudRepository<Email,EmailID>{

}
