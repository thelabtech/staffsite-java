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

	private Date periodEnd = null;

	private Date periodBegin = null;

	private Strategy strategy;

	private String transUsername = "";
	
	private Status statusHistory;

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
		setMetadata("PeriodBegin", "periodBegin", table);
		setMetadata("PeriodEnd", "periodEnd", table);
		setMetadata("Strategy", "strategy", table);
		setMetadata("TransUsername", "transUsername", table);
		setMetadata("StatusHistory", "statusHistory", table);

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

	public Date getPeriodEnd() {
		return periodEnd;
	}

	public void setPeriodEnd(Date periodEnd) {
		this.periodEnd = org.alt60m.util.DateUtils.clearTimeFromDate(periodEnd);
	}

	public Date getPeriodBegin() {
		return periodBegin;
	}

	public void setPeriodBegin(Date periodBegin) {
		this.periodBegin = org.alt60m.util.DateUtils
				.clearTimeFromDate(periodBegin);
	}

	public void setPeriodEndString(String periodEnd) {
		try {
			this.periodEnd = dateFormat.parse(periodEnd);
		} catch (ParseException e) {
			log.error(e, e);
		}
	}

	public void setPeriodBeginString(String periodBegin) {
		try {
			this.periodBegin = dateFormat.parse(periodBegin);
		} catch (ParseException e) {
			log.error(e, e);
		}
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

	public String getStatusHistory() {
		if (statusHistory == null) {
			return null;
		}
		return statusHistory.toString();
	}

	public String getStatusHistoryFullName() {
		return statusHistory.getName();
	}

	public void setStatusHistory(String statusHistory) {
		this.statusHistory = Status.valueOf(statusHistory);
	}
}