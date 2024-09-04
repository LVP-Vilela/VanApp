package br.com.tcc.vanApp.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.tcc.vanApp.model.Escola;
import br.com.tcc.vanApp.DAO.IEscola;

@RestController
@CrossOrigin("*")
@RequestMapping("/escolas")
public class EscolaController{
	
	@Autowired
	private IEscola dao;
	
	@GetMapping
	public List<Escola> listaEscolas(){
		return (List<Escola>) dao.findAll();
	}
	
	@PostMapping
	public Escola cadastrarEscola(@RequestBody Escola escola) {
		Escola escolaNova = dao.save(escola);
		return escolaNova;
	}
	
	@PutMapping
	public Escola editarEscola(@RequestBody Escola escola) {
		Escola escolaNova = dao.save(escola);
		return escolaNova;
	}
	
	@DeleteMapping("/{id}")
	public Optional<Escola> excluirEscola(@PathVariable Integer id) {
		Optional<Escola> escola = dao.findById(id);
		dao.deleteById(id);
		return escola;
	}
}
