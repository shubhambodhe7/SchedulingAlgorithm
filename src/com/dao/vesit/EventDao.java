package com.dao.vesit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dto.vesit.Event;
import com.mapper.vesit.EventRowMapper;

@Repository
public class EventDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getjdbcTemplate() {
		return jdbcTemplate;
	}

	public void setjdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public EventDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EventDao(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Event> getAllEvents() {
		return jdbcTemplate.query("Select * from public.event", new EventRowMapper());

	}

	public List<Event> addEvent(Event e) {
		jdbcTemplate.update(
				"INSERT INTO public.event(event_name, gender, parallel_matches, details)  VALUES ( ?, ?, ?, ?)",
				new Object[] { e.getEventName(), e.getGender(), e.getParallelMatches(), e.getDetails() });
		return getAllEvents();

	}

	public int registerAsEventHead(int userId, int eventId) {
		return jdbcTemplate.update("INSERT INTO public.event_head( user_id, event_id)   VALUES ( ?, ?)",
				new Object[] { userId, eventId });

	}

	

	public boolean checkIfAlreadyRegisteredEventHead(int userId, int eventId) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(
				"Select * from public.event_head where user_id = ? and event_id=?", new Object[] { userId, eventId });

		// System.out.println("list" + list);
		if (null == list || list.isEmpty()) {
			return false;
		}
		return true;
	}

}
