package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class ActivityContact extends DBIOEntity {

	private String fk_activityId = new String();
	private String fk_accountNo = new String();
	private boolean dbioDummy = true;

	public ActivityContact() {}

	public boolean isPKEmpty() {
		return fk_activityId.equals("") && fk_accountNo.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_assoc_activitycontact";
		setMetadata("AccountNo","accountNo","KEY");
		setMetadata("ActivityId","ActivityID","KEY");
		setMetadata("DbioDummy","dbioDummy",table);
		setAutodetectProperties(false);
	}

	public boolean getDbioDummy(){return this.dbioDummy;}
	public void setDbioDummy(boolean dbioDummy){this.dbioDummy = dbioDummy;}

	public String getActivityId() { return fk_activityId; }
	public void setActivityId(String fk_activityId) { this.fk_activityId = fk_activityId; }
	public Activity getActivity() { return new Activity(this.fk_activityId); }
	public void setActivity(Activity a) { this.fk_activityId = a.getActivityId(); }

	public String getAccountNo() { return fk_accountNo; }
	public void setAccountNo(String fk_accountNo) { this.fk_accountNo = fk_accountNo; }
	public Staff getStaff(){ return new Staff(this.fk_accountNo); }
	public void setStaff(Staff s){ this.fk_accountNo = s.getAccountNo(); }
}