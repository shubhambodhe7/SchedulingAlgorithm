
package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.Event;

public class EventRowMapper implements RowMapper<Event> {

	@Override
	public Event mapRow(ResultSet rs, int rowSeq) throws SQLException {
		// TODO Auto-generated method stub
		Event e = new Event();
		e.setEventId(rs.getInt("event_id"));
		e.setEventName(rs.getString("event_name"));
		e.setGender(rs.getString("gender"));
		e.setDetails(rs.getString("details"));
		e.setMaxPlayers(rs.getInt("max_participate"));
		e.setEventType(rs.getString("event_type"));
		e.setTeamsInOneMatch(rs.getInt("teams_in_one_match"));
		e.setEventHead(rs.getString("eventhead"));
		e.setMainEventId(rs.getDouble("main_event_id"));
		e.setSeed(rs.getInt("seed"));

		return e;
	}

}
