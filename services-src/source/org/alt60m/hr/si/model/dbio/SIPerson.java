package org.alt60m.hr.si.model.dbio;

import java.util.Date;
import java.util.Hashtable;

import org.alt60m.ministry.model.dbio.Address;
import com.kenburcham.framework.dbio.DBIOEntity;

public class SIPerson extends DBIOEntity {
	private static Hashtable translateMaritalStatusToTable = null;
	private static Hashtable translateMaritalStatusToCode = null;

	private static final String TABLENAME = "ministry_person";

	private Address currAdd = new Address();
	private Address permAdd = new Address();
	private Address emer1Add = new Address();
	private Address emer2Add = new Address();

	public boolean insert() {
		setDateCreated(new Date());
		setDateChanged(new Date());
		setCreatedBy("STINT");
		setChangedBy("STINT");
		boolean result = super.insert();
		currAdd.setFk_PersonID(this.PersonID);
		permAdd.setFk_PersonID(this.PersonID);
		emer1Add.setFk_PersonID(this.PersonID);
		emer2Add.setFk_PersonID(this.PersonID);
		currAdd.setAddressType(Address.CURRENT_ADDRESS);
		permAdd.setAddressType(Address.PERMANENT_ADDRESS);
		emer1Add.setAddressType(Address.EMERGENCY1_ADDRESS);
		emer2Add.setAddressType(Address.EMERGENCY2_ADDRESS);
		currAdd.insert();
		permAdd.insert();
		emer1Add.insert();
		emer2Add.insert();
		return result;
	}
	public boolean update() {
		setDateChanged(new Date());
		setChangedBy("STINT");
		boolean result = super.update();
		currAdd.setFk_PersonID(this.PersonID);
		permAdd.setFk_PersonID(this.PersonID);
		emer1Add.setFk_PersonID(this.PersonID);
		emer2Add.setFk_PersonID(this.PersonID);
		currAdd.setAddressType(Address.CURRENT_ADDRESS);
		permAdd.setAddressType(Address.PERMANENT_ADDRESS);
		emer1Add.setAddressType(Address.EMERGENCY1_ADDRESS);
		emer2Add.setAddressType(Address.EMERGENCY2_ADDRESS);
		currAdd.update();
		permAdd.update();
		emer1Add.update();
		emer2Add.update();
		return result;
	}
	public boolean delete() {
		currAdd.delete();
		permAdd.delete();
		emer1Add.delete();
		emer2Add.delete();
		return super.delete();
	}
	public boolean select() {
		boolean result = super.select();
		if ( result ) {
			currAdd.setFk_PersonID(this.PersonID);
			permAdd.setFk_PersonID(this.PersonID);
			emer1Add.setFk_PersonID(this.PersonID);
			emer2Add.setFk_PersonID(this.PersonID);
			currAdd.setAddressType(Address.CURRENT_ADDRESS);
			permAdd.setAddressType(Address.PERMANENT_ADDRESS);
			emer1Add.setAddressType(Address.EMERGENCY1_ADDRESS);
			emer2Add.setAddressType(Address.EMERGENCY2_ADDRESS);

			if (!currAdd.select()) {
				currAdd.persist();
			}
			if (!permAdd.select()) {
				permAdd.persist();
			}
			if (!emer1Add.select()) {
				emer1Add.persist();
			}
			if (!emer2Add.select()) {
				emer2Add.persist();
			}
		}
		return result;
	}
	public boolean isPKEmpty() {
		return PersonID == 0;
	}
	public SIPerson() {
		initHashtables();
		currAdd.setToolName("STINT");
		permAdd.setToolName("STINT");
		emer1Add.setToolName("STINT");
		emer2Add.setToolName("STINT");
	}
	public SIPerson(String id) {
		initHashtables();
		currAdd.setToolName("STINT");
		permAdd.setToolName("STINT");
		emer1Add.setToolName("STINT");
		emer2Add.setToolName("STINT");
		if (id != null && !id.equals("")) {
			PersonID = (new Integer(id)).intValue();
			if (PersonID != 0) {
				select();
			}
		}
	}
	public SIPerson(int id) {
		initHashtables();
		currAdd.setToolName("STINT");
		permAdd.setToolName("STINT");
		emer1Add.setToolName("STINT");
		emer2Add.setToolName("STINT");
		PersonID= id;
		select();
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

	public void localinit() {
		String table = TABLENAME;

		setMetadata("SIPersonID", "personID", "IDENTITY");
		setMetadata("AccountNo", "accountNo", table);
		setMetadata("LastName", "lastName", table);
		setMetadata("FirstName", "firstName", table);
		setMetadata("MiddleName", "middleName", table);
		setMetadata("PreferredName", "preferredName", table);
		setMetadata("Gender", "gender", table);
		setMetadata("Region", "region", table);
		setMetadata("WorkInUS", "workInUS", table);
		setMetadata("IsStaff", "isStaff", table);
		setMetadata("Title", "title", table);
		setMetadata("RecentSchools", "campus", table);
		setMetadata("UniversityState", "universityState", table);
		setMetadata("GraduationDate", "graduation_date", table);
		setMetadata("Majors", "major", table);
		setMetadata("MaritalStatus", "maritalStatus", table);
		setMetadata("NumberChildren", "numberChildren", table);
		setMetadata("DateCreated","dateCreated",table);
		setMetadata("DateChanged","dateChanged",table);
		setMetadata("ChangedBy","changedBy",table);
		setMetadata("CreatedBy","createdBy",table);
		setMetadata("Fk_ssmUserID", "fk_ssmUserID", table);
		setMetadata("Fk_StaffSiteProfileID", "fk_StaffSiteProfileID", table);

		setAutodetectProperties(false);
	}

    private int PersonID = 0;
	private String accountNo = "";
	private String lastName = "";
	private String firstName = "";
	private String middleName = "";
    private String preferredName="";
	private String gender = "";
	private String region = "";
	private boolean workInUS;
	private boolean isStaff;
    private String title = "";
    private String recentSchools="";
	private String universityState = "";
    private Date graduation_date = null;
    private String majors="";
	private String maritalStatus="";
    private String numberChildren="";
    private Date dateCreated=null;
    private Date dateChanged=null;
    private String changedBy="";
    private String createdBy="";
    private int fk_ssmUserID = 0;
	private int fk_StaffSiteProfileID = 0;


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
		return currAdd.getAddress1();
	}

	/**
	 * Returns the currentAddress2.
	 * @return String
	 */
	public String getCurrentAddress2() {
		return currAdd.getAddress2();
	}

	/**
	 * Returns the currentCellPhone.
	 * @return String
	 */
	public String getCurrentCellPhone() {
		return currAdd.getCellPhone();
	}

	/**
	 * Returns the currentCity.
	 * @return String
	 */
	public String getCurrentCity() {
		return currAdd.getCity();
	}

	/**
	 * Returns the currentEmail.
	 * @return String
	 */
	public String getCurrentEmail() {
		return currAdd.getEmail();
	}

	/**
	 * Returns the currentHomePhone.
	 * @return String
	 */
	public String getCurrentHomePhone() {
		return currAdd.getHomePhone();
	}

	/**
	 * Returns the currentState.
	 * @return String
	 */
	public String getCurrentState() {
		return currAdd.getState();
	}

	/**
	 * Returns the currentWorkPhone.
	 * @return String
	 */
	public String getCurrentWorkPhone() {
		return currAdd.getWorkPhone();
	}

	/**
	 * Returns the currentZip.
	 * @return String
	 */
	public String getCurrentZip() {
		return currAdd.getZip();
	}

	/**
	 * Returns the emer2Address1.
	 * @return String
	 */
	public String getEmer2Address1() {
		return emer2Add.getAddress1();
	}

	/**
	 * Returns the emer2Address2.
	 * @return String
	 */
	public String getEmer2Address2() {
		return emer2Add.getAddress2();
	}

	/**
	 * Returns the emer2CellPhone.
	 * @return String
	 */
	public String getEmer2CellPhone() {
		return emer2Add.getCellPhone();
	}

	/**
	 * Returns the emer2City.
	 * @return String
	 */
	public String getEmer2City() {
		return emer2Add.getCity();
	}

	/**
	 * Returns the emer2ContactName.
	 * @return String
	 */
	public String getEmer2ContactName() {
		return emer2Add.getContactName();
	}

	/**
	 * Returns the emer2ContactRelationship.
	 * @return String
	 */
	public String getEmer2ContactRelationship() {
		return emer2Add.getContactRelationship();
	}

	/**
	 * Returns the emer2Email.
	 * @return String
	 */
	public String getEmer2Email() {
		return emer2Add.getEmail();
	}

	/**
	 * Returns the emer2HomePhone.
	 * @return String
	 */
	public String getEmer2HomePhone() {
		return emer2Add.getHomePhone();
	}

	/**
	 * Returns the emer2State.
	 * @return String
	 */
	public String getEmer2State() {
		return emer2Add.getState();
	}

	/**
	 * Returns the emer2WorkPhone.
	 * @return String
	 */
	public String getEmer2WorkPhone() {
		return emer2Add.getWorkPhone();
	}

	/**
	 * Returns the emer2Zip.
	 * @return String
	 */
	public String getEmer2Zip() {
		return emer2Add.getZip();
	}

	/**
	 * Returns the emerAddress1.
	 * @return String
	 */
	public String getEmerAddress1() {
		return emer1Add.getAddress1();
	}

	/**
	 * Returns the emerAddress2.
	 * @return String
	 */
	public String getEmerAddress2() {
		return emer1Add.getAddress2();
	}

	/**
	 * Returns the emerCellPhone.
	 * @return String
	 */
	public String getEmerCellPhone() {
		return emer1Add.getCellPhone();
	}

	/**
	 * Returns the emerCity.
	 * @return String
	 */
	public String getEmerCity() {
		return emer1Add.getCity();
	}

	/**
	 * Returns the emerContactName.
	 * @return String
	 */
	public String getEmerContactName() {
		return emer1Add.getContactName();
	}

	/**
	 * Returns the emerContactRelationship.
	 * @return String
	 */
	public String getEmerContactRelationship() {
		return emer1Add.getContactRelationship();
	}

	/**
	 * Returns the emerEmail.
	 * @return String
	 */
	public String getEmerEmail() {
		return emer1Add.getEmail();
	}

	/**
	 * Returns the emerHomePhone.
	 * @return String
	 */
	public String getEmerHomePhone() {
		return emer1Add.getHomePhone();
	}

	/**
	 * Returns the emerState.
	 * @return String
	 */
	public String getEmerState() {
		return emer1Add.getState();
	}

	/**
	 * Returns the emerWorkPhone.
	 * @return String
	 */
	public String getEmerWorkPhone() {
		return emer1Add.getWorkPhone();
	}

	/**
	 * Returns the emerZip.
	 * @return String
	 */
	public String getEmerZip() {
		return emer1Add.getZip();
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
		return currAdd.getEndDate();
	}

	/**
	 * Returns the lastName.
	 * @return String
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * Returns the permAddress1.
	 * @return String
	 */
	public String getPermAddress1() {
		return permAdd.getAddress1();
	}

	/**
	 * Returns the permAddress2.
	 * @return String
	 */
	public String getPermAddress2() {
		return permAdd.getAddress2();
	}

	/**
	 * Returns the permCellPhone.
	 * @return String
	 */
	public String getPermCellPhone() {
		return permAdd.getCellPhone();
	}

	/**
	 * Returns the permCity.
	 * @return String
	 */
	public String getPermCity() {
		return permAdd.getCity();
	}

	/**
	 * Returns the permEmail.
	 * @return String
	 */
	public String getPermEmail() {
		return permAdd.getEmail();
	}

	/**
	 * Returns the permHomePhone.
	 * @return String
	 */
	public String getPermHomePhone() {
		return permAdd.getHomePhone();
	}

	/**
	 * Returns the permState.
	 * @return String
	 */
	public String getPermState() {
		return permAdd.getState();
	}

	/**
	 * Returns the permWorkPhone.
	 * @return String
	 */
	public String getPermWorkPhone() {
		return permAdd.getWorkPhone();
	}

	/**
	 * Returns the permZip.
	 * @return String
	 */
	public String getPermZip() {
		return permAdd.getZip();
	}

	/**
	 * Returns the region.
	 * @return String
	 */
	public String getRegion() {
		return region;
	}

	/**
	 * Returns the sIPersonID.
	 * @return String
	 */
	public String getSIPersonID() {
		return Integer.toString(PersonID);
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
		currAdd.setAddress1(currentAddress1);
	}

	/**
	 * Sets the currentAddress2.
	 * @param currentAddress2 The currentAddress2 to set
	 */
	public void setCurrentAddress2(String currentAddress2) {
		currAdd.setAddress2(currentAddress2);
	}

	/**
	 * Sets the currentCellPhone.
	 * @param currentCellPhone The currentCellPhone to set
	 */
	public void setCurrentCellPhone(String currentCellPhone) {
		currAdd.setCellPhone(currentCellPhone);
	}

	/**
	 * Sets the currentCity.
	 * @param currentCity The currentCity to set
	 */
	public void setCurrentCity(String currentCity) {
		currAdd.setCity(currentCity);
	}

	/**
	 * Sets the currentEmail.
	 * @param currentEmail The currentEmail to set
	 */
	public void setCurrentEmail(String currentEmail) {
		currAdd.setEmail(currentEmail);
	}

	/**
	 * Sets the currentHomePhone.
	 * @param currentHomePhone The currentHomePhone to set
	 */
	public void setCurrentHomePhone(String currentHomePhone) {
		currAdd.setHomePhone(currentHomePhone);
	}

	/**
	 * Sets the currentState.
	 * @param currentState The currentState to set
	 */
	public void setCurrentState(String currentState) {
		currAdd.setState(currentState);
	}

	/**
	 * Sets the currentWorkPhone.
	 * @param currentWorkPhone The currentWorkPhone to set
	 */
	public void setCurrentWorkPhone(String currentWorkPhone) {
		currAdd.setWorkPhone(currentWorkPhone);
	}

	/**
	 * Sets the currentZip.
	 * @param currentZip The currentZip to set
	 */
	public void setCurrentZip(String currentZip) {
		currAdd.setZip(currentZip);
	}

	/**
	 * Sets the emer2Address1.
	 * @param emer2Address1 The emer2Address1 to set
	 */
	public void setEmer2Address1(String emer2Address1) {
		emer2Add.setAddress1(emer2Address1);
	}

	/**
	 * Sets the emer2Address2.
	 * @param emer2Address2 The emer2Address2 to set
	 */
	public void setEmer2Address2(String emer2Address2) {
		emer2Add.setAddress2(emer2Address2);
	}

	/**
	 * Sets the emer2CellPhone.
	 * @param emer2CellPhone The emer2CellPhone to set
	 */
	public void setEmer2CellPhone(String emer2CellPhone) {
		emer2Add.setCellPhone(emer2CellPhone);
	}

	/**
	 * Sets the emer2City.
	 * @param emer2City The emer2City to set
	 */
	public void setEmer2City(String emer2City) {
		emer2Add.setCity(emer2City);
	}

	/**
	 * Sets the emer2ContactName.
	 * @param emer2ContactName The emer2ContactName to set
	 */
	public void setEmer2ContactName(String emer2ContactName) {
		emer2Add.setContactName(emer2ContactName);
	}

	/**
	 * Sets the emer2ContactRelationship.
	 * @param emer2ContactRelationship The emer2ContactRelationship to set
	 */
	public void setEmer2ContactRelationship(String emer2ContactRelationship) {
		emer2Add.setContactRelationship(emer2ContactRelationship);
	}

	/**
	 * Sets the emer2Email.
	 * @param emer2Email The emer2Email to set
	 */
	public void setEmer2Email(String emer2Email) {
		emer2Add.setEmail(emer2Email);
	}

	/**
	 * Sets the emer2HomePhone.
	 * @param emer2HomePhone The emer2HomePhone to set
	 */
	public void setEmer2HomePhone(String emer2HomePhone) {
		emer2Add.setHomePhone(emer2HomePhone);
	}

	/**
	 * Sets the emer2State.
	 * @param emer2State The emer2State to set
	 */
	public void setEmer2State(String emer2State) {
		emer2Add.setState(emer2State);
	}

	/**
	 * Sets the emer2WorkPhone.
	 * @param emer2WorkPhone The emer2WorkPhone to set
	 */
	public void setEmer2WorkPhone(String emer2WorkPhone) {
		emer2Add.setWorkPhone(emer2WorkPhone);
	}

	/**
	 * Sets the emer2Zip.
	 * @param emer2Zip The emer2Zip to set
	 */
	public void setEmer2Zip(String emer2Zip) {
		emer2Add.setZip(emer2Zip);
	}

	/**
	 * Sets the emerAddress1.
	 * @param emerAddress1 The emerAddress1 to set
	 */
	public void setEmerAddress1(String emerAddress1) {
		emer1Add.setAddress1(emerAddress1);
	}

	/**
	 * Sets the emerAddress2.
	 * @param emerAddress2 The emerAddress2 to set
	 */
	public void setEmerAddress2(String emerAddress2) {
		emer1Add.setAddress2(emerAddress2);
	}

	/**
	 * Sets the emerCellPhone.
	 * @param emerCellPhone The emerCellPhone to set
	 */
	public void setEmerCellPhone(String emerCellPhone) {
		emer1Add.setCellPhone(emerCellPhone);
	}

	/**
	 * Sets the emerCity.
	 * @param emerCity The emerCity to set
	 */
	public void setEmerCity(String emerCity) {
		emer1Add.setCity(emerCity);
	}

	/**
	 * Sets the emerContactName.
	 * @param emerContactName The emerContactName to set
	 */
	public void setEmerContactName(String emerContactName) {
		emer1Add.setContactName(emerContactName);
	}

	/**
	 * Sets the emerContactRelationship.
	 * @param emerContactRelationship The emerContactRelationship to set
	 */
	public void setEmerContactRelationship(String emerContactRelationship) {
		emer1Add.setContactRelationship(emerContactRelationship);
	}

	/**
	 * Sets the emerEmail.
	 * @param emerEmail The emerEmail to set
	 */
	public void setEmerEmail(String emerEmail) {
		emer1Add.setEmail(emerEmail);
	}

	/**
	 * Sets the emerHomePhone.
	 * @param emerHomePhone The emerHomePhone to set
	 */
	public void setEmerHomePhone(String emerHomePhone) {
		emer1Add.setHomePhone(emerHomePhone);
	}

	/**
	 * Sets the emerState.
	 * @param emerState The emerState to set
	 */
	public void setEmerState(String emerState) {
		emer1Add.setState(emerState);
	}

	/**
	 * Sets the emerWorkPhone.
	 * @param emerWorkPhone The emerWorkPhone to set
	 */
	public void setEmerWorkPhone(String emerWorkPhone) {
		emer1Add.setWorkPhone(emerWorkPhone);
	}

	/**
	 * Sets the emerZip.
	 * @param emerZip The emerZip to set
	 */
	public void setEmerZip(String emerZip) {
		emer1Add.setZip(emerZip);
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
		currAdd.setEndDate(lastDateAtAddress);
	}

	/**
	 * Sets the lastName.
	 * @param lastName The lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * Sets the permAddress1.
	 * @param permAddress1 The permAddress1 to set
	 */
	public void setPermAddress1(String permAddress1) {
		permAdd.setAddress1(permAddress1);
	}

	/**
	 * Sets the permAddress2.
	 * @param permAddress2 The permAddress2 to set
	 */
	public void setPermAddress2(String permAddress2) {
		permAdd.setAddress2(permAddress2);
	}

	/**
	 * Sets the permCellPhone.
	 * @param permCellPhone The permCellPhone to set
	 */
	public void setPermCellPhone(String permCellPhone) {
		permAdd.setCellPhone(permCellPhone);
	}

	/**
	 * Sets the permCity.
	 * @param permCity The permCity to set
	 */
	public void setPermCity(String permCity) {
		permAdd.setCity(permCity);
	}

	/**
	 * Sets the permEmail.
	 * @param permEmail The permEmail to set
	 */
	public void setPermEmail(String permEmail) {
		permAdd.setEmail(permEmail);
	}

	/**
	 * Sets the permHomePhone.
	 * @param permHomePhone The permHomePhone to set
	 */
	public void setPermHomePhone(String permHomePhone) {
		permAdd.setHomePhone(permHomePhone);
	}

	/**
	 * Sets the permState.
	 * @param permState The permState to set
	 */
	public void setPermState(String permState) {
		permAdd.setState(permState);
	}

	/**
	 * Sets the permWorkPhone.
	 * @param permWorkPhone The permWorkPhone to set
	 */
	public void setPermWorkPhone(String permWorkPhone) {
		permAdd.setWorkPhone(permWorkPhone);
	}

	/**
	 * Sets the permZip.
	 * @param permZip The permZip to set
	 */
	public void setPermZip(String permZip) {
		permAdd.setZip(permZip);
	}

	/**
	 * Sets the region.
	 * @param region The region to set
	 */
	public void setRegion(String region) {
		this.region = region;
	}

	/**
	 * Sets the sIPersonID.
	 * @param sIPersonID The sIPersonID to set
	 */
	public void setSIPersonID(String sIPersonID) {
		if (sIPersonID != null && !sIPersonID.equals("")) {
			PersonID = Integer.parseInt(sIPersonID);
		}
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
		return graduation_date;
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
	 * Sets the graduation_date.
	 * @param graduation_date The graduation_date to set
	 */
	public void setGraduationDate(Date graduation_date) {
		this.graduation_date = graduation_date;
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
	 *
	 * @return String
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Sets the title.
	 *
	 * @param title
	 *            The title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * Returns the staffStieProfileID. Added 6 December 2002 by RDH
	 *
	 * @return String
	 */
	public int getFk_StaffSiteProfileID() {
		return fk_StaffSiteProfileID;
	}

	/**
	 * Sets the staffStieProfileID. Added 6 December 2002 by RDH
	 *
	 * @param fk_StaffStieProfileID
	 *            The staffStieProfileID to set
	 */
	public void setFk_StaffSiteProfileID(int fk_StaffSiteProfileID) {
		this.fk_StaffSiteProfileID = fk_StaffSiteProfileID;
	}

	/**
	 * Returns the staffStieProfileID. Added 12 December 2002 by RDH
	 *
	 * @return String
	 */
	public String getUniversityState() {
		return universityState;
	}

	/**
	 * Sets the staffStieProfileID. Added 12 December 2002 by RDH
	 *
	 * @param universityState
	 *            The state the most recently attended school was in.
	 */
	public void setUniversityState(String universityState) {
		this.universityState = universityState;
	}

	/**
	 * @return Returns the changedBy.
	 */
	public String getChangedBy() {
		return changedBy;
	}

	/**
	 * @param changedBy
	 *            The changedBy to set.
	 */
	public void setChangedBy(String changedBy) {
		this.changedBy = changedBy;
	}

	/**
	 * @return Returns the dateChanged.
	 */
	public Date getDateChanged() {
		return dateChanged;
	}

	/**
	 * @param dateChanged
	 *            The dateChanged to set.
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
	 *
	 */
	public void updateNoDate() {
		super.update();
	}
	/**
	 * @return Returns the maritalStatus.
	 */
	public String getMaritalStatus() {
		return maritalStatus;
	}
	/**
	 * @param maritalStatus The maritalStatus to set.
	 */
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
}