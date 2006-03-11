package org.alt60m.hr.si.model.dbio;

import java.util.Date;
//import com.kenburcham.framework.dbio.DBIOEntity;
//import com.kenburcham.framework.dbio.DBIOEntityException;

public class SIPerson_Archive2003 extends SIPerson_Parent {
	public boolean isPKEmpty() {
		return SIPersonID == 0;
	}
	public SIPerson_Archive2003() {
		// Archive class allows inheritance through polymorphism & upcasting
	}
	public SIPerson_Archive2003(String id) {
		// Archive class allows inheritance through polymorphism & upcasting
		SIPersonID= (new Integer(id)).intValue();
		select();
	}
	public SIPerson_Archive2003(int id) {
		// Archive class allows inheritance through polymorphism & upcasting
		SIPersonID= id;
		select();
	}
	public void localinit() {
		String table = "hr_si_Person_Archive2003";
		
		setMetadata("SIPersonID", "SIPersonID", "IDENTITY");
		setMetadata("SurferID", "surferID", table);
		setMetadata("Role", "role", table);
		setMetadata("Region", "region", table);
		setMetadata("LastName", "lastName", table);
		setMetadata("FirstName", "firstName", table);
		setMetadata("MiddleName", "middleName", table);
		setMetadata("CurrentAddress1", "currentAddress1", table);
		setMetadata("CurrentAddress2", "currentAddress2", table);
		setMetadata("CurrentCity", "currentCity", table);
		setMetadata("CurrentState", "currentState", table);
		setMetadata("CurrentZip", "currentZip", table);
		setMetadata("CurrentWorkPhone", "currentWorkPhone", table);
		setMetadata("CurrentHomePhone", "currentHomePhone", table);
		setMetadata("CurrentCellPhone", "currentCellPhone", table);
		setMetadata("CurrentEmail", "currentEmail", table);
		setMetadata("LastDateAtAddress", "lastDateAtAddress", table);
		setMetadata("MaritalStatus", "maritalStatus", table);
		setMetadata("WorkInUS", "workInUS", table);
		setMetadata("AccountNo", "accountNo", table);
		setMetadata("Gender", "gender", table);
		setMetadata("IsStaff", "isStaff", table);
		setMetadata("PermAddress1", "permAddress1", table);
		setMetadata("PermAddress2", "permAddress2", table);
		setMetadata("PermCity", "permCity", table);
		setMetadata("PermState", "permState", table);
		setMetadata("PermZip", "permZip", table);
		setMetadata("PermHomePhone", "permHomePhone", table);
		setMetadata("PermWorkPhone", "permWorkPhone", table);
		setMetadata("PermCellPhone", "permCellPhone", table);
		setMetadata("PermEmail", "permEmail", table);
		setMetadata("EmerAddress1", "emerAddress1", table);
		setMetadata("EmerAddress2", "emerAddress2", table);
		setMetadata("EmerCity", "emerCity", table);
		setMetadata("EmerState", "emerState", table);
		setMetadata("EmerZip", "emerZip", table);
		setMetadata("EmerHomePhone", "emerHomePhone", table);
		setMetadata("EmerWorkPhone", "emerWorkPhone", table);
		setMetadata("EmerCellPhone", "emerCellPhone", table);
		setMetadata("EmerEmail", "emerEmail", table);
		setMetadata("Emer2Address1", "emer2Address1", table);
		setMetadata("Emer2Address2", "emer2Address2", table);
		setMetadata("Emer2City", "emer2City", table);
		setMetadata("Emer2State", "emer2State", table);
		setMetadata("Emer2Zip", "emer2Zip", table);
		setMetadata("Emer2HomePhone", "emer2HomePhone", table);
		setMetadata("Emer2WorkPhone", "emer2WorkPhone", table);
		setMetadata("Emer2CellPhone", "emer2CellPhone", table);
		setMetadata("Emer2Email", "emer2Email", table);
		setMetadata("EmerContactName", "emerContactName", table);
		setMetadata("EmerContactRelationship", "emerContactRelationship", table);
		setMetadata("Emer2ContactName", "emer2ContactName", table);
		setMetadata("Emer2ContactRelationship", "emer2ContactRelationship", table);
		setMetadata("Fk_ssmUserID", "fk_ssmUserID", table);
		setMetadata("Title", "title", table);
		setMetadata("PreferredName", "preferredName", table);
		setMetadata("NumberChildren", "numberChildren", table);
		setMetadata("RecentSchools", "recentSchools", table);
		setMetadata("GraduationDate", "graduationDate", table);
		setMetadata("Majors", "majors", table);
		setMetadata("Fk_StaffSiteProfileID", "fk_StaffSiteProfileID", table);
		setMetadata("UniversityState", "universityState", table);	
			
		setAutodetectProperties(false);		
	}

    private int SIPersonID = 0;
	private String surferID = "";
	private String role = "";
	private String region = "";
	private String lastName = "";
	private String firstName = "";
	private String middleName = "";
    private String currentAddress1 = "";
	private String currentAddress2 = "";
	private String currentCity = "";
	private String currentState = "";
	private String currentZip = "";
	private String currentWorkPhone = "";
	private String currentHomePhone = "";
	private String currentCellPhone = "";
	private String currentEmail = "";
	private Date   lastDateAtAddress = null;
	private String maritalStatus = "";
	private boolean workInUS;
	private String accountNo = "";
	private String gender = "";
	private boolean isStaff;
	private String permAddress1 = "";
	private String permAddress2 = "";
	private String permCity = "";
	private String permState = "";
    private String permZip = "";
    private String permHomePhone = "";
    private String permWorkPhone = "";
    private String permCellPhone = "";
    private String permEmail = "";
	private String emerAddress1 = "";
	private String emerAddress2 = "";
	private String emerCity = "";
	private String emerState = "";
    private String emerZip = "";
    private String emerHomePhone = "";
    private String emerWorkPhone = "";
    private String emerCellPhone = "";
    private String emerEmail = "";
	private String emer2Address1 = "";
	private String emer2Address2 = "";
	private String emer2City = "";
	private String emer2State = "";
    private String emer2Zip = "";
    private String emer2HomePhone = "";
    private String emer2WorkPhone = "";
    private String emer2CellPhone = "";
    private String emer2Email = "";
    private String emerContactName = "";
    private String emerContactRelationship = "";
    private String emer2ContactName = "";
    private String emer2ContactRelationship = "";
    private int fk_ssmUserID = 0;
    private String preferredName="";
    private String numberChildren="";
    private String recentSchools="";
    private Date graduationDate=null;
    private String majors="";
    private String title = "";

		/* Added 6 December 2002 by RDH: Used to aid in determining which staff members
		will have administrative and evaluator access to the system. */
	private String fk_StaffSiteProfileID = "";

		/* Added 12 December 2002 by RDH: Used to aid in determining which region the
		applicant is assosciated with. This is the state the most recently attended school
		was in.*/
	private String universityState = "";


	/**
	 * Returns the accountNo.
	 * @return String
	 */
	public String getAccountNo() {
		return accountNo;
	}

	/**
	 * Returns the currentAddress1.
	 * @return String
	 */
	public String getCurrentAddress1() {
		return currentAddress1;
	}

	/**
	 * Returns the currentAddress2.
	 * @return String
	 */
	public String getCurrentAddress2() {
		return currentAddress2;
	}

	/**
	 * Returns the currentCellPhone.
	 * @return String
	 */
	public String getCurrentCellPhone() {
		return currentCellPhone;
	}

	/**
	 * Returns the currentCity.
	 * @return String
	 */
	public String getCurrentCity() {
		return currentCity;
	}

	/**
	 * Returns the currentEmail.
	 * @return String
	 */
	public String getCurrentEmail() {
		return currentEmail;
	}

	/**
	 * Returns the currentHomePhone.
	 * @return String
	 */
	public String getCurrentHomePhone() {
		return currentHomePhone;
	}

	/**
	 * Returns the currentState.
	 * @return String
	 */
	public String getCurrentState() {
		return currentState;
	}

	/**
	 * Returns the currentWorkPhone.
	 * @return String
	 */
	public String getCurrentWorkPhone() {
		return currentWorkPhone;
	}

	/**
	 * Returns the currentZip.
	 * @return String
	 */
	public String getCurrentZip() {
		return currentZip;
	}

	/**
	 * Returns the emer2Address1.
	 * @return String
	 */
	public String getEmer2Address1() {
		return emer2Address1;
	}

	/**
	 * Returns the emer2Address2.
	 * @return String
	 */
	public String getEmer2Address2() {
		return emer2Address2;
	}

	/**
	 * Returns the emer2CellPhone.
	 * @return String
	 */
	public String getEmer2CellPhone() {
		return emer2CellPhone;
	}

	/**
	 * Returns the emer2City.
	 * @return String
	 */
	public String getEmer2City() {
		return emer2City;
	}

	/**
	 * Returns the emer2ContactName.
	 * @return String
	 */
	public String getEmer2ContactName() {
		return emer2ContactName;
	}

	/**
	 * Returns the emer2ContactRelationship.
	 * @return String
	 */
	public String getEmer2ContactRelationship() {
		return emer2ContactRelationship;
	}

	/**
	 * Returns the emer2Email.
	 * @return String
	 */
	public String getEmer2Email() {
		return emer2Email;
	}

	/**
	 * Returns the emer2HomePhone.
	 * @return String
	 */
	public String getEmer2HomePhone() {
		return emer2HomePhone;
	}

	/**
	 * Returns the emer2State.
	 * @return String
	 */
	public String getEmer2State() {
		return emer2State;
	}

	/**
	 * Returns the emer2WorkPhone.
	 * @return String
	 */
	public String getEmer2WorkPhone() {
		return emer2WorkPhone;
	}

	/**
	 * Returns the emer2Zip.
	 * @return String
	 */
	public String getEmer2Zip() {
		return emer2Zip;
	}

	/**
	 * Returns the emerAddress1.
	 * @return String
	 */
	public String getEmerAddress1() {
		return emerAddress1;
	}

	/**
	 * Returns the emerAddress2.
	 * @return String
	 */
	public String getEmerAddress2() {
		return emerAddress2;
	}

	/**
	 * Returns the emerCellPhone.
	 * @return String
	 */
	public String getEmerCellPhone() {
		return emerCellPhone;
	}

	/**
	 * Returns the emerCity.
	 * @return String
	 */
	public String getEmerCity() {
		return emerCity;
	}

	/**
	 * Returns the emerContactName.
	 * @return String
	 */
	public String getEmerContactName() {
		return emerContactName;
	}

	/**
	 * Returns the emerContactRelationship.
	 * @return String
	 */
	public String getEmerContactRelationship() {
		return emerContactRelationship;
	}

	/**
	 * Returns the emerEmail.
	 * @return String
	 */
	public String getEmerEmail() {
		return emerEmail;
	}

	/**
	 * Returns the emerHomePhone.
	 * @return String
	 */
	public String getEmerHomePhone() {
		return emerHomePhone;
	}

	/**
	 * Returns the emerState.
	 * @return String
	 */
	public String getEmerState() {
		return emerState;
	}

	/**
	 * Returns the emerWorkPhone.
	 * @return String
	 */
	public String getEmerWorkPhone() {
		return emerWorkPhone;
	}

	/**
	 * Returns the emerZip.
	 * @return String
	 */
	public String getEmerZip() {
		return emerZip;
	}

	/**
	 * Returns the firstName.
	 * @return String
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * Returns the gender.
	 * @return String
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * Returns the isStaff.
	 * @return boolean
	 */
	public boolean getIsStaff() {
		return isStaff;
	}

	/**
	 * Returns the lastDateAtAddress.
	 * @return Date
	 */
	public Date getLastDateAtAddress() {
		return lastDateAtAddress;
	}

	/**
	 * Returns the lastName.
	 * @return String
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * Returns the maritalStatus.
	 * @return String
	 */
	public String getMaritalStatus() {
		return maritalStatus;
	}

	/**
	 * Returns the permAddress1.
	 * @return String
	 */
	public String getPermAddress1() {
		return permAddress1;
	}

	/**
	 * Returns the permAddress2.
	 * @return String
	 */
	public String getPermAddress2() {
		return permAddress2;
	}

	/**
	 * Returns the permCellPhone.
	 * @return String
	 */
	public String getPermCellPhone() {
		return permCellPhone;
	}

	/**
	 * Returns the permCity.
	 * @return String
	 */
	public String getPermCity() {
		return permCity;
	}

	/**
	 * Returns the permEmail.
	 * @return String
	 */
	public String getPermEmail() {
		return permEmail;
	}

	/**
	 * Returns the permHomePhone.
	 * @return String
	 */
	public String getPermHomePhone() {
		return permHomePhone;
	}

	/**
	 * Returns the permState.
	 * @return String
	 */
	public String getPermState() {
		return permState;
	}

	/**
	 * Returns the permWorkPhone.
	 * @return String
	 */
	public String getPermWorkPhone() {
		return permWorkPhone;
	}

	/**
	 * Returns the permZip.
	 * @return String
	 */
	public String getPermZip() {
		return permZip;
	}

	/**
	 * Returns the region.
	 * @return String
	 */
	public String getRegion() {
		return region;
	}

	/**
	 * Returns the role.
	 * @return String
	 */
	public String getRole() {
		return role;
	}

	/**
	 * Returns the sIPersonID.
	 * @return String
	 */
	public String getSIPersonID() {
		return Integer.toString(SIPersonID);
	}

	/**
	 * Returns the surferID.
	 * @return String
	 */
	public String getSurferID() {
		return surferID;
	}

	/**
	 * Returns the workInUS.
	 * @return boolean
	 */
	public boolean getWorkInUS() {
		return workInUS;
	}

	/**
	 * Sets the accountNo.
	 * @param accountNo The accountNo to set
	 */
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	/**
	 * Sets the currentAddress1.
	 * @param currentAddress1 The currentAddress1 to set
	 */
	public void setCurrentAddress1(String currentAddress1) {
		this.currentAddress1 = currentAddress1;
	}

	/**
	 * Sets the currentAddress2.
	 * @param currentAddress2 The currentAddress2 to set
	 */
	public void setCurrentAddress2(String currentAddress2) {
		this.currentAddress2 = currentAddress2;
	}

	/**
	 * Sets the currentCellPhone.
	 * @param currentCellPhone The currentCellPhone to set
	 */
	public void setCurrentCellPhone(String currentCellPhone) {
		this.currentCellPhone = currentCellPhone;
	}

	/**
	 * Sets the currentCity.
	 * @param currentCity The currentCity to set
	 */
	public void setCurrentCity(String currentCity) {
		this.currentCity = currentCity;
	}

	/**
	 * Sets the currentEmail.
	 * @param currentEmail The currentEmail to set
	 */
	public void setCurrentEmail(String currentEmail) {
		this.currentEmail = currentEmail;
	}

	/**
	 * Sets the currentHomePhone.
	 * @param currentHomePhone The currentHomePhone to set
	 */
	public void setCurrentHomePhone(String currentHomePhone) {
		this.currentHomePhone = currentHomePhone;
	}

	/**
	 * Sets the currentState.
	 * @param currentState The currentState to set
	 */
	public void setCurrentState(String currentState) {
		this.currentState = currentState;
	}

	/**
	 * Sets the currentWorkPhone.
	 * @param currentWorkPhone The currentWorkPhone to set
	 */
	public void setCurrentWorkPhone(String currentWorkPhone) {
		this.currentWorkPhone = currentWorkPhone;
	}

	/**
	 * Sets the currentZip.
	 * @param currentZip The currentZip to set
	 */
	public void setCurrentZip(String currentZip) {
		this.currentZip = currentZip;
	}

	/**
	 * Sets the emer2Address1.
	 * @param emer2Address1 The emer2Address1 to set
	 */
	public void setEmer2Address1(String emer2Address1) {
		this.emer2Address1 = emer2Address1;
	}

	/**
	 * Sets the emer2Address2.
	 * @param emer2Address2 The emer2Address2 to set
	 */
	public void setEmer2Address2(String emer2Address2) {
		this.emer2Address2 = emer2Address2;
	}

	/**
	 * Sets the emer2CellPhone.
	 * @param emer2CellPhone The emer2CellPhone to set
	 */
	public void setEmer2CellPhone(String emer2CellPhone) {
		this.emer2CellPhone = emer2CellPhone;
	}

	/**
	 * Sets the emer2City.
	 * @param emer2City The emer2City to set
	 */
	public void setEmer2City(String emer2City) {
		this.emer2City = emer2City;
	}

	/**
	 * Sets the emer2ContactName.
	 * @param emer2ContactName The emer2ContactName to set
	 */
	public void setEmer2ContactName(String emer2ContactName) {
		this.emer2ContactName = emer2ContactName;
	}

	/**
	 * Sets the emer2ContactRelationship.
	 * @param emer2ContactRelationship The emer2ContactRelationship to set
	 */
	public void setEmer2ContactRelationship(String emer2ContactRelationship) {
		this.emer2ContactRelationship = emer2ContactRelationship;
	}

	/**
	 * Sets the emer2Email.
	 * @param emer2Email The emer2Email to set
	 */
	public void setEmer2Email(String emer2Email) {
		this.emer2Email = emer2Email;
	}

	/**
	 * Sets the emer2HomePhone.
	 * @param emer2HomePhone The emer2HomePhone to set
	 */
	public void setEmer2HomePhone(String emer2HomePhone) {
		this.emer2HomePhone = emer2HomePhone;
	}

	/**
	 * Sets the emer2State.
	 * @param emer2State The emer2State to set
	 */
	public void setEmer2State(String emer2State) {
		this.emer2State = emer2State;
	}

	/**
	 * Sets the emer2WorkPhone.
	 * @param emer2WorkPhone The emer2WorkPhone to set
	 */
	public void setEmer2WorkPhone(String emer2WorkPhone) {
		this.emer2WorkPhone = emer2WorkPhone;
	}

	/**
	 * Sets the emer2Zip.
	 * @param emer2Zip The emer2Zip to set
	 */
	public void setEmer2Zip(String emer2Zip) {
		this.emer2Zip = emer2Zip;
	}

	/**
	 * Sets the emerAddress1.
	 * @param emerAddress1 The emerAddress1 to set
	 */
	public void setEmerAddress1(String emerAddress1) {
		this.emerAddress1 = emerAddress1;
	}

	/**
	 * Sets the emerAddress2.
	 * @param emerAddress2 The emerAddress2 to set
	 */
	public void setEmerAddress2(String emerAddress2) {
		this.emerAddress2 = emerAddress2;
	}

	/**
	 * Sets the emerCellPhone.
	 * @param emerCellPhone The emerCellPhone to set
	 */
	public void setEmerCellPhone(String emerCellPhone) {
		this.emerCellPhone = emerCellPhone;
	}

	/**
	 * Sets the emerCity.
	 * @param emerCity The emerCity to set
	 */
	public void setEmerCity(String emerCity) {
		this.emerCity = emerCity;
	}

	/**
	 * Sets the emerContactName.
	 * @param emerContactName The emerContactName to set
	 */
	public void setEmerContactName(String emerContactName) {
		this.emerContactName = emerContactName;
	}

	/**
	 * Sets the emerContactRelationship.
	 * @param emerContactRelationship The emerContactRelationship to set
	 */
	public void setEmerContactRelationship(String emerContactRelationship) {
		this.emerContactRelationship = emerContactRelationship;
	}

	/**
	 * Sets the emerEmail.
	 * @param emerEmail The emerEmail to set
	 */
	public void setEmerEmail(String emerEmail) {
		this.emerEmail = emerEmail;
	}

	/**
	 * Sets the emerHomePhone.
	 * @param emerHomePhone The emerHomePhone to set
	 */
	public void setEmerHomePhone(String emerHomePhone) {
		this.emerHomePhone = emerHomePhone;
	}

	/**
	 * Sets the emerState.
	 * @param emerState The emerState to set
	 */
	public void setEmerState(String emerState) {
		this.emerState = emerState;
	}

	/**
	 * Sets the emerWorkPhone.
	 * @param emerWorkPhone The emerWorkPhone to set
	 */
	public void setEmerWorkPhone(String emerWorkPhone) {
		this.emerWorkPhone = emerWorkPhone;
	}

	/**
	 * Sets the emerZip.
	 * @param emerZip The emerZip to set
	 */
	public void setEmerZip(String emerZip) {
		this.emerZip = emerZip;
	}

	/**
	 * Sets the firstName.
	 * @param firstName The firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * Sets the gender.
	 * @param gender The gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * Sets the isStaff.
	 * @param isStaff The isStaff to set
	 */
	public void setIsStaff(boolean isStaff) {
		this.isStaff = isStaff;
	}

	/**
	 * Sets the lastDateAtAddress.
	 * @param lastDateAtAddress The lastDateAtAddress to set
	 */
	public void setLastDateAtAddress(Date lastDateAtAddress) {
		this.lastDateAtAddress = lastDateAtAddress;
	}

	/**
	 * Sets the lastName.
	 * @param lastName The lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * Sets the maritalStatus.
	 * @param maritalStatus The maritalStatus to set
	 */
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	/**
	 * Sets the permAddress1.
	 * @param permAddress1 The permAddress1 to set
	 */
	public void setPermAddress1(String permAddress1) {
		this.permAddress1 = permAddress1;
	}

	/**
	 * Sets the permAddress2.
	 * @param permAddress2 The permAddress2 to set
	 */
	public void setPermAddress2(String permAddress2) {
		this.permAddress2 = permAddress2;
	}

	/**
	 * Sets the permCellPhone.
	 * @param permCellPhone The permCellPhone to set
	 */
	public void setPermCellPhone(String permCellPhone) {
		this.permCellPhone = permCellPhone;
	}

	/**
	 * Sets the permCity.
	 * @param permCity The permCity to set
	 */
	public void setPermCity(String permCity) {
		this.permCity = permCity;
	}

	/**
	 * Sets the permEmail.
	 * @param permEmail The permEmail to set
	 */
	public void setPermEmail(String permEmail) {
		this.permEmail = permEmail;
	}

	/**
	 * Sets the permHomePhone.
	 * @param permHomePhone The permHomePhone to set
	 */
	public void setPermHomePhone(String permHomePhone) {
		this.permHomePhone = permHomePhone;
	}

	/**
	 * Sets the permState.
	 * @param permState The permState to set
	 */
	public void setPermState(String permState) {
		this.permState = permState;
	}

	/**
	 * Sets the permWorkPhone.
	 * @param permWorkPhone The permWorkPhone to set
	 */
	public void setPermWorkPhone(String permWorkPhone) {
		this.permWorkPhone = permWorkPhone;
	}

	/**
	 * Sets the permZip.
	 * @param permZip The permZip to set
	 */
	public void setPermZip(String permZip) {
		this.permZip = permZip;
	}

	/**
	 * Sets the region.
	 * @param region The region to set
	 */
	public void setRegion(String region) {
		this.region = region;
	}

	/**
	 * Sets the role.
	 * @param role The role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * Sets the sIPersonID.
	 * @param sIPersonID The sIPersonID to set
	 */
	public void setSIPersonID(String sIPersonID) {
		SIPersonID = Integer.parseInt(sIPersonID);
	}

	/**
	 * Sets the surferID.
	 * @param surferID The surferID to set
	 */
	public void setSurferID(String surferID) {
		this.surferID = surferID;
	}

	/**
	 * Sets the workInUS.
	 * @param workInUS The workInUS to set
	 */
	public void setWorkInUS(boolean workInUS) {
		this.workInUS = workInUS;
	}

	/**
	 * Returns the middleName.
	 * @return String
	 */
	public String getMiddleName() {
		return middleName;
	}

	/**
	 * Sets the middleName.
	 * @param middleName The middleName to set
	 */
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	/**
	 * Returns the fk_ssmUserID.
	 * @return int
	 */
	public int getFk_ssmUserID() {
		return fk_ssmUserID;
	}

	/**
	 * Sets the fk_ssmUserID.
	 * @param fk_ssmUserID The fk_ssmUserID to set
	 */
	public void setFk_ssmUserID(int fk_ssmUserID) {
		this.fk_ssmUserID = fk_ssmUserID;
	}

	/**
	 * Returns the graduationDate.
	 * @return Date
	 */
	public Date getGraduationDate() {
		return graduationDate;
	}

	/**
	 * Returns the majors.
	 * @return String
	 */
	public String getMajors() {
		return majors;
	}

	/**
	 * Returns the numberChildren.
	 * @return String
	 */
	public String getNumberChildren() {
		return numberChildren;
	}

	/**
	 * Returns the preferredName.
	 * @return String
	 */
	public String getPreferredName() {
		return preferredName;
	}

	/**
	 * Returns the recentSchools.
	 * @return String
	 */
	public String getRecentSchools() {
		return recentSchools;
	}

	/**
	 * Sets the graduationDate.
	 * @param graduationDate The graduationDate to set
	 */
	public void setGraduationDate(Date graduationDate) {
		this.graduationDate = graduationDate;
	}

	/**
	 * Sets the majors.
	 * @param majors The majors to set
	 */
	public void setMajors(String majors) {
		this.majors = majors;
	}

	/**
	 * Sets the numberChildren.
	 * @param numberChildren The numberChildren to set
	 */
	public void setNumberChildren(String numberChildren) {
		this.numberChildren = numberChildren;
	}

	/**
	 * Sets the preferredName.
	 * @param preferredName The preferredName to set
	 */
	public void setPreferredName(String preferredName) {
		this.preferredName = preferredName;
	}

	/**
	 * Sets the recentSchools.
	 * @param recentSchools The recentSchools to set
	 */
	public void setRecentSchools(String recentSchools) {
		this.recentSchools = recentSchools;
	}

	/**
	 * Returns the title.
	 * @return String
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Sets the title.
	 * @param title The title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
 * Returns the staffStieProfileID.
	 * Added 6 December 2002 by RDH
 * @return String
 */
	public String getFk_StaffSiteProfileID() {
		return fk_StaffSiteProfileID;
	}
	/**
 * Sets the staffStieProfileID.
	 * Added 6 December 2002 by RDH
 * @param fk_StaffStieProfileID The staffStieProfileID to set
 */
	public void setFk_StaffSiteProfileID(String fk_StaffSiteProfileID) {
		this.fk_StaffSiteProfileID = fk_StaffSiteProfileID;
	}
		/**
 * Returns the staffStieProfileID.
	 * Added 12 December 2002 by RDH
 * @return String
 */
	public String getUniversityState() {
		return universityState;
	}
	/**
 * Sets the staffStieProfileID.
	 * Added 12 December 2002 by RDH
 * @param universityState The state the most recently attended school was in.
 */
	public void setUniversityState(String universityState) {
		this.universityState = universityState;
	}
}
