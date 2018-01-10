package com.dto.vesit;

import java.util.List;

import com.project.vesit.Team;

public class Event {

	private int eventId;
	private String eventName;
	private List<Team> teams;
	private String gender;
	private int parallelMatches;
	private String details;

	public Event(int eventId, String eventName, List<Team> teams, String gender, int parallelMatches, String details) {
		super();
		this.eventId = eventId;
		this.eventName = eventName;
		this.teams = teams;
		this.gender = gender;
		this.parallelMatches = parallelMatches;
		this.details = details;
	}

	public Event(int eventId, String eventName, String gender, int parallelMatches, String details) {
		super();
		this.eventId = eventId;
		this.eventName = eventName;
		this.gender = gender;
		this.parallelMatches = parallelMatches;
		this.details = details;
	}

	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean schedulingCmplt() {

		for (Team t : teams) {
			if (!t.isScheduled()) {
				return false;
			}
		}
		return true;

	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getParallelMatches() {
		return parallelMatches;
	}

	public void setParallelMatches(int parallelMatches) {
		this.parallelMatches = parallelMatches;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

}
