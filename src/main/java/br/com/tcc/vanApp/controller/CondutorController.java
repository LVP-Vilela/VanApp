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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.com.tcc.vanApp.DAO.ICondutor;
import br.com.tcc.vanApp.model.Condutor;

@RestController
@CrossOrigin("*")
@RequestMapping("/condutores")
public class CondutorController {
	
	@Autowired
	private ICondutor dao;
	
	@GetMapping
	public List<Condutor> listaCondutores(){
		return (List<Condutor>) dao.findAll();
	}
	
	@PostMapping
	public Condutor cadastrarCondutor(@RequestBody Condutor condutor) {
		Condutor condutorNova = dao.save(condutor);
		return condutorNova;
	}
	
	@PutMapping
	public Condutor editarEscola(@RequestBody Condutor condutor) {
		Condutor condutorNova = dao.save(condutor);
		return condutorNova;
	}
	
	@DeleteMapping("/{cnh}")
	public Optional<Condutor> excluirEscola(@PathVariable String cnh) {
		Optional<Condutor> condutor = dao.findById(cnh);
		dao.deleteById(cnh);
		return condutor;
	}
	
	@GetMapping("/{cnh}")
	public Condutor ProcuraCondutor(@PathVariable String cnh){
		Optional<Condutor> condutor = (Optional<Condutor>)dao.findById(cnh);
		return condutor.get();
	}
	
	@GetMapping("/filtro")
	public List<Condutor> ProcuraCondutorFiltro(@RequestParam String periodo, 
	                                            @RequestParam Integer escola, 
	                                            @RequestParam Integer bairro) {
	    return dao.findCondutoresByPeriodoBairroEscola(periodo, bairro, escola);
	}

}
