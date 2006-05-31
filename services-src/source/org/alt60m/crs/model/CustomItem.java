package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.log.*;
import com.kenburcham.framework.system.*;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class CustomItem extends DBIOEntity {

	public static SystemLog log = (SystemLog) SystemManager
			.getLog(CustomItem.class.getName());

	// IDENTITY
	private int customItemID;

	// KEY
	private int fk_ConferenceID;

	private String title = "";

	private String text = "";

	private int displayOrder = 0;

	public CustomItem() {
	}

	public void localinit() throws DBIOEntityException {
		String table = "crs_customitem";
		setMetadata("CustomItemID", "customItemID", "IDENTITY");

		setMetadata("ConferenceID", "fk_ConferenceID", "KEY");

		setMetadata("Title", "title", table);
		setMetadata("Text", "text", table);
		setMetadata("DisplayOrder", "displayOrder", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getCustomItemID() == 0;
	}

	public int getCustomItemID() {
		return customItemID;
	}

	public void setCustomItemID(int customItemID) {
		this.customItemID = customItemID;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public int getConferenceID() {
		return fk_ConferenceID;
	}

	public void setConferenceID(int conferenceID) {
		this.fk_ConferenceID = conferenceID;
	}

	public Conference getConference() {
		Conference c = new Conference();
		c.setConferenceID(fk_ConferenceID);
		c.select();
		return c;
	}

	public void setConference(Conference c) {
		fk_ConferenceID = c.getConferenceID();
	}
}