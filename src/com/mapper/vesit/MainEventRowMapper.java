
package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.MainEvent;

public class MainEventRowMapper implements RowMapper<MainEvent> {

	@Override
	public MainEvent mapRow(ResultSet rs, int rowSeq) throws SQLException {
		// TODO Auto-generated method stub
		MainEvent e = new MainEvent();
		e.setMainEventId(rs.getInt("main_event_id"));
		e.setMainEventName(rs.getString("main_event_name"));
		e.setMainEventParallelMatches(rs.getInt("main_event_parallel_matches"));

		return e;
	}

}
