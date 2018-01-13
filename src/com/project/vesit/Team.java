package com.project.vesit;

import java.util.*;

public class Team {
	private int teamId;
	private String teamName;
	private List<Player> players;
	private boolean scheduled;
	private int sportId;
	private int gameId;
	
	

	public Team() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public int getSportId() {
		return sportId;
	}

	public void setSportId(int sportId) {
		this.sportId = sportId;
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

	public Team(int teamId, String teamName, boolean scheduled, int sportId, int gameId) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
		this.scheduled = scheduled;
		this.sportId = sportId;
		this.gameId = gameId;
	}

	

	@Override
	public String toString() {
		return "Team [teamId=" + teamId + ", teamName=" + teamName + ", players=" + players + ", scheduled=" + scheduled
				+ ", sportId=" + sportId + ", gameId=" + gameId + "]";
	}

}
