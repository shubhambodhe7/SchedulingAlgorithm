package com.services.vesit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.vesit.EventDao;
import com.dto.vesit.Event;
import com.dto.vesit.Team;

@Service
public class EventService {

	@Autowired
	EventDao ed = new EventDao();

	public EventDao getEd() {
		return ed;
	}

	public void setEd(EventDao ed) {
		this.ed = ed;
	}

	public EventService(EventDao ed) {
		super();
		this.ed = ed;
	}

	public EventService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<Event> addEvent(Event event) {
		return ed.addEvent(event);
	}

	public List<Event> getAllEvents() {
		return ed.getAllEvents();
	}

	public int registerAsEventHead(int userId, int eventId) {
		// TODO Auto-generated method stub
		if (!ed.checkIfAlreadyRegisteredEventHead(userId, eventId)) {
			return ed.registerAsEventHead(userId, eventId);
		} else
			return -1;
	}

	public int registerForIndEvent(int userId, int eventId) {
		// TODO Auto-generated method stub
		/*
		 * if (!ed.checkIfAlreadyRegisteredForIndEvent(userId, eventId)) {
		 * return ed.registerForIndEvent(userId, eventId); } else
		 */return 1;
	}

	public int registerForTeamEvent(Team team) {
		// TODO Auto-generated method stub
		return ed.registerForTeamEvent(team);
		// return 1;
	}

}
