/*
 * Created on January 20, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.wsn.sp.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

/**
 * @author josh.starcher
 *
 */
public class WsnProjectLeader extends DBIOEntity {

	private int WsnProjectID = 0;
	private String name = "";
	private String country = "";
	private String partnershipRegion = "";
	private String wsnYear = "";
	private String PDWsnApplicationID = "";
	private String PDFirstName = "";
	private String PDLastName = "";
	private String PDCurrentEmail = "";
	private String APDWsnApplicationID = "";
	private String APDFirstName = "";
	private String APDLastName = "";
	private String APDCurrentEmail = "";
	private String CoordWsnApplicationID = "";
	private String CoordLastName = "";
	private String CoordFirstName = "";
	private String CoordCurrentEmail = "";

	/**
	 * 
	 */
	public WsnProjectLeader() {
		super();
	}
	
	public WsnProjectLeader(String id) {
		setWsnProjectIDStr(id);
		select();
	}
	public WsnProjectLeader(int id) {
		setWsnProjectIDInt(id);
		select();
	}
	
	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#localinit()
	 */
	public void localinit() throws DBIOEntityException {
		String table = "wsn_sp_viewProjectLeaders";
		
		setMetadata("WsnProjectID", "WsnProjectID", "IDENTITY");
		setMetadata("WsnProjectID", "WsnProjectID", table);
		setMetadata("Name", "name", table);
		setMetadata("Country", "country", table);
		setMetadata("PartnershipRegion", "partnershipRegion", table);
		setMetadata("WsnYear", "wsnYear", table);
		setMetadata("PDWsnApplicationID", "PDWsnApplicationID", table);
		setMetadata("PDFirstName", "PDFirstName", table);
		setMetadata("PDLastName", "PDLastName", table);
		setMetadata("PDCurrentEmail", "PDCurrentEmail", table);
		setMetadata("APDWsnApplicationID", "APDWsnApplicationID", table);
		setMetadata("APDFirstName", "APDFirstName", table);
		setMetadata("APDLastName", "APDLastName", table);
		setMetadata("APDCurrentEmail", "APDCurrentEmail", table);
		setMetadata("CoordWsnApplicationID", "CoordWsnApplicationID", table);
		setMetadata("CoordLastName", "CoordLastName", table);
		setMetadata("CoordFirstName", "CoordFirstName", table);
		setMetadata("CoordCurrentEmail", "CoordCurrentEmail", table);

		setAutodetectProperties(false);
	}
    
	/* (non-Javadoc)
	 * @see com.kenburcham.framework.dbio.DBIOEntity#isPKEmpty()
	 */
	public boolean isPKEmpty() {
		return WsnProjectID == 0;
	}

	public String getWsnProjectID() {
		return String.valueOf(WsnProjectID);
	}
	public void setWsnProjectID(int WsnProjectID) {
		this.WsnProjectID = WsnProjectID;
	}
	public int getWsnProjectIDInt() {
		return WsnProjectID;
	}
	public void setWsnProjectIDInt(int WsnProjectID) {
		this.WsnProjectID = WsnProjectID; 
	}
	public void setWsnProjectIDStr(String WsnProjectID) {
		if (WsnProjectID != null && !WsnProjectID.equals("") && !WsnProjectID.equals(" ")) {
			this.WsnProjectID = Integer.parseInt(WsnProjectID); 
		}
	}

	public String getAPDCurrentEmail() {
		return APDCurrentEmail;
	}

	public void setAPDCurrentEmail(String currentEmail) {
		APDCurrentEmail = currentEmail;
	}

	public String getAPDFirstName() {
		return APDFirstName;
	}

	public void setAPDFirstName(String firstName) {
		APDFirstName = firstName;
	}

	public String getAPDLastName() {
		return APDLastName;
	}

	public void setAPDLastName(String lastName) {
		APDLastName = lastName;
	}

	public String getAPDWsnApplicationID() {
		return APDWsnApplicationID;
	}

	public void setAPDWsnApplicationID(String wsnApplicationID) {
		APDWsnApplicationID = wsnApplicationID;
	}

	public String getCoordCurrentEmail() {
		return CoordCurrentEmail;
	}

	public void setCoordCurrentEmail(String coordCurrentEmail) {
		CoordCurrentEmail = coordCurrentEmail;
	}

	public String getCoordLastName() {
		return CoordLastName;
	}

	public String getCoordFirstName() {
		return CoordFirstName;
	}

	public void setCoordFirstName(String coordFirstName) {
		CoordFirstName = coordFirstName;
	}

	public void setCoordLastName(String coordLastName) {
		CoordLastName = coordLastName;
	}

	public String getCoordWsnApplicationID() {
		return CoordWsnApplicationID;
	}

	public void setCoordWsnApplicationID(String coordWsnApplicationID) {
		CoordWsnApplicationID = coordWsnApplicationID;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPartnershipRegion() {
		return partnershipRegion;
	}

	public void setPartnershipRegion(String partnershipRegion) {
		this.partnershipRegion = partnershipRegion;
	}

	public String getPDCurrentEmail() {
		return PDCurrentEmail;
	}

	public void setPDCurrentEmail(String currentEmail) {
		PDCurrentEmail = currentEmail;
	}

	public String getPDFirstName() {
		return PDFirstName;
	}

	public void setPDFirstName(String firstName) {
		PDFirstName = firstName;
	}

	public String getPDLastName() {
		return PDLastName;
	}

	public void setPDLastName(String lastName) {
		PDLastName = lastName;
	}

	public String getPDWsnApplicationID() {
		return PDWsnApplicationID;
	}

	public void setPDWsnApplicationID(String wsnApplicationID) {
		PDWsnApplicationID = wsnApplicationID;
	}

	public String getWsnYear() {
		return wsnYear;
	}

	public void setWsnYear(String wsnYear) {
		this.wsnYear = wsnYear;
	}


	/**
	 * Overwrite the insert and update methods
	 */
	public boolean insert() {
		return false;
	}
	public boolean update() {
		return false;
	}
}
