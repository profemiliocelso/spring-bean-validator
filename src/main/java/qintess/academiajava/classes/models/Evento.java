package qintess.academiajava.classes.models;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class Evento  {
	

	private int id;
	
	@NotEmpty(message = "A descrição deve ser informada")
	@Size(min = 2, max=45, message = "A descrição deve ter até 45 caracteres")
	private String descricao;
	
	@NotEmpty(message = "O nome do responsável deve ser informado")
	@Size(max=10, message = "O nome do responsavel deve ter até 10 caracteres")
	private String responsavel;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date data;
	

	private Double preco;
	
	private List<Convidado> convidados;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getResponsavel() {
		return responsavel;
	}
	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Double getPreco() {
		return preco;
	}
	public void setPreco(Double preco) {
		this.preco = preco;
	}
	public List<Convidado> getConvidados() {
		return convidados;
	}
	public void setConvidados(List<Convidado> convidados) {
		this.convidados = convidados;
	}
	
	@Override
	public String toString() {
		return "ID: " + this.getId() + " - " + this.getDescricao();
	}
	
	
	
}
