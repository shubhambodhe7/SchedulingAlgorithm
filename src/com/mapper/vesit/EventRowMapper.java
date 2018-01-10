
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
		e.setParallelMatches(rs.getInt("parallel_matches"));
		e.setDetails(rs.getString("details"));
		e.setMaxPlayers(rs.getInt("max_participate"));
		e.setMaxTeams(rs.getInt("max_team"));

		return e;
	}

}
