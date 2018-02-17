package com.dto.vesit;

import java.sql.Timestamp;

public class PublicHoliday {
	private int rowId;
	private Timestamp date;
	private String occasion;

	public PublicHoliday(int rowId, Timestamp date, String occasion) {
		super();
		this.rowId = rowId;
		this.date = date;
		this.occasion = occasion;
	}

	public PublicHoliday() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getRowId() {
		return rowId;
	}

	public void setRowId(int rowId) {
		this.rowId = rowId;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getOccasion() {
		return occasion;
	}

	public void setOccasion(String occasion) {
		this.occasion = occasion;
	}

}
