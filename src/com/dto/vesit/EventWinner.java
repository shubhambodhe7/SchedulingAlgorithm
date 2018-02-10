package com.dto.vesit;

public class EventWinner {
	private int eventId;
	private String eventName;
	private String teamName;
	private String classroom;
	private String round;
	private int points;
	
	
	public EventWinner() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EventWinner(String eventName, String teamName, String classroom, String round, int points) {
		super();
		this.eventName = eventName;
		this.teamName = teamName;
		this.classroom = classroom;
		this.round = round;
		this.points = points;
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
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public String getRound() {
		return round;
	}
	public void setRound(String round) {
		this.round = round;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	@Override
	public String toString() {
		return "EventWinner [eventName=" + eventName + ", teamName=" + teamName + ", classroom=" + classroom
				+ ", round=" + round + ", points=" + points + "]";
	}

	
}
