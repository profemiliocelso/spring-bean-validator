package qintess.academiajava.classes.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import qintess.academiajava.classes.models.Evento;

public class EventoMapper implements RowMapper<Evento>{

	@Override
	public Evento mapRow(ResultSet rs, int rowNum) throws SQLException {
		Evento evento = new Evento();
		evento.setId(rs.getInt("ID"));
		evento.setDescricao(rs.getString("DESCRICAO"));
		evento.setData(rs.getDate("DATA"));
		evento.setResponsavel(rs.getString("RESPONSAVEL"));
		evento.setPreco(rs.getDouble("PRECO"));
		
		return evento;
	}

	
}
