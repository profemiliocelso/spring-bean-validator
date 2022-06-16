package qintess.academiajava.classes.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import qintess.academiajava.classes.dao.EventosDao;
import qintess.academiajava.classes.models.Evento;
import qintess.academiajava.classes.models.EventoApi;

@RestController
@RequestMapping("/api")
public class ApiController {

	@Autowired
	private EventosDao eventosDao;
	
	@CrossOrigin
	@GetMapping("/eventos")
	public List<Evento> listarEventos(){
		try {
			return eventosDao.listarEventos();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Evento>();
		}
	}
	
	@CrossOrigin
	@RequestMapping(
			value = "/eventos",
			method = RequestMethod.POST,
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public EventoApi incluirEvento(@RequestBody EventoApi evento) {
		try {
			eventosDao.incluirEvento(evento);
			return evento;
		} catch (Exception e) {
			e.printStackTrace();
			return new EventoApi();
		}
	}
}
