package org.alt60m.discipleship.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Call extends DBIOEntity {
	
	public Call(int id) {
		callId = id;
		select();
	}
	public Call(String id) {
		callId = (new Integer(id)).intValue();
		select();
	}
	public Call() {
	}

	public boolean isPKEmpty() {
		return callId == 0;
	}

//identity
	private int callId = 0;

	private Date dateOfCall = null;
	private String note = "";
	
	private int fk_contactId = 0;
	
	public void localinit() throws DBIOEntityException {
		String table = "discipleship_Call";

		setMetadata("CallId","callid","IDENTITY");
		setMetadata("DateOfCall","dateofcall",table);
		setMetadata("Note","note",table);
		setMetadata("ContactId","fk_contactid",table);
		
		setAutodetectProperties(false);
	}

	/**
	 * @return
	 */
	public int getCallId() {
		return callId;
	}

	/**
	 * @return
	 */
	public String getCallIdString() {
		return (new Integer(callId)).toString();
	}

	/**
	 * @param i
	 */
	public void setCallId(int i) {
		callId = i;
	}

	/**
	 * @return
	 */
	public Date getDateOfCall() {
		return dateOfCall;
	}

	/**
	 * @param string
	 */
	public void setDateOfCall(Date string) {
		dateOfCall = string;
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