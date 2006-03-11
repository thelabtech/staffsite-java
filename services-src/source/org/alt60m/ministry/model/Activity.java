/* Generated by Together */

package org.alt60m.ministry.model;

import java.util.*;

/**
 * @rdbPhysicalName Activity
 * @rdbPhysicalPrimaryKeyName PK_Activity
 * @persistent
 * @table ministry_Activity
 * @key-generator UUID
 * @cache-type none
 * @access shared
 */
public class Activity {

    class Status {
		public static final String ACTIVE = "AC";
		public static final String INACTIVE = "IN";
		public static final String KEYCONTACT= "KE";
		public static final String LAUNCHED = "LA";
		public static final String PIONEERING = "PI";
		public static final String TRANSFORMATIONAL = "TR";
    }


    private String status = new String();
    private Date periodEnd;
    private String strategy = new String();
    private String transUsername = new String();

	public String getStatusFullName() {
		if (status.equalsIgnoreCase(Status.ACTIVE)) return "Active";
		if (status.equalsIgnoreCase(Status.INACTIVE)) return "Inactive";
		if (status.equalsIgnoreCase(Status.KEYCONTACT)) return "Key Contact";
		if (status.equalsIgnoreCase(Status.LAUNCHED)) return "Launched";
		if (status.equalsIgnoreCase(Status.PIONEERING)) return "Pioneering";
		if (status.equalsIgnoreCase(Status.TRANSFORMATIONAL)) return "Transformational";
        return "Unknown";
    }
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status; 
	}
    public boolean isActive() {
		return (!Status.INACTIVE.equalsIgnoreCase(this.status));
    }
	public Date getPeriodEnd() {
		return periodEnd; 
	}
	public void setPeriodEnd(Date periodEnd) {
	    if (periodEnd != null) {
		Calendar cin = Calendar.getInstance();
		Calendar cout = Calendar.getInstance();
		cin.setTime(periodEnd);
		cout.clear();
		cout.set(cin.get(Calendar.YEAR), cin.get(Calendar.MONTH), cin.get(Calendar.DATE));
		this.periodEnd = cout.getTime();
	    } else {
		this.periodEnd = periodEnd;
	    }	    
	}

    public String getStrategyFullName() {
		return org.alt60m.ministry.Strategies.expandStrategy(getStrategy());
    }
	public String getStrategy() {
		return strategy; 
	}
	public void setStrategy(String strategy) {
		this.strategy = strategy; 
	}
	public String getTransUsername() {
		return transUsername; 
	}
	public void setTransUsername(String transUsername) {
		this.transUsername = transUsername; 
	}
	public TargetArea getTargetArea() {
		return targetArea; 
	}
	public void setTargetArea(TargetArea targetArea) {
		this.targetArea = targetArea;
 	}

	public Date getPeriodBegin() {
		return periodBegin; 
	}
	public void setPeriodBegin(Date periodBegin) {
	    if (periodBegin != null) {
		Calendar cin = Calendar.getInstance();
		Calendar cout = Calendar.getInstance();
		cin.setTime(periodBegin);
		cout.clear();
		cout.set(cin.get(Calendar.YEAR), cin.get(Calendar.MONTH), cin.get(Calendar.DATE));
		this.periodBegin = cout.getTime();
	    } else {
		this.periodBegin = periodBegin;
	    }	    
	}

    public String getActivityID(){
            return activityID;
        }

    public void setActivityID(String activityID){
            this.activityID = activityID;
        }


    public Collection getActivityContacts(){
            return activityContacts;
        }

	public void addActivityContacts(Staff contact) {
		activityContacts.add(contact);
    }
	public void removeActivityContact(Staff contact) {
		this.activityContacts.remove(contact);
    }
	public void setActivityContacts(Collection contacts) {
		this.activityContacts = contacts;
	}

    public LocalLevel getTeam(){
            return team;
        }

	public void setTeam(LocalLevel team){
    	this.team = team;
	}

    /**
     * @clientCardinality 0..n
     * @clientRole activities
     * @supplierCardinality 0..1
     * @supplierRole targetArea
     * @label hasActivity 
     * @bidirectional <{Logical_View.org.alt60m.ministry.ejb.TargetArea#doesActivity}>
     * @sql-name fk_targetAreaID
	 */
    private TargetArea targetArea;

    /**
     * @associates <{org.alt60m.ministry.model.Staff}>
     * @field-type org.alt60m.ministry.model.Staff
     * @many-table ministry_assocActivityStaff
     * @sql-name fk_accountNo
     * @many-key fk_activityID
     */
    private Collection activityContacts = new Vector();

    /**
    * @sql-name fk_teamID
    */
    private LocalLevel team;

    private Date periodBegin;
	/**
	 * @primary-key
	 */
    private String activityID = new String();
}
