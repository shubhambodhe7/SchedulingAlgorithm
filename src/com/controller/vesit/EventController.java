package com.controller.vesit;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.vesit.Event;
import com.dto.vesit.EventWinner;
import com.dto.vesit.Login;
import com.dto.vesit.MainEvent;
import com.dto.vesit.Team;
import com.google.gson.Gson;
import com.mapper.vesit.PublicHolidayRowMapper;
import com.dto.vesit.Player;
import com.dto.vesit.PublicHoliday;
import com.dto.vesit.Schedule;
import com.services.vesit.EventService;

@Controller
public class EventController {
	@Autowired
	EventService es = new EventService();

	@RequestMapping(value = "/addEvent", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody int addEvent(@RequestBody Event event) throws NoSuchAlgorithmException {
		return es.addEvent(event);
	}

	@RequestMapping(value = "/getAllEvents", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getAllEvents() throws NoSuchAlgorithmException {
		return es.getAllEvents();
	}

	@RequestMapping(value = "/getSchedule", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Schedule> getSchedule() throws NoSuchAlgorithmException {
		return es.getSchedule();
	}

	@RequestMapping(value = "/getMySchedule/{userId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Schedule> getMySchedule(@PathVariable String userId) throws NoSuchAlgorithmException {
		return es.getMySchedule(userId);
	}

	@RequestMapping(value = "/getWinners/{eventId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<EventWinner> getClickedEventWinners(@PathVariable String eventId)
			throws NoSuchAlgorithmException {
		return es.getClickedEventWinners(eventId);
	}

	@RequestMapping(value = "/getClassPoints/{userId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<EventWinner> getWinners(@PathVariable String userId) throws NoSuchAlgorithmException {
		System.out.println(" getClassPoints " + userId);
		return es.getWinners(userId);
	}

	@RequestMapping(value = "/getMyRegistrations/{userId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<EventWinner> getMyRegistrations(@PathVariable String userId)
			throws NoSuchAlgorithmException {
		System.out.println(" getClassPoints " + userId);
		return es.getMyRegistrations(userId);
	}

	@RequestMapping(value = "/getMainEvents", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MainEvent> getMainEvents() throws NoSuchAlgorithmException {
		return es.getMainEvents();
	}

	@RequestMapping(value = "/getEventDetails/{userId:.+}/{eventId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getEventDetails(@PathVariable String userId, @PathVariable int eventId)
			throws NoSuchAlgorithmException {
		return es.getEventDetails(userId, eventId);
	}

	@RequestMapping(value = "/getEventDetailsAsPerUser/{userId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getEventDetailsAsPerUser(@PathVariable String userId)
			throws NoSuchAlgorithmException {
		return es.getEventDetailsAsPerUser(userId);
	}
	
	@RequestMapping(value = "/getEventDetailsAsPerGender/{gender:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getEventDetailsAsPerGender(@PathVariable String gender)
			throws NoSuchAlgorithmException {
		return es.getEventDetailsAsPerGender(gender);
	}

	@RequestMapping(value = "/getPendingEventsForRefreeAssignment", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getPendingEventsForRefreeAssignment() throws NoSuchAlgorithmException {
		return es.getPendingEventsForRefreeAssignment();
	}

	@RequestMapping(value = "/checkIfTeamAlreadyRegistered/{userId:.+}/{eventId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody boolean checkIfTeamAlreadyRegistered(@PathVariable String userId, @PathVariable int eventId)
			throws NoSuchAlgorithmException {
		return es.checkIfTeamAlreadyRegistered(userId, eventId);
	}

	@RequestMapping(value = "/registerAsEventHead/{userId:.+}/{eventId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int registerAsEventHead(@PathVariable String userId, @PathVariable int eventId)
			throws NoSuchAlgorithmException {
		return es.registerAsEventHead(userId, eventId);
	}

	@RequestMapping(value = "/registerForIndEvent/{userId:.+}/{eventId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int registerForIndEvent(@PathVariable String userId, @PathVariable int eventId)
			throws NoSuchAlgorithmException {
		return es.registerForIndEvent(userId, eventId);
	}

	@RequestMapping(value = "/unregisterForIndEvent/{userId:.+}/{eventId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int unregisterForIndEvent(@PathVariable String userId, @PathVariable int eventId)
			throws NoSuchAlgorithmException {
		return es.unregisterForIndEvent(userId, eventId);
	}

	@RequestMapping(value = "/registerForTeamEvent", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody int registerForTeamEvent(@RequestBody Map<String, String> data)
			throws NoSuchAlgorithmException {
		Map<String, String> d = data;
		System.out.println(d);
		return es.registerForTeamEvent(String.valueOf(data.get("classroom")), String.valueOf(data.get("classroom")),
				String.valueOf(data.get("eventId")), data.get("players"));
		// return 1;
	}

	@RequestMapping(value = "/getEligibleEventHeads/{eventId:.+}/{gameId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Login> getEligibleEventHeads(@PathVariable int eventId,@PathVariable  int gameId) throws NoSuchAlgorithmException {
		return es.getEligibleEventHeads(eventId,gameId);
	}

	@RequestMapping(value = "/getTeamsForEvent", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<Team> getTeamsForEvent(@RequestBody int eventId) throws NoSuchAlgorithmException {
		return es.getTeamsForEvent(eventId);
	}

	@RequestMapping(value = "/assignRefereeForEvent/{userId:.+}/{eventId:.+}/{gameId:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int assignReferee(@PathVariable String userId, @PathVariable String eventId,
			@PathVariable String gameId) throws NoSuchAlgorithmException {
		return es.assignReferee(Integer.parseInt(eventId), userId, Integer.parseInt(gameId));
	}

	@RequestMapping(value = "/advanceTeam/{round:.+}/{eventId:.+}/{json:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int advanceTeam(@PathVariable String round, @PathVariable String eventId,
			@PathVariable String json) throws NoSuchAlgorithmException {

		return es.advanceTeam(round, eventId, json);
		// return 1;
	}

	@RequestMapping(value = "/updateScore/{round:.+}/{eventId:.+}/{json:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int updateScore(@PathVariable String round, @PathVariable String eventId,
			@PathVariable String json) throws NoSuchAlgorithmException {

		return es.advanceTeam(round, eventId, json);
		// return 1;
	}

	@RequestMapping(value = "/deleteEvent/{eventId}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int deleteEvent(@PathVariable int eventId) throws NoSuchAlgorithmException {
		return es.deleteEvent(eventId);
	}

	@RequestMapping(value = "/getPublicHoliday", method = RequestMethod.GET, produces = "application/json")

	public @ResponseBody List<PublicHoliday> getPublicHoliday() {
		return es.getPublicHoliday();

	}

	@RequestMapping(value = "/addPublicHoliday/{date:.+}/{occasion:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int addPublicHoliday(@PathVariable String date, @PathVariable String occasion)
			throws NoSuchAlgorithmException {
		return es.addPublicHoliday(date, occasion);
	}

	@RequestMapping(value = "/deletePublicHoliday/{rowId}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int deletePublicHoliday(@PathVariable int rowId) throws NoSuchAlgorithmException {
		return es.deletePublicHoliday(rowId);
	}

	@RequestMapping(value = "/generateSchedule/{date:.+}/{round:.+}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int generateSchedule(@PathVariable String date, @PathVariable String round)
			throws NoSuchAlgorithmException {
		System.out.println(date);
		System.out.println(round);

		return es.generateSchedule(date, round);
	}

	@RequestMapping(value = "/getAllClassScore", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Map<String, Object>> getAllClassScore() {

		return es.getAllClassScore();

	}

}
