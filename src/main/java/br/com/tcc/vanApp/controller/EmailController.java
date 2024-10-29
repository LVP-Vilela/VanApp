package br.com.tcc.vanApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.tcc.vanApp.DAO.IEmail;
import br.com.tcc.vanApp.model.Email;

@RestController
@CrossOrigin("*")
@RequestMapping("/emails")
public class EmailController {
	
	@Autowired
	private IEmail dao;
	
	@GetMapping
	public List<Email> listaEmail(){
		return (List<Email>) dao.findAll();
	}
	
	@PostMapping
	public Email cadastrarEmail(@RequestBody Email email) {
		Email emailNova = dao.save(email);
		return emailNova;
	}
	
	@PutMapping
	public Email editarEmail(@RequestBody Email email) {
		Email emailNova = dao.save(email);
		return emailNova;
	}
	
	@GetMapping("/{cnh}")
	public List<Email> listaEmailsPorCondutor(@PathVariable String cnh){
		return (List<Email>) dao.findByCnh(cnh);
	}

}
