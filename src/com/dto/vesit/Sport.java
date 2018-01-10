package com.dto.vesit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Sport {
	private int sportId;
	private String sportName;
	private List<Team> teams;
	private long slotTime;
	private long interval;
	private Timestamp startTimestamp;
	private Timestamp curTimestamp;

	public Sport(int sportId, String sportName, long slotTime, long interval, Timestamp startTimestamp,
			Timestamp curTimestamp) {
		super();
		this.sportId = sportId;
		this.sportName = sportName;
		this.slotTime = slotTime;
		this.interval = interval;
		this.startTimestamp = startTimestamp;
		this.curTimestamp = curTimestamp;
	}

	public Sport() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Sport [sportId=" + sportId + ", sportName=" + sportName + ", teams=" + teams + ", slotTime=" + slotTime
				+ ", interval=" + interval + ", startTimestamp=" + startTimestamp + ", curTimestamp=" + curTimestamp
				+ "]";
	}

	public long getInterval() {
		return interval;
	}

	public void setInterval(long interval) {
		this.interval = interval;
	}

	public int getSportId() {
		return sportId;
	}

	public void setSportId(int sportId) {
		this.sportId = sportId;
	}

	public String getSportName() {
		return sportName;
	}

	public void setSportName(String sportName) {
		this.sportName = sportName;
	}

	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

	public long getSlotTime() {
		return slotTime;
	}

	public void setSlotTime(long slotTime) {
		this.slotTime = slotTime;
	}

	public Timestamp getStartTimestamp() {
		return startTimestamp;
	}

	public void setStartTimestamp(Timestamp startTimestamp) {
		this.startTimestamp = startTimestamp;
	}

	public Timestamp getCurTimestamp() {
		return curTimestamp;
	}

	public void setCurTimestamp(Timestamp curTimestamp) {
		this.curTimestamp = curTimestamp;
	}

	public boolean schedulingCmplt() {

		for (Team t : teams) {
			if (!t.isScheduled()) {
				return false;
			}
		}
		return true;

	}

}
