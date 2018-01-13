package com.services.vesit;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.vesit.EventDao;
import com.dto.vesit.Event;
import com.dto.vesit.Login;
import com.dto.vesit.Player;
import com.dto.vesit.Team;
import com.google.gson.Gson;

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

	public List<Event> getEventDetails(int eventId) {
		return ed.getEventDetails(eventId);
	}

	public List<Login> getEligibleEventHeads(int eventId) {
		return ed.getEligibleEventHeads(eventId);
	}

	public List<Event> getPendingEventsForRefreeAssignment() {
		return ed.getPendingEventsForRefreeAssignment();
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

	public int registerForTeamEvent(String teamName, String dept, String year, String eventId, String json) {

		Team t = new Team();
		t.setTeamName(teamName);
		t.setDept(dept);
		t.setEventId(Integer.parseInt(eventId));
		t.setYearOfEng(Integer.parseInt(year));
		System.out.println(json);

		Gson gson = new Gson();
		Player[] playerArray = gson.fromJson(json, Player[].class);
		List<Player> playerList = Arrays.asList(playerArray);
		// System.out.println(playerList);
		return ed.registerForTeamEvent(t, playerList);
		// return 1;
	}

	public int assignReferee(int eventId, int userId) {
		return ed.assignReferee(eventId, userId);
	}

}
