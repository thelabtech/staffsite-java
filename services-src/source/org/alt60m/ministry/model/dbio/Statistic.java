package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

import java.sql.Timestamp;
import java.util.*;

public class Statistic extends DBIOEntity {

	private String statisticId = new String();

	private int fk_activityId;

	private Date periodBegin;
	private Date periodEnd;

	private int decisions;
	private int mediaExposures;
	private int personalEvangelismExposures;
	private int groupEvangelismExposures;
	private int laborersSent;

	//formerly involvedNewBelievers
	private int growthGroupMembers;
	private int multipliers;
	private int studentLeaders;
	private int involvedStudents;
	private int seekers;
	private int holySpiritConversations;
	
	private Timestamp updatedAt;

	private String updatedBy;
	
	private String peopleGroup;
	
	public Statistic(String id) {
		statisticId = id;
		select();
	}
	public Statistic() {}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_statistic";

		setMetadata("StatisticId", "StatisticID", "IDENTITY");

		setMetadata("ActivityIdInternal", "fk_Activity", table);

		setMetadata("PeriodBegin", "periodBegin", table);
		setMetadata("PeriodEnd", "periodEnd", table);


		setMetadata("Decisions", "decisions", table);
		setMetadata("MediaExposures", "exposuresViaMedia", table);
		setMetadata("PersonalEvangelismExposures", "evangelisticOneOnOne", table);
		setMetadata("GroupEvangelismExposures", "evangelisticGroup", table);
		setMetadata("HolySpiritConversations", "holySpiritConversations", table);		
		setMetadata("LaborersSent", "laborersSent", table);

		setMetadata("GrowthGroupMembers", "invldNewBlvrs", table);
		setMetadata("Multipliers", "multipliers", table);
		setMetadata("StudentLeaders", "studentLeaders", table);
		setMetadata("InvolvedStudents", "invldStudents", table);
		setMetadata("Seekers", "ongoingEvangReln", table);
		
		setMetadata("UpdatedBy", "updated_by", table);
		setMetadata("PeopleGroup", "peopleGroup", table);
		
		
		setMetadata("UpdatedAt", "updated_at", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getStatisticId().equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public int getGroupEvangelismExposures() {
		return groupEvangelismExposures;
	}
	public void setGroupEvangelismExposures(int groupEvangelismExposures) {
		this.groupEvangelismExposures = groupEvangelismExposures;
	}
	public int getMultipliers() {
		return multipliers;
	}
	public void setMultipliers(int multipliers) {
		this.multipliers = multipliers;
	}
	public int getPersonalEvangelismExposures() {
		return personalEvangelismExposures;
	}
	public void setPersonalEvangelismExposures(int personalEvangelismExposures) {
		this.personalEvangelismExposures = personalEvangelismExposures;
	}
	public int getHolySpiritConversations() {
		return holySpiritConversations;
	}
	public void setHolySpiritConversations(int holySpiritConversations) {
		this.holySpiritConversations = holySpiritConversations;
	}
	public String getStatisticId() { return statisticId; }
	public void setStatisticId(String statisticId) { this.statisticId = statisticId; }

	public Date getPeriodBegin() { return periodBegin; }
	public void setPeriodBegin(Date periodBegin) { this.periodBegin = org.alt60m.util.DateUtils.clearTimeFromDate(periodBegin); }

	public Date getPeriodEnd() { return periodEnd; }
	public void setPeriodEnd(Date periodEnd) { this.periodEnd = org.alt60m.util.DateUtils.clearTimeFromDate(periodEnd); }

	public int getMediaExposures() { return mediaExposures; }
	public void setMediaExposures(int i) { mediaExposures = i; }

	public int getDecisions() { return decisions; }
	public void setDecisions(int decisions) { this.decisions = decisions; }

	public int getGrowthGroupMembers() { return growthGroupMembers; }
	public void setGrowthGroupMembers(int invldNewBlvrs) { this.growthGroupMembers = invldNewBlvrs; }

	public int getInvolvedStudents() { return involvedStudents; }
	public void setInvolvedStudents(int invldStudents) { this.involvedStudents = invldStudents; }
	
	public int getSeekers() { return seekers; }
	public void setSeekers(int seekers) { this.seekers = seekers; }

	public int getStudentLeaders() { return studentLeaders; }
	public void setStudentLeaders(int i) { studentLeaders = i; }

	public int getLaborersSent() {
		return laborersSent;
	}
	public void setLaborersSent(int laborersSent) {
		this.laborersSent = laborersSent;
	}
	public int getActivityIdInternal() {
		return fk_activityId;
	}
	public void setActivityIdInternal(int fk_activityId) {
		this.fk_activityId = fk_activityId;
	}
	public String getActivityId() { return String.valueOf(getActivityIdInternal()); }
	public void setActivityId(String activityId) { setActivityIdInternal(Integer.parseInt(activityId)); }
	public Activity getActivity() { return new Activity(getActivityId()); }
	public void setActivity(Activity a) { setActivityId(a.getActivityId()); }
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setPeopleGroup(String peopleGroup) {
		this.peopleGroup = peopleGroup;
	}
	public String getPeopleGroup() {
		return peopleGroup;
	}
}
