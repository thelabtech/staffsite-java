package org.alt60m.staffSite.model.dbio;

import java.util.Vector;
import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class StaffSiteProfile extends DBIOEntity {

    private String StaffSiteProfileID = "";
    private String firstName = "";
    private String lastName = "";
    private String userName = "";
	private boolean changePassword;
	private boolean captureHRinfo;
	private String accountNo = "";
	private boolean isStaff;
//    private String email = "";
    private String passwordQuestion = "";
    private String passwordAnswer = "";
//    private int fk_ssmUserId = 0;

	public StaffSiteProfile(String id) {
		StaffSiteProfileID = id;
		select();
	}
	public StaffSiteProfile() { }

	public boolean isPKEmpty() { return StaffSiteProfileID.equals(""); }
	public boolean persist() { return isPKEmpty() ? insert() : update(); }

	public void localinit() throws DBIOEntityException {
		String table = "staffsite_staffsiteprofile";

		setMetadata("StaffSiteProfileID","StaffSiteProfileID","IDENTITY");
		setMetadata("FirstName","firstName",table);
		setMetadata("LastName","lastName",table);
		setMetadata("UserName","userName",table);
		setMetadata("ChangePassword","changePassword",table);
		setMetadata("CaptureHRinfo","captureHRinfo",table);
		setMetadata("AccountNo","accountNo",table);
		setMetadata("IsStaff","isStaff",table);
//		setMetadata("Email","email",table);
		setMetadata("PasswordQuestion","passwordQuestion",table);
		setMetadata("PasswordAnswer","passwordAnswer",table);
//		setMetadata("Fk_ssmUserId", "fk_ssmUserId",table);

		setAutodetectProperties(false);
	}

	public String getStaffSiteProfileID() {
	        return StaffSiteProfileID;
	}
	public void setStaffSiteProfileID(String StaffSiteProfileID) {
	        this.StaffSiteProfileID = StaffSiteProfileID;
	}
	public String getFirstName() {
	        return firstName;
	}
	public void setFirstName(String firstName) {
	        this.firstName = firstName;
	}
	public String getLastName() {
	        return lastName;
	}
	public void setLastName(String lastName) {
	        this.lastName = lastName;
	}
	public String getUserName() {
	        return userName;
	}
	public void setUserName(String userName) {
	        this.userName = userName;
	}
	public boolean getChangePassword() {
	        return changePassword;
	}
	public void setChangePassword(boolean changePassword) {
	        this.changePassword = changePassword;
	}
	
	public boolean getCaptureHRinfo() {
        return captureHRinfo;
	}
	public void setCaptureHRinfo(boolean captureHRinfo) {
	       this.captureHRinfo = captureHRinfo;
	}

	public String getAccountNo() {
	        return accountNo;
	}
	public void setAccountNo(String accountNo) {
	        this.accountNo = accountNo;
	}
	public boolean getIsStaff() {
	        return isStaff;
	}
	public void setIsStaff(boolean isStaff) {
	        this.isStaff = isStaff;
	}
/*	public String getEmail() {
	        return email;
	}
	public void setEmail(String email) {
	        this.email = email;
	}
*/
	public String getPasswordQuestion() {
	        return passwordQuestion;
	}
	public void setPasswordQuestion(String passwordQuestion) {
	        this.passwordQuestion = passwordQuestion;
	}
	public String getPasswordAnswer() {
	        return passwordAnswer;
	}
	public void setPasswordAnswer(String passwordAnswer) {
	        this.passwordAnswer = passwordAnswer;
	}
//	public Set getPreferences() {
//ToDO: Finish
//		if(preferences==null)
//			preferences = new StaffSitePref().selectList("");
//		return preferences;
//	}
//	public void setPreferences(Set preferences) {
//		    this.preferences = preferences;
//	}

// Associations

	public Vector getPreferences(){
		StaffSitePref r = new StaffSitePref();
		r.setStaffSitePrefID(StaffSiteProfileID);
		return r.selectList();
	}
	public Vector getPreferences(String orderField, boolean DESC) {
		StaffSitePref r = new StaffSitePref();
		return r.selectList("fk_ConferenceID = '" + StaffSiteProfileID + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocPreference(StaffSitePref pref) {
		pref.setProfileID(StaffSiteProfileID);
		pref.update();
	}
	public void dissocPreference(StaffSitePref pref) {   //Do we need this?
		pref.delete();
	}


	/**
	 * @return Returns the fk_ssmUserId.
	 */
/*	public int getFk_ssmUserId() {
		return fk_ssmUserId;
	}
*/
	/**
	 * @param fk_ssmUserId The fk_ssmUserId to set.
	 */
/*	public void setFk_ssmUserId(int fk_ssmUserId) {
		this.fk_ssmUserId = fk_ssmUserId;
	}
*/
}
