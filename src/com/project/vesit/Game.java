package com.project.vesit;

import java.sql.Timestamp;

public class Game {
	private int gameId;
	private Timestamp startTimeStamp;
	private Timestamp endTimeStamp;
	private int eventId;
	private String eventHead;

	
	
	public Game(Timestamp startTimeStamp, Timestamp endTimeStamp, int eventId) {
		super();
		this.startTimeStamp = startTimeStamp;
		this.endTimeStamp = endTimeStamp;
		this.eventId = eventId;
	}

	public Game(int gameId, Timestamp startTimeStamp, Timestamp endTimeStamp, int eventId, String eventHead) {
		super();
		this.gameId = gameId;
		this.startTimeStamp = startTimeStamp;
		this.endTimeStamp = endTimeStamp;
		this.eventId = eventId;
		this.eventHead = eventHead;
	}

	public Game() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getGameId() {
		return gameId;
	}

	public void setGameId(int gameId) {
		this.gameId = gameId;
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

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventHead() {
		return eventHead;
	}

	public void setEventHead(String eventHead) {
		this.eventHead = eventHead;
	}

	@Override
	public String toString() {
		return "Game [gameId=" + gameId + ", startTimeStamp=" + startTimeStamp + ", endTimeStamp=" + endTimeStamp
				+ ", eventId=" + eventId + ", eventHead=" + eventHead + "]";
	}

}
