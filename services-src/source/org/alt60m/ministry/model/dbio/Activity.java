package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Activity extends DBIOEntity{

	public Activity(String id) {
		activityId = id;
		select();
	}
	public Activity() {}

    class Status {
		public static final String ACTIVE = "AC";
		public static final String INACTIVE = "IN";
		public static final String KEYCONTACT= "KE";
		public static final String LAUNCHED = "LA";
		public static final String PIONEERING = "PI";
		public static final String TRANSFORMATIONAL = "TR";
		public static final String FORERUNNER = "FR";
    }

	//IDENTITY
    private String activityId = "";

	//KEY
    private String fk_localLevelId = new String();
    private String fk_targetAreaId = new String();

    private String status = "";
    private Date periodEnd = null;
    private Date periodBegin = null;
    private String strategy = "";
    private String transUsername = "";

	public boolean isPKEmpty() {
		return activityId.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_Activity";

		setMetadata("ActivityId","ActivityID","IDENTITY");

		setMetadata("LocalLevelId","fk_teamID",table);
		setMetadata("TargetAreaId","fk_targetAreaID",table);

		setMetadata("Status","status",table);
		setMetadata("PeriodBegin","periodBegin",table);
		setMetadata("PeriodEnd","periodEnd",table);
		setMetadata("Strategy","strategy",table);
		setMetadata("TransUsername","transUsername",table);

		setAutodetectProperties(false);
	}

	public String getStatusFullName() {
		if (status.equalsIgnoreCase(Status.ACTIVE)) return "Active";
		if (status.equalsIgnoreCase(Status.INACTIVE)) return "Inactive";
		if (status.equalsIgnoreCase(Status.KEYCONTACT)) return "Key Contact";
		if (status.equalsIgnoreCase(Status.LAUNCHED)) return "Launched";
		if (status.equalsIgnoreCase(Status.PIONEERING)) return "Pioneering";
		if (status.equalsIgnoreCase(Status.TRANSFORMATIONAL)) return "Transformational";
		if (status.equalsIgnoreCase(Status.FORERUNNER)) return "Forerunner";
        return "Unknown";
    }

    public String getActivityId() { return activityId; }
    public void setActivityId(String activityId) { this.activityId = activityId; }
	
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }

	public boolean isActive() { return (!Status.INACTIVE.equalsIgnoreCase(this.status)); }
        
	public Date getPeriodEnd() { return periodEnd; }
	public void setPeriodEnd(Date periodEnd) { this.periodEnd = org.alt60m.util.DateUtils.clearTimeFromDate(periodEnd); }

	public Date getPeriodBegin() { return periodBegin; }
	public void setPeriodBegin(Date periodBegin) { this.periodBegin = org.alt60m.util.DateUtils.clearTimeFromDate(periodBegin); }
        
	public void setPeriodEndString(String periodEnd) { this.periodEnd = new Date(periodEnd); }
	public void setPeriodBeginString(String periodBegin) { this.periodBegin = new Date(periodBegin); }

	public String getStrategy() { return strategy; }
	public void setStrategy(String strategy) { this.strategy = strategy; }

	public String getStrategyFullName() { return org.alt60m.ministry.Strategies.expandStrategy(getStrategy()); }

	public String getTransUsername() { return transUsername; }
	public void setTransUsername(String transUsername) { this.transUsername = transUsername; }

	public String getTargetAreaId() { return fk_targetAreaId; }
	public void setTargetAreaId(String targetAreaId) {	this.fk_targetAreaId = targetAreaId; }
	public TargetArea getTargetArea() { return new TargetArea(fk_targetAreaId); }
	public void setTargetArea(TargetArea targetArea){ this.fk_targetAreaId = targetArea.getTargetAreaId(); }

	public String getLocalLevelId() { return fk_localLevelId; }
	public void setLocalLevelId(String localLevelId) {	this.fk_localLevelId = localLevelId; }
	public LocalLevel getLocalLevel() { return new LocalLevel(fk_localLevelId); }
	public LocalLevel getTeam() { return getLocalLevel(); }
	public void setLocalLevel(LocalLevel localLevel){ this.fk_localLevelId = localLevel.getLocalLevelId(); }
	public void setTeam(LocalLevel localLevel){ setLocalLevel(localLevel); }
	
	public Vector getStatistics() {
		Statistic s = new Statistic();
		s.setActivityId(this.activityId);
		return s.selectList();
	}
	public Vector getStatistics(String orderField, boolean DESC) {
		Statistic s = new Statistic();
		return s.selectList("fk_Activity = '" + this.activityId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocStatistic(Statistic s) {
		s.setActivityId(this.activityId);
		s.update();
	}
	public void dissocStatistic(Statistic s) {
		s.setActivityId("");
		s.update();
	}

    public Vector getActivityContacts() {
		Staff s = new Staff();
		String table = "ministry_viewActivityContacts";
		s.changeTargetTable(table);
		return s.selectList("ActivityID = '" + this.activityId + "'");
	}
    public Vector getActivityContacts(String orderField, boolean DESC) {
		Staff s = new Staff();
		String table = "ministry_viewActivityContacts";
		s.changeTargetTable(table);
		return s.selectList("ActivityID = '" + this.activityId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocContact(Staff s) {
		ActivityContact ac = new ActivityContact();
		ac.setActivityId(this.activityId);
		ac.setAccountNo(s.getAccountNo());
		ac.insert();
	}
	public void dissocContact(Staff s) {
		ActivityContact ac = new ActivityContact();
		ac.setActivityId(this.activityId);
		ac.setAccountNo(s.getAccountNo());
		ac.delete();
	}
	public void addActivityContacts(Staff s) {
		assocContact(s);
	}
	
        
        public void getFieldvalue() { }  public String getFieldvalue(String foo) { return ""; }
        public void getHeaderName() { }  public String getHeaderName(String foo) { return ""; }
        public void getColumnName() { }  public String getColumnName(String foo) { return ""; }
}