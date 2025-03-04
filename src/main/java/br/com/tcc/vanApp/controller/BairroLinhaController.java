package br.com.tcc.vanApp.controller;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.RestController;

import br.com.tcc.vanApp.DAO.IBairroLinha;
import br.com.tcc.vanApp.model.BairroLinha;
import br.com.tcc.vanApp.model.BairroLinhaID;
import jakarta.transaction.Transactional;

@RestController
@CrossOrigin("*")
@RequestMapping("/bairroslinhas")
public class BairroLinhaController {

	@Autowired
	private IBairroLinha dao;
	
	@GetMapping
	public List<BairroLinha> listaBairroLinhas(){
		return (List<BairroLinha>) dao.findAll();
	}
	
	@PostMapping
	public BairroLinha cadastrarEscolasLinhas(@RequestBody BairroLinha bairroLinha) {
		BairroLinha bairroLinhaNova = dao.save(bairroLinha);
		return bairroLinhaNova;
	}
	
	
	@PostMapping("/bairrosList")
	@Transactional
	public ResponseEntity<List<BairroLinha>> cadastrarBairrosLinhas(@RequestBody List<BairroLinha> bairrosLinhas) {
	    // Filtra as escolas que têm idEscolas não nulo
	    List<BairroLinha> bairrosValidas = bairrosLinhas.stream()
	        .filter(bairroLinha -> bairroLinha.getIdBairros() != null)  // Filtra para remover os itens com idEscolas nulo
	        .collect(Collectors.toList());

	    // Verificar se ainda existem escolas para salvar após o filtro
	    if (bairrosValidas.isEmpty()) {
	        return ResponseEntity.ok().body(null);  // Se não houver escolas válidas, retorna erro
	    }

	    // Salvar as escolas válidas
	    List<BairroLinha> resultList = (List<BairroLinha>) dao.saveAll(bairrosValidas);
	    
	    return ResponseEntity.ok().body((List<BairroLinha>) resultList);  // Retorna a resposta com as escolas salvas
	}
	
	@PutMapping
	public BairroLinha editarBairrosLinhas(@RequestBody BairroLinha bairroLinha) {
		BairroLinha bairroLinhaNova = dao.save(bairroLinha);
		return bairroLinhaNova;
	}
	
	@DeleteMapping("/bairrosDelete")
	public ResponseEntity<Void> removeListaBairroLinha(@RequestBody List<BairroLinha> bairrosLinhas) {
	    try {
	        // Cria um conjunto de IDs únicos para evitar a duplicação
	        Set<BairroLinhaID> ids = bairrosLinhas.stream()
	        	.filter(bairroLinha -> bairroLinha.getIdBairros() != null)
	        	.map(bairroLinha -> new BairroLinhaID(bairroLinha.getIdLinhas(), bairroLinha.getIdBairros()))
	            .collect(Collectors.toSet());

	        // Remove todas as escolas correspondentes no banco de dados
	        dao.deleteAllById(ids);

	        return ResponseEntity.noContent().build(); // Retorna um status 204 (No Content) após a remoção
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // Em caso de erro, retorna status 500
	    }
	}
	
	
	@GetMapping("/{idLinhas}")
	public List<BairroLinha> listaBairrosLinhasPorLinha(@PathVariable Integer idLinhas){
		return (List<BairroLinha>) dao.findByIdLinhas(idLinhas);
	}
}
