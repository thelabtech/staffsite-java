package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

import org.alt60m.ministry.model.dbio.Address;

public class Person extends DBIOEntity {
	private Address currAdd = new Address();
	private Address permAdd = new Address();
	
	public boolean insert() {
		setDateCreated(new Date());
		setDateChanged(new Date());
		setChangedBy("CRS");
		setCreatedBy("CRS");
		boolean result = super.insert();
		currAdd.setFk_PersonID(this.personID);
		permAdd.setFk_PersonID(this.personID);
		currAdd.setAddressType(Address.CURRENT_ADDRESS);
		permAdd.setAddressType(Address.PERMANENT_ADDRESS);
		currAdd.insert();
		permAdd.insert();
		return result;
	}
	public boolean update() {
		setDateChanged(new Date());
		setChangedBy("CRS");
		boolean result = super.update();
		currAdd.setFk_PersonID(this.personID);
		permAdd.setFk_PersonID(this.personID);
		currAdd.setAddressType(Address.CURRENT_ADDRESS);
		permAdd.setAddressType(Address.PERMANENT_ADDRESS);
		currAdd.update();
		permAdd.update();
		return result;
	}
	public void updateNoDate() {
		super.update();
		currAdd.setFk_PersonID(this.personID);
		permAdd.setFk_PersonID(this.personID);
		currAdd.setAddressType(Address.CURRENT_ADDRESS);
		permAdd.setAddressType(Address.PERMANENT_ADDRESS);
		currAdd.persist();
		permAdd.persist();
	}
	public boolean delete() {
		currAdd.delete();
		permAdd.delete();
		return super.delete();
	}
	public boolean select() {
		boolean result = super.select();
		if ( result ) {
			currAdd.setFk_PersonID(this.personID);
			permAdd.setFk_PersonID(this.personID);
			currAdd.setAddressType(Address.CURRENT_ADDRESS);
			permAdd.setAddressType(Address.PERMANENT_ADDRESS);
			
			if (!currAdd.select()) {
				currAdd.persist();
			}
			if (!permAdd.select()) {
				permAdd.persist();
			}
		}
		return result;
	}
	public boolean select(String whereclause) {
		boolean result = super.select(whereclause);
		if ( result ) {
			currAdd.setFk_PersonID(this.personID);
			permAdd.setFk_PersonID(this.personID);
			currAdd.setAddressType(Address.CURRENT_ADDRESS);
			permAdd.setAddressType(Address.PERMANENT_ADDRESS);
			if (!currAdd.select()) {
				currAdd.persist();
			}
			if (!permAdd.select()) {
				permAdd.persist();
			}
		}
		return result;
	}
	public Vector selectList() {
		Vector people = super.selectList();
		Vector result = new Vector();
		for ( int i = 0; i < people.size(); i++ ) {
			Person p = (Person)people.get(i);
			p.currAdd.setFk_PersonID(p.personID);
			p.permAdd.setFk_PersonID(p.personID);
			p.currAdd.setAddressType(Address.CURRENT_ADDRESS);
			p.permAdd.setAddressType(Address.PERMANENT_ADDRESS);
			p.currAdd.select();
			p.permAdd.select();
			result.add(p);
		}
		return result;
	}
	public Vector selectList(String whereclause) {
		Vector people = super.selectList(whereclause);
		Vector result = new Vector();
		for ( int i = 0; i < people.size(); i++ ) {
			Person p = (Person)people.get(i);
			p.currAdd.setFk_PersonID(p.personID);
			p.permAdd.setFk_PersonID(p.personID);
			p.currAdd.setAddressType(Address.CURRENT_ADDRESS);
			p.permAdd.setAddressType(Address.PERMANENT_ADDRESS);
			p.currAdd.select();
			p.permAdd.select();
			result.add(p);
		}
		return result;
	}
	public Person() {
		currAdd.setToolName("CRS");
		permAdd.setToolName("CRS");
	}

	public Person(int id) {
		this.setPersonID(id);
		currAdd.setToolName("CRS");
		permAdd.setToolName("CRS");
		this.select();
	}

	public boolean isPKEmpty() {
		return personID == 0;
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_person";
		setMetadata("PersonID", "personID", "IDENTITY");
		setMetadata("DateCreated", "dateCreated", table);
		setMetadata("DateChanged", "dateChanged", table);
		setMetadata("ChangedBy","changedBy",table);
		setMetadata("CreatedBy","createdBy",table);
		setMetadata("FirstName", "firstName", table);
		setMetadata("LastName", "lastName", table);
		setMetadata("MiddleInitial", "middleName", table);
		setMetadata("BirthDate", "birthDate", table);
		setMetadata("Campus", "campus", table);
		setMetadata("YearInSchool", "yearInSchool", table);
		setMetadata("GraduationDate", "graduationDate", table);
		setMetadata("GreekAffiliation", "greekAffiliation", table);
		setMetadata("Gender", "gender", table);
		setMetadata("MaritalStatus", "maritalStatus", table);
		setMetadata("NumberOfKids", "numberChildren", table);
		setMetadata("AccountNo", "accountNo", table);
		setMetadata("SpouseID", "fk_spouseID", table);
		setMetadata("Fk_ssmUserID", "fk_ssmUserId", table);

		setAutodetectProperties(false);
	}

	private int personID = 0;
	private Date createdDate = null;
	private Date dateChanged = null;
	private String changedBy = "";
	private String createdBy = "";

	private String firstName = "";

	private String lastName = "";

	private String middleInitial = "";

	private String birthDate = "";

	private String campus = "";

	private String yearInSchool = "";

	private String graduationDate = "";

	private String greekAffiliation = "";

	private String gender = "";

	private String maritalStatus = "";

	private String numberOfKids = "";

	private String accountNo = "";

	private int spouseID = 0;
	
	private int fk_ssmUserID = 0;

	private Person spouse;
	
	public int getPersonID() {
		return personID;
	}

	public void setPersonID(int personID) {
		this.personID = personID;
	}

	public int getSpouseID() {
		return spouseID;
	}

	public void setSpouseID(int spouseID) {
		this.spouseID = spouseID;
	}

	public String getEmail() {
		return currAdd.getEmail();
	}

	public void setEmail(String email) {
		currAdd.setEmail(email);
	}

	public Date getDateCreated() {
		return createdDate;
	}

	public void setDateCreated(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleInitial() {
		return this.middleInitial;
	}

	public void setMiddleInitial(String middleInitial) {
		this.middleInitial = middleInitial;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getCampus() {
		return this.campus;
	}

	public void setCampus(String campus) {
		this.campus = campus;
	}

	public String getYearInSchool() {
		return yearInSchool;
	}

	public void setYearInSchool(String yearInSchool) {
		this.yearInSchool = yearInSchool;
	}

	public String getGreekAffiliation() {
		return greekAffiliation;
	}

	public void setGreekAffiliation(String greekAffiliation) {
		this.greekAffiliation = greekAffiliation;
	}

	public String getGraduationDate() {
		return graduationDate;
	}

	public void setGraduationDate(String graduationDate) {
		this.graduationDate = graduationDate;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress1() {
		return currAdd.getAddress1();
	}

	public void setAddress1(String address1) {
		currAdd.setAddress1(address1);
	}

	public String getAddress2() {
		return currAdd.getAddress2();
	}

	public void setAddress2(String address2) {
		currAdd.setAddress2(address2);
	}

	public String getCity() {
		return currAdd.getCity();
	}

	public void setCity(String city) {
		currAdd.setCity(city);
	}

	public String getState() {
		return currAdd.getState();
	}

	public void setState(String state) {
		currAdd.setState(state);
	}

	public String getZip() {
		return currAdd.getZip();
	}

	public void setZip(String zip) {
		currAdd.setZip(zip);
	}

	public String getCountry() {
		return currAdd.getCountry();
	}

	public void setCountry(String country) {
		currAdd.setCountry(country);
	}

	public String getHomePhone() {
		return currAdd.getHomePhone();
	}

	public void setHomePhone(String homePhone) {
		currAdd.setHomePhone(homePhone);
	}

	public String getPermanentAddress1() {
		return permAdd.getAddress1();
	}

	public void setPermanentAddress1(String permanentAddress1) {
		permAdd.setAddress1(permanentAddress1);
	}

	public String getPermanentAddress2() {
		return permAdd.getAddress2();
	}

	public void setPermanentAddress2(String permanentAddress2) {
		permAdd.setAddress2(permanentAddress2);
	}

	public String getPermanentCity() {
		return permAdd.getCity();
	}

	public void setPermanentCity(String permanentCity) {
		permAdd.setCity(permanentCity);
	}

	public String getPermanentState() {
		return permAdd.getState();
	}

	public void setPermanentState(String permanentState) {
		permAdd.setState(permanentState);
	}

	public String getPermanentZip() {
		return permAdd.getZip();
	}

	public void setPermanentZip(String permanentZip) {
		permAdd.setZip(permanentZip);
	}

	public String getPermanentCountry() {
		return permAdd.getCountry();
	}

	public void setPermanentCountry(String permanentCountry) {
		permAdd.setCountry(permanentCountry);
	}

	public String getPermanentPhone() {
		return permAdd.getHomePhone();
	}

	public void setPermanentPhone(String permanentPhone) {
		permAdd.setHomePhone(permanentPhone);
	}

	public String getMaritalStatus() {
		return this.maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getNumberOfKids() {
		return numberOfKids;
	}

	public void setNumberOfKids(String numberOfKids) {
		this.numberOfKids = numberOfKids;
	}

	public int getNumberOfKidsInt() {
		return Integer.parseInt(numberOfKids);
	}

	public void setNumberOfKidsInt(int numberOfKids) {
		this.numberOfKids = String.valueOf(numberOfKids);
	}

	public String getAccountNo() {
		return this.accountNo;
	}

	public void setAccountNo(String accountNo) {
		if (accountNo != null) {
			this.accountNo = accountNo.trim();
		}
	}

	public Vector getRegistration() {
		Registration r = new Registration();
		r.setPersonID(personID);
		return r.selectList();
	}

	public void assocRegistration(Registration r) {
		r.setPersonID(personID);
		r.update();
	}

	public void dissocRegistration(Registration r) {
		r.setPersonID(0);
		r.update();
	}

	//	public Person getSpouse(){
	//		if(spouse == null){
	//			spouse.setPersonID(spouseID);
	//			spouse.select();
	//		}
	//		return spouse;
	//	}
	//	public void setSpouse(Person spouse) {
	//		spouseID = spouse.getPersonID();
	//		this.spouse = spouse;
	//	}


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