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

import br.com.tcc.vanApp.DAO.IEscolaLinha;
import br.com.tcc.vanApp.model.EscolaLinha;
import br.com.tcc.vanApp.model.EscolaLinhaID;
import jakarta.transaction.Transactional;

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
	
	
	@PostMapping("/escolasList")
	@Transactional
	public ResponseEntity<List<EscolaLinha>> cadastrarEscolasLinhas(@RequestBody List<EscolaLinha> escolasLinhas) {
	    // Filtra as escolas que têm idEscolas não nulo
	    List<EscolaLinha> escolasValidas = escolasLinhas.stream()
	        .filter(escolaLinha -> escolaLinha.getIdEscolas() != null)  // Filtra para remover os itens com idEscolas nulo
	        .collect(Collectors.toList());

	    // Verificar se ainda existem escolas para salvar após o filtro
	    if (escolasValidas.isEmpty()) {
	        return ResponseEntity.ok().body(null);  // Se não houver escolas válidas, retorna erro
	    }

	    // Salvar as escolas válidas
	    List<EscolaLinha> resultList = (List<EscolaLinha>) dao.saveAll(escolasValidas);
	    
	    return ResponseEntity.ok().body((List<EscolaLinha>) resultList);  // Retorna a resposta com as escolas salvas
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
	
	@DeleteMapping("/escolasDelete")
	public ResponseEntity<Void> removeListaEscolaLinha(@RequestBody List<EscolaLinha> escolasLinhas) {
	    try {
	        // Cria um conjunto de IDs únicos para evitar a duplicação
	        Set<EscolaLinhaID> ids = escolasLinhas.stream()
	        	.filter(escolaLinha -> escolaLinha.getIdEscolas() != null)
	        	.map(escolaLinha -> new EscolaLinhaID(escolaLinha.getIdLinhas(), escolaLinha.getIdEscolas()))
	            .collect(Collectors.toSet());

	        // Remove todas as escolas correspondentes no banco de dados
	        dao.deleteAllById(ids);

	        return ResponseEntity.noContent().build(); // Retorna um status 204 (No Content) após a remoção
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // Em caso de erro, retorna status 500
	    }
	}
}
