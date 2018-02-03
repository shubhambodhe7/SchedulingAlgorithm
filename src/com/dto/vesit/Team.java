package com.dto.vesit;

import java.util.*;

public class Team {
	private int teamId;
	private String teamName;
	private List<Player> players;
	private boolean scheduled;
	private int eventId;
	private int gameId;
	private String classroom;

	public Team() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Team(int teamId, String teamName) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getGameId() {
		return gameId;
	}

	public void setGameId(int gameId) {
		this.gameId = gameId;
	}

	public boolean isScheduled() {
		return scheduled;
	}

	public void setScheduled(boolean scheduled) {
		this.scheduled = scheduled;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public List<Player> getPlayers() {
		return players;
	}

	public void setPlayers(List<Player> players) {
		this.players = players;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public Team(int teamId, String teamName, boolean scheduled, int eventId, int gameId) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
		this.scheduled = scheduled;
		this.eventId = eventId;
		this.gameId = gameId;
	}

	@Override
	public String toString() {
		return "Team [" + teamId + " : " + teamName + "]";
	}

}
