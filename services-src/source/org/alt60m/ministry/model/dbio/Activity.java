package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.alt60m.ministry.Strategy;
import org.alt60m.ministry.Status;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Activity extends DBIOEntity {

	static SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

	public Activity(String id) {
		activityId = id;
		select();
	}

	public Activity() {
	}

	// IDENTITY
	private String activityId = "";

	// KEY
	private String fk_localLevelId = new String();

	private String fk_targetAreaId = new String();

	private Status status;

	private Strategy strategy;

	private String transUsername = "";
	
//	private Status statusHistory;
	
	private String url = "";

	private String facebook = "";
	
	private static Log log = LogFactory.getLog(Activity.class);

	public boolean isPKEmpty() {
		return activityId.equals("");
	}

	public boolean persist() {
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_activity";

		setMetadata("ActivityId", "ActivityID", "IDENTITY");
		setMetadata("LocalLevelId", "fk_teamID", table);
		setMetadata("TargetAreaId", "fk_targetAreaID", table);
		setMetadata("Status", "status", table);
		setMetadata("Strategy", "strategy", table);
		setMetadata("TransUsername", "transUsername", table);
		setMetadata("Url", "url", table);
		setMetadata("Facebook", "facebook", table);

		setAutodetectProperties(false);
	}

	public String getStatusFullName() {
		return status.getName();
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getStatus() {
		if (status == null) {
			return null;
		}
		return status.toString();
	}

	public void setStatus(String status) {
		this.status = Status.valueOf(status);
	}

	public boolean isActive() {
		return (Status.IN != status);
	}


	public String getStrategy() {
		if (strategy == null) {
			return null;
		}
		return strategy.toString();
	}

	public void setStrategy(String strategy) {
		if (strategy != null && !strategy.equals("")) {	
			this.strategy = Strategy.valueOf(strategy);
		}
	}

	public String getStrategyFullName() {
		return org.alt60m.ministry.Strategy.expandStrategy(getStrategy());
	}

	public String getTransUsername() {
		return transUsername;
	}

	public void setTransUsername(String transUsername) {
		this.transUsername = transUsername;
	}

	public String getTargetAreaId() {
		return fk_targetAreaId;
	}

	public void setTargetAreaId(String targetAreaId) {
		this.fk_targetAreaId = targetAreaId;
	}

	public TargetArea getTargetArea() {
		return new TargetArea(fk_targetAreaId);
	}

	public void setTargetArea(TargetArea targetArea) {
		this.fk_targetAreaId = targetArea.getTargetAreaId();
	}

	public String getLocalLevelId() {
		return fk_localLevelId;
	}

	public void setLocalLevelId(String localLevelId) {
		this.fk_localLevelId = localLevelId;
	}

	public LocalLevel getLocalLevel() {
		return new LocalLevel(fk_localLevelId);
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	

	public LocalLevel getTeam() {
		return getLocalLevel();
	}

	public void setLocalLevel(LocalLevel localLevel) {
		this.fk_localLevelId = localLevel.getLocalLevelId();
	}

	public void setTeam(LocalLevel localLevel) {
		setLocalLevel(localLevel);
	}

	public Vector getStatistics() {
		Statistic s = new Statistic();
		s.setActivityId(this.activityId);
		return s.selectList();
	}

	public Vector getStatistics(String orderField, boolean DESC) {
		Statistic s = new Statistic();
		return s.selectList("fk_Activity = '" + this.activityId + "' ORDER BY "
				+ orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocStatistic(Statistic s) {
		s.setActivityId(this.activityId);
		s.update();
	}

	public void dissocStatistic(Statistic s) {
		s.setActivityId("");
		s.update();
	}

	@SuppressWarnings("unchecked")
	public Vector<Staff> getActivityContacts() {
		Staff s = new Staff();
		String table = "ministry_viewactivitycontacts";
		s.changeTargetTable(table);
		return s.selectList("ActivityID = '" + this.activityId + "'");
	}

	public Vector getActivityContacts(String orderField, boolean DESC) {
		Staff s = new Staff();
		String table = "ministry_viewactivitycontacts";
		s.changeTargetTable(table);
		return s.selectList("ActivityID = '" + this.activityId + "' ORDER BY "
				+ orderField + " " + (DESC ? "DESC" : "ASC"));
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

	public void getFieldvalue() {
	}

	public String getFieldvalue(String foo) {
		return "";
	}

	public void getHeaderName() {
	}

	public String getHeaderName(String foo) {
		return "";
	}

	public void getColumnName() {
	}

	public String getColumnName(String foo) {
		return "";
	}
}