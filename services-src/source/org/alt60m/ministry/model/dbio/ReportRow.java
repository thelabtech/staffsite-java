package org.alt60m.ministry.model.dbio;

public class ReportRow extends Object {
	
	public ReportRow(){
		
	}
	public ReportRow(ReportRow row){
		this.setEvangelisticOneOnOne(row.getEvangelisticOneOnOne());
		this.setEvangelisticGroup(row.getEvangelisticGroup());
		this.setExposuresViaMedia(row.getExposuresViaMedia());
		this.setHolySpirit(row.getHolySpirit());
		this.setDollarsRaised(row.getDollarsRaised());
		this.setDecisions(row.getDecisions());
		this.setDecisionsPersonalEvangelismExposures(row.getDecisionsPersonalEvangelismExposures());
		this.setDecisionsGroupEvangelismExposures(row.getDecisionsGroupEvangelismExposures());
		this.setDecisionsMediaExposures(row.getDecisionsMediaExposures());
		this.setLaborersSent(row.getLaborersSent());
		
		this.setMultipliers(row.getMultipliers());
		this.setInvldStudents(row.getInvldStudents());
		this.setSeekers(row.getSeekers());
		this.setStudentLeaders(row.getStudentLeaders());
		
		this.setRowGroup(row.getRowid()); 
		this.setRowid(row.getRowid());
		this.setActivityID(row.getActivityID());
		this.setStrategy(row.getStrategy());
		this.setCampusName(row.getCampusName());
		this.setEnrollment(row.getEnrollment());
		this.setLabel(row.getLabel());
		this.setLocalLevelId(row.getLocalLevelId());
		this.setTargetAreaID(row.getTargetAreaID());
		this.setPeopleGroup(row.getPeopleGroup());
		this.setRegion(row.getRegion());
		this.setStatus(row.getStatus()); 
		this.setActivityPeriodBegin(row.getActivityPeriodBegin());
		this.setStatPeriodEnd(row.getStatPeriodEnd());
		this.setStatPeriodBegin(row.getStatPeriodBegin());
		
		this.setEventKeyID(row.getEventKeyID());
		this.setEventType(row.getEventType());
		
		
	}
	private String rowid="";
	private String activityID="";
	private String campusName="";
	private String strategy="";
	private String region="";
	private String peopleGroup="";
	private String status="";
	private String targetAreaID="";
	private String localLevelId="";
	private String activityPeriodBegin="";
	private String statPeriodEnd="";
	private String statPeriodBegin="";
	private String function=""; //this is for special rows, i.e. toggling rows
	private String rowGroup=""; //this is for grouping toggling rows
	private String label="";
	
	private String enrollment="";
	private Integer evangelisticOneOnOne=0;
	private Integer evangelisticGroup=0;
	private Integer exposuresViaMedia=0;
	private Integer holySpirit=0;
	private Integer dollarsRaised=0;
	private Integer decisions=0;
	private Integer decisionsPersonalEvangelismExposures=0; 
	private Integer decisionsGroupEvangelismExposures=0;
	private Integer decisionsMediaExposures=0;
	private Integer laborersSent=0;
	private Integer multipliers=0;
	private Integer invldStudents=0;
	private Integer seekers=0;
	private Integer studentLeaders=0;
	private String eventType="";
	private String eventKeyID="";
	
	public String getRowid(){return this.rowid;}
	public void setRowid(String value){this.rowid=value;}
	
	public String getActivityID(){return this.activityID;}
	public void setActivityID(String value){this.activityID=value;}
	
	public String getCampusName(){return this.campusName;}
	public void setCampusName(String value){this.campusName=value;}
	
	public String getStrategy(){return this.strategy;}
	public void setStrategy(String value){this.strategy=value;}
	
	public String getRegion(){return this.region;}
	public void setRegion(String value){this.region=value;}
	
	public String getPeopleGroup(){return this.peopleGroup;}
	public void setPeopleGroup(String value){this.peopleGroup=value;}
	
	public String getStatus(){return this.status;}
	public void setStatus(String value){this.status=value;}
	
	public String getTargetAreaID(){return this.targetAreaID;}
	public void setTargetAreaID(String value){this.targetAreaID=value;}
	
	public String getLocalLevelId(){return this.localLevelId;}
	public void setLocalLevelId(String value){this.localLevelId=value;}
	
	public String getActivityPeriodBegin(){return this.activityPeriodBegin;}
	public void setActivityPeriodBegin(String value){this.activityPeriodBegin=value;}
	
	public String getStatPeriodEnd(){return this.statPeriodEnd;}
	public void setStatPeriodEnd(String value){this.statPeriodEnd=value;}
	
	public String getStatPeriodBegin(){return this.statPeriodBegin;}
	public void setStatPeriodBegin(String value){this.statPeriodBegin=value;}
	
	public String getFunction(){return this.function;}
	public void setFunction(String value){this.function=value;}
	
	public String getRowGroup(){return this.rowGroup;}
	public void setRowGroup(String value){this.rowGroup=value;}
	
	
	public String getEnrollment(){return this.enrollment;}
	public void setEnrollment(String value){this.enrollment=value;}
	
	public String getLabel(){ return this.label;}
	public void setLabel(String value){this.label=value;}
	
	public int getEvangelisticOneOnOne(){ return this.evangelisticOneOnOne;}
	public void setEvangelisticOneOnOne(int value){this.evangelisticOneOnOne=value;}
	
	public int getEvangelisticGroup(){ return this.evangelisticGroup;}
	public void setEvangelisticGroup(int value){this.evangelisticGroup=value;}
	
	public int getExposuresViaMedia(){ return this.exposuresViaMedia;}
	public void setExposuresViaMedia(int value){this.exposuresViaMedia=value;}
	
	public int getHolySpirit(){ return this.holySpirit;}
	public void setHolySpirit(int value){this.holySpirit=value;}
	
	public int getDollarsRaised(){ return this.dollarsRaised;}
	public void setDollarsRaised(int value){this.dollarsRaised=value;}
	
	public int getDecisions(){ return this.decisions;}
	public void setDecisions(int value){this.decisions=value;}
	
	public int getDecisionsPersonalEvangelismExposures(){ return this.decisionsPersonalEvangelismExposures;}
	public void setDecisionsPersonalEvangelismExposures(int value){this.decisionsPersonalEvangelismExposures=value;}
	
	public int getDecisionsGroupEvangelismExposures(){ return this.decisionsGroupEvangelismExposures;}
	public void setDecisionsGroupEvangelismExposures(int value){this.decisionsGroupEvangelismExposures=value;}
	
	public int getDecisionsMediaExposures(){ return this.decisionsMediaExposures;}
	public void setDecisionsMediaExposures(int value){this.decisionsMediaExposures=value;}
	
	public int getLaborersSent(){ return this.laborersSent;}
	public void setLaborersSent(int value){this.laborersSent=value;}
	
	public int getMultipliers(){ return this.multipliers;}
	public void setMultipliers(int value){this.multipliers=value;}
	
	public int getInvldStudents(){ return this.invldStudents;}
	public void setInvldStudents(int value){this.invldStudents=value;}
	
	public int getSeekers(){ return this.seekers;}
	public void setSeekers(int value){this.seekers=value;}
	
	public int getStudentLeaders(){ return this.studentLeaders;}
	public void setStudentLeaders(int value){this.studentLeaders=value;}
	
	public String getEventType(){
		return this.eventType;
	}
	public void setEventType(String type){
		this.eventType=type;
	}
	public String getEventKeyID(){
		return this.eventKeyID;
	}
	public void setEventKeyID(String id){
		this.eventType=id;
	}
	
	public void addToTotal(ReportRow row){
		
		this.setEvangelisticOneOnOne(this.getEvangelisticOneOnOne()+row.getEvangelisticOneOnOne());//then we add the receiving row's already totals
		this.setEvangelisticGroup(this.getEvangelisticGroup()+row.getEvangelisticGroup());
		this.setExposuresViaMedia(this.getExposuresViaMedia()+row.getExposuresViaMedia());
		this.setHolySpirit(this.getHolySpirit()+row.getHolySpirit());
		this.setDollarsRaised(this.getDollarsRaised()+row.getDollarsRaised());
		this.setDecisions(this.getDecisions()+row.getDecisions());
		this.setDecisionsPersonalEvangelismExposures(this.getDecisionsPersonalEvangelismExposures()+row.getDecisionsPersonalEvangelismExposures());
		this.setDecisionsGroupEvangelismExposures(this.getDecisionsGroupEvangelismExposures()+row.getDecisionsGroupEvangelismExposures());
		this.setDecisionsMediaExposures(this.getDecisionsMediaExposures()+row.getDecisionsMediaExposures());
		this.setLaborersSent(this.getLaborersSent()+row.getLaborersSent());
		this.setMultipliers(this.getMultipliers()+row.getMultipliers());
		this.setInvldStudents(this.getInvldStudents()+row.getInvldStudents());
		this.setSeekers(this.getSeekers()+row.getSeekers());
		this.setStudentLeaders(this.getStudentLeaders()+row.getStudentLeaders());
		
		this.setRowGroup(row.getRowid()); 
		this.setRowid(row.getRowid());
		this.setActivityID(row.getActivityID());
		this.setStrategy(row.getStrategy());
		this.setCampusName(row.getCampusName());
		this.setEnrollment(row.getEnrollment());
		this.setLabel(row.getLabel());
		this.setLocalLevelId(row.getLocalLevelId());
		this.setTargetAreaID(row.getTargetAreaID());
		this.setPeopleGroup(row.getPeopleGroup());
		this.setRegion(row.getRegion());
		this.setStatus(row.getStatus()); 
		this.setActivityPeriodBegin(row.getActivityPeriodBegin());
		this.setStatPeriodEnd(row.getStatPeriodEnd());
		this.setStatPeriodBegin(row.getStatPeriodBegin());
		
	}
	public String toString(){
		String string="";
		string+="  rowid: "+this.getRowid()+" ";
		string+="  activityID: "+this.getActivityID()+" ";
		string+="  eventType: "+this.getEventType()+" ";
		string+="  eventKeyID: "+this.getEventKeyID()+" ";
		string+="  campusName: "+this.getCampusName()+" ";
		string+="  strategy: "+this.getStrategy()+" ";
		string+="  region: "+this.getRegion()+" ";
		string+="  peopleGroup: "+this.getPeopleGroup()+" ";
		string+="  status: "+this.getStatus()+" ";
		string+="  targetAreaID: "+this.getTargetAreaID()+" ";
		string+="  localLevelId: "+this.getLocalLevelId()+" ";
		string+="  activityPeriodBegin: "+this.getActivityPeriodBegin()+" ";
		string+="  statPeriodEnd: "+this.getStatPeriodEnd()+" ";
		string+="  statPeriodBegin: "+this.getStatPeriodBegin()+" ";
		string+="  function: "+this.getFunction()+" "; //this is for special rows, i.e. toggling rows
		string+="  rowGroup: "+this.getRowGroup()+" "; //this is for grouping toggling rows
		string+="  label: "+this.getLabel()+" ";
		
		string+="  enrollment: "+this.getEnrollment()+" ";
		string+="  evangelisticOneOnOne: "+this.getEvangelisticOneOnOne()+" ";
		string+="  evangelisticGroup: "+this.getEvangelisticGroup()+" ";
		string+="  exposuresViaMedia: "+this.getExposuresViaMedia()+" ";
		string+="  holySpirit: "+this.getHolySpirit()+" ";
		string+="  dollarsRaised: "+this.getDollarsRaised()+" ";
		string+="  decisions: "+this.getDecisions()+" ";
		string+="  decisionsPersonalEvangelismExposures: "+this.getDecisionsPersonalEvangelismExposures()+" "; 
		string+="  decisionsGroupEvangelismExposures: "+this.getDecisionsGroupEvangelismExposures()+" ";
		string+="  decisionsMediaExposures: "+this.getDecisionsMediaExposures()+" ";
		string+="  laborersSent: "+this.getLaborersSent()+" ";
		string+="  multipliers: "+this.getMultipliers()+" ";
		string+="  invldStudents: "+this.getInvldStudents()+" ";
		string+="  seekers: "+this.getSeekers()+" ";
		string+="  studentLeaders: "+this.getStudentLeaders()+" ";
		return string;
	}
		
}