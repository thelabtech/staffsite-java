package org.alt60m.ministry.model.dbio;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.text.DateFormatter;

import com.kenburcham.framework.dbio.DBIOEntity;
//import com.kenburcham.framework.dbio.DBIOEntity;
//import com.kenburcham.framework.dbio.DBIOEntityException;

public class Person extends DBIOEntity {
	private static final String TABLENAME = "ministry_person";


	public boolean insert() {
		setDateCreated(new Date());
		setDateChanged(new Date());
		setChangedBy(toolName);
		setCreatedBy(toolName);
		return super.insert();
	}
	public boolean update() {
		setDateChanged(new Date());
		setChangedBy(toolName);
		return super.update();
	}
	public boolean isPKEmpty() {
		return PersonID == 0;
	}
	public Person() {
	}
	public Person(String id) {
		PersonID= (new Integer(id)).intValue();
		select();
	}
	public Person(int id) {
		PersonID= id;
		select();
	}
	public void localinit() {
		String table = TABLENAME;
		
		setMetadata("PersonID", "PersonID", "IDENTITY");
		setMetadata("AccountNo", "accountNo", table);
		setMetadata("LastName", "lastName", table);
		setMetadata("FirstName", "firstName", table);
		setMetadata("MiddleName", "middleName", table);
		setMetadata("PreferredName", "preferredName", table);
		setMetadata("Gender", "gender", table);
		setMetadata("RawBirthDate", "birth_date", table);
		setMetadata("RawDateBecameChristian", "date_became_christian", table);
		setMetadata("Region", "region", table);
		setMetadata("WorkInUS", "workInUS", table);
		setMetadata("UsCitizen", "usCitizen", table);
		setMetadata("Citizenship", "citizenship", table);
		setMetadata("IsStaff", "isStaff", table);
		setMetadata("Title", "title", table);
		setMetadata("Campus", "campus", table);
		setMetadata("UniversityState", "universityState", table);
		setMetadata("YearInSchool", "yearInSchool", table);
		setMetadata("GraduationDate", "graduation_date", table);
		setMetadata("Major", "major", table);
		setMetadata("GreekAffiliation", "greekAffiliation", table);
		setMetadata("MaritalStatus", "maritalStatus", table);
		setMetadata("NumberChildren", "numberChildren", table);
		setMetadata("IsChild", "isChild", table);
		setMetadata("DateCreated", "dateCreated", table);
		setMetadata("DateChanged", "dateChanged", table);
		setMetadata("CreatedBy", "createdBy", table);
		setMetadata("ChangedBy", "changedBy", table);
		setMetadata("Fk_ssmUserID", "fk_ssmUserID", table);
		setMetadata("Fk_StaffSiteProfileID", "fk_StaffSiteProfileID", table);
		setMetadata("Fk_spouseID", "fk_spouseID", table);
		setMetadata("Fk_childOf", "fk_childOf", table);
		setMetadata("IsSecureString","isSecure",table);
		setMetadata("Ministry", "ministry", table);
		setMetadata("Strategy", "strategy", table);
		
		setAutodetectProperties(false);		
	}

    private int PersonID = 0;
	private String accountNo = "";
	private String lastName = "";
	private String firstName = "";
	private String middleName = "";
    private String preferredName="";
	private String gender = "";
	private Date birthDate = null;
	private Date date_became_christian = null;
	private String region = "";
	private boolean workInUS;
	private boolean usCitizen;
	private String citizenship = "";
	private boolean isStaff;
    private String title = "";
    private String campus="";
    private String universityState="";
    private String yearInSchool = "";
    private String graduation_date=null;
    private String major="";
    private String greekAffiliation="";
    private String maritalStatus="";
    private String numberChildren="";
    private boolean isChild;
    private Date dateCreated = null;
    private Date dateChanged = null;
    private String changedBy = "";
    private String createdBy = "";
    private int fk_ssmUserID = 0;
    private int fk_StaffSiteProfileID = 0;
    private int fk_spouseID = 0;
    private int fk_childOf = 0;
    private String isSecure = "";
    private String ministry = "";
    private String strategy = "";
    //not saved (directly) to database; but used for changedBy and createdBy
    private String toolName = "NONE SPECIFIED";

    
    public void setToolName(String toolName)
    {
    	this.toolName = toolName;
    }
    
    public String getToolName()
    {
    	return toolName;
    }
    
	/**
	 * @return Returns the accountNo.
	 */
	public String getAccountNo() {
		return accountNo;
	}
	/**
	 * @param accountNo The accountNo to set.
	 */
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	/**
	 * @return Returns the birth_date.
	 */
	public Date getRawBirthDate() {
		return birthDate;
	}
	/**
	 * @param birthDate The birthDate to set.
	 */
	public void setRawBirthDate(Date birth_date) {
		this.birthDate = birth_date;
	}
	
	public void setBirthDate(String birthDate) throws ParseException 
	{
		if (birthDate == null || birthDate.equals("")) {
			this.birthDate = null;
			return;
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		this.birthDate = simpleDateFormat.parse(birthDate);
	}
	
	public String getBirthDate()
	{
		if (birthDate == null)
		{
			return "";
		}
		else {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
			return simpleDateFormat.format(birthDate);
		}
	}
	
	/**
	 * @return Returns the campus.
	 */
	public String getCampus() {
		return campus;
	}
	/**
	 * @param campus The campus to set.
	 */
	public void setCampus(String campus) {
		this.campus = campus;
	}
	
	/**
	 * @return Returns the createdBy
	 */
	public String getCreatedBy()
	{
		return createdBy;
	}
	
	/**
	 * @param createdBy The createdBy to set.
	 */
	public void setCreatedBy(String createdBy)
	{
		this.createdBy = createdBy;
	}
	
	/**
	 * @return Returns the changedBy.
	 */
	public String getChangedBy() {
		return changedBy;
	}
	/**
	 * @param changedBy The changedBy to set.
	 */
	public void setChangedBy(String changedBy) {
		this.changedBy = changedBy;
	}
	/**
	 * @return Returns the citizenship.
	 */
	public String getCitizenship() {
		return citizenship;
	}
	/**
	 * @param citizenship The citizenship to set.
	 */
	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}
	/**
	 * @return Returns the dateBecameChristian.
	 */
	public Date getRawDateBecameChristian() {
		return date_became_christian;
	}
	/**
	 * @param dateBecameChristian The dateBecameChristian to set.
	 */
	public void setRawDateBecameChristian(Date date_became_christian) {
		this.date_became_christian = date_became_christian;
	}
	
	public String getDateBecameChristian() {
		return new SimpleDateFormat("MM/dd/yyyy").format(this.date_became_christian);
	}
	
	public void setDateBecameChristian(String dateBecameChristian) throws ParseException{
		if (dateBecameChristian == null || dateBecameChristian.equals("")){
			this.date_became_christian = null;
			return;
		}
		this.date_became_christian = new SimpleDateFormat("MM/dd/yyyy").parse(dateBecameChristian);
	}
	
	/**
	 * @return Returns the dateChanged.
	 */
	public Date getDateChanged() {
		return dateChanged;
	}
	/**
	 * @param dateChanged The dateChanged to set.
	 */
	public void setDateChanged(Date dateChanged) {
		this.dateChanged = dateChanged;
	}
	/**
	 * @return Returns the dateCreated.
	 */
	public Date getDateCreated() {
		return dateCreated;
	}
	/**
	 * @param dateCreated The dateCreated to set.
	 */
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	/**
	 * @return Returns the firstName.
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName The firstName to set.
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return Returns the fk_childOf.
	 */
	public int getFk_childOf() {
		return fk_childOf;
	}
	/**
	 * @param fk_childOf The fk_childOf to set.
	 */
	public void setFk_childOf(int fk_childOf) {
		this.fk_childOf = fk_childOf;
	}

	/**
	 * @return Returns the fk_spouseID.
	 */
	public int getFk_spouseID() {
		return fk_spouseID;
	}
	/**
	 * @param fk_spouseID The fk_spouseID to set.
	 */
	public void setFk_spouseID(int fk_spouseID) {
		this.fk_spouseID = fk_spouseID;
	}
	/**
	 * @return Returns the fk_ssmUserID.
	 */
	public int getFk_ssmUserID() {
		return fk_ssmUserID;
	}
	/**
	 * @param fk_ssmUserID The fk_ssmUserID to set.
	 */
	public void setFk_ssmUserID(int fk_ssmUserID) {
		this.fk_ssmUserID = fk_ssmUserID;
	}
	/**
	 * @return Returns the fk_StaffSiteProfileID.
	 */
	public int getFk_StaffSiteProfileID() {
		return fk_StaffSiteProfileID;
	}
	/**
	 * @param fk_StaffSiteProfileID The fk_StaffSiteProfileID to set.
	 */
	public void setFk_StaffSiteProfileID(int fk_StaffSiteProfileID) {
		this.fk_StaffSiteProfileID = fk_StaffSiteProfileID;
	}
	/**
	 * @return Returns the gender.
	 */
	public String getGender() {
		return gender;
	}
	/**
	 * @param gender The gender to set.
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	/**
	 * @return Returns the graduationDate.
	 */
	public String getGraduationDate() {
		return graduation_date;
	}
	/**
	 * @param graduationDate The graduationDate to set.
	 */
	public void setGraduationDate(String graduationDate) {
		this.graduation_date = graduationDate;
	}
	/**
	 * @return Returns the greekAffiliation.
	 */
	public String getGreekAffiliation() {
		return greekAffiliation;
	}
	/**
	 * @param greekAffiliation The greekAffiliation to set.
	 */
	public void setGreekAffiliation(String greekAffiliation) {
		this.greekAffiliation = greekAffiliation;
	}
	/**
	 * @return Returns the isChild.
	 */
	public boolean getIsChild() {
		return isChild;
	}
	/**
	 * @param isChild The isChild to set.
	 */
	public void setIsChild(boolean isChild) {
		this.isChild = isChild;
	}

	/**
	 * @return Returns the isMarried.
	 */
	public String getMaritalStatus() {
		return maritalStatus;
	}
	/**
	 * @param isMarried The isMarried to set.
	 */
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	
	/**
	 * @return Returns the isStaff.
	 */
	public boolean getIsStaff() {
		return isStaff;
	}
	/**
	 * @param isStaff The isStaff to set.
	 */
	public void setIsStaff(boolean isStaff) {
		this.isStaff = isStaff;
	}
	/**
	 * @return Returns the lastName.
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName The lastName to set.
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return Returns the major.
	 */
	public String getMajor() {
		return major;
	}
	/**
	 * @param major The major to set.
	 */
	public void setMajor(String major) {
		this.major = major;
	}

	public String getMinistry() {
		return ministry;
	}
	public void setMinistry(String ministry) {
		this.ministry = ministry;
	}

	/**
	 * @return Returns the middleName.
	 */
	public String getMiddleName() {
		return middleName;
	}
	/**
	 * @param middleName The middleName to set.
	 */
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	/**
	 * @return Returns the numberChildren.
	 */
	public String getNumberChildren() {
		return numberChildren;
	}
	/**
	 * @param numberChildren The numberChildren to set.
	 */
	public void setNumberChildren(String numberChildren) {
		this.numberChildren = numberChildren;
	}
	/**
	 * @return Returns the personID.
	 */
	public int getPersonID() {
		return PersonID;
	}
	/**
	 * @param personID The personID to set.
	 */
	public void setPersonID(int personID) {
		PersonID = personID;
	}

	/**
	 * @return Returns the preferredName.
	 */
	public String getPreferredName() {
		return preferredName;
	}
	/**
	 * @param preferredName The preferredName to set.
	 */
	public void setPreferredName(String preferredName) {
		this.preferredName = preferredName;
	}
	/**
	 * @return Returns the region.
	 */
	public String getRegion() {
		return region;
	}
	/**
	 * @param region The region to set.
	 */
	public void setRegion(String region) {
		this.region = region;
	}

	/**
	 * @return Returns the title.
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title The title to set.
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return Returns the usCitizen.
	 */
	public boolean getUsCitizen() {
		return usCitizen;
	}
	/**
	 * @param usCitizen The usCitizen to set.
	 */
	public void setUsCitizen(boolean usCitizen) {
		this.usCitizen = usCitizen;
	}

	/**
	 * @return Returns the workInUS.
	 */
	public boolean getWorkInUS() {
		return workInUS;
	}
	/**
	 * @param workInUS The workInUS to set.
	 */
	public void setWorkInUS(boolean workInUS) {
		this.workInUS = workInUS;
	}
	/**
	 * @return Returns the yearInSchool.
	 */
	public String getYearInSchool() {
		return yearInSchool;
	}
	/**
	 * @param yearInSchool The yearInSchool to set.
	 */
	public void setYearInSchool(String yearInSchool) {
		this.yearInSchool = yearInSchool;
	}
	/**
	 * @return Returns the universityState.
	 */
	public String getUniversityState() {
		return universityState;
	}
	/**
	 * @param universityState The universityState to set.
	 */
	public void setUniversityState(String universityState) {
		this.universityState = universityState;
	}
	
	public boolean getIsSecure() { return isSecure != null && isSecure.equals("T"); }
	public void setIsSecure(boolean val) { this.isSecure = val ? "T" : "F"; }
	public String getIsSecureString() { return isSecure; }
	public void setIsSecureString(String val) { this.isSecure = val; }
	
	public String getStrategy() {
		return strategy;
	}
	public void setStrategy(String strategy) {
		this.strategy = strategy;
	}
}