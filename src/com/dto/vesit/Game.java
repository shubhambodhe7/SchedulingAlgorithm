package com.dto.vesit;

import java.sql.Timestamp;

public class Game {
	private int gameId;
	private Team teamA;
	private Team teamB;
	private Timestamp startTimeStamp;
	private Timestamp endTimeStamp;
	private int sportId;

	public int getGameId() {
		return gameId;
	}

	public void setGameId(int gameId) {
		this.gameId = gameId;
	}

	public Team getTeamA() {
		return teamA;
	}

	public void setTeamA(Team teamA) {
		this.teamA = teamA;
	}

	public Team getTeamB() {
		return teamB;
	}

	public void setTeamB(Team teamB) {
		this.teamB = teamB;
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

	public int getSportId() {
		return sportId;
	}

	public void setSportId(int sportId) {
		this.sportId = sportId;
	}

	public Game(int gameId, Team teamA, Team teamB, Timestamp startTimeStamp, Timestamp endTimeStamp) {
		super();
		this.gameId = gameId;
		this.teamA = teamA;
		this.teamB = teamB;
		this.startTimeStamp = startTimeStamp;
		this.endTimeStamp = endTimeStamp;
	}

	public Game(int gameId, Team teamA, Team teamB) {
		super();
		this.gameId = gameId;
		this.teamA = teamA;
		this.teamB = teamB;
	}

	public Game(Team teamA, Team teamB, Timestamp startTimeStamp, Timestamp endTimeStamp) {
		super();
		this.teamA = teamA;
		this.teamB = teamB;
		this.startTimeStamp = startTimeStamp;
		this.endTimeStamp = endTimeStamp;
	}

	public Game(Team teamA, Team teamB, Timestamp startTimeStamp, Timestamp endTimeStamp, int sportId) {
		super();
		this.teamA = teamA;
		this.teamB = teamB;
		this.startTimeStamp = startTimeStamp;
		this.endTimeStamp = endTimeStamp;
		this.sportId = sportId;
	}

	@Override
	public String toString() {
		return "Game [gameId=" + gameId + ", teamA=" + teamA + ", teamB=" + teamB + ", startTimeStamp=" + startTimeStamp
				+ ", endTimeStamp=" + endTimeStamp + "]";
	}

}
