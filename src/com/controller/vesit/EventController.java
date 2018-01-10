package com.controller.vesit;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.vesit.Event;
import com.services.vesit.EventService;

@Controller
public class EventController {
	@Autowired
	EventService es = new EventService();

	@RequestMapping(value = "/addEvent", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<Event> addEvent(@RequestBody Event event) throws NoSuchAlgorithmException {
		return es.addEvent(event);
	}

	@RequestMapping(value = "/getAllEvents", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getAllEvents() throws NoSuchAlgorithmException {
		return es.getAllEvents();
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

}
