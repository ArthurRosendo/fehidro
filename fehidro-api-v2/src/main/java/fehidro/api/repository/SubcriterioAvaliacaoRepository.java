package fehidro.api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fehidro.api.model.Proposta;
import fehidro.api.model.SubcriterioAvaliacao;
import fehidro.api.model.Usuario;

public interface SubcriterioAvaliacaoRepository extends JpaRepository<SubcriterioAvaliacao, Long> {

	@Query("select s from SubcriterioAvaliacao s where s.perfilAcesso = (select perfilAcesso from Usuario u where u =?1) AND (s.id not in ( select subcriterio from Avaliacao a where a.avaliador = ?1 and a.proposta =?2))")
	public List<SubcriterioAvaliacao> findEmAberto(Usuario usuario, Proposta proposta);
	
//	@Query("select s from SubcriterioAvaliacao s where s.perfilAcesso = '1' AND (s.id not in ( select subcriterio from Avaliacao a where a.avaliador = ?1 and a.proposta =?2))")
//	public List<SubcriterioAvaliacao> findEmAbertoSecretariaExecutiva(Usuario usuario, Proposta proposta);
	
}
