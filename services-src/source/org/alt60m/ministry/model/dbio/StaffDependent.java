package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class StaffDependent extends DBIOEntity {

	private String fk_dependentId = new String();
	private String fk_accountNo = new String();
	
	public StaffDependent() {}
	
	public boolean isPKEmpty() {
		return fk_dependentId.equals("") && fk_accountNo.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_assoc_dependents";
		setMetadata("AccountNo","accountNo",table);
		setMetadata("DependentId","DependentID",table);
		setMetadata("DbioDummy","dbioDummy",table);
		setAutodetectProperties(false);
	}
	private boolean dbioDummy = true;
	public boolean getDbioDummy(){return this.dbioDummy;}
	public void setDbioDummy(boolean dbioDummy){this.dbioDummy = dbioDummy;}

	public String getDependentId() { return fk_dependentId; }
	public void setDependentId(String fk_DependentId) { this.fk_dependentId = fk_DependentId; }
	public Dependent getDependent() { return new Dependent(this.fk_dependentId); }
	public void setDependent(Dependent a) { this.fk_dependentId = a.getDependentId(); }

	public String getAccountNo() { return fk_accountNo; }
	public void setAccountNo(String fk_AccountNo) { this.fk_accountNo = fk_AccountNo; }
	public Staff getStaff(){ return new Staff(this.fk_accountNo); }
	public void setStaff(Staff s){ this.fk_accountNo = s.getAccountNo(); }
}