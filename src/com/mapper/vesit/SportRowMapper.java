package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.Sport;

public class SportRowMapper implements RowMapper<Sport> {

	public Sport mapRow(ResultSet rs, int rowSeq) throws SQLException {

		Sport s = new Sport(rs.getInt(1), rs.getString(2), rs.getLong(3), rs.getLong(6), rs.getTimestamp(4),
				rs.getTimestamp(5));
		return s;

	}

}
