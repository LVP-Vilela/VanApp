package br.com.tcc.vanApp.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import br.com.tcc.vanApp.DAO.IBairro;
import br.com.tcc.vanApp.model.Bairro;

@RestController
@CrossOrigin("*")
@RequestMapping("/bairros")
public class BairroController {

	@Autowired
	private IBairro dao;
	
	@GetMapping
	public List<Bairro> listaBairros(){
		return (List<Bairro>) dao.findAll();
	}
	
	@PostMapping
	public Bairro cadastrarBairro(@RequestBody Bairro bairro) {
		Bairro bairroNovo = dao.save(bairro);
		return bairroNovo;
	}
	
	@PutMapping
	public Bairro editarBairro(@RequestBody Bairro bairro) {
		Bairro bairroNovo = dao.save(bairro);
		return bairroNovo;
	}
	
	@DeleteMapping("/{id}")
	public Optional<Bairro> excluirBairro(@PathVariable Integer id) {
		Optional<Bairro> bairro = dao.findById(id);
		dao.deleteById(id);
		return bairro;
	}
	
	@GetMapping("/{idBairros}")
	public Bairro listaBairrosLinhasPorLinha(@PathVariable Integer idBairros){
		Optional<Bairro> bairro= dao.findById(idBairros);
		return  bairro.get();
	}
}
