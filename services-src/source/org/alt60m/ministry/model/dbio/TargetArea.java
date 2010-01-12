/* Generated by Together */

package org.alt60m.ministry.model.dbio;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class TargetArea extends DBIOEntity {
	
	public TargetArea(String id) {
		targetAreaId = id;
		select();
	}	
	public TargetArea() { }

	public boolean isPKEmpty() {
		return targetAreaId.equals("");
	}
	public boolean persist(){
		return isPKEmpty() ? insert() : update();
	}

	public void localinit() throws DBIOEntityException {
		String table = "ministry_targetarea";
		setMetadata("TargetAreaId", "targetAreaId", "IDENTITY");

		setMetadata("Name", "name", table);
		setMetadata("Type", "type", table);
		setMetadata("Address1", "address1", table);
		setMetadata("Address2", "address2", table);
		setMetadata("City", "city", table);
		setMetadata("State", "state", table);
		setMetadata("Zip", "zip", table);
		setMetadata("Country", "country", table);
		setMetadata("Phone", "phone", table);
		setMetadata("Fax", "fax", table);
		setMetadata("Email", "email", table);
		setMetadata("Url", "url", table);
		setMetadata("Abbrv", "abbrv", table);
		setMetadata("Fice", "fice", table);
		setMetadata("Note", "note", table);
		setMetadata("AltName", "altName", table);
		setMetadata("IsSecureString", "isSecure", table);
		setMetadata("IsClosedString", "isClosed", table);
		setMetadata("Region", "region", table);
		setMetadata("Mpta", "mpta", table);
		setMetadata("UrlToLogo", "urlToLogo", table);
		setMetadata("Enrollment", "enrollment", table);
		setMetadata("MonthSchoolStarts", "monthSchoolStarts", table);
		setMetadata("MonthSchoolStops", "monthSchoolStops", table);
		setMetadata("IsSemesterString", "isSemester", table);
		setMetadata("IsNoFiceOK", "isNoFiceOK", table);
		setMetadata("IsApprovedString", "isApproved", table);
		setMetadata("AoaPriority", "aoaPriority", table);
		setMetadata("Aoa", "aoa", table);
		setMetadata("CiaUrl", "ciaUrl", table);
		setMetadata("InfoUrl", "infoUrl", table);
		setMetadata("EventType", "eventType", table);
		setMetadata("EventKeyID", "eventKeyID", table);

		setAutodetectProperties(false);
	}

	private String targetAreaId = new String();

	private String name = "";
	private String address1 = "";
	private String address2 = "";
	private String city = "";
	private String state = "";
	private String zip = "";
	private String country = "";
	private String phone = "";
	private String fax = "";
	private String email = "";
	private String url = "";
	private String abbrv = "";
	private String fice = "";
	//private String population = "";
	private String note = "";
	private String altName = "";
	private String isSecure = "";
	private String isClosed = "";
	private String region = "";
	private String mpta = "";
	private String urlToLogo = "";
	private String enrollment = "";
	private String monthSchoolStarts = "";
	private String monthSchoolStops = "";
	private String isSemester = "";
	private String isNoFiceOK = "";
	private String isApproved = "";
	private String aoaPriority = "";
	private String aoa = "";
	private String ciaUrl = "";
	private String infoUrl = "";
	private String eventType = "";
	private String eventKeyID = "";
	private String type="";
	
	public String getTargetAreaId() { return targetAreaId; }
	public void setTargetAreaId(String targetAreaId) { this.targetAreaId = targetAreaId; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getType() { return type; }
	public void setType(String type) { this.type = type; }
	
	public String getAddress1() { return address1; }
	public void setAddress1(String address1) { this.address1 = address1; }
	
	public String getAddress2() { return address2; }
	public void setAddress2(String address2) { this.address2 = address2; }
	
	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }
	
	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	
	public String getZip() { return zip; }
	public void setZip(String zip) { this.zip = zip; }
	
	public String getCountry() { return country; }
	public void setCountry(String country) { this.country = country; }
	
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	
	public String getFax() { return fax; }
	public void setFax(String fax) { this.fax = fax; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getUrl() { return url; }
	public void setUrl(String url) { this.url = url; }
	
	public String getAbbrv() { return abbrv; }
	public void setAbbrv(String abbrv) { this.abbrv = abbrv; }
	
	public String getFice() { return fice; }
	public void setFice(String fice) { this.fice = fice; }
	
	//public String getPopulation() { return population; }
	//public void setPopulation(String population) { this.population = population; }
	
	public String getNote() { return note; }
	public void setNote(String note) { this.note = note; }
	
	public String getAltName() { return altName; }
	public void setAltName(String altName) { this.altName = altName; }
	
	public boolean getIsSecure() { return isSecure != null && isSecure.equals("T"); }
	public void setIsSecure(boolean isSecure) { this.isSecure = isSecure ? "T" : "F"; }
	public String getIsSecureString() { return isSecure; }
	public void setIsSecureString(String isSecure) { this.isSecure = isSecure; }
	
	public boolean getIsClosed() { return isClosed != null && isClosed.equals("T"); }
	public void setIsClosed(boolean isClosed) { this.isClosed = isClosed ? "T" : "F"; }
	public String getIsClosedString() { return isClosed; }
	public void setIsClosedString(String isClosed) { this.isClosed = isClosed; }
	
	
	public String getRegion() { return region; }
	public void setRegion(String region) { this.region = region; }
	
	public String getMpta() { return mpta; }
	public void setMpta(String mpta) { this.mpta = mpta; }
	
	public String getUrlToLogo() { return urlToLogo; }
	public void setUrlToLogo(String urlToLogo) { this.urlToLogo = urlToLogo; }
	
	public String getEnrollment() { return enrollment; }
	public void setEnrollment(String enrollment) { this.enrollment = enrollment; }
	
	public String getMonthSchoolStarts() { return monthSchoolStarts; }
	public void setMonthSchoolStarts(String monthSchoolStarts) { this.monthSchoolStarts = monthSchoolStarts; }
	
	public String getMonthSchoolStops() { return monthSchoolStops; }
	public void setMonthSchoolStops(String monthSchoolStops) { this.monthSchoolStops = monthSchoolStops; }
	
	public boolean getIsSemester() { return isSemester != null && isSemester.equals("T"); }
	public void setIsSemester(boolean isSemester) { this.isSemester = isSemester ? "T" : "F"; }
	public String getIsSemesterString() { return isSemester; }
	public void setIsSemesterString(String isSemester) { this.isSemester = isSemester; }
	
	public String getIsNoFiceOK() { return isNoFiceOK; }
	public void setIsNoFiceOK(String isNoFiceOK) { this.isNoFiceOK = isNoFiceOK; }
	
	public String getAoaPriority() { return aoaPriority; }
	public void setAoaPriority(String aoaPriority) { this.aoaPriority = aoaPriority; }
	
	public String getAoa() { return aoa; }
	public void setAoa(String aoa) { this.aoa = aoa; }
	
	public String getCiaUrl() { return ciaUrl; }
	public void setCiaUrl(String ciaUrl) { this.ciaUrl = ciaUrl; }
	
	public String getInfoUrl() { return infoUrl; }
	public void setInfoUrl(String infoUrl) { this.infoUrl = infoUrl; }
	
	public String getEventType() {return eventType;}
	public void setEventType( String eventType) {this.eventType=eventType;}
	
	public String getEventKeyID() {return eventKeyID;}
	public void setEventKeyID( String eventKeyID) {this.eventKeyID=eventKeyID;}

	@SuppressWarnings("unchecked")
	public Vector<Activity> getActivities() {
		Vector<Activity>result=new Vector<Activity>();
		Activity a = new Activity();
		for (org.alt60m.ministry.Strategy strategy : org.alt60m.ministry.Strategy.campusStrategies()) {
			a = new Activity();
		a.setTargetAreaId(this.targetAreaId);
		a.setStrategy(strategy.toString());
		result.addAll( a.selectList());
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public Vector getActivities(String orderField, boolean DESC) {
		Activity a = new Activity();
		return a.selectList("fk_targetAreaID = '" + this.targetAreaId + "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}
	public void assocActivity(Activity a) {
		a.setTargetAreaId(this.targetAreaId);
		a.update();
	}
	public void dissocActivity(Activity a) {
		a.setTargetAreaId("");
		a.update();
	}	

	@SuppressWarnings("unchecked")
	public Vector getNonCccMins() {
		NonCccMin ncm = new NonCccMin();
		String table = "ministry_viewTargetAreaNonCccMin";
		ncm.changeTargetTable(table);
		return ncm.selectList("TargetAreaID = '" + this.targetAreaId + "'");
	}	
	@SuppressWarnings("unchecked")
	public Vector getNonCccMins(String orderField, boolean DESC) {
		NonCccMin ncm = new NonCccMin();
		String table = "ministry_viewTargetAreaNonCccMin";
		ncm.changeTargetTable(table);
		return ncm.selectList("TargetAreaID = '" + this.targetAreaId + "' ORDER BY "
				+ orderField + " " + (DESC ? "DESC" : "ASC"));
	}	
	public void assocNonCccMin(NonCccMin ncm) {
		NonCccMinContact ncc = new NonCccMinContact();
		ncc.setNonCccMinId(ncm.getNonCccMinId());
		ncc.setTargetAreaId(this.getTargetAreaId());
		ncc.insert();
	}
	public void dissocNonCccMin(NonCccMin ncm) {
		NonCccMinContact ncc = new NonCccMinContact();
		ncc.setNonCccMinId(ncm.getNonCccMinId());
		ncc.setTargetAreaId(this.getTargetAreaId());
		ncc.delete();
	}
	@SuppressWarnings("unchecked")
	public Vector getOtherMinistries() {
		return this.getNonCccMins();
	}
	
	public boolean getIsApproved() { return isApproved != null && isSemester.equals("T"); }
	public void setIsApproved(boolean isApproved) { this.isApproved = isApproved ? "T" : "F"; }
	public String getIsApprovedString() { return isApproved; }
	public void setIsApprovedString(String isApproved) { this.isApproved = isApproved; }
        
    public void getFieldvalue() { }  public String getFieldvalue(String foo) { return ""; }
    public void getHeaderName() { }  public String getHeaderName(String foo) { return ""; }
    public void getColumnName() { }  public String getColumnName(String foo) { return ""; }
        
    public String getEventLink() {
    	String eventLink="";
    	if (this.getEventType().equals("C1")){
    		eventLink="https://staff.campuscrusadeforchrist.com/servlet/CRSAdmin?action=showConference&conferenceID="+eventKeyID;
    	}
    	else if (this.getEventType().equals("C2")){
    		eventLink="https://www.conferenceregistrationtool.com/conferenceInfo.seam?conferenceId="+eventKeyID;
    	}
    	else if (this.getEventType().equals("SP")){
    		eventLink="https://sp.campuscrusadeforchrist.com/projects/"+eventKeyID+"/version";
    	}
    	return eventLink;	
    }
}
