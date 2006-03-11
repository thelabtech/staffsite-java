package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;
import java.text.SimpleDateFormat;

/**
 * @author Michael.Brinkley
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class Rolodex extends DBIOEntity {
	
	public Rolodex(int id) {
		rolodexId = id;
		select();
	}
	public Rolodex(String id) {
		rolodexId = (new Integer(id)).intValue();
		select();
	}
	public Rolodex() {}

	public boolean isPKEmpty() {
		return rolodexId == 0;
	}

//identity
	private int rolodexId = 0;

	private String firstName = "";
    private String middleInitial = "";
	private String lastName = "";
	private String address = "";
	private String address2 = "";
	private String city = "";
	private String state = "";
	private String zip = "";
    private String gender = "";
    private String phone = "";
    private String email = "";
    private String maritalStatus = "";
    private Date birthDate = null;
	private String campus = "";
	private String table = "";
	private String key = "";
	private Date dateInserted = null;
	private String crsPersonId = "";
	private String eventPersonId = "";
	private String siPersonId = "";
	private String linczoneContactId = "";
	private String staffAccountNo = "";
	private String usspStudentId = "";
	private String ussp01StudentId = "";
	private String wsnSpPersonId = "";
	private String note = "";

	public void localinit() throws DBIOEntityException {
		String table = "ministry_Rolodex";

		setMetadata("RolodexIdString","rolodexid","IDENTITY");
		setMetadata("FirstName","firstname",table);
		setMetadata("MiddleInitial","middleinitial",table);
		setMetadata("LastName","lastname",table);
		setMetadata("Address","address",table);
		setMetadata("Address2","address2",table);
		setMetadata("City","city",table);
		setMetadata("State","state",table);
		setMetadata("Zip","zip",table);
		setMetadata("Gender","gender",table);
		setMetadata("Phone","phone",table);
		setMetadata("Email","email",table);
		setMetadata("MaritalStatus","maritalstatus",table);
		setMetadata("BirthDate","birthdate",table);
		setMetadata("Campus","campus",table);
		setMetadata("Table","sourcetable",table);
		setMetadata("Key","sourcekey",table);
		setMetadata("DateInserted","dateinserted",table);
		setMetadata("CrsPersonId","crspersonid",table);
		setMetadata("EventPersonId","eventpersonid",table);
		setMetadata("SiPersonId","sipersonid",table);
		setMetadata("LinczoneContactId","linczonecontactid",table);
		setMetadata("StaffAccountNo","staffaccountno",table);
		setMetadata("UsspStudentId","usspstudentid",table);
		setMetadata("Ussp01StudentId","ussp01studentid",table);
		setMetadata("WsnSpPersonId","wsnsppersonid",table);
		setMetadata("Note","note",table);
		
		setAutodetectProperties(false);
	}

	/**
	 * @return the id of this rolodex object as an int
	 */
	public int getRolodexId() {
		return rolodexId;
	}
	/**
	 * @return the id of this rolodex object as a string
	 */
	public String getRolodexIdString() {
		return (new Integer(this.rolodexId)).toString();
	}
	/**
	 * @param the id, as an int, to set this rolodex to  
	 */	
	public void setRolodexId(int id) {
		this.rolodexId = id;
	}	
	/**
	 * @param the id, as a string, to set this rolodex to  
	 */	
	public void setRolodexIdString(String id) {
		this.rolodexId = (new Integer(id)).intValue();
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
	public String getMiddleInitial() {
		return middleInitial;
	}

	/**
	 * @param string
	 */
	public void setMiddleInitial(String string) {
		middleInitial = string;
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
	public String getAddress() {
		return address;
	}

	/**
	 * @param string
	 */
	public void setAddress(String string) {
		address = string;
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
	public String getPhone() {
		return phone;
	}

	/**
	 * @param string
	 */
	public void setPhone(String string) {
		phone = string;
	}

	/**
	 * @return
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param string
	 */
	public void setEmail(String string) {
		email = string;
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
	 * @return
	 */
	public String getBirthDateStringMMDDYYYY() {
		return new SimpleDateFormat("MM/dd/yyyy").format(birthDate).toString();
	}

	/**
	 * @param date
	 */
	public void setBirthDate(Date date) {
		birthDate = org.alt60m.util.DateUtils.clearTimeFromDate(date);
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
	public String getTable() {
		return table;
	}

	/**
	 * @param string
	 */
	public void setTable(String string) {
		table = string;
	}

	/**
	 * @return
	 */
	public String getKey() {
		return key;
	}

	/**
	 * @param string
	 */
	public void setKey(String string) {
		key = string;
	}

	/**
	 * @return
	 */
	public Date getDateInserted() {
		return dateInserted;
	}

	/**
	 * @param date
	 */
	public void setDateInserted(Date date) {
		dateInserted = org.alt60m.util.DateUtils.clearTimeFromDate(date);
	}
	/**
	 * @return
	 */
	public String getCrsPersonId() {
		return crsPersonId;
	}

	/**
	 * @param string
	 */
	public void setCrsPersonId(String string) {
		crsPersonId = string;
	}

	/**
	 * @return
	 */
	public String getEventPersonId() {
		return eventPersonId;
	}

	/**
	 * @param string
	 */
	public void setEventPersonId(String string) {
		eventPersonId = string;
	}

	/**
	 * @return
	 */
	public String getLinczoneContactId() {
		return linczoneContactId;
	}

	/**
	 * @param string
	 */
	public void setLinczoneContactId(String string) {
		linczoneContactId = string;
	}

	/**
	 * @return
	 */
	public String getSiPersonId() {
		return siPersonId;
	}

	/**
	 * @param string
	 */
	public void setSiPersonId(String string) {
		siPersonId = string;
	}

	/**
	 * @return
	 */
	public String getStaffAccountNo() {
		return staffAccountNo;
	}

	/**
	 * @param string
	 */
	public void setStaffAccountNo(String string) {
		staffAccountNo = string;
	}

	/**
	 * @return
	 */
	public String getUssp01StudentId() {
		return ussp01StudentId;
	}

	/**
	 * @param string
	 */
	public void setUssp01StudentId(String string) {
		ussp01StudentId = string;
	}

	/**
	 * @return
	 */
	public String getUsspStudentId() {
		return usspStudentId;
	}

	/**
	 * @param string
	 */
	public void setUsspStudentId(String string) {
		usspStudentId = string;
	}

	/**
	 * @return
	 */
	public String getWsnSpPersonId() {
		return wsnSpPersonId;
	}

	/**
	 * @param string
	 */
	public void setWsnSpPersonId(String string) {
		wsnSpPersonId = string;
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

}
