package org.alt60m.staffSite.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class StaffSitePref extends DBIOEntity {

	private String StaffSitePrefID = "";
    private String name = "";
    private String displayName = "";
    private String value = "";
	private String fk_StaffSiteProfile="";


	public StaffSitePref(String id) {
		StaffSitePrefID = id;
		select();
	}
	public StaffSitePref() { }


	public boolean isPKEmpty() { return StaffSitePrefID.equals(""); }
	public boolean persist() { return isPKEmpty() ? insert() : update(); }

	public void localinit() throws DBIOEntityException {
		String table = "staffsite_staffsitepref";

		setMetadata("StaffSitePrefID","StaffSitePrefID","IDENTITY");
		setMetadata("Name","name",table);
		setMetadata("DisplayName","displayName",table);
		setMetadata("Value","value",table);
		setMetadata("ProfileID","fk_StaffSiteProfile","KEY");

		setAutodetectProperties(false);
	}

	public String getStaffSitePrefID() {
	        return StaffSitePrefID;
	}
	public void setStaffSitePrefID(String StaffSitePrefID) {
	        this.StaffSitePrefID = StaffSitePrefID;
	}
	public String getName() {
	        return name;
	}
	public void setName(String name) {
	        this.name = name;
	}
	public String getDisplayName() {
	        return displayName;
	}
	public void setDisplayName(String displayName) {
	        this.displayName = displayName;
	}
	public String getValue() {
	        return value;
	}
	public void setValue(String value) {
	        this.value = value;
	}

// Associations
	public String getProfileID() { return fk_StaffSiteProfile; }
	public void setProfileID(String staffsitePrefID) { this.fk_StaffSiteProfile = staffsitePrefID; }

	public StaffSiteProfile getProfile() {
		StaffSiteProfile ssp = new StaffSiteProfile();
		ssp.setStaffSiteProfileID(fk_StaffSiteProfile);
		ssp.select();
		return ssp;
	}
	public void setProfile(StaffSiteProfile c){
		fk_StaffSiteProfile = c.getStaffSiteProfileID();
	}

}
