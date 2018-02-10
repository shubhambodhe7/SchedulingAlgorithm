package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.EventWinner;

public class EventWinnerRowMapper implements RowMapper<EventWinner> {

	@Override
	public EventWinner mapRow(ResultSet rs, int rowSeq) throws SQLException {
		// TODO Auto-generated method stub
		EventWinner e = new EventWinner();
		e.setEventId(rs.getInt("event_id"));
		e.setEventName(rs.getString("event_name"));
		e.setTeamName(rs.getString("team_name"));
		e.setClassroom(rs.getString("classroom"));
		e.setRound(rs.getString("round"));
		e.setPoints(rs.getInt("points"));

		return e;
	}

}
