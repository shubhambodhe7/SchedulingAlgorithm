package com.controller.vesit;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import com.dto.vesit.Login;
import com.dto.vesit.Team;
import com.google.gson.Gson;
import com.dto.vesit.Player;
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

	@RequestMapping(value = "/getEventDetails/{eventId}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getEventDetails(@PathVariable int eventId) throws NoSuchAlgorithmException {
		return es.getEventDetails(eventId);
	}

	@RequestMapping(value = "/getPendingEventsForRefreeAssignment", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getPendingEventsForRefreeAssignment() throws NoSuchAlgorithmException {
		return es.getPendingEventsForRefreeAssignment();
	}

	@RequestMapping(value = "/registerAsEventHead/{userId}/{eventId}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int registerAsEventHead(@PathVariable int userId, @PathVariable int eventId)
			throws NoSuchAlgorithmException {
		return es.registerAsEventHead(userId, eventId);
	}

	@RequestMapping(value = "/registerForIndEvent/{userId}/{eventId}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int registerForIndEvent(@PathVariable int userId, @PathVariable int eventId)
			throws NoSuchAlgorithmException {
		return es.registerForIndEvent(userId, eventId);
	}

	@RequestMapping(value = "/registerForTeamEvent/{teamName}/{dept}/{year}/{eventId}/{json}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int registerForTeamEvent(@PathVariable String teamName, @PathVariable String dept,
			@PathVariable String year, @PathVariable String eventId, @PathVariable String json)
			throws NoSuchAlgorithmException {

		return es.registerForTeamEvent(teamName, dept, year, eventId, json);
		// return 1;
	}

	@RequestMapping(value = "/getEligibleEventHeads", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<Login> getEligibleEventHeads(@RequestBody int eventId) throws NoSuchAlgorithmException {
		return es.getEligibleEventHeads(eventId);
	}

	@RequestMapping(value = "/getTeamsForEvent", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<Team> getTeamsForEvent(@RequestBody int eventId) throws NoSuchAlgorithmException {
		return es.getTeamsForEvent(eventId);
	}

	@RequestMapping(value = "/assignRefereeForEvent/{userId}/{eventId}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int assignReferee(@PathVariable String userId, @PathVariable String eventId)
			throws NoSuchAlgorithmException {
		return es.assignReferee(Integer.parseInt(eventId), Integer.parseInt(userId));
	}

	@RequestMapping(value = "/advanceTeam/{round}/{eventId}/{json}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody int advanceTeam(@PathVariable String round, @PathVariable String eventId,
			@PathVariable String json) throws NoSuchAlgorithmException {

		return es.advanceTeam(round, eventId, json);
		// return 1;
	}
}
