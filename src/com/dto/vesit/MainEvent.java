package com.dto.vesit;

public class MainEvent {
	private int mainEventId;
	private String mainEventName;
	private int mainEventParallelMatches;

	public MainEvent(int mainEventId, String mainEventName, int mainEventParallelMatches) {
		super();
		this.mainEventId = mainEventId;
		this.mainEventName = mainEventName;
		this.mainEventParallelMatches = mainEventParallelMatches;
	}

	public MainEvent() {
		// TODO Auto-generated constructor stub
	}

	public int getMainEventId() {
		return mainEventId;
	}

	public void setMainEventId(int mainEventId) {
		this.mainEventId = mainEventId;
	}

	public String getMainEventName() {
		return mainEventName;
	}

	public void setMainEventName(String mainEventName) {
		this.mainEventName = mainEventName;
	}

	public int getMainEventParallelMatches() {
		return mainEventParallelMatches;
	}

	public void setMainEventParallelMatches(int mainEventParallelMatches) {
		this.mainEventParallelMatches = mainEventParallelMatches;
	}

	@Override
	public String toString() {
		return "MainEvent [mainEventEd=" + mainEventId + ", mainEventName=" + mainEventName
				+ ", mainEventParallelMatches=" + mainEventParallelMatches + "]";
	}

}
