package org.alt60m.ministry.model.dbio;

import java.util.Date;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;


public class StaffSnapshot extends DBIOEntity {

//identity
	
	private int snapshotID = 0;
	
	private String accountNo = "";
	
	// NAME
	private String firstName = "";
    private String middleName = "";
    private String lastName = "";
    
    // CONTACT
    private String addressType = "";
    private String address1 = "";
    private String address2 = "";
    private String city = "";
    private String state = "";
    private String zip = "";
    private String country = "";
    private String intAddress = "";
    
    private String workPhone = "";
    private String mobilePhone = "";
    

    // JOB
    private String ministry = "";
    private String department = "";
    private String subMinistry = "";
    private String position = "";
    private String positionDescr = "";
    private String strategy = "";
    private String intStatus = "";
    private String intRole = "";
    private String role = "";
    
    // FAMILY
    private String maritalStatus = "";
    
    private String spouseFirstName = "";
    private String spouseMiddleName = "";
    private String spouseLastName = "";
    
    private int numChildren=0;
    
    private Date dateChanged = null;
    
 
    
    
	public StaffSnapshot(String id) {
		accountNo = id;
		select();
	}
	public StaffSnapshot() {}

	public boolean isPKEmpty() {
		return  snapshotID==0;
	}

	public boolean insert() {
		setDateChanged(new Date());
		return super.insert();
	}
	public boolean update() {
		setDateChanged(new Date());
		return super.update();
	}
	
	public boolean persist(){
		select();
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_staffSnapshot";

		setMetadata("SnapshotID","snapshotID","IDENTITY");
		
		setMetadata("AccountNo","accountNo",table);
		
		setMetadata("FirstName","firstName",table);
		setMetadata("MiddleName","middleName",table);
		setMetadata("LastName","lastName",table);
		
		setMetadata("AddressType","addressType",table);
        setMetadata("Address1","address1",table);
        setMetadata("Address2","address2",table);
        setMetadata("City","city",table);
        setMetadata("State","state",table);
        setMetadata("Zip","zip",table);
        setMetadata("Country","country",table);
        setMetadata("IntAddress","intAddress",table);
        
        setMetadata("WorkPhone","workPhone",table);
		setMetadata("MobilePhone","mobilePhone",table);
		
		setMetadata("Ministry","ministry",table);
		setMetadata("Department","department",table);
		setMetadata("SubMinistry","subMinistry",table);
		setMetadata("Position","position",table);
		setMetadata("PositionDescr","positionDescr",table);
		setMetadata("Strategy","strategy",table);
		setMetadata("IntStatus","intStatus",table);
		setMetadata("IntRole","intRole",table);
		setMetadata("Role","role",table);
		
		
		setMetadata("MaritalStatus","isMarried",table);
		
		setMetadata("SpouseFirstName","spouseFirstName",table);
		setMetadata("SpouseMiddleName","spouseMiddleName",table);
		setMetadata("SpouseLastName","spouseLastName",table);
		
		setMetadata("NumChildren","numChildren",table);
		
		setMetadata("DateChanged","dateChanged",table);
		
		setAutodetectProperties(false);
	}
	public int getSnapshotID() { return snapshotID; }
	public void setSnapshotID(int surferID) { this.snapshotID = snapshotID; }	

	public String getAccountNo() { return accountNo; }
	public void setAccountNo(String accountNo) { this.accountNo = accountNo; }	

	// NAME
	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName){ this.firstName = firstName; }

	public String getMiddleName() { return middleName; }
	public void setMiddleName(String middleName) { this.middleName = middleName; }
	
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }
	
	// CONTACT
	public String getAddressType() { return addressType; }
	public void setAddressType(String addressType) { this.addressType = addressType; }

	public String getAddress1() { return address1; }
	public void setAddress1(String address1) { this.address1 = address1; }
	
	public String getAddress2() { return address2; }
	public void setAddress2(String address2) { this.address2 = address2; }
	
	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }

	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	
	public String getZip() { return zip; }
	public void setZip(String zip) { this.zip = zip; }
	
	public String getCountry() { return country; }
	public void setCountry(String country) { this.country = country; }

	public String getIntAddress() { return intAddress; }
	public void setIntAddress(String intAddress) { this.intAddress = intAddress; }
	
	
	
	public String getWorkPhone() { return workPhone; }
	public void setWorkPhone(String workPhone) { this.workPhone = workPhone; }
	
	public String getMobilePhone() { return mobilePhone; }
	public void setMobilePhone(String mobilePhone) { this.mobilePhone = mobilePhone; }

	
	// JOB
	public String getMinistry() { return ministry; }
	public void setMinistry(String ministry) { this.ministry = ministry; }
	
	public String getDepartment() { return department; }
	public void setDepartment(String department) { this.department = department; }
	
	public String getSubMinistry() { return subMinistry; }
	public void setSubMinistry(String subMinistry) { this.subMinistry = subMinistry; }
	
	public String getPosition() { return position; }
	public void setPosition(String position) { this.position = position; }
	
	public String getPositionDescr() { return positionDescr; }
	public void setPositionDescr(String positionDescr) { this.positionDescr = positionDescr; }
	
	public String getStrategy() { return strategy; }
	public void setStrategy(String strategy) { this.strategy = strategy; }

	public String getRole() { return role; }
	public void setRole(String role) { this.role = role; }
	
	public String getIntStatus() { return intStatus; }
	public void setIntStatus(String intStatus) { this.intStatus = intStatus; }

	public String getIntRole() { return intRole; }
	public void setIntRole(String intRole) { this.intRole = intRole; }

	
	// FAMILY
	public String getMaritalStatus() { return maritalStatus; }
	public void setMaritalStatus(String maritalStatus) { this.maritalStatus = maritalStatus; }
	
	public String getSpouseFirstName() { return spouseFirstName; }
	public void setSpouseFirstName(String spouseFirstName) { this.spouseFirstName = spouseFirstName; }
	
	public String getSpouseMiddleName() { return spouseMiddleName; }
	public void setSpouseMiddleName(String spouseMiddleName) { this.spouseMiddleName = spouseMiddleName; }
	
	public String getSpouseLastName() { return spouseLastName; }
	public void setSpouseLastName(String spouseLastName) { this.spouseLastName = spouseLastName; }
	
	public int getNumChildren() { return numChildren; }
	public void setNumChildren(int numChildren) { this.numChildren = numChildren; }
	
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
	
}