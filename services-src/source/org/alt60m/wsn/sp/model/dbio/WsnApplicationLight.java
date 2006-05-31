/*
 * Created on May 25, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.wsn.sp.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class WsnApplicationLight extends DBIOEntity {

	private int WsnApplicationID = 0;

	private String surferID = "";
	private String legalLastName = "";
	private String legalFirstName = "";
	private String wsnYear = "";
	//note: currentEmail is stored in NewAddress
	private String currentEmail = "";

	/**
	 * 
	 */
	public WsnApplicationLight() {
		super();
	}
	
	public WsnApplicationLight(String id) {
		setWsnApplicationIdStr(id);
		select();
	}
	public WsnApplicationLight(int id) {
		setWsnApplicationIdInt(id);
		select();
	}
	
	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#localinit()
	 */
	public void localinit() throws DBIOEntityException {
		String table = "wsn_sp_viewapplicationlight";
		
		setMetadata("WsnApplicationID", "WsnApplicationID", "IDENTITY");
		setMetadata("SurferID", "surferID", table);
		setMetadata("LegalLastName", "legalLastName", table);
		setMetadata("LegalFirstName", "legalFirstName", table);
		setMetadata("WsnYear", "wsnYear", table);
		setMetadata("CurrentEmail", "currentEmail", table);

		setAutodetectProperties(false);
	}

	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#isPKEmpty()
	 */
	public boolean isPKEmpty() {
		return WsnApplicationID == 0;
	}

	public String getWsnApplicationID() {
		return String.valueOf(WsnApplicationID);
	}
	public void setWsnApplicationID(int WsnApplicationID) {
		this.WsnApplicationID = WsnApplicationID;
	}
	public int getWsnApplicationIdInt() {
		return WsnApplicationID;
	}
	public void setWsnApplicationIdInt(int WsnApplicationID) {
		this.WsnApplicationID = WsnApplicationID; 
	}
	public void setWsnApplicationIdStr(String WsnApplicationID) {
		if (WsnApplicationID != null && !WsnApplicationID.equals("") && !WsnApplicationID.equals(" ")) {
			this.WsnApplicationID = Integer.parseInt(WsnApplicationID); 
		}
	}

	/**
	 * @return
	 */
	public String getLegalFirstName() {
		return legalFirstName;
	}

	/**
	 * @return
	 */
	public String getLegalLastName() {
		return legalLastName;
	}
	
	/**
	 * @param string
	 */
	public String getSurferID() {
		return surferID; 
	}
	
	/**
	 * @param string
	 */
	public void setLegalFirstName(String string) {
		legalFirstName = string;
	}

	/**
	 * @param string
	 */
	public void setLegalLastName(String string) {
		legalLastName = string;
	}

	/**
	 * @param string
	 */
	public void setSurferID(String surferID) {
		this.surferID = surferID; 
	}
	
	/**
	 * @return
	 */
	public String getWsnYear() {
		return wsnYear;
	}

	/**
	 * @param string
	 */
	public void setWsnYear(String string) {
		wsnYear = string;
	}

	public String getCurrentEmail() {
		return currentEmail; 
	}
	public void setCurrentEmail(String currentEmail) {
		this.currentEmail = currentEmail; 
	}
	public String getEmail() {
		return currentEmail; 
	}
	public void setEmail(String currentEmail) {
		this.currentEmail = currentEmail; 
	}
}
