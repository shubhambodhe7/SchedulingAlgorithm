package com.mapper.vesit;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.vesit.Event;
import com.dto.vesit.PublicHoliday;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dto.vesit.Event;

public class PublicHolidayRowMapper implements RowMapper<PublicHoliday> {

	@Override
	public PublicHoliday mapRow(ResultSet rs, int rowSeq) throws SQLException {
		// TODO Auto-generated method stub
		PublicHoliday h = new PublicHoliday();
		h.setRowId(rs.getInt(0));
		h.setDate(rs.getTimestamp(0));
		h.setOccasion(rs.getString(2));
		return h;
	}

}
