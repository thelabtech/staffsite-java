package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Dependent extends DBIOEntity {
	
	public Dependent(String id) {
		dependentId = id;
		select();
	}
	public Dependent() { }
	
    private String dependentId = new String();
    
    private String firstName = new String();
    private String middleName = new String();
    private String lastName = new String();
    private Date birthDate;
    private String gender = new String();
    
    public boolean isPKEmpty() {
    	return dependentId.equals("");
    }
    public boolean persist() {
    	return isPKEmpty() ? insert() : update();
    }
    
    public void localinit() throws DBIOEntityException {
    	String table = "ministry_dependent";
    	
    	setMetadata("DependentId","DependentID","IDENTITY");
    	
    	setMetadata("FirstName","firstName",table);
    	setMetadata("MiddleName","middleName",table);
    	setMetadata("LastName","lastName",table);
    	setMetadata("BirthDate","birthdate",table);
    	setMetadata("Gender","gender",table);
    	
    	setAutodetectProperties(false);
    }
    
	public String getDependentId(){ return dependentId; }
	public void setDependentId(String dependentId){ this.dependentId = dependentId; }    

	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName) { this.firstName = firstName; }
	
	public String getMiddleName() { return middleName; }
	public void setMiddleName(String middleName) { this.middleName = middleName; }
	
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }
	
	public Date getBirthDate() { return birthDate; }
	public void setBirthDate(Date birthDate) { this.birthDate = org.alt60m.util.DateUtils.clearTimeFromDate(birthDate); }
	
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }

    public Vector getStaff() {
    	Staff s = new Staff();
    	String table = "ministry_viewdependentsstaff";
    	s.changeTargetTable(table);
    	return s.selectList("DependentID = '" + this.dependentId + "'");
    }    
    public Vector getStaff(String orderField, boolean DESC) {
		Staff s = new Staff();
		String table = "ministry_viewdependentsstaff";
		s.changeTargetTable(table);
		return s.selectList("DependentID = '" + this.dependentId + "' ORDER BY "
				+ orderField + " " + (DESC ? "DESC" : "ASC"));
    }    
	public void assocStaff(Staff s) {
		StaffDependent sd = new StaffDependent();
		sd.setDependentId(this.dependentId);
		sd.setAccountNo(s.getAccountNo());
		sd.insert();
	}    
	public void dissocStaff(Staff s) {
		StaffDependent sd = new StaffDependent();
		sd.setDependentId(this.dependentId);
		sd.setAccountNo(s.getAccountNo());
		sd.delete();
	}
	public void assocStaffId(String id) {
		StaffDependent sd = new StaffDependent();
		sd.setDependentId(this.dependentId);
		sd.setAccountNo(id);
		sd.insert();
	}    
	public void dissocStaffId(String id) {
		StaffDependent sd = new StaffDependent();
		sd.setDependentId(this.dependentId);
		sd.setAccountNo(id);
		sd.delete();
	}
    
}
