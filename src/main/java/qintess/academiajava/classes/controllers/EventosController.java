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
	
	
	
	
	
	
	
	
//	@GetMapping("/endereco")
//	public ModelAndView buscar(Model model) {
//		String uri = "https://viacep.com.br/ws/01001000/json/";
//		RestTemplate template = new RestTemplate();
//		ResponseEntity<Endereco> endereco = template.getForEntity(uri, Endereco.class);
//		
//		model.addAttribute("endereco", endereco.getBody());
//		return new ModelAndView("endereco");
//	}
}





