package org.alt60m.wsn.sp.model.dbio;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;

import org.alt60m.hr.ms.servlet.dbio.MSInfo;
import org.alt60m.ministry.model.dbio.Address;
import org.alt60m.ministry.model.dbio.LocalLevel;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class WsnPerson extends DBIOEntity{
	private static Log log = LogFactory.getLog(WsnPerson.class);
	
	private static Hashtable translateMaritalStatusToTable = null;
	private static Hashtable translateMaritalStatusToCode = null;
	

	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
	
	private Address currAdd = new Address();
	private Address emerAdd = new Address();
	
	public boolean insert() {
		setDateCreated(new Date());
		setDateChanged(new Date());
		setCreatedBy("SP");
		setChangedBy("SP");
		boolean result = super.insert();
		currAdd.setFk_PersonID(this.WsnPersonID);
		emerAdd.setFk_PersonID(this.WsnPersonID);
		currAdd.setAddressType(Address.CURRENT_ADDRESS);
		emerAdd.setAddressType(Address.EMERGENCY1_ADDRESS);
		currAdd.insert();
		emerAdd.insert();
		return result;
	}
	public boolean update() {
		setDateChanged(new Date());
		setChangedBy("SP");
		boolean result = super.update();
		currAdd.setFk_PersonID(this.WsnPersonID);
		emerAdd.setFk_PersonID(this.WsnPersonID);
		currAdd.setAddressType(Address.CURRENT_ADDRESS);
		emerAdd.setAddressType(Address.EMERGENCY1_ADDRESS);
		currAdd.update();
		emerAdd.update();
		return result;
	}
	public void updateNoDate() {
		super.update();
	}
	public boolean delete() {
		currAdd.delete();
		emerAdd.delete();
		return super.delete();
	}
	public boolean select() {
		boolean result = super.select();
		if ( result ) {
			currAdd.setFk_PersonID(this.WsnPersonID);
			emerAdd.setFk_PersonID(this.WsnPersonID);
			currAdd.setAddressType(Address.CURRENT_ADDRESS);
			emerAdd.setAddressType(Address.EMERGENCY1_ADDRESS);
			if (!currAdd.select()) {
				currAdd.persist();
			}
			if (!emerAdd.select()) {
				emerAdd.persist();
			}
		}
		return result;
	}
	public boolean isPKEmpty() {
		return WsnPersonID == 0;
	}
	
	private void initHashtables() {
		if (translateMaritalStatusToTable == null) {
			translateMaritalStatusToTable = new Hashtable();
			translateMaritalStatusToTable.put("", "");
			translateMaritalStatusToTable.put("Single", "S");
			translateMaritalStatusToTable.put("Married", "M");
			translateMaritalStatusToTable.put("Divorced", "D");
			translateMaritalStatusToTable.put("Separated", "P");
			translateMaritalStatusToTable.put("Widowed", "W");
			
			translateMaritalStatusToCode = new Hashtable();
			translateMaritalStatusToCode.put("", "");
			translateMaritalStatusToCode.put("S", "Single");
			translateMaritalStatusToCode.put("M", "Married");
			translateMaritalStatusToCode.put("D", "Divorced");
			translateMaritalStatusToCode.put("P", "Separated");
			translateMaritalStatusToCode.put("W", "Widowed");
		}
	}
	
	public static String translateMaritalStatus(String letter) {
		String result = letter;
		if (translateMaritalStatusToCode.containsKey(letter)) {
			result = (String)translateMaritalStatusToCode.get(letter);
		}
		return result;
	}
	
	public void localinit() throws DBIOEntityException {
		String table = "ministry_person";
		
		setMetadata("WsnPersonID", "personID", "IDENTITY");
		
		setMetadata("Fk_StaffSiteProfileID", "fk_StaffSiteProfileID", table);
		setMetadata("Region", "region", table);
		setMetadata("LastName", "lastName", table);
		setMetadata("FirstName", "firstName", table);
		setMetadata("RawBirthdate", "birth_date", table);
		setMetadata("RawDateBecameChristian", "date_became_christian", table);
		setMetadata("MaritalStatus", "maritalStatus", table);
		setMetadata("Campus", "campus", table);
		setMetadata("Major", "major", table);
		setMetadata("YearInSchool", "yearInSchool", table);
		setMetadata("RawGraduationDate", "graduation_date", table);
		setMetadata("UsCitizen", "usCitizen", table);
		setMetadata("Citizenship", "citizenship", table);
		setMetadata("AccountNo", "accountNo", table);
		setMetadata("Gender", "gender", table);
		setMetadata("IsStaff", "isStaff", table);
		setMetadata("IsChild", "isChild", table);
		setMetadata("SpouseID", "fk_spouseID", table);
		setMetadata("ChildOfId", "fk_childOf", table);
		setMetadata("SsmUserID", "fk_ssmUserID", table);
		setMetadata("DateChanged", "dateChanged", table);
		setMetadata("DateCreated", "dateCreated", table);
		setMetadata("ChangedBy", "changedBy", table);
		setMetadata("CreatedBy", "createdBy", table);
		setMetadata("MiddleName", "middleName", table);
		setMetadata("Title", "title", table);
		setMetadata("UniversityState", "universityState", table);
				
		setAutodetectProperties(false);
	}
	private final MSInfo info = new MSInfo();

	private final String currentWsnYear = MSInfo.CURRENT_WSN_YEAR;

	public WsnPerson() {
		initHashtables();
		currAdd.setToolName("SP");
		emerAdd.setToolName("SP");
	}

	public WsnPerson(String id) {
		initHashtables();
		currAdd.setToolName("SP");
		emerAdd.setToolName("SP");
		setWsnPersonID(id);
		select();
	}
	public WsnPerson(int id) {
		initHashtables();
		currAdd.setToolName("SP");
		emerAdd.setToolName("SP");
		setWsnPersonIdInt(id);
		select();
	}
	
	public boolean persist() {
		return isPKEmpty() ? insert() : update(); 
	}

	private int WsnPersonID = 0;

	private int fk_StaffSiteProfileID = 0;
	private String region = "";
	private String lastName = "";
	private String firstName = "";
	private Date birthdate;
	private Date dateBecameChristian = null;
	private String maritalStatus = "";
	private String campus = "";
	private String major = "";
	private String yearInSchool = "";
	private Date graduationDate;
	private boolean usCitizen;
	private String citizenship = "";
	private String accountNo = "";
	private String gender = "";
	private Date dateChanged;
	private String createdBy = "";
	private boolean isStaff;
	private boolean isChild;
	private int fk_spouseID = 0;
	private int fk_childOf = 0;

	private int fk_ssmUserID;
	private int weight, heightFeet, heightInches, ethnicMinistry;
	private Date dateCreated;
	private String changedBy, middleName, title;
	private String universityState = "";
	public int getWsnPersonID() {
		return WsnPersonID;
	}
	public void setWsnPersonID(String WsnPersonID) {
		if (WsnPersonID != null && !WsnPersonID.equals("") && !WsnPersonID.equals(" ")) {
			this.WsnPersonID = Integer.parseInt(WsnPersonID);
		} 
	}
	public void setWsnPersonID(Integer WsnPersonID) {
		if (WsnPersonID != null) {
			this.WsnPersonID = WsnPersonID.intValue();
		} 
	}
	public void setWsnPersonID(int WsnPersonID) {
		this.WsnPersonID = WsnPersonID;
	}
	public int getWsnPersonIdInt() {
		return WsnPersonID;
	}
	public void setWsnPersonIdInt(int WsnPersonID) {
		this.WsnPersonID = WsnPersonID; 
	}
	public int getFk_StaffSiteProfileID() {
		return fk_StaffSiteProfileID; 
	}
	public void setFk_StaffSiteProfileID(int surferID) {
		this.fk_StaffSiteProfileID = surferID; 
	}
	public void setFk_StaffSiteProfileID(String surferID) {
		if (surferID != null && !surferID.equals("")) {
			setFk_StaffSiteProfileID(Integer.parseInt(surferID));
		}
	}
	public String getRegion() {
		return region; 
	}
	public void setRegion(String region) {
		this.region = region; 
	}
	public String getLastName() {
		return lastName; 
	}
	public void setLastName(String legalLastName) {
		this.lastName = legalLastName; 
	}
	public String getFirstName() {
		return firstName; 
	}
	public void setFirstName(String legalFirstName) {
		this.firstName = legalFirstName; 
	}	
	public int getCurrentAddressID() {
		return currAdd.getAddressId();
	}
	public void setCurrentAddressID(int ID) {
		currAdd.setAddressId(ID);
	}
	public String getCurrentAddressType() {
		return currAdd.getAddressType();
	}
	public void setCurrentAddressType(String type) {
		currAdd.setAddressType(type);
	}
	public int getCurrentAddressFk_PersonID() {
		return currAdd.getFk_PersonID();
	}
	public void setCurrentAddressFk_PersonID(int ID) {
		currAdd.setFk_PersonID(ID);
	}
	public String getCurrentAddress() {
		return currAdd.getAddress1(); 
	}
	public void setCurrentAddress(String currentAddress) {
		currAdd.setAddress1(currentAddress); 
	}
	public String getCurrentCity() {
		return currAdd.getCity(); 
	}
	public void setCurrentCity(String currentCity) {
		currAdd.setCity(currentCity); 
	}
	public String getCurrentAddress2() {
		return currAdd.getAddress2(); 
	}
	public void setCurrentAddress2(String currentAddress2) {
		currAdd.setAddress2(currentAddress2); 
	}
	public String getCurrentState() {
		return currAdd.getState(); 
	}
	public void setCurrentState(String currentState) {
		currAdd.setState(currentState); 
	}
	public String getCurrentZip() {
		return currAdd.getZip(); 
	}
	public void setCurrentZip(String currentZip) {
		currAdd.setZip(currentZip); 
	}
	public String getCurrentPhone() {
		return currAdd.getHomePhone(); 
	}
	public void setCurrentPhone(String currentPhone) {
		currAdd.setHomePhone(currentPhone); 
	}
	public String getCurrentEmail() {
		return currAdd.getEmail(); 
	}
	public void setCurrentEmail(String currentEmail) {
		currAdd.setEmail(currentEmail); 
	}
	
	public Date getRawBirthdate() {
		return birthdate;
	}
	
	public void setRawBirthdate(Date birthdate)
	{
		this.birthdate = birthdate;
	}
	
	public String getBirthdate() {
		return formatDate(this.birthdate);
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = parseDate(birthdate);
	}
	
	public String getDateBecameChristian() {
		return formatDate(this.dateBecameChristian);
	}
	
	public void setDateBecameChristian(String dateBecameChristian) {
		this.dateBecameChristian = parseDate(dateBecameChristian);
	}
	
	public Date getRawDateBecameChristian() {
		return dateBecameChristian;
	}
	public void setRawDateBecameChristian(Date dateBecameChristian) {
		this.dateBecameChristian = dateBecameChristian; 
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		if (maritalStatus != null) {
			if(translateMaritalStatusToTable.containsKey(maritalStatus)) {
				this.maritalStatus = (String)translateMaritalStatusToTable.get(maritalStatus);
			} else {
				this.maritalStatus = maritalStatus;
			}
		} else {
			this.maritalStatus = null;
		}
	}
	public String getCampus() {
		return campus; 
	}
	public void setCampus(String universityFullName) {
		this.campus = universityFullName; 
	}
	public String getMajor() {
		return major; 
	}
	public void setMajor(String major) {
		this.major = major; 
	}
	public String getYearInSchool() {
		return yearInSchool; 
	}
	public void setYearInSchool(String yearInSchool) {
		this.yearInSchool = yearInSchool; 
	}
	
	public Date getRawGraduationDate() {
		return graduationDate;
	}
	
	public void setRawGraduationDate(Date graduationDate) {
		this.graduationDate = graduationDate;
	}
	
	public String getGraduationDate() {
		return formatDate(this.graduationDate);
	}
	public void setGraduationDate(String graduationDate) {
		this.graduationDate = parseDate(graduationDate);
	}
	
	public boolean getUsCitizen() {
		return usCitizen; 
	}
	public void setUsCitizen(boolean usCitizen) {
		this.usCitizen = usCitizen; 
	}
	public String getCitizenship() {
		return citizenship; 
	}
	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship; 
	}
	public String getAccountNo() {
		return accountNo; 
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo; 
	}
	public String getEmergName() {
		return emerAdd.getContactName(); 
	}
	public void setEmergName(String emergName) {
		emerAdd.setContactName(emergName); 
	}
	public int getEmergAddressID() {
		return emerAdd.getAddressId();
	}
	public void setEmergAddressID(int ID) {
		emerAdd.setAddressId(ID);
	}
	public String getEmergAddressType() {
		return emerAdd.getAddressType();
	}
	public void setEmergAddressType(String type) {
		emerAdd.setAddressType(type);
	}
	public int getEmergAddressFk_PersonID() {
		return emerAdd.getFk_PersonID();
	}
	public void setEmergAddressFk_PersonID(int ID) {
		emerAdd.setFk_PersonID(ID);
	}
	public String getEmergAddress() {
		return emerAdd.getAddress1(); 
	}
	public void setEmergAddress(String emergAddress) {
		emerAdd.setAddress1(emergAddress); 
	}
	public String getEmergCity() {
		return emerAdd.getCity(); 
	}
	public void setEmergCity(String emergCity) {
		emerAdd.setCity(emergCity); 
	}
	public String getEmergState() {
		return emerAdd.getState(); 
	}
	public void setEmergState(String emergState) {
		emerAdd.setState(emergState); 
	}
	public String getEmergZip() {
		return emerAdd.getZip(); 
	}
	public void setEmergZip(String emergZip) {
		emerAdd.setZip(emergZip); 
	}
	public String getEmergPhone() {
		return emerAdd.getHomePhone(); 
	}
	public void setEmergPhone(String emergPhone) {
		emerAdd.setHomePhone(emergPhone); 
	}
	public String getEmergWorkPhone() {
		return emerAdd.getWorkPhone(); 
	}
	public void setEmergWorkPhone(String emergWorkPhone) {
		emerAdd.setWorkPhone(emergWorkPhone); 
	}
	public String getEmergEmail() {
		return emerAdd.getEmail(); 
	}
	public void setEmergEmail(String emergEmail) {
		emerAdd.setEmail(emergEmail); 
	}
	public String getGender() {
		return gender; 
	}
	public void setGender(String gender) {
		this.gender = gender; 
	}
	public Date getDateChanged() {
		return dateChanged; 
	}
	public void setDateChanged(Date dateChanged) {
		this.dateChanged = dateChanged; 
	}
	public boolean getIsStaff() {
		return isStaff; 
	}
	public void setIsStaff(boolean isStaff) {
		this.isStaff = isStaff; 
	}
	public boolean getIsChild() {
		return isChild; 
	}
	public void setIsChild(boolean child) {
		this.isChild = child; 
	}
	public int getSpouseID() {
		return fk_spouseID; 
	}
	public void setSpouseID(int wsnSpouse) {
		this.fk_spouseID = wsnSpouse;
	}
	public void setSpouseID(String wsnSpouse) {
		if (wsnSpouse != null && !wsnSpouse.equals("") && !wsnSpouse.equals(" ") && wsnSpouse.length() < 29) {
			this.fk_spouseID = Integer.parseInt(wsnSpouse);
		}
	}
	public WsnPerson getSpouse() {
		WsnPerson result = null;
		if (fk_spouseID != 0) {
			result = new WsnPerson(fk_spouseID);
		}
		return result; 
	}
	public void setWsnSpouse(WsnPerson wsnSpouse) {
		if (wsnSpouse != null) {
			this.fk_spouseID = wsnSpouse.getWsnPersonID();
		}
		else {
			this.fk_spouseID = 0; 
		}
	}
/*	public Vector getIsCoord() {
		WsnProject project = new WsnProject();
		project.setIsCoordId(String.valueOf(this.getWsnPersonID()));
		return project.selectList();
	}
	public Vector getIsCoord(String orderField, boolean DESC) {
		WsnProject project = new WsnProject();
		return project.selectList("fk_IsCoord = '" + this.WsnPersonID + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void setIsCoord(Collection isCoord) {
		Iterator iter = isCoord.iterator();
		while (iter.hasNext()) {
			WsnProject project = (WsnProject)iter.next();
			project.setIsCoordId(String.valueOf(this.getWsnPersonID()));
			project.persist();
		}
	}
	public void assocIsCoord(WsnProject project) {
		project.setIsCoordId(String.valueOf(this.getWsnPersonID()));
		project.persist();
	}
	public void dissocIsCoord(WsnProject project) {
		project.setIsCoordId("");
		project.persist();
	}

	public String getIsAPDId() {
		WsnProject apd = getIsAPD();
		String result = null;
		if (apd != null) {
			result = apd.getIsAPDId();
		}
		return result; 
	}
	public void setIsAPDId(String isAPD) {
		setIsAPD(new WsnProject(isAPD));
	}
	public WsnProject getIsAPD() {
		WsnProject project = null;
		if (WsnPersonID != 0) {
			project = new WsnProject();
			project.setIsAPDId(String.valueOf(this.getWsnPersonID()));
			project.select();
			if (project.getWsnProjectIdInt() == 0) {
				project = null;
			}
		}
		return project; 
	}
	public void setIsAPD(WsnProject isAPD) {
		isAPD.setIsAPDId(String.valueOf(this.getWsnPersonID())); 
	}
	public String getIsPDId() {
		WsnProject pd = getIsPD();
		String result = null;
		if (pd != null) {
			result = pd.getIsPDId();
		}
		return result; 
	}
	public void setIsPDId(String isPD) {
		setIsPD(new WsnProject(isPD));
	}
	public WsnProject getIsPD() {
		WsnProject project = null;
		if (WsnPersonID != 0) {
			project = new WsnProject();
			project.setIsPDId(String.valueOf(this.getWsnPersonID()));
			project.select();
			if (project.getWsnProjectIdInt() == 0) {
				project = null;
			}
		}
		return project; 
	}
	public void setIsPD(WsnProject isPD) {
		isPD.setIsPDId(String.valueOf(this.getWsnPersonID())); 
	}
*/
	public int getChildOfId() {
		return fk_childOf; 
	}
	public void setChildOfId(String childOf) {
		if (childOf != null && !childOf.equals("") && !childOf.equals(" ")) {
			this.fk_childOf = Integer.parseInt(childOf);
		}
	}
	public void setChildOfId(int childOf) {
		this.fk_childOf = childOf; 
	}
	public WsnPerson getChildOf() {
		WsnPerson result = null;
		if (fk_childOf != 0) {
			result = new WsnPerson(this.fk_childOf);
		}
		return result; 
	}
	public void setChildOf(WsnPerson childOf) {
		if (childOf!=null){
			this.fk_childOf = childOf.getWsnPersonID();
		} else {
			this.fk_childOf = 0; 
		}
	}
	
	public Vector getWsnChild() {
		WsnPerson person = new WsnPerson();
		person.setChildOfId((new Integer(this.WsnPersonID)).toString());
		return person.selectList();
	}
	public Vector getWsnChild(String orderField, boolean DESC) {
		WsnPerson person = new WsnPerson();
		return person.selectList("fk_childOf = '" + this.WsnPersonID + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void setWsnChild(Collection wsnChild) {
		Iterator iter = wsnChild.iterator();
		while (iter.hasNext()) {
			WsnPerson person = (WsnPerson)iter.next();
			person.setChildOfId((new Integer(this.WsnPersonID)).toString());
			person.persist();
		}
	}
	public void assocWsnChild(WsnPerson person) {
		person.setChildOfId((new Integer(this.WsnPersonID)).toString());
		person.persist();
	}
	public void dissocWsnChild(WsnPerson person) {
		person.setChildOfId("");
		person.persist();
	}

	public int getSsmUserID() { return fk_ssmUserID; }
	public void setSsmUserID(int ssmUserID) { this.fk_ssmUserID = ssmUserID; }
	public void setSsmUserID(String ssmUserID) { setSsmUserID(Integer.parseInt(ssmUserID)); }
	/* integers */
	public int getWeight() { return weight; }
	public void setWeight(int weight) { this.weight = weight; }
	public int getHeightFeet() { return heightFeet; }
	public void setHeightFeet(int heightFeet) { this.heightFeet = heightFeet; }
	public int getHeightInches() { return heightInches; }
	public void setHeightInches(int heightInches) { this.heightInches = heightInches; }
	public int getEthnicMinistry() { return ethnicMinistry; }
	public void setEthnicMinistry(int ethnicMinistry) { this.ethnicMinistry = ethnicMinistry; }
	
	public Date getDateCreated() { return dateCreated; }
	public void setDateCreated(Date createDate) { this.dateCreated = createDate; }
	
	public String getChangedBy() { return changedBy; }
	public void setChangedBy(String lastChangedBy) { this.changedBy = lastChangedBy; }
	
	public String getCurrentCellPhone() { return currAdd.getCellPhone(); }
	public void setCurrentCellPhone(String currentCellPhone) { currAdd.setCellPhone(currentCellPhone); }
	
	public String getEmergAddress2() { return emerAdd.getAddress2(); }
	public void setEmergAddress2(String emergAddress2) { emerAdd.setAddress2(emergAddress2); }
	
	public String getMiddleName() { return middleName; }
	public void setMiddleName(String legalMiddleName) { this.middleName = legalMiddleName; }
	
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	
	public String getUniversityState() {
		return universityState; 
	}
	public void setUniversityState(String universityState) {
		this.universityState = universityState;
	}

	public boolean checkRequiredFields() throws Exception{
		try {
			// perform checks for required fields.
			return true;
		} catch(Exception e) { throw e; }
	}

	// encodes the object's referenceId and returns it.
	// used for emailing the referenceId as a hyperlink.
	public static String encodeWsnApplicationID(String id) {
	    Long result = new Long(0L);
	    log.debug("EncodeWsnApplicationID=" + id);
	    try
	    {
	      long wsnid = Long.valueOf(id).longValue();
		  long coefficient = 2125551213L;  // largest integer is: 214 748 3647
		  result = new Long (coefficient * wsnid);
		}
		catch(Exception e)
		{
            log.error("Error: Problem encoding WsnApplicationID: " +id + "... returning '0' (probably not what you wanted)"); 		    
		}
		log.debug("EncodeWsnApplicationID returning: " + result.toString());
		
		return result.toString();
	}

	// Given an encoded referenceId, decodes it back to a form that can be used for query on referenceId field
	public static String decodeWsnApplicationID(String id) {
	    Long result = new Long(0L);
	    log.debug("DecodeWsnApplicationID=" + id);
	    try
	    {
	      long wsnid = Long.valueOf(id).longValue();
		  long coefficient = 2125551213L;  // largest integer is: 214 748 3647
		  result = new Long (wsnid / coefficient);
		}
		catch(Exception e)
		{
            log.error("Error: Problem decoding WsnApplicationID: " +id + "... returning '0' (probably not what you wanted)"); 		    
		}
		log.debug("DecodeWsnApplicationID returning: " + result.toString());
		
		return result.toString();
	}
	
	/* end MS additions */


	// This method does not appear to be used anywhere; is it worth keeping? 
	//   -Matt D
	// added dc 11/15/02
	// Use this method to see if a particular ProjectID is in the collection projects
	public boolean checkProject(String pid, Collection projects) {
		// Go thru all available projects to see if this one project is in the list
		Iterator itr = projects.iterator();
		while (itr.hasNext()) {
			Hashtable project = (Hashtable)itr.next();
			String projectID = (String)project.get("WsnProjectID");
			if (!"".equals(projectID) && projectID != null  &&  projectID.equals(pid)) {
				log.debug("   projectid=" + projectID + " name=" + (String)project.get("Name"));
				log.debug("   FOUND THIS ONE!");
				return true;
			}
		}
		return false;
	}
	/**
	 * 
	 */
	public void selectAddresses() {
		if ( !isPKEmpty() ) {
			currAdd.setFk_PersonID(this.WsnPersonID);
			emerAdd.setFk_PersonID(this.WsnPersonID);
			currAdd.setAddressType(Address.CURRENT_ADDRESS);
			emerAdd.setAddressType(Address.EMERGENCY1_ADDRESS);
			currAdd.select();
			emerAdd.select();
		}
	}

	/**
	 * @return Returns the createdBy.
	 */
	public String getCreatedBy() {
		return createdBy;
	}
	/**
	 * @param createdBy The createdBy to set.
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	

	private Date parseDate(String dateString) {
		if (dateString == null || dateString.equals("")) {
			return null;
		}
		try {
		return simpleDateFormat.parse(dateString);
		} catch (ParseException e) {
			return null;
		}
	}
	
	private String formatDate(Date date) {
		if (date == null) {
			return "";
		}
		return simpleDateFormat.format(date);
	}

}
