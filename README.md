# Projeto com bean-validator

# Passos:

### 1. Adicionar o elemento no pom.xml:

```
<dependency>
  <groupId>org.hibernate.validator</groupId>
  <artifactId>hibernate-validator</artifactId>
  <version>6.2.3.Final</version>
</dependency>
```

### 2. Adicionar as anotações de validações no modelo **Evento**:

```
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

```

 ### 3. Adicionar a taglib do Spring Form e realizar as alterações no arquivo **novoEvento.jsp**:
  
  ```
  <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Eventos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	.borda {
		max-width: 400px;
		margin: auto;
	}
</style>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<div class="container">
		<div class="borda">
			<h1 class="text-primary">Cadastro de Eventos</h1>
			<form:form action="/Projeto01_Eventos_SpringMVC/cadevento" 
					modelAttribute="evento" method="post">
			
				<div class="md-3">
					<form:label path="descricao" cssClass="form-label">Descrição:</form:label>
					<form:input path="descricao" cssClass="form-control"  />
					<form:errors path="descricao" cssClass="text-danger" />
				</div>
				
				<div class="md-3">
					<form:label path="data" cssClass="form-label">Data:</form:label>
					<form:input path="data" cssClass="form-control" type="date" />
					<form:errors path="data" cssClass="text-danger" />
				</div>
				
				<div class="md-3">
					<form:label path="responsavel" cssClass="form-label">Responsável:</form:label>
					<form:input path="responsavel" cssClass="form-control" />
					<form:errors path="responsavel" cssClass="text-danger" />
				</div>	
				
				<div class="md-3">
					<form:label path="preco" cssClass="form-label">Preço:</form:label>
					<form:input path="preco" cssClass="form-control" type="text"  />
					<form:errors path="data" cssClass="text-danger" />
				</div>
				<button type="submit" class="btn btn-primary">Incluir Evento</button>						
			</form:form>
			
		</div>
	</div>
</body>
</html>


  ```

### 4. Alterar a classe **EventosController** (observe os actions para o GET e para o POST):

```
package qintess.academiajava.classes.controllers;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import qintess.academiajava.classes.dao.EventosDao;
import qintess.academiajava.classes.models.Evento;

@Controller
public class EventosController {

	@Autowired
	private EventosDao eventosDao;
	
	@GetMapping("/eventos/inicio")
	public ModelAndView iniciar() {
		return new ModelAndView("eventos/index");
	}
	
	
	@GetMapping("/eventos/listar")
	public ModelAndView listar(Model model) {
		try {
			List<Evento> lista = eventosDao.listarEventos();
			model.addAttribute("eventos", lista);
			return new ModelAndView("eventos/listaEventos");			
		} catch (Exception e) {
			model.addAttribute("mensagem", e.getMessage());
			return new ModelAndView("erro");
		}
	}
	
	// Inclusão de Eventos - usaremos o retorno do tipo String nestes actions
	@GetMapping("/eventos/incluir")
	public String incluir(Model model) {
		try {
			model.addAttribute("evento", new Evento());
			return "eventos/novoEvento";
		} catch (Exception e) {
			model.addAttribute("mensagem", e.getMessage());
			return "erro";			
		}
	}
	
	// BindingResult deve ser colocado logo após @ModelAttribute
	@PostMapping("/cadevento")
	public String incluir(
			@Valid @ModelAttribute("evento") Evento evento,
			BindingResult result,
			Model model) {
		try {

			if(result.hasErrors()) {
				return "eventos/novoEvento";
			} else {
				eventosDao.incluirEvento(evento);
				return "redirect:/eventos/listar";				
			}
			
		} catch (Exception e) {
			model.addAttribute("mensagem", e.getMessage());
			return "erro";						
		}		
	}
	
	// Alteração de eventos
	
	@GetMapping("/eventos/alterar/{idEvento}")
	public String alterar(@PathVariable("idEvento") int id, Model model) {
		try {
			Evento evento = eventosDao.buscarEvento(id);
			if(evento == null) {
				throw new Exception("Nenhum evento com o id informado.");
			}
			model.addAttribute("evt", evento);
			return "eventos/alterarEvento";
			
		} catch (Exception e) {
			model.addAttribute("mensagem", e.getMessage());
			return "erro";			
		}			
	}
	
	@PostMapping("/alteraevento")
	public String alterar(
			Evento evento, 
			@RequestParam("dataEvento") String dataEvento, 
			Model model) {
		try {
			//System.out.println(dataEvento);
			Date data = new SimpleDateFormat("yyyy-MM-dd").parse(dataEvento);
			evento.setData(data);
			
			eventosDao.alterarEvento(evento);
			return "redirect:/eventos/listar";
		} catch (Exception e) {
			model.addAttribute("mensagem", e.getMessage());
			return "erro";						
		}		
	}
	
	@GetMapping("/eventos/remover/{id}")
	public String remover(@PathVariable("id") int id, Model model) {
		try {
			eventosDao.excluirEvento(id);
			return "redirect:/eventos/listar";
		} catch (Exception e) {
			model.addAttribute("mensagem", e.getMessage());
			return "erro";
		}
	}	
}


```
