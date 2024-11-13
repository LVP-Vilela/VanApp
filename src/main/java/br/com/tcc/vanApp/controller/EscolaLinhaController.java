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

import br.com.tcc.vanApp.DAO.IEscolaLinha;
import br.com.tcc.vanApp.model.EscolaLinha;

@RestController
@CrossOrigin("*")
@RequestMapping("/escolaslinhas")
public class EscolaLinhaController {
	
	@Autowired
	private IEscolaLinha dao;

	@GetMapping
	public List<EscolaLinha> listaEscolasLinhas(){
		return (List<EscolaLinha>) dao.findAll();
	}
	
	@PostMapping
	public EscolaLinha cadastrarEscolasLinhas(@RequestBody EscolaLinha escolaLinha) {
		EscolaLinha escolaLinhaNova = dao.save(escolaLinha);
		return escolaLinhaNova;
	}
	
	@PutMapping
	public EscolaLinha editarEscolasLinhas(@RequestBody EscolaLinha escolaLinha) {
		EscolaLinha escolaLinhaNova = dao.save(escolaLinha);
		return escolaLinhaNova;
	}
	
	@GetMapping("/{idLinhas}")
	public List<EscolaLinha> listaEscolasLinhasPorLinha(@PathVariable Integer idLinhas){
		return (List<EscolaLinha>) dao.findByIdLinhas(idLinhas);
	}
}
