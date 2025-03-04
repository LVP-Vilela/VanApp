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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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

import br.com.tcc.vanApp.DAO.ICondutor;
import br.com.tcc.vanApp.model.Condutor;

@RestController
@CrossOrigin("*")
@RequestMapping("/condutores")
public class CondutorController {
	
	@Autowired
	private ICondutor dao;
	private PasswordEncoder passwoedEncoder;
	
	public CondutorController(ICondutor dao) {
		this.dao = dao;
		this.passwoedEncoder = new BCryptPasswordEncoder();
	}
	
	@GetMapping
	public List<Condutor> listaCondutores(){
		return (List<Condutor>) dao.findAll();
	}
	
	@PostMapping
	public Condutor cadastrarCondutor(@RequestBody Condutor condutor) {
		String encoder =this.passwoedEncoder.encode(condutor.getSenha());
		condutor.setSenha(encoder);
		Condutor condutorNova = dao.save(condutor);
		return condutorNova;
	}
	
	@PostMapping("/uploadImage")
    public ResponseEntity<String> uploadImage(@RequestParam("image") MultipartFile image) {
        if (image.isEmpty()) {
            return ResponseEntity.badRequest().body("Nenhuma imagem recebida.");
        }

        try {
        	//String diretorioRelativo = ".\\img\\users-image\\";
        	//Path path = Paths.get(diretorioRelativo + image.getOriginalFilename());
        	Path path = Paths.get("C:\\xampp\\htdocs\\vanApp\\img\\users-image\\"+image.getOriginalFilename());
            Files.copy(image.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            return ResponseEntity.ok("Imagem salva com sucesso!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Erro ao salvar a imagem.");
        }
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
	public Condutor procuraCondutor(@PathVariable String cnh){
		Optional<Condutor> condutor = (Optional<Condutor>)dao.findById(cnh);
		return condutor.get();
	}
	
	@GetMapping("/filtro")
	public List<Condutor> ProcuraCondutorFiltro(@RequestParam Integer periodo, 
	                                            @RequestParam Integer escola, 
	                                            @RequestParam Integer bairro) {
		String periodoStr=null;
		switch (periodo) {
		  case 1:
			  periodoStr = "Período da Manhã";
		    break;
		  case 2:
			  periodoStr = "Período da Tarde";
		    break;
		  case 3:
			  periodoStr = "Período da Noite";
		    break;
		  case 4:
			  periodoStr = "Período Integral";
		    break;
		}
	    return dao.findCondutoresByPeriodoBairroEscola(periodoStr, bairro, escola);
	}
	
	@PostMapping("/login")
	public Condutor validarSenha(@RequestBody Condutor condutor){
		String senha = dao.findById(condutor.getCnh()).get().getSenha();
		Boolean valid = passwoedEncoder.matches(condutor.getSenha(), senha);
		if (valid) {
			return condutor;
		}else {
			return null;
		}
		
	}
}
