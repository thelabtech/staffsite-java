/* Generated by Together */

package org.alt60m.ministry.model;
import java.util.*;

/**
 * @persistent 
 * @table ministry_Staff
 * @cache-type none
 * @access shared
 */
 
 //kb - 11/14/02 - added isSecure field.
 
public class Staff {

    private String firstName = new String();
    private String middleInitial = new String();

    private String lastName = new String();
    /**
    * @sql-type char[TF]
    */
    private boolean isMale;
    private String position = new String();
    private String countryStatus = new String();

    private String jobStatus = new String();
    private String ministry = new String();
    private String strategy = new String();
    /**
    * @sql-type char[TF]
    */
    private boolean isNewStaff;
    private String primaryEmpLocState = new String();
    private String primaryEmpLocCountry = new String();
    private String primaryEmpLocCity = new String();
    private String spouseFirstName = new String();
    private String spouseMiddleName = new String();
    private String spouseLastName = new String();
    private String spouseAccountNo = new String();
    private String spouseEmail = new String();
    private String fianceeFirstName = new String();
    private String fianceeMiddleName = new String();
    private String fianceeLastName = new String();
    private String fianceeAccountno = new String();
    /**
    * @sql-type char[TF]
    */
    private boolean isFianceeStaff;
    private Date fianceeJoinStaffDate;
    /**
    * @sql-type char[TF]
    */
    private boolean isFianceeJoiningNS;
    /**
    * @sql-type char[TF]
    */
    private boolean joiningNS;
    private String homePhone = new String();
    private String workPhone = new String();
    private String mobilePhone = new String();
    private String pager = new String();
    private String email = new String();
    /**
    * @sql-type char[TF]
    */
    private boolean isEmailSecure;
    private boolean isSecure;           //added kb 11/14/02
    private boolean isSupported;        //added kb 11/14/02
    private String url = new String();
    private Date newStaffTrainingDate;
    private String fax = new String();
    private String note = new String();
    private String region = new String();

    /**
     * @stereotype key 
     * @rdbPrimaryKey
     * @rdbNotNull
     * @rdbSize 20
     * @rdbPhysicalName accountNo
     * @rdbLogicalType VARCHAR
	 * @primary-key
     */
    private String accountNo = new String();
    private String countryCode = new String();
    private String ssn = new String();
    private String maritalStatus = new String();
    private String deptId = new String();
    private String jobCode = new String();
    private String accountCode = new String();
    private String compFreq = new String();
    private String compRate = new String();
    private String compChngAmt = new String();
    private String jobTitle = new String();
    private String deptName = new String();
    private String coupleTitle = new String();
    private String otherPhone = new String();
    private String preferredName = new String();
    private String namePrefix = new String();
    private Date origHireDate;
    private Date birthDate;
    private Date marriageDate;
    private Date hireDate;
    private Date rehireDate;
    private Date loaStartDate;
    private Date loaEndDate;
    private String loaReason = new String();
    private long severancePayMonthsReq;
    private Date serviceDate;
    private Date lastIncDate;
    private Date jobEntryDate;
    private Date deptEntryDate;
    private Date reportingDate;
    private String employmentType = new String();
    private String resignationReason = new String();
    private Date resignationDate;
    /**
    * @sql-type char[TF]
    */
    private boolean contributionsToOtherAcct;
    private String contributionsToAcntName = new String();
    private String contributionsToAcntNo = new String();

	/**
     * @sql-name fk_currentAddress
     */
    private Address currentAddress;

	/**
     * @sql-name fk_primaryAddress
     */
	private Address primaryAddress;

     /**
      * @field-type org.alt60m.ministry.model.Dependent
      * @many-table ministry_Assoc_dependents
      * @sql-name dependentID
      * @many-key accountNo
      */
    private Collection dependents = new Vector();

	/**
     * @sql-name fk_secondaryAddress
     */
    private Address secondaryAddress;

    /**
     * @shapeType AssociationLink 
     * @clientCardinality 0..1
     * @supplierCardinality 0..n
     * @supplierRole loaExplanation
     * @label loaNote
     * @field-type org.alt60m.ministry.model.Note
     * @many-key Fk_loaNote
     */
	private Collection loaNote = new Vector();

	/**
     * @shapeType AssociationLink 
     * @clientCardinality 0..1
     * @supplierCardinality 0..n
     * @supplierRole resignationLetter
     * @label resignationLetter
     * @field-type org.alt60m.ministry.model.Note
     * @many-key Fk_resignationLetter
     */
    private Collection resignationLetter = new Vector();

	public String getFirstName() {
		return firstName; 
	}
	public void setFirstName(String firstName){
        this.firstName = firstName;
    }
	public String getMiddleInitial() {
		return middleInitial; 
	}
	public void setMiddleInitial(String middleInitial) {
		this.middleInitial = middleInitial; 
	}
	public String getLastName() {
		return lastName; 
	}
	public void setLastName(String lastName) {
		this.lastName = lastName; 
	}
	public boolean getIsMale() {
		return isMale; 
	}
	public void setIsMale(boolean isMale) {
		this.isMale = isMale; 
	}
	public String getPosition() {
		return position; 
	}
	public void setPosition(String position) {
		this.position = position; 
	}
	public String getCountryStatus() {
		return countryStatus; 
	}
	public void setCountryStatus(String countryStatus) {
		this.countryStatus = countryStatus; 
	}
	public String getJobStatus() {
		return jobStatus; 
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus; 
	}
	public String getMinistry() {
		return ministry; 
	}
	public void setMinistry(String ministry) {
		this.ministry = ministry; 
	}
	public String getStrategy() {
		return strategy; 
	}
	public void setStrategy(String strategy) {
		this.strategy = strategy; 
	}

	public boolean getIsNewStaff() {
		return isNewStaff; 
	}
	public void setIsNewStaff(boolean isNewStaff) {
		this.isNewStaff = isNewStaff; 
	}
	public String getPrimaryEmpLocState() {
		return primaryEmpLocState; 
	}
	public void setPrimaryEmpLocState(String primaryEmpLocState) {
		this.primaryEmpLocState = primaryEmpLocState; 
	}
	public String getPrimaryEmpLocCountry() {
		return primaryEmpLocCountry; 
	}
	public void setPrimaryEmpLocCountry(String primaryEmpLocCountry) {
		this.primaryEmpLocCountry = primaryEmpLocCountry; 
	}
	public String getPrimaryEmpLocCity() {
		return primaryEmpLocCity; 
	}
	public void setPrimaryEmpLocCity(String primaryEmpLocCity) {
		this.primaryEmpLocCity = primaryEmpLocCity; 
	}
	public String getSpouseFirstName() {
		return spouseFirstName; 
	}
	public void setSpouseFirstName(String spouseFirstName) {
		this.spouseFirstName = spouseFirstName; 
	}
	public String getSpouseMiddleName() {
		return spouseMiddleName; 
	}
	public void setSpouseMiddleName(String spouseMiddleName) {
		this.spouseMiddleName = spouseMiddleName; 
	}
	public String getSpouseLastName() {
		return spouseLastName; 
	}
	public void setSpouseLastName(String spouseLastName) {
		this.spouseLastName = spouseLastName; 
	}
	public String getSpouseAccountNo() {
		return spouseAccountNo; 
	}
	public void setSpouseAccountNo(String spouseAccountNo) {
		this.spouseAccountNo = spouseAccountNo; 
	}
	public String getSpouseEmail() {
		return spouseEmail; 
	}
	public void setSpouseEmail(String spouseEmail) {
		this.spouseEmail = spouseEmail; 
	}
	public String getFianceeFirstName() {
		return fianceeFirstName; 
	}
	public void setFianceeFirstName(String fianceeFirstName) {
		this.fianceeFirstName = fianceeFirstName; 
	}
	public String getFianceeMiddleName() {
		return fianceeMiddleName; 
	}
	public void setFianceeMiddleName(String fianceeMiddleName) {
		this.fianceeMiddleName = fianceeMiddleName; 
	}
	public String getFianceeLastName() {
		return fianceeLastName; 
	}
	public void setFianceeLastName(String fianceeLastName) {
		this.fianceeLastName = fianceeLastName; 
	}
	public String getFianceeAccountno() {
		return fianceeAccountno; 
	}
	public void setFianceeAccountno(String finaceeAccountno) {
		this.fianceeAccountno = finaceeAccountno; 
	}
	public boolean getIsFianceeStaff() {
		return isFianceeStaff; 
	}
	public void setIsFianceeStaff(boolean isFianceeStaff) {
		this.isFianceeStaff = isFianceeStaff; 
	}
	public Date getFianceeJoinStaffDate() {
		return fianceeJoinStaffDate; 
	}
	public void setFianceeJoinStaffDate(Date fianceeJoinStaffDate) {
		this.fianceeJoinStaffDate = fianceeJoinStaffDate; 
	}
	public boolean getIsFianceeJoiningNS() {
		return isFianceeJoiningNS; 
	}
	public void setIsFianceeJoiningNS(boolean isFianceeJoiningNS) {
		this.isFianceeJoiningNS = isFianceeJoiningNS; 
	}
	public boolean getJoiningNS() {
		return joiningNS; 
	}
	public void setJoiningNS(boolean joiningNS) {
		this.joiningNS = joiningNS; 
	}
	public String getHomePhone() {
		return homePhone; 
	}
	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone; 
	}
	public String getWorkPhone() {
		return workPhone; 
	}
	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone; 
	}
	public String getMobilePhone() {
		return mobilePhone; 
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone; 
	}
	public String getPager() {
		return pager; 
	}
	public void setPager(String pager) {
		this.pager = pager; 
	}
	public String getEmail() {
		return email; 
	}
	public void setEmail(String email) {
		this.email = email; 
	}
	public boolean getIsEmailSecure() {
		return isEmailSecure; 
	}
	public void setIsEmailSecure(boolean isEmailSecure) {
		this.isEmailSecure = isEmailSecure; 
	}
	
	//added kb 11/14/02
	public boolean getIsSecure() { return isSecure; }
	public void setIsSecure(boolean val) { isSecure = val; }
	
	public boolean getIsSupported() { return isSupported; }
	public void setIsSupported(boolean val) { isSupported = val; }
	//end added kb
	
	public String getUrl() {
		return url; 
	}
	public void setUrl(String url) {
		this.url = url; 
	}
	public Date getNewStaffTrainingDate() {
		return newStaffTrainingDate; 
	}
	public void setNewStaffTrainingDate(Date newStaffTrainingDate) {
		this.newStaffTrainingDate = newStaffTrainingDate; 
	}
	public String getFax() {
		return fax; 
	}
	public void setFax(String fax) {
		this.fax = fax; 
	}
	public String getNote() {
		return note; 
	}
	public void setNote(String note) {
		this.note = note; 
	}
	public String getRegion() {
		return region; 
	}
	public void setRegion(String region) {
		this.region = region; 
	}
	public String getAccountNo() {
		return accountNo; 
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo; 
	}
	public String getCountryCode() {
		return countryCode; 
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode; 
	}
	public String getSsn() {
		return ssn; 
	}
	public void setSsn(String ssn) {
		this.ssn = ssn; 
	}
	public String getMaritalStatus() {
		return maritalStatus; 
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus; 
	}
	public String getDeptId() {
		return deptId; 
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId; 
	}
	public String getJobCode() {
		return jobCode; 
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode; 
	}
	public String getAccountCode() {
		return accountCode; 
	}
	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode; 
	}
	public String getCompFreq() {
		return compFreq; 
	}
	public void setCompFreq(String compFreq) {
		this.compFreq = compFreq; 
	}
	public String getCompRate() {
		return compRate; 
	}
	public void setCompRate(String compRate) {
		this.compRate = compRate; 
	}
	public String getCompChngAmt() {
		return compChngAmt; 
	}
	public void setCompChngAmt(String compChngAmt) {
		this.compChngAmt = compChngAmt; 
	}
	public String getJobTitle() {
		return jobTitle; 
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle; 
	}
	public String getDeptName() {
		return deptName; 
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName; 
	}
	public String getCoupleTitle() {
		return coupleTitle; 
	}
	public void setCoupleTitle(String coupleTitle) {
		this.coupleTitle = coupleTitle; 
	}
	public String getOtherPhone() {
		return otherPhone; 
	}
	public void setOtherPhone(String otherPhone) {
		this.otherPhone = otherPhone; 
	}
	public String getPreferredName() {
		return preferredName; 
	}
	public void setPreferredName(String preferredName) {
		this.preferredName = preferredName; 
	}
	public String getNamePrefix() {
		return namePrefix; 
	}
	public void setNamePrefix(String namePrefix) {
		this.namePrefix = namePrefix; 
	}
	public Date getOrigHireDate() {
		return origHireDate; 
	}
	public void setOrigHireDate(Date origHireDate) {
		this.origHireDate = origHireDate; 
	}
	public Date getBirthDate() {
		return birthDate; 
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate; 
	}
	public Date getMarriageDate() {
		return marriageDate; 
	}
	public void setMarriageDate(Date marriageDate) {
		this.marriageDate = marriageDate; 
	}
	public Date getHireDate() {
		return hireDate; 
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate; 
	}
	public Date getRehireDate() {
		return rehireDate; 
	}
	public void setRehireDate(Date rehireDate) {
		this.rehireDate = rehireDate; 
	}
	public Date getLoaStartDate() {
		return loaStartDate; 
	}
	public void setLoaStartDate(Date loaStartDate) {
		this.loaStartDate = loaStartDate; 
	}
	public Date getLoaEndDate() {
		return loaEndDate; 
	}
	public void setLoaEndDate(Date loaEndDate) {
		this.loaEndDate = loaEndDate; 
	}
	public String getLoaReason() {
		return loaReason; 
	}
	public void setLoaReason(String loaReason) {
		this.loaReason = loaReason; 
	}
	public long getSeverancePayMonthsReq() {
		return severancePayMonthsReq; 
	}
	public void setSeverancePayMonthsReq(long severancePayMonthsReq) {
		this.severancePayMonthsReq = severancePayMonthsReq; 
	}
	public Date getServiceDate() {
		return serviceDate; 
	}
	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate; 
	}
	public Date getLastIncDate() {
		return lastIncDate; 
	}
	public void setLastIncDate(Date lastIncDate) {
		this.lastIncDate = lastIncDate; 
	}
	public Date getJobEntryDate() {
		return jobEntryDate; 
	}
	public void setJobEntryDate(Date jobEntryDate) {
		this.jobEntryDate = jobEntryDate; 
	}
	public Date getDeptEntryDate() {
		return deptEntryDate; 
	}
	public void setDeptEntryDate(Date deptEntryDate) {
		this.deptEntryDate = deptEntryDate; 
	}
	public Date getReportingDate() {
		return reportingDate; 
	}
	public void setReportingDate(Date reportingDate) {
		this.reportingDate = reportingDate; 
	}
	public String getEmploymentType() {
		return employmentType; 
	}
	public void setEmploymentType(String employmentType) {
		this.employmentType = employmentType; 
	}
	public String getResignationReason() {
		return resignationReason; 
	}
	public void setResignationReason(String resignationReason) {
		this.resignationReason = resignationReason; 
	}
	public Date getResignationDate() {
		return resignationDate; 
	}
	public void setResignationDate(Date resignationDate) {
		this.resignationDate = resignationDate; 
	}
	public boolean getContributionsToOtherAcct() {
		return contributionsToOtherAcct; 
	}
	public void setContributionsToOtherAcct(boolean contributionsToOtherAcct) {
		this.contributionsToOtherAcct = contributionsToOtherAcct; 
	}
	public String getContributionsToAcntName() {
		return contributionsToAcntName; 
	}
	public void setContributionsToAcntName(String contributionsToAcntName) {
		this.contributionsToAcntName = contributionsToAcntName; 
	}
	public String getContributionsToAcntNo() {
		return contributionsToAcntNo; 
	}
	public void setContributionsToAcntNo(String contributionsToAcntNo) {
		this.contributionsToAcntNo = contributionsToAcntNo; 
	}

    public LocalLevel getMembership(){
            return membership;
        }

    public void setMembership(LocalLevel membership){
            this.membership = membership;
        }

    public Address getPrimaryAddress(){
            return primaryAddress;
        }

    public void assocLocalLevel(LocalLevel t) {
		this.membership = t;
    }

    public void setPrimaryAddress(Address primaryAddress){
            this.primaryAddress = primaryAddress;
        }

    public void assocPrimaryAddress(Address primaryAddress){
            this.primaryAddress = primaryAddress;
        }

    public Address getSecondaryAddress(){
            return secondaryAddress;
        }

    public void setSecondaryAddress(Address secondaryAddress){
            this.secondaryAddress = secondaryAddress;
        }

    public void assocSecondaryAddress(Address secondaryAddress){
            this.secondaryAddress = secondaryAddress;
        }

    public Collection getDependents(){
            return dependents;
        }

    public void setDependents(Collection dependents){
            this.dependents = dependents;
        }

    public void assocDependent(Dependent d) {
	this.dependents.add(d);
    }

    public Address getCurrentAddress(){
            return currentAddress;
        }

    public void setCurrentAddress(Address currentAddress){
            this.currentAddress = currentAddress;
        }

    public void assocCurrentAddress(Address currentAddress){
            this.currentAddress = currentAddress;
        }

    public Collection getLoaNote(){
            return loaNote;
        }
    public void assocLoaNote(Note loaNote) {
		this.loaNote.add(loaNote);
        loaNote.setLoaNote(this);
    }
    public void dissocLoaNote(Note loaNote) {
		this.loaNote.remove(loaNote);
    }

    public void setLoaNote(Collection loaNote){
            this.loaNote = loaNote;
        }
//
    public Collection getResignationLetter(){
            return this.resignationLetter;
        }

    public void assocResignationLetter(Note resignationLetter) {
		this.resignationLetter.add(resignationLetter);
    }
    public void dissocResignationLetter(Note resignationLetter) {
		this.resignationLetter.remove(resignationLetter);
    }

    public void setResignationLetter(Collection resignationLetter){
            this.resignationLetter = resignationLetter;
        }
    /**
     * @sql-name fk_teamID
     */
	private LocalLevel membership;
    


    /**
     * @shapeType AssociationLink 
     * @undirected
     * @clientCardinality 0..n
     * @supplierCardinality 0..n
     * @label intlContact
     */
    /*# private WsnPartnership intlContact; */

    /**
     * @shapeType AssociationLink 
     * @undirected
     * @clientCardinality 0..n
     * @supplierCardinality 0..n
     * @label partCoord
     */
    /*# private WsnPartnership partCoord; */





    /**
     * @shapeType AssociationLink 
     * @clientCardinality 0..n
     * @clientRole resignationLetter
     * @supplierCardinality 0..1
     * @label
     * 
     */
    /*# private Note resignationLetter; */

    /**
     * @shapeType AssociationLink 
     * @clientCardinality 0..1
     * @supplierCardinality 0..1
     * @label currentAddress
     */
    /*# private Address currentAddress; */
}
