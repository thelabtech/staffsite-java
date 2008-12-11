package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Staff extends DBIOEntity {

//identity
	private String accountNo = "";

//foreign keys
	private String fk_currentAddressId = "";
	private String fk_primaryAddressId = "";
    private String fk_secondaryAddressId = "";
	private int teamId = 0;
	
	private String firstName = "";
    private String middleInitial = "";
    private String lastName = "";
    private String isMale = "";
    private String position = "";
    private String countryStatus = "";
    private String jobStatus = "";
    private String ministry = "";
    private String strategy = "";
    private String isNewStaff = "";
    private String primaryEmpLocState = "";
    private String primaryEmpLocCountry = "";
    private String primaryEmpLocCity = "";
    private String primaryEmpLocDesc = "";
    private String spouseFirstName = "";
    private String spouseMiddleName = "";
    private String spouseLastName = "";
    private String spouseAccountNo = "";
    private String spouseEmail = "";
    private String fianceeFirstName = "";
    private String fianceeMiddleName = "";
    private String fianceeLastName = "";
    private String fianceeAccountNo = "";
    private String isFianceeStaff = "";
    private Date fianceeJoinStaffDate = null;
    private String isFianceeJoiningNS = "";
    private String joiningNS = "";
    private String homePhone = "";
    private String workPhone = "";
    private String mobilePhone = "";
    private String pager = "";
    private String email = "";
    private String isEmailSecure = "";
    private String isSecure = "";
    private String isSupported = "";
    private String url = "";
    private Date newStaffTrainingDate = null;
    private String fax = "";
    private String note = "";
    private String region = "";
    private String countryCode = "";
    private String ssn = "";
    private String maritalStatus = "";
    private String deptId = "";
    private String jobCode = "";
    private String accountCode = "";
    private String compFreq = "";
    private String compRate = "";
    private String compChngAmt = "";
    private String jobTitle = "";
    private String deptName = "";
    private String coupleTitle = "";
    private String otherPhone = "";
    private String preferredName = "";
    private String namePrefix = "";
    private Date origHireDate = null;
    private Date birthDate = null;
    private Date marriageDate = null;
    private Date hireDate = null;
    private Date rehireDate = null;
    private Date loaStartDate = null;
    private Date loaEndDate = null;
    private String loaReason = "";
    private long severancePayMonthsReq = 0;
    private Date serviceDate = null;
    private Date lastIncDate = null;
    private Date jobEntryDate = null;
    private Date deptEntryDate = null;
    private Date reportingDate = null;
    private String employmentType = "";
    private String resignationReason = "";
    private Date resignationDate = null;
    private String contributionsToOtherAcct = "";
    private String contributionsToAcntName = "";
	private String contributionsToAcntNo = "";
	private String removedFromPeopleSoft = "";
	private String isNonUSStaff = "";  // Currently used so Review360 can see people not in PS
	private int personID=0;
	
	public Staff(String id) {
		accountNo = id;
		if (!id.equals("")) {
			select();
		}
	}
	public Staff() {}

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
		setMetadata("MiddleInitial","middleInitial",table);
		setMetadata("LastName","lastName",table);
		setMetadata("IsMaleString","isMale",table);
		setMetadata("Position","position",table);
		setMetadata("CountryStatus","countryStatus",table);
		setMetadata("JobStatus","jobStatus",table);
		setMetadata("Ministry","ministry",table);
		setMetadata("Strategy","strategy",table);
		setMetadata("IsNewStaffString","isNewStaff",table);
		setMetadata("PrimaryEmpLocState","primaryEmpLocState",table);
		setMetadata("PrimaryEmpLocCountry","primaryEmpLocCountry",table);
		setMetadata("PrimaryEmpLocCity","primaryEmpLocCity",table);
		setMetadata("PrimaryEmpLocDesc","primaryEmpLocDesc",table);
		setMetadata("SpouseFirstName","spouseFirstName",table);
		setMetadata("SpouseMiddleName","spouseMiddleName",table);
		setMetadata("SpouseLastName","spouseLastName",table);
		setMetadata("SpouseAccountNo","spouseAccountNo",table);
		setMetadata("SpouseEmail","spouseEmail",table);
		setMetadata("FianceeFirstName","fianceeFirstName",table);
		setMetadata("FianceeMiddleName","fianceeMiddleName",table);
		setMetadata("FianceeLastName","fianceeLastName",table);
		setMetadata("FianceeAccountNo","fianceeAccountno",table);
		setMetadata("IsFianceeStaffString","isFianceeStaff",table);
		setMetadata("FianceeJoinStaffDate","fianceeJoinStaffDate",table);
		setMetadata("IsFianceeJoiningNSString","isFianceeJoiningNS",table);
		setMetadata("JoiningNSString","joiningNS",table);
		setMetadata("HomePhone","homePhone",table);
		setMetadata("WorkPhone","workPhone",table);
		setMetadata("MobilePhone","mobilePhone",table);
		setMetadata("Pager","pager",table);
		setMetadata("Email","email",table);
		setMetadata("IsEmailSecureString","isEmailSecure",table);
		setMetadata("Url","url",table);
		setMetadata("NewStaffTrainingDate","newStaffTrainingdate",table);
		setMetadata("Fax","fax",table);
		setMetadata("Note","note",table);
		setMetadata("Region","region",table);
		setMetadata("CountryCode","countryCode",table);
		setMetadata("Ssn","ssn",table);
		setMetadata("MaritalStatus","maritalStatus",table);
		setMetadata("DeptId","deptId",table);
		setMetadata("JobCode","jobCode",table);
		setMetadata("AccountCode","accountCode",table);
		setMetadata("CompFreq","compFreq",table);
		setMetadata("CompRate","compRate",table);
		setMetadata("CompChngAmt","compChngAmt",table);
		setMetadata("JobTitle","jobTitle",table);
		setMetadata("DeptName","deptName",table);
		setMetadata("CoupleTitle","coupleTitle",table);
		setMetadata("OtherPhone","otherPhone",table);
		setMetadata("PreferredName","preferredName",table);
		setMetadata("NamePrefix","namePrefix",table);
		setMetadata("OrigHireDate","origHiredate",table);
		setMetadata("BirthDate","birthDate",table);
		setMetadata("MarriageDate","marriageDate",table);
		setMetadata("HireDate","hireDate",table);
		setMetadata("RehireDate","rehireDate",table);
		setMetadata("LoaStartDate","loaStartDate",table);
		setMetadata("LoaEndDate","loaEndDate",table);
		setMetadata("LoaReason","loaReason",table);
		setMetadata("SeverancePayMonthsReq","severancePayMonthsReq",table);
		setMetadata("ServiceDate","serviceDate",table);
		setMetadata("LastIncDate","lastIncDate",table);
		setMetadata("JobEntryDate","jobEntryDate",table);
		setMetadata("DeptEntryDate","deptEntryDate",table);
		setMetadata("ReportingDate","reportingDate",table);
		setMetadata("EmploymentType","employmentType",table);
		setMetadata("ResignationReason","resignationReason",table);
		setMetadata("ResignationDate","resignationDate",table);
		setMetadata("ContributionsToOtherAcctString","contributionsToOtherAcct",table);
		setMetadata("ContributionsToAcntName","contributionsToAcntName",table);
		setMetadata("ContributionsToAcntNo","contributionsToAcntNo",table);
		setMetadata("IsSecureString","isSecure",table);
		setMetadata("IsSupportedString","isSupported",table);
		setMetadata("RemovedFromPeopleSoft","removedFromPeopleSoft",table);
		setMetadata("IsNonUSStaff","isNonUSStaff",table);  // Currently used so Review360 can see people not in PS
		
		setMetadata("TeamId","fk_teamID",table);
		setMetadata("PrimaryAddressId","fk_primaryAddress",table);
		setMetadata("SecondaryAddressId","fk_secondaryAddress",table);
		setMetadata("PersonID","person_id",table);
		setAutodetectProperties(false);
	}

	public String getAccountNo() { return accountNo; }
	public void setAccountNo(String accountNo) { this.accountNo = accountNo; }	

	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName){ this.firstName = firstName; }

	public String getMiddleInitial() { return middleInitial; }
	public void setMiddleInitial(String middleInitial) { this.middleInitial = middleInitial; }
	
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }
	
	public boolean getIsMale() { return isMale != null && isMale.equals("T"); }
	public void setIsMale(boolean isMale) { this.isMale = isMale ? "T" : "F"; }
	public String getIsMaleString() { return isMale; }
	public void setIsMaleString(String isMale) { this.isMale = isMale; }

	public String getPosition() { return position; }
	public void setPosition(String position) { this.position = position; }
	
	public String getCountryStatus() { return countryStatus; }
	public void setCountryStatus(String countryStatus) { this.countryStatus = countryStatus; }
	
	public String getJobStatus() { return jobStatus; }
	public void setJobStatus(String jobStatus) { this.jobStatus = jobStatus; }
	
	public String getMinistry() { return ministry; }
	public void setMinistry(String ministry) { this.ministry = ministry; }
	
	public String getStrategy() { return strategy; }
	public void setStrategy(String strategy) { this.strategy = strategy; }

	public boolean getIsNewStaff() { return isNewStaff != null && isNewStaff.equals("T"); }
	public void setIsNewStaff(boolean isNewStaff) { this.isNewStaff = isNewStaff ? "T" : "F"; }
	public String getIsNewStaffString() { return isNewStaff; }
	public void setIsNewStaffString(String isNewStaff) { this.isNewStaff = isNewStaff; }
	
	public String getPrimaryEmpLocState() { return primaryEmpLocState; }
	public void setPrimaryEmpLocState(String primaryEmpLocState) { this.primaryEmpLocState = primaryEmpLocState; }
	
	public String getPrimaryEmpLocCountry() { return primaryEmpLocCountry; }
	public void setPrimaryEmpLocCountry(String primaryEmpLocCountry) { this.primaryEmpLocCountry = primaryEmpLocCountry; }
	
	public String getPrimaryEmpLocCity() { return primaryEmpLocCity; }
	public void setPrimaryEmpLocCity(String primaryEmpLocCity) { this.primaryEmpLocCity = primaryEmpLocCity; }
	
	public String getSpouseFirstName() { return spouseFirstName; }
	public void setSpouseFirstName(String spouseFirstName) { this.spouseFirstName = spouseFirstName; }
	
	public String getSpouseMiddleName() { return spouseMiddleName; }
	public void setSpouseMiddleName(String spouseMiddleName) { this.spouseMiddleName = spouseMiddleName; }
	
	public String getSpouseLastName() { return spouseLastName; }
	public void setSpouseLastName(String spouseLastName) { this.spouseLastName = spouseLastName; }
	
	public String getSpouseAccountNo() { return spouseAccountNo; }
	public void setSpouseAccountNo(String spouseAccountNo) { this.spouseAccountNo = spouseAccountNo; }
	
	public String getSpouseEmail() { return spouseEmail; }
	public void setSpouseEmail(String spouseEmail) { this.spouseEmail = spouseEmail; }
	
	public String getFianceeFirstName() { return fianceeFirstName; }
	public void setFianceeFirstName(String fianceeFirstName) { this.fianceeFirstName = fianceeFirstName; }
	
	public String getFianceeMiddleName() { return fianceeMiddleName; }
	public void setFianceeMiddleName(String fianceeMiddleName) { this.fianceeMiddleName = fianceeMiddleName; }
	
	public String getFianceeLastName() { return fianceeLastName; }
	public void setFianceeLastName(String fianceeLastName) { this.fianceeLastName = fianceeLastName; }
	
	public String getFianceeAccountNo() { return fianceeAccountNo; }
	public void setFianceeAccountNo(String fianceeAccountNo) { this.fianceeAccountNo = fianceeAccountNo; }
	
	public boolean getIsFianceeStaff() { return isFianceeStaff != null && isFianceeStaff.equals("T"); }
	public void setIsFianceeStaff(boolean isFianceeStaff) { this.isFianceeStaff = isFianceeStaff ? "T" : "F"; }
	public String getIsFianceeStaffString() { return isFianceeStaff; }
	public void setIsFianceeStaffString(String isFianceeStaff) { this.isFianceeStaff = isFianceeStaff; }
	
	public Date getFianceeJoinStaffDate() { return fianceeJoinStaffDate; }
	public void setFianceeJoinStaffDate(Date fianceeJoinStaffDate) { this.fianceeJoinStaffDate = org.alt60m.util.DateUtils.clearTimeFromDate(fianceeJoinStaffDate); }
	
	public boolean getIsFianceeJoiningNS() { return isFianceeJoiningNS != null && isFianceeJoiningNS.equals("T"); }
	public void setIsFianceeJoiningNS(boolean isFianceeJoiningNS) { this.isFianceeJoiningNS = isFianceeJoiningNS ? "T" : "F"; }
	public String getIsFianceeJoiningNSString() { return isFianceeJoiningNS; }
	public void setIsFianceeJoiningNSString(String isFianceeJoiningNS) { this.isFianceeJoiningNS = isFianceeJoiningNS; }
	
	public boolean getJoiningNS() { return joiningNS != null && joiningNS.equals("T"); }
	public void setJoiningNS(boolean joiningNS) { this.joiningNS = joiningNS ? "T" : "F"; }
	public String getJoiningNSString() { return joiningNS; }
	public void setJoiningNSString(String joiningNS) { this.joiningNS = joiningNS; }
	
	public String getHomePhone() { return homePhone; }
	public void setHomePhone(String homePhone) { this.homePhone = homePhone; }
	
	public String getWorkPhone() { return workPhone; }
	public void setWorkPhone(String workPhone) { this.workPhone = workPhone; }
	
	public String getMobilePhone() { return mobilePhone; }
	public void setMobilePhone(String mobilePhone) { this.mobilePhone = mobilePhone; }
	
	public String getPager() { return pager; }
	public void setPager(String pager) { this.pager = pager; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public boolean getIsEmailSecure() { return isEmailSecure != null && isEmailSecure.equals("T"); }
	public void setIsEmailSecure(boolean isEmailSecure) { this.isEmailSecure = isEmailSecure ? "T" : "F"; }
	public String getIsEmailSecureString() { return isEmailSecure; }
	public void setIsEmailSecureString(String isEmailSecure) { this.isEmailSecure = isEmailSecure; }
	
	public boolean getIsSecure() { return isSecure != null && isSecure.equals("T"); }
	public void setIsSecure(boolean val) { this.isSecure = val ? "T" : "F"; }
	public String getIsSecureString() { return isSecure; }
	public void setIsSecureString(String val) { this.isSecure = val; }
	
	public boolean getIsSupported() { return isSupported != null && isSupported.equals("T"); }
	public void setIsSupported(boolean val) { this.isSupported = val ? "T" : "F"; }
	public String getIsSupportedString() { return isSupported; }
	public void setIsSupportedString(String val) { this.isSupported = val; }
	
	public String getUrl() { return url; }
	public void setUrl(String url) { this.url = url; }
	
	public Date getNewStaffTrainingDate() { return newStaffTrainingDate; }
	public void setNewStaffTrainingDate(Date newStaffTrainingDate) { this.newStaffTrainingDate = org.alt60m.util.DateUtils.clearTimeFromDate(newStaffTrainingDate); }
	
	public String getFax() { return fax; }
	public void setFax(String fax) { this.fax = fax; }
	
	public String getNote() { return note; }
	public void setNote(String note) { this.note = note; }
	
	public String getRegion() { return region; }
	public void setRegion(String region) { this.region = region; }
	
	public String getCountryCode() { return countryCode; }
	public void setCountryCode(String countryCode) { this.countryCode = countryCode; }
	
	public String getSsn() { return ssn; }
	public void setSsn(String ssn) { this.ssn = ssn; }
	
	public String getMaritalStatus() { return maritalStatus; }
	public void setMaritalStatus(String maritalStatus) { this.maritalStatus = maritalStatus; }
	
	public String getDeptId() { return deptId; }
	public void setDeptId(String deptId) { this.deptId = deptId; }
	
	public String getJobCode() { return jobCode; }
	public void setJobCode(String jobCode) { this.jobCode = jobCode; }
	
	public String getAccountCode() { return accountCode; }
	public void setAccountCode(String accountCode) { this.accountCode = accountCode; }
	
	public String getCompFreq() { return compFreq; }
	public void setCompFreq(String compFreq) { this.compFreq = compFreq; }
	
	public String getCompRate() { return compRate; }
	public void setCompRate(String compRate) { this.compRate = compRate; }
	
	public String getCompChngAmt() { return compChngAmt; }
	public void setCompChngAmt(String compChngAmt) { this.compChngAmt = compChngAmt; }
	
	public String getJobTitle() { return jobTitle; }
	public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }
	
	public String getDeptName() { return deptName; }
	public void setDeptName(String deptName) { this.deptName = deptName; }
	
	public String getCoupleTitle() { return coupleTitle; }
	public void setCoupleTitle(String coupleTitle) { this.coupleTitle = coupleTitle; }
	
	public String getOtherPhone() { return otherPhone; }
	public void setOtherPhone(String otherPhone) { this.otherPhone = otherPhone; }
	
	public String getPreferredName() { return preferredName; }
	public void setPreferredName(String preferredName) { this.preferredName = preferredName; }
	
	public String getNamePrefix() { return namePrefix; }
	public void setNamePrefix(String namePrefix) { this.namePrefix = namePrefix; }
	
	public Date getOrigHireDate() { return origHireDate; }
	public void setOrigHireDate(Date origHireDate) { this.origHireDate = org.alt60m.util.DateUtils.clearTimeFromDate(origHireDate); }
	
	public Date getBirthDate() { return birthDate; }
	public void setBirthDate(Date birthDate) { this.birthDate = org.alt60m.util.DateUtils.clearTimeFromDate(birthDate); }
	
	public Date getMarriageDate() { return marriageDate; }
	public void setMarriageDate(Date marriageDate) { this.marriageDate = org.alt60m.util.DateUtils.clearTimeFromDate(marriageDate); }
	
	public Date getHireDate() { return hireDate; }
	public void setHireDate(Date hireDate) { this.hireDate = org.alt60m.util.DateUtils.clearTimeFromDate(hireDate); } 
	
	public Date getRehireDate() { return rehireDate; }
	public void setRehireDate(Date rehireDate) { this.rehireDate = org.alt60m.util.DateUtils.clearTimeFromDate(rehireDate); }
	
	public Date getLoaStartDate() { return loaStartDate; }
	public void setLoaStartDate(Date loaStartDate) { this.loaStartDate = org.alt60m.util.DateUtils.clearTimeFromDate(loaStartDate); }
	
	public Date getLoaEndDate() { return loaEndDate; }
	public void setLoaEndDate(Date loaEndDate) { this.loaEndDate = org.alt60m.util.DateUtils.clearTimeFromDate(loaEndDate); }
	
	public String getLoaReason() { return loaReason; }
	public void setLoaReason(String loaReason) { this.loaReason = loaReason; }
	
	public long getSeverancePayMonthsReq() { return severancePayMonthsReq; }
	public void setSeverancePayMonthsReq(long severancePayMonthsReq) { this.severancePayMonthsReq = severancePayMonthsReq; }
	
	public Date getServiceDate() { return serviceDate; }
	public void setServiceDate(Date serviceDate) { this.serviceDate = org.alt60m.util.DateUtils.clearTimeFromDate(serviceDate); }
	
	public Date getLastIncDate() { return lastIncDate; }
	public void setLastIncDate(Date lastIncDate) { this.lastIncDate = org.alt60m.util.DateUtils.clearTimeFromDate(lastIncDate); }
	
	public Date getJobEntryDate() { return jobEntryDate; }
	public void setJobEntryDate(Date jobEntryDate) { this.jobEntryDate = org.alt60m.util.DateUtils.clearTimeFromDate(jobEntryDate); }
	
	public Date getDeptEntryDate() { return deptEntryDate; }
	public void setDeptEntryDate(Date deptEntryDate) { this.deptEntryDate = org.alt60m.util.DateUtils.clearTimeFromDate(deptEntryDate); }
	
	public Date getReportingDate() { return reportingDate; }
	public void setReportingDate(Date reportingDate) { this.reportingDate = org.alt60m.util.DateUtils.clearTimeFromDate(reportingDate); }
	
	public String getEmploymentType() { return employmentType; }
	public void setEmploymentType(String employmentType) { this.employmentType = employmentType; }
	
	public String getResignationReason() { return resignationReason; }
	public void setResignationReason(String resignationReason) { this.resignationReason = resignationReason; }
	
	public Date getResignationDate() { return resignationDate; }
	public void setResignationDate(Date resignationDate) { this.resignationDate = resignationDate; }
	
	public boolean getContributionsToOtherAcct() { return contributionsToOtherAcct != null && contributionsToOtherAcct.equals("T"); }
	public void setContributionsToOtherAcct(boolean contributionsToOtherAcct) {	this.contributionsToOtherAcct = contributionsToOtherAcct ? "T" : "F"; }
	public String getContributionsToOtherAcctString() { return contributionsToOtherAcct; }
	public void setContributionsToOtherAcctString(String contributionsToOtherAcct) { this.contributionsToOtherAcct = contributionsToOtherAcct; }
	
	public String getContributionsToAcntName() { return contributionsToAcntName; }
	public void setContributionsToAcntName(String contributionsToAcntName) { this.contributionsToAcntName = contributionsToAcntName; }
	
	public String getContributionsToAcntNo() { return contributionsToAcntNo; }
	public void setContributionsToAcntNo(String contributionsToAcntNo) { this.contributionsToAcntNo = contributionsToAcntNo; }
	
	public String getRemovedFromPeopleSoft() { return removedFromPeopleSoft; }
	public void setRemovedFromPeopleSoft(String removedFromPeopleSoft) { this.removedFromPeopleSoft = removedFromPeopleSoft; }
	
	public String getIsNonUSStaff() { return isNonUSStaff; }
	public void setIsNonUSStaff(String isNonUSStaff) { this.isNonUSStaff = isNonUSStaff; }
	
	
	
	
    public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int fk_localLevelId) {
		this.teamId = fk_localLevelId;
	}
	  public int getPersonID() {
			return personID;
		}
		public void setPersonID(int personID) {
			this.personID = personID;
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
	
	public LocalLevel getLocalLevel(){ return new LocalLevel(getLocalLevelId()); }
	public void setLocalLevel(LocalLevel ll){ setLocalLevelId(ll.getLocalLevelId()); }
	public LocalLevel getMembership(){ return getLocalLevel(); }
	public void setMembership(LocalLevel membership){ setLocalLevel(membership); }
	public void assocLocalLevel(LocalLevel t) { setLocalLevel(t); }

	public String getCurrentAddressId(){ return this.fk_currentAddressId; }
	public void setCurrentAddressId(String id){ this.fk_currentAddressId = id; }
	public OldAddress getCurrentAddress(){ return new OldAddress(this.fk_currentAddressId); }
	public void setCurrentAddress(OldAddress currentAddress){ this.fk_currentAddressId = currentAddress.getAddressId(); }
	public void assocCurrentAddress(OldAddress currentAddress){ setCurrentAddress(currentAddress); }

	public String getPrimaryAddressId(){
		if  (this.fk_primaryAddressId!=null && 
			!this.fk_primaryAddressId.equals("") &&
			!this.fk_primaryAddressId.equals(" ") &&
			!this.fk_primaryAddressId.equals("0"))
				return this.fk_primaryAddressId;
		else 
			return null;			
		}
	public void setPrimaryAddressId(String id){ this.fk_primaryAddressId = id; }
	public OldAddress getPrimaryAddress(){
		if  (this.fk_primaryAddressId!=null && 
				!this.fk_primaryAddressId.equals("") &&
				!this.fk_primaryAddressId.equals(" ") &&
				!this.fk_primaryAddressId.equals("0"))
			return new OldAddress(this.fk_primaryAddressId);
		else return null;
	}
	public void setPrimaryAddress(OldAddress primaryAddress){ this.fk_primaryAddressId = primaryAddress.getAddressId(); }
	public void assocPrimaryAddress(OldAddress primaryAddress){ setPrimaryAddress(primaryAddress); }

	public String getSecondaryAddressId(){ 
		if ((this.fk_secondaryAddressId==null) || (this.fk_secondaryAddressId.equals("")) || (this.fk_secondaryAddressId.equals(" ")) || (this.fk_secondaryAddressId.equals("0")))  return null;
		else return this.fk_secondaryAddressId; 
	}
	public void setSecondaryAddressId(String id){ this.fk_secondaryAddressId = id; }
	public OldAddress getSecondaryAddress(){
		if  (this.fk_secondaryAddressId!=null && 
				!this.fk_secondaryAddressId.equals("") &&
				!this.fk_secondaryAddressId.equals(" ") &&
				!this.fk_secondaryAddressId.equals("0"))
			return new OldAddress(this.fk_secondaryAddressId);
		else return null;
	}
	public void setSecondaryAddress(OldAddress secondaryAddress){ this.fk_secondaryAddressId = secondaryAddress.getAddressId(); }
	public void assocSecondaryAddress(OldAddress secondaryAddress){ setSecondaryAddress(secondaryAddress); }

	public Vector getDependents(){ 
		Dependent d = new Dependent();
		String table = "ministry_viewStaffDependents";
		d.changeTargetTable(table);
		return d.selectList("accountNo = '" + this.accountNo + "'");
	}
	public Vector getDependents(String orderField, boolean DESC){ 
		Dependent d = new Dependent();
		String table = "ministry_viewStaffDependents";
		d.changeTargetTable(table);
		return d.selectList("accountNo = '" + this.accountNo + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocDependent(Dependent d) {
		StaffDependent sd = new StaffDependent();
		sd.setDependent(d);
		sd.setStaff(this);
		sd.insert();
    }
	public void dissocDependent(Dependent d) {
		StaffDependent sd = new StaffDependent();
		sd.setDependent(d);
		sd.setStaff(this);
		sd.delete();
	}

	public Vector getLoaNotes(){
		Note n = new Note();
		n.setLoaNoteId(this.accountNo);
		return n.selectList();
	}
	public Vector getLoaNotes(String orderField, boolean DESC){
		Note n = new Note();
		return n.selectList("Fk_loaNote = '" + this.accountNo + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocLoaNote(Note loaNote) {
		loaNote.setLoaNoteId(this.accountNo);
		loaNote.update();
	}
	public void dissocLoaNote(Note loaNote) {
		loaNote.setLoaNoteId("");
		loaNote.update();
	}

	public Vector getResignationLetters(){
		Note n = new Note();
		n.setResignationLetterId(this.accountNo);
		return n.selectList();
	}
	public Vector getResignationLetters(String orderField, boolean DESC){
		Note n = new Note();
		return n.selectList("Fk_resignationLetter = '" + this.accountNo + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocResignationLetter(Note resignationLetter) {
		resignationLetter.setResignationLetterId(this.accountNo);
		resignationLetter.update();
	}
	public void dissocResignationLetter(Note resignationLetter) {
		resignationLetter.setResignationLetterId("");
		resignationLetter.update();
	}
	/**
	 * @return Returns the primaryEmpLocDesc.
	 */
	public String getPrimaryEmpLocDesc() {
		return primaryEmpLocDesc;
	}
	/**
	 * @param primaryEmpLocDesc The primaryEmpLocDesc to set.
	 */
	public void setPrimaryEmpLocDesc(String primaryEmpLocDesc) {
		this.primaryEmpLocDesc = primaryEmpLocDesc;
	}
}
