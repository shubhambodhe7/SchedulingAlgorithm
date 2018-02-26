
package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.Schedule;

public class ScheduleRowMapper implements RowMapper<Schedule> {

	@Override
	public Schedule mapRow(ResultSet rs, int rowSeq) throws SQLException {
		Schedule s = new Schedule();
		s.setSchdeuleId(rs.getDouble("schedule_id"));
		s.setGameId(rs.getInt("game_id"));
		s.setStartTimeStamp(rs.getTimestamp("start_ts"));
		s.setEndTimeStamp(rs.getTimestamp("end_ts"));
		s.setEventHead(rs.getString("event_head_id"));
		s.setEventId(rs.getInt("event_id"));
		s.setEventName(rs.getString("event_name"));
		s.setRound(rs.getString("round"));

		return s;
	}

}
