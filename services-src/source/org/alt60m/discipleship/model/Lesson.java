package org.alt60m.discipleship.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Lesson extends DBIOEntity {
	
	public Lesson(int id) {
		lessonId = id;
		select();
	}
	public Lesson(String id) {
		lessonId = (new Integer(id)).intValue();
		select();
	}
	public Lesson() {
	}

	public boolean isPKEmpty() {
		return lessonId == 0;
	}

//identity
	private int lessonId = 0;

	private Date date = null;
	private String scripture = "";
	private String topic = "";
	private String depthOfUnderstanding = "";
	private String note = "";
	
	private int fk_contactId = 0;
	
	public void localinit() throws DBIOEntityException {
		String table = "discipleship_Lesson";

		setMetadata("LessonId","lessonid","IDENTITY");
		setMetadata("Date","date",table);
		setMetadata("Scripture","scripture",table);
		setMetadata("Topic","topic",table);
		setMetadata("DepthOfUnderstanding","depthofunderstanding",table);
		setMetadata("Note","note",table);
		setMetadata("ContactId","fk_contactid",table);
		
		setAutodetectProperties(false);
	}

	/**
	 * @return
	 */
	public int getLessonId() {
		return lessonId;
	}

	/**
	 * @return
	 */
	public String getLessonIdString() {
		return (new Integer(lessonId)).toString();
	}

	/**
	 * @param i
	 */
	public void setLessonId(int i) {
		lessonId = i;
	}

	/**
	 * @return
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @param date
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * @return
	 */
	public String getScripture() {
		return scripture;
	}

	/**
	 * @param string
	 */
	public void setScripture(String string) {
		scripture = string;
	}

	/**
	 * @return
	 */
	public String getTopic() {
		return topic;
	}

	/**
	 * @param string
	 */
	public void setTopic(String string) {
		topic = string;
	}

	/**
	 * @return
	 */
	public String getDepthOfUnderstanding() {
		return depthOfUnderstanding;
	}

	/**
	 * @param string
	 */
	public void setDepthOfUnderstanding(String string) {
		depthOfUnderstanding = string;
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