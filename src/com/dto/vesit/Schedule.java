package com.dto.vesit;

import java.sql.Timestamp;
import java.util.List;

public class Schedule {
	private double schdeuleId;
	private int gameId;
	private int eventId;
	private String eventName;
	private String round;
	private String eventHead;
	private Timestamp startTimeStamp;
	private Timestamp endTimeStamp;

	private List<Team> teams;

	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Schedule(double schdeuleId, int gameId, int eventId, List<Team> teams, Timestamp startTimeStamp,
			Timestamp endTimeStamp, String eventHead) {
		super();
		this.schdeuleId = schdeuleId;
		this.gameId = gameId;
		this.eventId = eventId;
		this.teams = teams;
		this.startTimeStamp = startTimeStamp;
		this.endTimeStamp = endTimeStamp;
		this.eventHead = eventHead;
	}
	

	public String getRound() {
		return round;
	}

	public void setRound(String round) {
		this.round = round;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public double getSchdeuleId() {
		return schdeuleId;
	}

	public void setSchdeuleId(double schdeuleId) {
		this.schdeuleId = schdeuleId;
	}

	public int getGameId() {
		return gameId;
	}

	public void setGameId(int gameId) {
		this.gameId = gameId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

	public Timestamp getStartTimeStamp() {
		return startTimeStamp;
	}

	public void setStartTimeStamp(Timestamp startTimeStamp) {
		this.startTimeStamp = startTimeStamp;
	}

	public Timestamp getEndTimeStamp() {
		return endTimeStamp;
	}

	public void setEndTimeStamp(Timestamp endTimeStamp) {
		this.endTimeStamp = endTimeStamp;
	}

	public String getEventHead() {
		return eventHead;
	}

	public void setEventHead(String eventHead) {
		this.eventHead = eventHead;
	}

}
