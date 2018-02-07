package com.services.vesit;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.dao.vesit.EventDao;
import com.dto.vesit.Event;
import com.dto.vesit.Login;
import com.dto.vesit.MainEvent;
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

	public int addEvent(Event event) {
		return ed.addEvent(event);
	}

	public List<Event> getAllEvents() {
		return ed.getAllEvents();
	}

	public List<MainEvent> getMainEvents() {
		return ed.getMainEvents();
	}

	public List<Event> getEventDetails(String userId, int eventId) {
		return ed.getEventDetails(userId, eventId);
	}
	public List<Event> getEventDetailsAsPerUser(String userId) {
		return ed.getEventDetailsAsPerUser(userId);
	}

	public List<Login> getEligibleEventHeads(int eventId) {
		return ed.getEligibleEventHeads(eventId);
	}

	public List<Team> getTeamsForEvent(int eventId) {
		return ed.getTeamsForEvent(eventId);
	}

	public List<Event> getPendingEventsForRefreeAssignment() {
		return ed.getPendingEventsForRefreeAssignment();
	}

	public int registerAsEventHead(String userId, int eventId) {
		// TODO Auto-generated method stub

		if (!ed.checkIfAlreadyRegisteredEventHead(userId, eventId)) {
			return ed.registerAsEventHead(userId, eventId);
		} else
			return -1;
	}

	public int registerForIndEvent(String userId, int eventId) {
		// TODO Auto-generated method stub

		if (!ed.checkIfAlreadyRegisteredForIndEvent(userId, eventId)) {
			return ed.registerForIndEvent(userId, eventId);
		}
		return -1;
	}

	public int registerForTeamEvent(String teamName, String classroom, String eventId, String json) {

		Team t = new Team();
		t.setTeamName(teamName);
		t.setClassroom(classroom);
		t.setEventId(Integer.parseInt(eventId));
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

	public int advanceTeam(String round, String eventId, String json) {
		Gson gson = new Gson();
		Team[] teamArray = gson.fromJson(json, Team[].class);
		List<Team> teamList = Arrays.asList(teamArray);
		// System.out.println(playerList);
		return ed.advanceTeam(round, eventId, teamList);
		// return 1;
	}

	public int deleteEvent(int eventId) {
		return ed.deleteEvent(eventId);
	}

}
