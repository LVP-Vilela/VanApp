package br.com.tcc.vanApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.tcc.vanApp.DAO.ICelular;
import br.com.tcc.vanApp.model.Celular;

@RestController
@CrossOrigin("*")
@RequestMapping("/celulares")
public class CelularController {
	
	@Autowired
	private ICelular dao;
	
	@GetMapping
	public List<Celular> listaCelular(){
		return (List<Celular>) dao.findAll();
	}
	
	@PostMapping
	public Celular cadastrarCelular(@RequestBody Celular celular) {
		Celular celularNova = dao.save(celular);
		return celularNova;
	}
	
	@PutMapping
	public Celular editarCelular(@RequestBody Celular celular) {
		Celular celularNova = dao.save(celular);
		return celularNova;
	}

}
