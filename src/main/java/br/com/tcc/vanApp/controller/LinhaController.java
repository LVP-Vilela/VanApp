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

import br.com.tcc.vanApp.DAO.ILinha;
import br.com.tcc.vanApp.model.Linha;

@RestController
@CrossOrigin("*")
@RequestMapping("/linhas")
public class LinhaController {

	@Autowired
	private ILinha dao;
	
	@GetMapping
	public List<Linha> listaLinhas(){
		return (List<Linha>) dao.findAll();
	}
	
	@PostMapping
	public Linha cadastrarLinha(@RequestBody Linha linha) {
		Linha linhaNova = dao.save(linha);
		return linhaNova;
	}
	
	@PutMapping
	public Linha editarLinha(@RequestBody Linha linha) {
		Linha linhaNova = dao.save(linha);
		return linhaNova;
	}
	
	@DeleteMapping("/{id}")
	public Optional<Linha> excluirLinha(@PathVariable int id) {
		Optional<Linha> linha = dao.findById(id);
		dao.deleteById(id);
		return linha;
	}
	
	@GetMapping("/{cnh}")
	public List<Linha> listaLinhasPorCondutor(@PathVariable String cnh){
		return (List<Linha>) dao.findByCnhCondutor(cnh);
	}
}
