package qintess.academiajava.classes.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	// Todos os métodos escritos dentro dos controllers são denominados 'actions'
	
	@GetMapping("/")
	public ModelAndView iniciar() {
		return new ModelAndView("menu");
	}
	
	@GetMapping("/texto")
	public ModelAndView mostrarTitulo() {
		return new ModelAndView("titulo");
	}
	
	@GetMapping("/viacep")
	public ModelAndView mostrarEndereco() {
		return new ModelAndView("endereco");
	}
}
