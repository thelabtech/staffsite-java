package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class NonCccMin extends DBIOEntity {
	
	public NonCccMin(String id) {
		nonCccMinId = id;
		select();
	}
	public NonCccMin() { }
	
    private String nonCccMinId = new String();

    private String ministry = new String();
    private String firstName = new String();
    private String lastName = new String();
    private String address1 = new String();
    private String address2 = new String();
    private String city = new String();
    private String state = new String();
    private String zip = new String();
    private String country = new String();
    private String homePhone = new String();
    private String workPhone = new String();
    private String mobilePhone = new String();
    private String email = new String();
    private String url = new String();
    private String pager = new String();
    private String fax = new String();
    private String note = new String();
    
    public boolean isPKEmpty() { return nonCccMinId.equals(""); }
    public boolean persist() { return isPKEmpty() ? insert() : update(); }
    
    public void localinit() throws DBIOEntityException {
    	String table = "ministry_NonCccMin";
    	
    	setMetadata("NonCccMinId","NonCccMinID","IDENTITY");
    	
    	setMetadata("Ministry","ministry",table);
    	setMetadata("FirstName","firstName",table);
    	setMetadata("LastName","lastName",table);
    	setMetadata("Address1","address1",table);
    	setMetadata("Address2","address2",table);
    	setMetadata("City","city",table);
    	setMetadata("State","state",table);
    	setMetadata("Zip","zip",table);
    	setMetadata("Country","country",table);
    	setMetadata("HomePhone","homePhone",table);
    	setMetadata("WorkPhone","workPhone",table);
    	setMetadata("MobilePhone","mobilePhone",table);
    	setMetadata("Email","email",table);
    	setMetadata("Url","url",table);
    	setMetadata("Pager","pager",table);
    	setMetadata("Fax","fax",table);
    	setMetadata("Note","note",table);
    	
    	setAutodetectProperties(false);
    }
    
	public String getMinistry() { return ministry; }
	public void setMinistry(String ministry) { this.ministry = ministry; }
	
	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName) { this.firstName = firstName; }
	
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }
	
	public String getAddress1() { return address1; }
	public void setAddress1(String address1) { this.address1 = address1; }
	
	public String getAddress2() { return address2;  }
	public void setAddress2(String address2) { this.address2 = address2; }
	
	public String getCity() { return city;  }
	public void setCity(String city) { this.city = city;  }
	
	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	
	public String getZip() { return zip;  }
	public void setZip(String zip) { this.zip = zip; }
	
	public String getCountry() { return country; }
	public void setCountry(String country) { this.country = country; }
	
	public String getHomePhone() { return homePhone; }
	public void setHomePhone(String homePhone) { this.homePhone = homePhone; }
	
	public String getWorkPhone() { return workPhone; }
	public void setWorkPhone(String workPhone) { this.workPhone = workPhone; }
	
	public String getMobilePhone() { return mobilePhone; }
	public void setMobilePhone(String mobilePhone) { this.mobilePhone = mobilePhone; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getUrl() { return url;  }
	public void setUrl(String url) { this.url = url;  }
	
	public String getPager() { return pager;  }
	public void setPager(String pager) { this.pager = pager; }
	
	public String getFax() { return fax;  }
	public void setFax(String fax) { this.fax = fax; }
	
	public String getNote() { return note; }
	public void setNote(String note) { this.note = note; }

    public String getNonCccMinId(){ return nonCccMinId;  }
    public void setNonCccMinId(String nonCccMinId){ this.nonCccMinId = nonCccMinId; }
    
    public Vector getNonCccMinContacts() {
    	TargetArea ta = new TargetArea();
    	String table = "ministry_viewNonCccMinTargetArea";
    	ta.changeTargetTable(table);
    	return ta.selectList("NonCccMinID = '" + this.nonCccMinId + "'");
    }    
	public Vector getNonCccMinContacts(String orderField, boolean DESC) {
		TargetArea ta = new TargetArea();
		String table = "ministry_viewNonCccMinTargetArea";
		ta.changeTargetTable(table);
		return ta.selectList("NonCccMinID = '" + this.nonCccMinId + "' ORDER BY "
				+ orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public Vector getOtherMinistries() {
		return getNonCccMinContacts();
	}
	
	public void assocTargetArea(TargetArea ta) {
		NonCccMinContact ncc = new NonCccMinContact();
		ncc.setNonCccMinId(this.nonCccMinId);
		ncc.setTargetAreaId(ta.getTargetAreaId());
		ncc.insert();
	}
	public void dissocTargetArea(TargetArea ta) {
		NonCccMinContact ncc = new NonCccMinContact();
		ncc.setNonCccMinId(this.nonCccMinId);
		ncc.setTargetAreaId(ta.getTargetAreaId());
		ncc.delete();
	}
	public void addOtherMinistry(TargetArea ta) {
		assocTargetArea(ta);
	}
	public void removeOtherMinistry(TargetArea ta) {
		dissocTargetArea(ta);
	}
        
        public void getFieldvalue() { }  public String getFieldvalue(String foo) { return ""; }
        public void getHeaderName() { }  public String getHeaderName(String foo) { return ""; }
        public void getColumnName() { }  public String getColumnName(String foo) { return ""; }
}