package br.com.tcc.vanApp.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PathVariable;

import br.com.tcc.vanApp.model.Condutor;

public interface ICondutor extends CrudRepository<Condutor,String>{

	@Query("SELECT DISTINCT c FROM Condutor c "
            + "INNER JOIN Linha l ON c.cnh = l.cnhCondutor "
            + "INNER JOIN EscolaLinha el ON el.idLinhas = l.id "
            + "INNER JOIN Escola e ON e.id = el.idEscolas "
            + "INNER JOIN BairroLinha bl ON bl.idLinhas = l.id "
            + "INNER JOIN Bairro b ON b.id = bl.idBairros "
            + "WHERE l.periodo = :periodo AND b.id = :bairro AND e.id = :escola")
    List<Condutor> findCondutoresByPeriodoBairroEscola(
            @Param("periodo") String periodo, 
            @Param("bairro") Integer bairro, 
            @Param("escola") Integer escola);
}
