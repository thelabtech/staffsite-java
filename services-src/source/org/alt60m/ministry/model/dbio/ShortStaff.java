package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;


public class ShortStaff extends DBIOEntity {

//identity
	private String accountNo = "";

//foreign keys
	private int teamId = 0;
	
	private String firstName = "";
	private String preferredName = "";	
    private String middleInitial = "";
    private String lastName = "";
    private String email = "";
    private String region = "";
    private String jobTitle = "";
    private String removedFromPeopleSoft = "";
	

	public ShortStaff(String id) {
		accountNo = id;
		if (!id.equals("")) {
			select();
		}
	}
	public ShortStaff() {}

	public boolean isPKEmpty() {
		return accountNo.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_staff";

		setMetadata("AccountNo","accountNo","IDENTITY");
		setMetadata("FirstName","firstName",table);
		setMetadata("PreferredName","preferredName",table);
		setMetadata("MiddleInitial","middleInitial",table);
		setMetadata("LastName","lastName",table);
		setMetadata("Email","email",table);
		setMetadata("RemovedFromPeopleSoft","removedFromPeopleSoft",table);
		setMetadata("TeamId","fk_teamID",table);
		setMetadata("JobTitle","jobTitle",table);
		setMetadata("Region","region",table);
		setAutodetectProperties(false);
	}

	public String getAccountNo() { return accountNo; }
	public void setAccountNo(String accountNo) { this.accountNo = accountNo; }	

	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName){ this.firstName = firstName; }

	public String getPreferredName() { return preferredName; }
	public void setPreferredName(String preferredName){ this.preferredName = preferredName; }
	
	public String getMiddleInitial() { return middleInitial; }
	public void setMiddleInitial(String middleInitial) { this.middleInitial = middleInitial; }
	
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getRegion() { return region; }
	public void setRegion(String region) { this.region = region; }
	
	public String getJobTitle() { return jobTitle; }
	public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }
	
	public String getRemovedFromPeopleSoft() { return removedFromPeopleSoft; }
	public void setRemovedFromPeopleSoft(String removedFromPeopleSoft) { this.removedFromPeopleSoft = removedFromPeopleSoft; }
	
	
	
	
	
    public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int fk_localLevelId) {
		this.teamId = fk_localLevelId;
	}
	
	public String getLocalLevelId(){ return String.valueOf(getTeamId()); }
    public void setLocalLevelId(String id) {
    	if (id == null || id.equals("")) {
    		setTeamId(0);
    	}
    	else {
    		setTeamId(Integer.parseInt(id));
    	}
    }
    
    public Staff getStaff(){ return new Staff(getAccountNo());} //expand to full Staff object
    
	public LocalLevel getLocalLevel(){ return new LocalLevel(getLocalLevelId()); }
	public void setLocalLevel(LocalLevel ll){ setLocalLevelId(ll.getLocalLevelId()); }
	public LocalLevel getMembership(){ return getLocalLevel(); }
	public void setMembership(LocalLevel membership){ setLocalLevel(membership); }
	public void assocLocalLevel(LocalLevel t) { setLocalLevel(t); }

	
}
