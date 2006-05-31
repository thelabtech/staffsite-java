 
package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.log.*;
import com.kenburcham.framework.system.*;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class ChildRegistration extends DBIOEntity {

	public static SystemLog log = (SystemLog) SystemManager
			.getLog(ChildRegistration.class.getName());

	// IDENTITY
	private int childRegistrationID;

	// KEY
	private int fk_RegistrationID;

	private String firstName = "";

	private String lastName = "";
	
	private String gender = "";

	private int age = 0;

	private Date arriveDate = null;

	private Date leaveDate = null;

	private Date birthDate = null;

	private String inChildCare = "";

	public ChildRegistration() {
	}

	public void localinit() throws DBIOEntityException {
		String table = "crs_childregistration";
		setMetadata("ChildRegistrationID", "childRegistrationID", "IDENTITY");

		setMetadata("RegistrationID", "fk_RegistrationID", "KEY");

		setMetadata("FirstName", "firstName", table);
		setMetadata("LastName", "lastName", table);
		setMetadata("Gender", "gender", table);
		setMetadata("Age", "age", table);
		setMetadata("ArriveDate", "arriveDate", table);
		setMetadata("LeaveDate", "leaveDate", table);
		setMetadata("BirthDate", "birthDate", table);
		setMetadata("InChildCareString", "inChildCare", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getChildRegistrationID() == 0;
	}

	public int getChildRegistrationID() {
		return childRegistrationID;
	}

	public void setChildRegistrationID(int childRegistrationID) {
		this.childRegistrationID = childRegistrationID;
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
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getArriveDate() {
		return this.arriveDate;
	}

	public void setArriveDate(Date arriveDate) {
		this.arriveDate = arriveDate;
	}

	public Date getLeaveDate() {
		return this.leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public Date getBirthDate() {
		return this.birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public boolean getInChildCare() {
		return inChildCare != null && inChildCare.equals("T");
	}

	public void setInChildCare(boolean inChildCare) {
		this.inChildCare = inChildCare ? "T" : "F";
	}

	public String getInChildCareString() {
		return inChildCare;
	}

	public void setInChildCareString(String inChildCare) {
		this.inChildCare = inChildCare;
	}

	public int getRegistrationID() {
		return fk_RegistrationID;
	}

	public void setRegistrationID(int registrationID) {
		this.fk_RegistrationID = registrationID;
	}

	public Registration getRegistration() {
		Registration r = new Registration();
		r.setRegistrationID(fk_RegistrationID);
		r.select();
		return r;
	}

	public void setRegistration(Registration r) {
		fk_RegistrationID = r.getRegistrationID();
	}
}