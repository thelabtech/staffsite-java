package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Address extends DBIOEntity {
	public static final String CURRENT_ADDRESS = "current";
	public static final String PERMANENT_ADDRESS = "permanent";
	public static final String EMERGENCY1_ADDRESS = "emergency1";
	public static final String EMERGENCY2_ADDRESS = "emergency2";
	
	/**
	 * @primary-key
	 */
    private int addressId = 0;
    
    private Date startDate = null;
    private Date endDate = null;
    private String address1 = new String();
    private String address2 = new String();
    private String address3 = new String();
    private String address4 = new String();
    private String city = new String();
    private String state = new String();
    private String zip = new String();
    private String country = new String();
    private String homePhone = new String();
    private String workPhone = new String();
    private String cellPhone = new String();
    private String fax = new String();
    private String email = new String();
    private String url = new String();
    private String contactName = new String();
    private String contactRelationship = new String();
    private String addressType = new String();
    private Date createdDate = null;
	private Date dateChanged = null;
	private String changedBy = new String();
	private String createdBy = new String();
    private int fk_PersonID = 0;
    
    //not saved (directly) to database; but used for changedBy and createdBy
    
    private String toolName = "NONE SPECIFIED";
    
    public void localinit() throws DBIOEntityException {
    	String table = "ministry_newaddress";
    	
    	setMetadata("AddressId","addressID","IDENTITY");
            
        setMetadata("StartDate","start_date",table);
        setMetadata("EndDate","end_date",table);
        setMetadata("Address1","address1",table);
        setMetadata("Address2","address2",table);
        setMetadata("Address3","address3",table);
        setMetadata("Address4","address4",table);
        setMetadata("City","city",table);
        setMetadata("State","state",table);
        setMetadata("Zip","zip",table);
        setMetadata("Country","country",table);
        setMetadata("HomePhone","homePhone",table);
        setMetadata("WorkPhone","workPhone",table);
        setMetadata("CellPhone","cellPhone",table);
        setMetadata("Fax","fax",table);
        setMetadata("Email","email",table);
        setMetadata("Url","url",table);
        setMetadata("ContactName","contactName",table);
        setMetadata("ContactRelationship","contactRelationship",table);
        setMetadata("AddressType","addressType",table);
		setMetadata("DateCreated", "dateCreated", table);
		setMetadata("DateChanged", "dateChanged", table);
		setMetadata("ChangedBy","changedBy",table);
		setMetadata("CreatedBy","createdBy",table);
        setMetadata("Fk_PersonID","fk_PersonID",table);
 
		setAutodetectProperties(false);
	}
        
    public boolean isPKEmpty() {
    	return addressId == 0;
    }
    
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
    
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}
	
	public Address(int id) {
		addressId = id;
		select();
	}
	public Address() {}
    
	public void setToolName(String toolName) {
		this.toolName = toolName; 
	}
	
    public Date getStartDate() { return startDate; }
	public void setStartDate(Date startDate) { this.startDate = startDate; }
		    
	public Date getEndDate() { return endDate; }
	public void setEndDate(Date endDate) { this.endDate = endDate; }
	
	public String getAddress1() { return address1; }
	public void setAddress1(String address1) { this.address1 = address1; }
	
	public String getAddress2() { return address2; }
	public void setAddress2(String address2) { this.address2 = address2; }
	
	public String getAddress3() { return address3; }
	public void setAddress3(String address3) { this.address3 = address3; }
	
	public String getAddress4() { return address4; }
	public void setAddress4(String address4) { this.address4 = address4; }
	
	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }
	
	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	
	public String getZip() { return zip; }
	public void setZip(String zip) { this.zip = zip; }
	
	public String getCountry() { return country; }
	public void setCountry(String country) { this.country = country; }
	/**
	 * @return Returns the addressId.
	 */
	public int getAddressId() {
		return addressId;
	}
	/**
	 * @param addressId The addressId to set.
	 */
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	/**
	 * @return Returns the addressType.
	 */
	public String getAddressType() {
		return addressType;
	}
	/**
	 * @param addressType The addressType to set.
	 */
	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}
	/**
	 * @return Returns the cellPhone.
	 */
	public String getCellPhone() {
		return cellPhone;
	}
	/**
	 * @param cellPhone The cellPhone to set.
	 */
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	/**
	 * @return Returns the email.
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email The email to set.
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return Returns the fax.
	 */
	public String getFax() {
		return fax;
	}
	/**
	 * @param fax The fax to set.
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}
	/**
	 * @return Returns the fk_PersonID.
	 */
	public int getFk_PersonID() {
		return fk_PersonID;
	}
	/**
	 * @param fk_PersonID The fk_PersonID to set.
	 */
	public void setFk_PersonID(int fk_PersonID) {
		this.fk_PersonID = fk_PersonID;
	}
	public void setFk_PersonID(String fk_PersonID) {
		this.fk_PersonID = Integer.parseInt(fk_PersonID);
	}
	/**
	 * @return Returns the homePhone.
	 */
	public String getHomePhone() {
		return homePhone;
	}
	/**
	 * @param homePhone The homePhone to set.
	 */
	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}
	/**
	 * @return Returns the url.
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * @param url The url to set.
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * @return Returns the workPhone.
	 */
	public String getWorkPhone() {
		return workPhone;
	}
	/**
	 * @param workPhone The workPhone to set.
	 */
	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}
	/**
	 * @return Returns the contactName.
	 */
	public String getContactName() {
		return contactName;
	}
	/**
	 * @param contactName The contactName to set.
	 */
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	/**
	 * @return Returns the contactRelationship.
	 */
	public String getContactRelationship() {
		return contactRelationship;
	}
	/**
	 * @param contactRelationship The contactRelationship to set.
	 */
	public void setContactRelationship(String contactRelationship) {
		this.contactRelationship = contactRelationship;
	}

	/**
	 * @return Returns the createdDate.
	 */
	public Date getDateCreated() {
		return this.createdDate;
	}

	/**
	 * @param createdDate
	 *            The createdDate to set.
	 */
	public void setDateCreated(Date createdDate) {
		this.createdDate = createdDate;
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
	 * @return Returns the createdBy.
	 */
	public String getCreatedBy() {
		return createdBy;
	}

	/**
	 * @param createdBy
	 *            The createdBy to set.
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

}
