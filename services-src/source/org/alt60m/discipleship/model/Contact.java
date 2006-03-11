package org.alt60m.discipleship.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import org.alt60m.ministry.model.dbio.Staff;
import java.util.*;

public class Contact extends DBIOEntity {
	
	public Contact(int id) {
		contactId = id;
		select();
	}
	public Contact(String id) {
		contactId = (new Integer(id)).intValue();
		select();
	}
	public Contact() {
		dateAdded = new Date();
	}

	public boolean isPKEmpty() {
		return contactId == 0;
	}

//identity
	private int contactId = 0;

	private String firstName = "";
	private String lastName = "";
	private String phoneNumber = "";
	private String emailAddress = "";
	private String address1 = "";
	private String address2 = "";
	private String residence = "";
	private String city = "";
	private String state = "";
	private String zip = "";
	private String gender = "";
	private String maritalStatus = "";
	private String campus = "";
	private String levelOfDiscipleship = "";
	private String yearInSchool = "";
	private Date birthDate = null;
	private String dateBecameBeliever = "";
	private String primarySpiritualGift = "";
	private String secondarySpiritualGift = "";
	private String tertiarySpiritualGift = "";
	private String typeOfContact = "";
	private Date dateAdded = null;
	private String note = "";
	
	private String fk_discipledById = "";
	
	public void localinit() throws DBIOEntityException {
		String table = "discipleship_Contact";

		setMetadata("ContactId","contactid","IDENTITY");
		setMetadata("FirstName","firstname",table);
		setMetadata("LastName","lastname",table);
		setMetadata("PhoneNumber","phonenumber",table);
		setMetadata("EmailAddress","emailaddress",table);
		setMetadata("Address1","address1",table);
		setMetadata("Address2","address2",table);
		setMetadata("Residence","residence",table);
		setMetadata("City","city",table);
		setMetadata("State","state",table);
		setMetadata("Zip","zip",table);
		setMetadata("Gender","gender",table);
		setMetadata("MaritalStatus","maritalstatus",table);
		setMetadata("Campus","campus",table);
		setMetadata("LevelOfDiscipleship","levelofdiscipleship",table);
		setMetadata("YearInSchool","yearinschool",table);
		setMetadata("BirthDate","birthdate",table);
		setMetadata("DateBecameBeliever","datebecamebeliever",table);
		setMetadata("PrimarySpiritualGift","primaryspiritualgift",table);
		setMetadata("SecondarySpiritualGift","secondaryspiritualgift",table);
		setMetadata("TertiarySpiritualGift","tertiaryspiritualgift",table);
		setMetadata("TypeOfContact","typeofcontact",table);
		setMetadata("DateAdded","dateadded",table);
		setMetadata("Note","note",table);
		setMetadata("DiscipledById","discipledby",table);
		
		setAutodetectProperties(false);
	}

	/**
	 * @return
	 */
	public int getContactId() {
		return contactId;
	}

	/**
	 * @param i
	 */
	public void setContactId(int i) {
		contactId = i;
	}

	/**
	 * @return
	 */
	public String getContactIdString() {
		return (new Integer(contactId)).toString();
	}

	/**
	 * @return
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param string
	 */
	public void setFirstName(String string) {
		firstName = string;
	}

	/**
	 * @return
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param string
	 */
	public void setLastName(String string) {
		lastName = string;
	}

	/**
	 * @return
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param string
	 */
	public void setPhoneNumber(String string) {
		phoneNumber = string;
	}

	/**
	 * @return
	 */
	public String getEmailAddress() {
		return emailAddress;
	}

	/**
	 * @param string
	 */
	public void setEmailAddress(String string) {
		emailAddress = string;
	}

	/**
	 * @return
	 */
	public String getAddress1() {
		return address1;
	}

	/**
	 * @param string
	 */
	public void setAddress1(String string) {
		address1 = string;
	}

	/**
	 * @return
	 */
	public String getAddress2() {
		return address2;
	}

	/**
	 * @param string
	 */
	public void setAddress2(String string) {
		address2 = string;
	}

	/**
	 * @return
	 */
	public String getResidence() {
		return residence;
	}

	/**
	 * @param string
	 */
	public void setResidence(String string) {
		residence = string;
	}

	/**
	 * @return
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param string
	 */
	public void setCity(String string) {
		city = string;
	}

	/**
	 * @return
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param string
	 */
	public void setState(String string) {
		state = string;
	}

	/**
	 * @return
	 */
	public String getZip() {
		return zip;
	}

	/**
	 * @param string
	 */
	public void setZip(String string) {
		zip = string;
	}

	/**
	 * @return
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param string
	 */
	public void setGender(String string) {
		gender = string;
	}

	/**
	 * @return
	 */
	public String getMaritalStatus() {
		return maritalStatus;
	}

	/**
	 * @param string
	 */
	public void setMaritalStatus(String string) {
		maritalStatus = string;
	}

	/**
	 * @return
	 */
	public String getLevelOfDiscipleship() {
		return levelOfDiscipleship;
	}

	/**
	 * @param string
	 */
	public void setLevelOfDiscipleship(String string) {
		levelOfDiscipleship = string;
	}

	/**
	 * @return
	 */
	public String getYearInSchool() {
		return yearInSchool;
	}

	/**
	 * @param string
	 */
	public void setYearInSchool(String string) {
		yearInSchool = string;
	}

	/**
	 * @return
	 */
	public String getDateBecameBeliever() {
		return dateBecameBeliever;
	}

	/**
	 * @param string
	 */
	public void setDateBecameBeliever(String string) {
		dateBecameBeliever = string;
	}

	/**
	 * @return
	 */
	public Date getBirthDate() {
		return birthDate;
	}

	/**
	 * @return
	 */
	public String getBirthDateString() {
		return birthDate.toString();
	}

	/**
	 * @param date
	 */
	public void setBirthDate(Date date) {
		birthDate = date;
	}

	/**
	 * @return
	 */
	public String getCampus() {
		return campus;
	}

	/**
	 * @param string
	 */
	public void setCampus(String string) {
		campus = string;
	}

	/**
	 * @return
	 */
	public String getPrimarySpiritualGift() {
		return primarySpiritualGift;
	}

	/**
	 * @param string
	 */
	public void setPrimarySpiritualGift(String string) {
		primarySpiritualGift = string;
	}

	/**
	 * @return
	 */
	public String getSecondarySpiritualGift() {
		return secondarySpiritualGift;
	}

	/**
	 * @param string
	 */
	public void setSecondarySpiritualGift(String string) {
		secondarySpiritualGift = string;
	}

	/**
	 * @return
	 */
	public String getTertiarySpiritualGift() {
		return tertiarySpiritualGift;
	}

	/**
	 * @param string
	 */
	public void setTertiarySpiritualGift(String string) {
		tertiarySpiritualGift = string;
	}

	/**
	 * @return
	 */
	public String getTypeOfContact() {
		return typeOfContact;
	}

	/**
	 * @param string
	 */
	public void setTypeOfContact(String string) {
		typeOfContact = string;
	}

	/**
	 * @return
	 */
	public Date getDateAdded() {
		return dateAdded;
	}

	/**
	 * @return
	 */
	public String getDateAddedString() {
		return dateAdded.toString();
	}

	/**
	 * @param date
	 */
	public void setDateAdded(Date date) {
		dateAdded = date;
	}

	/**
	 * @return
	 */
	public String getNote() {
		return note;
	}

	/**
	 * @param string
	 */
	public void setNote(String string) {
		note = string;
	}
	
	/**
	 * @return
	 */
	public Vector getSchedules() {
		Schedule s = new Schedule();
		s.setContactId(this.contactId);
		return s.selectList();
	}
	/**
	 * @return
	 */
	public Schedule getMonday() {
		Schedule s = new Schedule();
		s.setScheduleId(this.contactId);
		s.setDayOfWeek("Monday");
		s.select();
		return s;
	}
	/**
	 * @return
	 */
	public Schedule getTuesday() {
		Schedule s = new Schedule();
		s.setScheduleId(this.contactId);
		s.setDayOfWeek("Tuesday");
		s.select();
		return s;
	}
	/**
	 * @return
	 */
	public Schedule getWednesday() {
		Schedule s = new Schedule();
		s.setScheduleId(this.contactId);
		s.setDayOfWeek("Wednesday");
		s.select();
		return s;
	}
	/**
	 * @return
	 */
	public Schedule getThursday() {
		Schedule s = new Schedule();
		s.setScheduleId(this.contactId);
		s.setDayOfWeek("Thursday");
		s.select();
		return s;
	}
	/**
	 * @return
	 */
	public Schedule getFriday() {
		Schedule s = new Schedule();
		s.setScheduleId(this.contactId);
		s.setDayOfWeek("Friday");
		s.select();
		return s;
	}
	/**
	 * @return
	 */
	public Schedule getSaturday() {
		Schedule s = new Schedule();
		s.setScheduleId(this.contactId);
		s.setDayOfWeek("Saturday");
		s.select();
		return s;
	}
	/**
	 * @return
	 */
	public Schedule getSunday() {
		Schedule s = new Schedule();
		s.setScheduleId(this.contactId);
		s.setDayOfWeek("Sunday");
		s.select();
		return s;
	}
	/**
	 * @return
	 */
	public Vector getSchedules(String orderField, boolean DESC) {
		Schedule s = new Schedule();
		return s.selectList("fk_contactid = '" + this.contactId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	/**
	 * @param string
	 */
	public void assocSchedule(Schedule s) {
		s.setContactId(this.contactId);
		s.update();
	}
	/**
	 * @param string
	 */
	public void dissocSchedule(Schedule s) {
		s.setContactId(0);
		s.update();
	}	

	/**
	 * @return
	 */
	public Vector getLessons() {
		Lesson l = new Lesson();
		l.setContactId(this.contactId);
		return l.selectList();
	}
	/**
	 * @return
	 */
	public Vector getLessons(String orderField, boolean DESC) {
		Lesson l = new Lesson();
		return l.selectList("fk_contactid = '" + this.contactId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	/**
	 * @param string
	 */
	public void assocLesson(Lesson l) {
		l.setContactId(this.contactId);
		l.update();
	}
	/**
	 * @param string
	 */
	public void dissocLesson(Lesson l) {
		l.setContactId(0);
		l.update();
	}	

	/**
	 * @return
	 */
	public Vector getCalls() {
		Call c = new Call();
		c.setContactId(this.contactId);
		return c.selectList();
	}
	/**
	 * @return
	 */
	public Vector getCalls(String orderField, boolean DESC) {
		Call c = new Call();
		return c.selectList("fk_contactid = '" + this.contactId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	/**
	 * @param string
	 */
	public void assocCall(Call c) {
		c.setContactId(this.contactId);
		c.update();
	}
	/**
	 * @param string
	 */
	public void dissocCall(Call c) {
		c.setContactId(0);
		c.update();
	}	

	/**
	 * @return
	 */
	public String getDiscipledById() {
		return fk_discipledById;
	}
	/**
	 * @param string
	 */
	public void setDiscipledById(String string) {
		fk_discipledById = string;
	}
	/**
	 * @return
	 */
	public Staff getDiscipledBy() {
		Staff s = new Staff();
		s.setAccountNo(this.fk_discipledById);
		s.select();
		return s;
	}
	/**
	 * @param string
	 */
	public void setDiscipledBy(Staff s) {
		fk_discipledById = s.getAccountNo();
	}

}