package fehidro.api.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonInclude;

@Table(name = "tb_criterioavaliacao")
@Entity
public class CriterioAvaliacao extends AbstractEntity {
	@Column(name = "nm_titulo")
	private String titulo;

	@Column(name = "nr_criterio")
	private Integer numero;
		
	@OneToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REMOVE})
	@JoinColumn(name = "criterioavaliacao_id")
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private List<Pontuacao> pontuacoes;
	
	@OneToMany(cascade={CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REMOVE})  //salva em cascata, altera pai e filho em cascata, exclui em cascata
	@JoinColumn(name = "criterioavaliacao_id")
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private List<SubcriterioAvaliacao> subcriterios;
	
	@OneToOne
	@JoinColumn(name = "perfilacesso_id")
	private PerfilAcesso perfilAcesso;

	public CriterioAvaliacao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public List<Pontuacao> getPontuacoes() {
		return pontuacoes;
	}

	public void setPontuacoes(List<Pontuacao> pontuacoes) {
		this.pontuacoes = pontuacoes;
	}
	
	public void addPontuacoes(Pontuacao pontuacao) {
		if (this.pontuacoes.contains(pontuacao))
			return;
		
		this.pontuacoes.add(pontuacao);
		pontuacao.setCriterio(this);
	}
	
	public void removePontuacoes(Pontuacao pontuacao) {
		if (!this.pontuacoes.contains(pontuacao))
			return;
		
		this.pontuacoes.remove(pontuacao);
		pontuacao.setCriterio(null);
	}

	public List<SubcriterioAvaliacao> getSubcriterios() {
		if (subcriterios != null)
			return new ArrayList<SubcriterioAvaliacao>(subcriterios);
		else 
			return new ArrayList<SubcriterioAvaliacao>();
	}

	public void setSubcriterios(List<SubcriterioAvaliacao> subcriterios) {
		this.subcriterios = subcriterios;
	}
	
	public void addSubcriterios(SubcriterioAvaliacao sub) {
		if (this.subcriterios.contains(sub))
			return;
		
		this.subcriterios.add(sub);
		sub.setCriterio(this);
	}
	
	public void removeSubcriterios(SubcriterioAvaliacao sub) {
		if (!this.subcriterios.contains(sub))
			return;
		
		this.subcriterios.remove(sub);
		sub.setCriterio(null);
	}
	
	public Integer getNumero() {
		return numero;
	}
	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public PerfilAcesso getPerfilAcesso() {
		return perfilAcesso;
	}

	public void setPerfilAcesso(PerfilAcesso perfilAcesso) {
		this.perfilAcesso = perfilAcesso;
	}
}
