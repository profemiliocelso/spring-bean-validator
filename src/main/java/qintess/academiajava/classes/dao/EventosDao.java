package qintess.academiajava.classes.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import qintess.academiajava.classes.mapper.EventoMapper;
import qintess.academiajava.classes.models.Evento;
import qintess.academiajava.classes.models.EventoApi;

public class EventosDao {

	private JdbcTemplate jdbcTemplate;

	public EventosDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// método para incluir um novo evento
	public void incluirEvento(Evento evento) throws Exception {
		try {
			String sql = "INSERT INTO TB_EVENTOS (DESCRICAO, DATA, RESPONSAVEL, PRECO) VALUES (?,?,?,?)";
			this.jdbcTemplate.update(sql, 
					evento.getDescricao(), 
					new java.sql.Date(evento.getData().getTime()),
					evento.getResponsavel(),
					evento.getPreco());
			
		} catch (Exception e) {
			throw e;
		}
	}
	
	// método para incluir um novo evento via API
	public void incluirEvento(EventoApi evento) throws Exception {
		try {
			String sql = "INSERT INTO TB_EVENTOS (DESCRICAO, DATA, RESPONSAVEL, PRECO) VALUES (?,?,?,?)";
			this.jdbcTemplate.update(sql, 
					evento.getDescricao(), 
					evento.getData(),
					evento.getResponsavel(),
					evento.getPreco());
			
		} catch (Exception e) {
			throw e;
		}
	}
	
	// método para alterar um evento
	public void alterarEvento(Evento evento) throws Exception {
		try {
			String sql = "UPDATE TB_EVENTOS SET DESCRICAO=?, DATA=?, RESPONSAVEL=?, PRECO=? "
					+ " WHERE ID=?";
			this.jdbcTemplate.update(sql, 
					evento.getDescricao(),
					new java.sql.Date(evento.getData().getTime()),
					evento.getResponsavel(),
					evento.getPreco(),
					evento.getId());
			
		} catch (Exception e) {
			throw e;
		} 		
	}
	
	// método para listar todos os eventos
	public List<Evento> listarEventos() throws Exception {
		List<Evento> eventos = new ArrayList<Evento>();
		try {
			eventos = this.jdbcTemplate.query(
					"SELECT * FROM TB_EVENTOS", new EventoMapper());
			
		} catch (Exception e) {
			throw e;
		}
		return eventos;
	}
	
	// método para buscar um evento pelo ID
	public Evento buscarEvento(int id) throws Exception {
		Evento evento = null;		
		try {
			evento = this.jdbcTemplate.queryForObject(
					"SELECT * FROM TB_EVENTOS WHERE ID= ?", 
					new EventoMapper(), 
					new Object[] { id });
			
		} catch (Exception e) {
			throw e;
		}
		return evento;
	}
	
	// método para excluir um evento pelo ID
	public int excluirEvento(int id) throws Exception {
		int registros = 0;
		try {
			registros = this.jdbcTemplate.update("DELETE FROM TB_EVENTOS WHERE ID=?", id);
		} catch (Exception e) {
			throw e;
		}
		return registros;
	}
}
