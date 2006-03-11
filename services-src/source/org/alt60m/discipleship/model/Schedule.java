package org.alt60m.discipleship.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Schedule extends DBIOEntity {
	
	public Schedule(int id) {
		scheduleId = id;
		select();
	}
	public Schedule(String id) {
		scheduleId = (new Integer(id)).intValue();
		select();
	}
	public Schedule() {
	}

	public boolean isPKEmpty() {
		return scheduleId == 0;
	}

//identity
	private int scheduleId = 0;

	private String dayOfWeek = "";
	private int hoursAvailable = 0;
	private String note = "";
	
	private int fk_contactId = 0;
	
	public void localinit() throws DBIOEntityException {
		String table = "discipleship_Schedule";

		setMetadata("ScheduleId","scheduleid","IDENTITY");
		setMetadata("DayOfWeek","dayofweek",table);
		setMetadata("HoursAvailable","hoursavailable",table);
		setMetadata("Note","note",table);
		setMetadata("ContactId","fk_contactid",table);
		
		setAutodetectProperties(false);
	}

	/**
	 * @return
	 */
	public int getScheduleId() {
		return scheduleId;
	}

	/**
	 * @return
	 */
	public String getScheduleIdString() {
		return (new Integer(scheduleId)).toString();
	}

	/**
	 * @param i
	 */
	public void setScheduleId(int i) {
		scheduleId = i;
	}

	/**
	 * @return
	 */
	public String getDayOfWeek() {
		return dayOfWeek;
	}

	/**
	 * @param string
	 */
	public void setDayOfWeek(String string) {
		dayOfWeek = string;
	}

	/**
	 * @return
	 */
	public int getHoursAvailable() {
		return hoursAvailable;
	}

	/**
	 * @param string
	 */
	public void setHoursAvailable(int i) {
		hoursAvailable = i;
	}
	/**
	 * @return
	 */
	public String getHoursAvailableString() {
		return (new Integer(hoursAvailable)).toString();
	}

	/**
	 * @param string
	 */
	public void setHoursAvailableString(String string) {
		hoursAvailable = (new Integer(string)).intValue();
	}

	/**
	 * @return
	 */
	public String getNote() {
		return note;
	}

	/**
	 * @param string
	 */
	public void setNote(String string) {
		note = string;
	}

	/**
	 * @return
	 */
	public int getContactId() {
		return fk_contactId;
	}
	/**
	 * @return
	 */
	public String getContactIdString() {
		return (new Integer(fk_contactId)).toString();
	}
	/**
	 * @param string
	 */
	public void setContactId(int i) {
		fk_contactId = i;
	}
	/**
	 * @param string
	 */
	public void setContactIdString(String string) {
		fk_contactId = (new Integer(string)).intValue();
	}
	/**
	 * @return
	 */
	public Contact getContact() {
		Contact c = new Contact();
		c.setContactId(this.fk_contactId);
		c.select();
		return c;
	}
	/**
	 * @param string
	 */
	public void setContact(Contact c) {
		fk_contactId = c.getContactId();
	}
}