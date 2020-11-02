package fehidro.model.dto.avaliacao;

import fehidro.api.model.Avaliacao;
//import fehidro.api.model.CriterioAvaliacao;
import fehidro.api.model.Pontuacao;
import fehidro.api.model.Proposta;
import fehidro.api.model.SubcriterioAvaliacao;
import fehidro.api.model.Usuario;
import fehidro.model.dto.usuario.CadastroUsuarioDTO;

public class CadastroAvaliacaoDTO {

	private long id;
    private Pontuacao nota;
    private CadastroUsuarioDTO avaliador;
    private Proposta proposta;
    private SubcriterioAvaliacao subcriterio;
    private String comentario;
//    private CriterioAvaliacao criterio;

	public CadastroAvaliacaoDTO() {

	}

	public CadastroAvaliacaoDTO(Avaliacao model) {
		if (model != null) {
			this.setId(model.getId());
			this.nota = model.getNota();
			this.avaliador = new CadastroUsuarioDTO(model.getAvaliador());
			this.proposta = model.getProposta();
			this.subcriterio = model.getSubcriterio();
//			this.criterio = model.getCriterio();
			this.comentario = model.getComentario();
		}
	}

	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id; 
	}
	
	public Pontuacao getNota() {
		return nota;
	}

	public void setNota(Pontuacao nota) {
		this.nota = nota;
	}

	public CadastroUsuarioDTO getAvaliador() {
		return avaliador;
	}

	public void setAvaliador(CadastroUsuarioDTO avaliador) {
		this.avaliador = avaliador;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public SubcriterioAvaliacao getSubcriterio() {
		return subcriterio;
	}

	public void setSubcriterio(SubcriterioAvaliacao subcriterio) {
		this.subcriterio = subcriterio;
	}
	
	public String getComentario() {
		return this.comentario;
	}
	public void setComentario(String _comentario) {
		this.comentario = _comentario;
	}

//	public CriterioAvaliacao getCriterio() {
//		return criterio;
//	}
//
//	public void setCriterio(CriterioAvaliacao criterio) {
//		this.criterio = criterio;
//	}

	

}
