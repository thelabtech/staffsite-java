package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class Statistic extends DBIOEntity {

	private String statisticId = new String();

	private int fk_activityId = 0;

	private Date periodBegin = null;
	private Date periodEnd = null;
	private int exposures = 0;
	private int exposuresViaMedia = 0;
	private int evangelisticOneOnOne = 0;
	private int evangelisticGroup = 0;
	private int ongoingEvangReln = 0;
	private int decisions = 0;
	private int decisionsHelpedByMedia = 0;
	private int decisionsHelpedByOneOnOne = 0;
	private int decisionsHelpedByGroup = 0;
	private int decisionsHelpedByOngoingReln = 0;
	private int attendedLastConf = 0;
	private int invldNewBlvrs = 0;
	private int invldStudents = 0;
	private int invldFreshmen = 0;
	private int invldSophomores = 0;
	private int invldJuniors = 0;
	private int invldSeniors = 0;
	private int invldGrads = 0;
	private int studentLeaders = 0;
	private int volunteers = 0;
	private int staff = 0;
	private int nonStaffStint = 0;
	private int staffStint = 0;
	
	public Statistic(String id) {
		statisticId = id;
		select();
	}
	public Statistic() {}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_Statistic";

		setMetadata("StatisticId", "StatisticID", "IDENTITY");

		setMetadata("ActivityIdInternal", "fk_Activity", table);

		setMetadata("PeriodBegin", "periodBegin", table);
		setMetadata("PeriodEnd", "periodEnd", table);
		setMetadata("Exposures", "exposures", table);
		setMetadata("MediaExposures", "exposuresViaMedia", table);
		setMetadata("IndividualPresentations", "evangelisticOneOnOne", table);
		setMetadata("GroupPresentations", "evangelisticGroup", table);
		setMetadata("OngoingRelationships", "ongoingEvangReln", table);
		setMetadata("Decisions", "decisions", table);
		setMetadata("MediaDecisions", "decisionsHelpedByMedia", table);
		setMetadata("IndividualDecisions", "decisionsHelpedByOneOnOne", table);
		setMetadata("GroupDecisions", "decisionsHelpedByGroup", table);
		setMetadata("OngoingDecisions", "decisionsHelpedByOngoingReln", table);
		setMetadata("AttendedLastConf", "attendedLastConf", table);
		setMetadata("InvldNewBlvrs", "invldNewBlvrs", table);
		setMetadata("InvldStudents", "invldStudents", table);
		setMetadata("InvldFreshmen", "invldFreshmen", table);
		setMetadata("InvldSophomores", "invldSophomores", table);
		setMetadata("InvldJuniors", "invldJuniors", table);
		setMetadata("InvldSeniors", "invldSeniors", table);
		setMetadata("InvldGrads", "invldGrads", table);
		setMetadata("StudentLeaders", "studentLeaders", table);
		setMetadata("Volunteers", "volunteers", table);
		setMetadata("Staff", "staff", table);
		setMetadata("NonStaffStint", "nonStaffStint", table);
		setMetadata("StaffStint", "staffStint", table);
		
		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getStatisticId().equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public String getStatisticId() { return statisticId; }
	public void setStatisticId(String statisticId) { this.statisticId = statisticId; }

	public Date getPeriodBegin() { return periodBegin; }
	public void setPeriodBegin(Date periodBegin) { this.periodBegin = org.alt60m.util.DateUtils.clearTimeFromDate(periodBegin); }
	
	public Date getPeriodEnd() { return periodEnd; }
	public void setPeriodEnd(Date periodEnd) { this.periodEnd = org.alt60m.util.DateUtils.clearTimeFromDate(periodEnd); }
	
	public int getExposures() { return exposures; }
	public void setExposures(int exposures) { this.exposures = exposures; }

	public int getMediaExposures() { return exposuresViaMedia; }
	public void setMediaExposures(int i) { exposuresViaMedia = i; }
	
	public int getMediaDecisions() { return decisionsHelpedByMedia; }
	public void setMediaDecisions(int i) { decisionsHelpedByMedia = i; }
	
	public int getGroupPresentations() { return evangelisticGroup; }
	public void setGroupPresentations(int i) { evangelisticGroup = i; }

	public int getGroupDecisions() { return decisionsHelpedByGroup; }
	public void setGroupDecisions(int i) { decisionsHelpedByGroup = i; }

	public int getIndividualPresentations() { return evangelisticOneOnOne; }
	public void setIndividualPresentations(int i) { evangelisticOneOnOne = i; }

	public int getIndividualDecisions() { return decisionsHelpedByOneOnOne; }
	public void setIndividualDecisions(int i) { decisionsHelpedByOneOnOne = i; }

	public int getOngoingRelationships() { return ongoingEvangReln; }
	public void setOngoingRelationships(int i) { ongoingEvangReln = i; }

	public int getOngoingDecisions() { return decisionsHelpedByOngoingReln; }
	public void setOngoingDecisions(int i) { decisionsHelpedByOngoingReln = i; }

	public int getDecisions() { return decisions; }
	public void setDecisions(int decisions) { this.decisions = decisions; }
	
	public int getAttendedLastConf() { return attendedLastConf; }
	public void setAttendedLastConf(int attendedLastConf) { this.attendedLastConf = attendedLastConf; }
	
	public int getInvldNewBlvrs() { return invldNewBlvrs; }
	public void setInvldNewBlvrs(int invldNewBlvrs) { this.invldNewBlvrs = invldNewBlvrs; }
	
	public int getInvldStudents() { return invldStudents; }
	public void setInvldStudents(int invldStudents) { this.invldStudents = invldStudents; }
	
	public int getInvldFreshmen() { return invldFreshmen; }
	public void setInvldFreshmen(int invldFreshmen) { this.invldFreshmen = invldFreshmen; }
	
	public int getInvldSophomores() { return invldSophomores; }
	public void setInvldSophomores(int invldSophomores) { this.invldSophomores = invldSophomores; }
	
	public int getInvldJuniors() { return invldJuniors; }
	public void setInvldJuniors(int invldJuniors) { this.invldJuniors = invldJuniors; }
	
	public int getInvldSeniors() { return invldSeniors; }
	public void setInvldSeniors(int invldSeniors) { this.invldSeniors = invldSeniors; }
	
	public int getInvldGrads() { return invldGrads; }
	public void setInvldGrads(int invldGrads) { this.invldGrads = invldGrads; }
	
	public int getStudentLeaders() { return studentLeaders; }
	public void setStudentLeaders(int i) { studentLeaders = i; }

	public int getVolunteers() { return volunteers; }
	public void setVolunteers(int volunteers) { this.volunteers = volunteers; }
	
	public int getStaff() { return staff; }
	public void setStaff(int staff) { this.staff = staff; }
	
	public int getNonStaffStint() { return nonStaffStint; }
	public void setNonStaffStint(int nonStaffStint) { this.nonStaffStint = nonStaffStint; }
	
	public int getStaffStint() { return staffStint; }
	public void setStaffStint(int staffStint) { this.staffStint = staffStint; }
	
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

}
