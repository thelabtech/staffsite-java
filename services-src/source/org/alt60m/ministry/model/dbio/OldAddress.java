package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class OldAddress extends DBIOEntity {
	/**
	 * @primary-key
	 */
    private String addressId = new String();
    
    private Date startDate;
    private Date endDate;
    private String address1 = new String();
    private String address2 = new String();
    private String address3 = new String();
    private String address4 = new String();
    private String city = new String();
    private String state = new String();
    private String zip = new String();
    private String country = new String();
    
    public void localinit() throws DBIOEntityException {
    	String table = "ministry_Address";
    	
    	setMetadata("AddressId","AddressID","IDENTITY");
            
        setMetadata("StartDate","startdate",table);
        setMetadata("EndDate","enddate",table);
        setMetadata("Address1","address1",table);
        setMetadata("Address2","address2",table);
        setMetadata("Address3","address3",table);
        setMetadata("Address4","address4",table);
        setMetadata("City","city",table);
        setMetadata("State","state",table);
        setMetadata("Zip","zip",table);
        setMetadata("Country","country",table);
 
		setAutodetectProperties(false);
	}
        
    public boolean isPKEmpty() {
    	return addressId.equals("");
    }
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}
	
	public OldAddress(String id) {
		addressId = id;
		select();
	}
	public OldAddress() {}
    
	public String getAddressId(){ return addressId; }
	public void setAddressId(String addressId){ this.addressId = addressId; }
    
    public Date getStartDate() { return startDate; }
	public void setStartDate(Date startDate) { this.startDate = org.alt60m.util.DateUtils.clearTimeFromDate(startDate); }
		    
	public Date getEndDate() { return endDate; }
	public void setEndDate(Date endDate) { this.endDate = org.alt60m.util.DateUtils.clearTimeFromDate(endDate); }
	
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
}
