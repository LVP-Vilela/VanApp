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

import br.com.tcc.vanApp.DAO.IBairroLinha;
import br.com.tcc.vanApp.model.BairroLinha;

@RestController
@CrossOrigin("*")
@RequestMapping("/bairroslinhas")
public class BairroLinhaController {

	@Autowired
	private IBairroLinha dao;
	
	@GetMapping
	public List<BairroLinha> listaBairrosLinhas(){
		return (List<BairroLinha>) dao.findAll();
	}
	
	@PostMapping
	public BairroLinha cadastrarBairrosLinhas(@RequestBody BairroLinha escolaLinha) {
		BairroLinha bairroLinhaNova = dao.save(escolaLinha);
		return bairroLinhaNova;
	}
	
	@PutMapping
	public BairroLinha editarEscolasLinhas(@RequestBody BairroLinha escolaLinha) {
		BairroLinha bairroLinhaNova = dao.save(escolaLinha);
		return bairroLinhaNova;
	}
	
	@GetMapping("/{idLinhas}")
	public List<BairroLinha> listaBairrosLinhasPorLinha(@PathVariable Integer idLinhas){
		return (List<BairroLinha>) dao.findByIdLinhas(idLinhas);
	}
}
