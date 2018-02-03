package com.project.vesit;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.joda.time.DateTime;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DateTime date = new DateTime().toDateMidnight().toDateTime();
		DateTime tomorrow = new DateTime().toDateMidnight().toDateTime().plusDays(1).plusHours(15);
		System.out.println(tomorrow);
	}

}
