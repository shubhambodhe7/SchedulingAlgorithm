package com.services.vesit;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.dao.vesit.EventDao;
import com.dto.vesit.Event;
import com.dto.vesit.EventWinner;
import com.dto.vesit.Login;
import com.dto.vesit.MainEvent;
import com.dto.vesit.Player;
import com.dto.vesit.PublicHoliday;
import com.dto.vesit.Schedule;
import com.dto.vesit.Team;
import com.google.gson.Gson;
import com.mapper.vesit.PublicHolidayRowMapper;

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

	public List<Schedule> getSchedule(int eventId) {
		return ed.getSchedule(eventId);
	}

	public List<Schedule> getMySchedule(String userId) {
		return ed.getMySchedule(userId);
	}

	public List<EventWinner> getClickedEventWinners(String eventId) {
		return ed.getClickedEventWinners(eventId);
	}

	public List<EventWinner> getWinners(String userId) {
		return ed.getWinners(userId);
	}

	public List<EventWinner> getMyRegistrations(String userId) {
		return ed.getMyRegistrations(userId);
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

	public List<Event> getEventDetailsAsPerGender(String gender) {
		return ed.getEventDetailsAsPerGender(gender);
	}

	public List<Login> getEligibleEventHeads(int eventId, int gameId) {
		return ed.getEligibleEventHeads(eventId, gameId);
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

	public boolean checkIfTeamAlreadyRegistered(String userId, int eventId) {
		// TODO Auto-generated method stub

		return ed.checkIfTeamAlreadyRegistered(userId, eventId);
	}

	public int registerForIndEvent(String userId, int eventId) {
		// TODO Auto-generated method stub

		return ed.registerForIndEvent(userId, eventId);
	}

	public int unregisterForIndEvent(String userId, int eventId) {
		// TODO Auto-generated method stub

		return ed.unregisterForIndEvent(userId, eventId);
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

	public int assignReferee(int eventId, String userId, int gameId) {
		return ed.assignReferee(eventId, userId, gameId);
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

	public List<PublicHoliday> getPublicHoliday() {
		return ed.getPublicHoliday();

	}

	public int addPublicHoliday(String date, String occasion) {
		// TODO Auto-generated method stub
		return ed.addPublicHoliday(date, occasion);
	}

	public int deletePublicHoliday(int rowId) {
		// TODO Auto-generated method stub
		return ed.deletePublicHoliday(rowId);
	}

	public int generateSchedule(String date, String round) {
		// TODO Auto-generated method stub
		return ed.generateSchedule(date, round);
	}

	public List<Map<String, Object>> getAllClassScore() {

		List<Map<String, Object>> list = ed.getAllClassScore();
		return list;

	}

}
