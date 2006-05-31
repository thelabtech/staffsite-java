package org.alt60m.wsn.sp.model.dbio;

import java.util.Collection;
import java.util.Vector;
import java.util.Date;
import java.util.Iterator;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;

public class WsnProject extends DBIOEntity {
	public boolean isPKEmpty() {
		return WsnProjectID == 0;
	}
	public void localinit() throws DBIOEntityException {
		String table = "wsn_sp_wsnproject";
		
		setMetadata("WsnProjectIdInt", "WsnProjectID", "IDENTITY");
		setMetadata("Name", "name", table);
		setMetadata("PartnershipRegion", "partnershipRegion", table);
		setMetadata("History", "history", table);
		setMetadata("StartDate", "startDate", table);
		setMetadata("StopDate", "stopDate", table);
		setMetadata("City", "city", table);
		setMetadata("Country", "country", table);
		setMetadata("Details", "details", table);
		setMetadata("Status", "status", table);
		setMetadata("DestinationGatewayCity", "destinationGatewayCity", table);
		setMetadata("DepartDateFromGateCity", "departDateFromGateCity", table);
		setMetadata("ArrivalDateAtLocation", "arrivalDateAtLocation", table);
		setMetadata("LocationGatewayCity", "locationGatewayCity", table);
		setMetadata("DepartureDateFromLocation", "departureDateFromLocation", table);
		setMetadata("ArrivalDateAtGatewayCity", "arrivalDateAtGatewayCity", table);
		setMetadata("FlightBudget", "flightBudget", table);
		setMetadata("GatewayCitytoLocationFlightNo", "GatewayCitytoLocationFlightNo", table);
		setMetadata("LocationToGatewayCityFlightNo", "locationToGatewayCityFlightNo", table);
		setMetadata("InCountryContact", "inCountryContact", table);
		setMetadata("ScholarshipAccountNo", "scholarshipAccountNo", table);
		setMetadata("OperatingAccountNo", "operatingAccountNo", table);
		setMetadata("AOA", "AOA", table);
		setMetadata("MPTA", "MPTA", table);
		setMetadata("StaffCost", "staffCost", table);
		setMetadata("StudentCost", "studentCost", table);
		setMetadata("InsuranceFormsReceived", "insuranceFormsReceived", table);
		setMetadata("CAPSFeePaid", "CAPSFeePaid", table);
		setMetadata("AdminFeePaid", "adminFeePaid", table);
		setMetadata("StoriesXX", "storiesXX", table);
		setMetadata("Stats", "stats", table);
		setMetadata("Secure", "secure", table);
		setMetadata("DateCreated", "dateCreated", table);
		setMetadata("LastUpdate", "lastUpdate", table);
		setMetadata("MaxNoStaffMale", "maxNoStaffMale", table);
		setMetadata("MaxNoStaffFemale", "maxNoStaffFemale", table);
		setMetadata("MaxNoStaffCouples", "maxNoStaffCouples", table);
		setMetadata("MaxNoStaffFamilies", "maxNoStaffFamilies", table);
		setMetadata("MaxNoStaff", "maxNoStaff", table);
		setMetadata("MaxNoInternAMale", "maxNoInternAMale", table);
		setMetadata("MaxNoInternAFemale", "maxNoInternAFemale", table);
		setMetadata("MaxNoInternACouples", "maxNoInternACouples", table);
		setMetadata("MaxNoInternAFamilies", "maxNoInternAFamilies", table);
		setMetadata("MaxNoInternA", "maxNoInternA", table);
		setMetadata("MaxNoInternPMale", "maxNoInternPMale", table);
		setMetadata("MaxNoInternPFemale", "maxNoInternPFemale", table);
		setMetadata("MaxNoInternPCouples", "maxNoInternPCouples", table);
		setMetadata("MaxNoInternPFamilies", "maxNoInternPFamilies", table);
		setMetadata("MaxNoInternP", "maxNoInternP", table);
		setMetadata("MaxNoStudentAMale", "maxNoStudentAMale", table);
		setMetadata("MaxNoStudentAFemale", "maxNoStudentAFemale", table);
		setMetadata("MaxNoStudentACouples", "maxNoStudentACouples", table);
		setMetadata("MaxNoStudentAFamilies", "maxNoStudentAFamilies", table);
		setMetadata("MaxNoStudentA", "maxNoStudentA", table);
		setMetadata("MaxNoStudentPMale", "maxNoStudentPMale", table);
		setMetadata("MaxNoStudentPFemale", "maxNoStudentPFemale", table);
		setMetadata("MaxNoStudentPCouples", "maxNoStudentPCouples", table);
		setMetadata("MaxNoStudentPFamilies", "maxNoStudentPFamilies", table);
		setMetadata("MaxNoStudents", "maxNoStudents", table);
		setMetadata("ProjEvalCompleted", "projEvalCompleted", table);
		setMetadata("EvangelisticExposures", "evangelisticExposures", table);
		setMetadata("ReceivedChrist", "receivedChrist", table);
		setMetadata("JesusFilmExposures", "jesusFilmExposures", table);
		setMetadata("JesusFilmReveivedChrist", "jesusFilmReveivedChrist", table);
		setMetadata("CoverageActivitiesExposures", "coverageActivitiesExposures", table);
		setMetadata("CoverageActivitiesDecisions", "coverageActivitiesDecisions", table);
		setMetadata("HolySpiritDecisions", "holySpiritDecisions", table);
		setMetadata("Website", "website", table);
		setMetadata("DestinationAddress", "destinationAddress", table);
		setMetadata("DestinationPhone", "destinationPhone", table);
		setMetadata("WsnYear", "wsnYear", table);
		setMetadata("IsCoordId", "fk_IsCoord", table);
		setMetadata("IsAPDId", "fk_IsAPD", table);
		setMetadata("IsPDId", "fk_IsPD", table);
		setMetadata("CreateDate", "createDate", table);
		setMetadata("LastChangedDate", "lastChangedDate", table);
		setMetadata("LastChangedBy", "lastChangedBy", table);
		setMetadata("DisplayLocation", "displayLocation", table);
		setMetadata("PartnershipRegionOnly", "partnershipRegionOnly", table);
		setMetadata("ProjectType", "projectType", table);
		setMetadata("InternCost", "internCost", table);
		setMetadata("OnHold", "onHold", table);
		setMetadata("LeadershipStartDate", "leadershipStartDate", table);
		setMetadata("LeadershipEndDate", "leadershipEndDate", table);
		setMetadata("StudentStartDate", "studentStartDate", table);
		setMetadata("StudentEndDate", "studentEndDate", table);
		setMetadata("StaffStartDate", "staffStartDate", table);
		setMetadata("StaffEndDate", "staffEndDate", table);
		setMetadata("OperatingBusinessUnit", "operatingBusinessUnit", table);
		setMetadata("OperatingOperatingUnit", "operatingOperatingUnit", table);
		setMetadata("OperatingDeptID", "operatingDeptID", table);
		setMetadata("OperatingProjectID", "operatingProjectID", table);
		setMetadata("OperatingDesignation", "operatingDesignation", table);
		setMetadata("ScholarshipBusinessUnit", "scholarshipBusinessUnit", table);
		setMetadata("ScholarshipOperatingUnit", "scholarshipOperatingUnit", table);
		setMetadata("ScholarshipDeptID", "scholarshipDeptID", table);
		setMetadata("ScholarshipProjectID", "scholarshipProjectID", table);
		setMetadata("ScholarshipDesignation", "scholarshipDesignation", table);
		
		/*Added 4/18/06 SRW */
		setMetadata("StatesideContactName", "statesideContactName", table); 
		setMetadata("StatesideContactProjectRole", "statesideContactProjectRole", table);
		setMetadata("StatesideContactPhone", "statesideContactPhone", table);
		setMetadata("StatesideContactEmail", "statesideContactEmail", table);
		
		setAutodetectProperties(false);
	}

	public WsnProject() {
//		createDate = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
	}
	public WsnProject(String id) {
		if (id != null && !id.equals("")) {
			WsnProjectID = (new Integer(id)).intValue();
			select();
		}
	}
	public WsnProject(int id) {
		WsnProjectID = id;
		select();
	}
	public boolean persist() { return isPKEmpty() ? insert() : update(); }
	public boolean insert() {
		setCreateDate(org.alt60m.util.DateUtils.clearTimeFromDate(new Date()));
		return super.insert();
	}
	
    private int WsnProjectID = 0;

	private String name = "";
	private String partnershipRegion = "";
	private String history = "";
	private String startDate = "";
	private String stopDate = "";
	private String city = "";
	private String country = "";
	private String details = "";
	private String status = "";
	private String destinationGatewayCity = "";
	private String departDateFromGateCity = "";
	private String arrivalDateAtLocation = "";
	private String locationGatewayCity = "";
	private String departureDateFromLocation = "";
	private String arrivalDateAtGatewayCity = "";
	private String flightBudget = "";
	private String GatewayCitytoLocationFlightNo = "";
	private String locationToGatewayCityFlightNo = "";
	private String inCountryContact = "";
	private String scholarshipAccountNo = "";
	private String operatingAccountNo = "";
	private String AOA = "";
	private String MPTA = "";
	private String staffCost = "";
	private String studentCost = "";
	private boolean insuranceFormsReceived;
    private boolean CAPSFeePaid;
    private boolean adminFeePaid;
	private String storiesXX = "";
	private String stats = "";
	private boolean secure;
	private String dateCreated = "";
	private String lastUpdate = "";
	private int maxNoStaff, maxNoStudents;
	private boolean projEvalCompleted;
	private int evangelisticExposures;
	private int receivedChrist;
	private int jesusFilmExposures;
	private int jesusFilmReveivedChrist;
	private int coverageActivitiesExposures;
	private int coverageActivitiesDecisions;
	private int holySpiritDecisions;
	private String website = "";
	private String destinationAddress = "";
	private String destinationPhone = "";
	private String wsnYear = "";
	
	/*Added 4/18/06 SRW	 */

	private String statesideContactName = "";
	private String statesideContactProjectRole = "";
	private String statesideContactPhone = "";
	private String statesideContactEmail = "";

	private int fk_isCoord = 0;
	private int fk_isAPD = 0;
    private int fk_isPD = 0;

	/* Model change: added for Mobilization System Project :::: 5 September 2002 RDH */
	/* And more on 15 October 2002 -- RDH */
	/* also note that get and set functions were added below for each of these */

	private String projectType, lastChangedBy, displayLocation;
	private Date studentStartDate, studentEndDate, staffStartDate, staffEndDate, leadershipStartDate,
			leadershipEndDate, createDate, lastChangedDate;
	private boolean partnershipRegionOnly;
	private String internCost;
	private boolean onHold;
	private int maxNoStaffMale, maxNoStaffFemale, maxNoStaffCouples, maxNoStaffFamilies,
			maxNoInternAMale, maxNoInternAFemale, maxNoInternACouples, maxNoInternAFamilies, maxNoInternA,
			maxNoInternPMale, maxNoInternPFemale, maxNoInternPCouples, maxNoInternPFamilies, maxNoInternP,
			maxNoStudentAMale, maxNoStudentAFemale, maxNoStudentACouples, maxNoStudentAFamilies, maxNoStudentA,
			maxNoStudentPMale, maxNoStudentPFemale, maxNoStudentPCouples, maxNoStudentPFamilies;

	/* end MS additions */

	/* Model change: added for PS 8 FIN upgrade ::: 2/14/03 SML */
	/* also note that get and set functions were added below for each of these */

	private String operatingBusinessUnit = "";
	private String operatingOperatingUnit = "";
	private String operatingDeptID = "";
	private String operatingProjectID = "";
	private String operatingDesignation = "";
	private String scholarshipBusinessUnit = "";
	private String scholarshipOperatingUnit = "";
	private String scholarshipDeptID = "";
	private String scholarshipProjectID = "";
	private String scholarshipDesignation = "";

	/* end PS 8 FIN additions */
	public String getWsnProjectID() {
		return String.valueOf(WsnProjectID);
	}
	public void setWsnProjectID(String WsnProjectID) {
		if (WsnProjectID != null) {
			this.WsnProjectID = Integer.parseInt(WsnProjectID);
		}
	} 
	public int getWsnProjectIdInt() {
		return WsnProjectID; 
	}
	public void setWsnProjectIdInt(int WsnProjectID) {
		this.WsnProjectID = WsnProjectID; 
	}
	public String getName() {
		return name; 
	}
	public void setName(String name) {
		this.name = name; 
	}
	public String getPartnershipRegion() {
		return partnershipRegion; 
	}
	public void setPartnershipRegion(String partnershipRegion) {
		this.partnershipRegion = partnershipRegion; 
	}
	public String getHistory() {
		return history; 
	}
	public void setHistory(String history) {
		this.history = history; 
	}
	public String getStartDate() {
		return startDate; 
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate; 
	}
	public String getStopDate() {
		return stopDate; 
	}
	public void setStopDate(String stopDate) {
		this.stopDate = stopDate; 
	}
	public String getCity() {
		return city; 
	}
	public void setCity(String city) {
		this.city = city; 
	}
	public String getCountry() {
		return country; 
	}
	public void setCountry(String country) {
		this.country = country; 
	}
	public String getDetails() {
		return details; 
	}
	public void setDetails(String details) {
		this.details = details; 
	}
	public String getStatus() {
		return status; 
	}
	public void setStatus(String status) {
		this.status = status; 
	}
	public String getDestinationGatewayCity() {
		return destinationGatewayCity; 
	}
	public void setDestinationGatewayCity(String destinationGatewayCity) {
		this.destinationGatewayCity = destinationGatewayCity; 
	}
	public String getDepartDateFromGateCity() {
		return departDateFromGateCity; 
	}
	public void setDepartDateFromGateCity(String departDateFromGateCity) {
		this.departDateFromGateCity = departDateFromGateCity; 
	}
	public String getArrivalDateAtLocation() {
		return arrivalDateAtLocation; 
	}
	public void setArrivalDateAtLocation(String arrivalDateAtLocation) {
		this.arrivalDateAtLocation = arrivalDateAtLocation; 
	}
	public String getLocationGatewayCity() {
		return locationGatewayCity; 
	}
	public void setLocationGatewayCity(String locationGatewayCity) {
		this.locationGatewayCity = locationGatewayCity; 
	}
	public String getDepartureDateFromLocation() {
		return departureDateFromLocation; 
	}
	public void setDepartureDateFromLocation(String departureDateFromLocation) {
		this.departureDateFromLocation = departureDateFromLocation; 
	}
	public String getArrivalDateAtGatewayCity() {
		return arrivalDateAtGatewayCity; 
	}
	public void setArrivalDateAtGatewayCity(String arrivalDateAtGatewayCity) {
		this.arrivalDateAtGatewayCity = arrivalDateAtGatewayCity; 
	}
	public String getFlightBudget() {
		return flightBudget; 
	}
	public void setFlightBudget(String flightBudget) {
		this.flightBudget = flightBudget; 
	}
	public String getGatewayCitytoLocationFlightNo() {
		return GatewayCitytoLocationFlightNo; 
	}
	public void setGatewayCitytoLocationFlightNo(String GatewayCitytoLocationFlightNo) {
		this.GatewayCitytoLocationFlightNo = GatewayCitytoLocationFlightNo; 
	}
	public String getLocationToGatewayCityFlightNo() {
		return locationToGatewayCityFlightNo; 
	}
	public void setLocationToGatewayCityFlightNo(String locationToGatewayCityFlightNo) {
		this.locationToGatewayCityFlightNo = locationToGatewayCityFlightNo; 
	}
	public String getInCountryContact() {
		return inCountryContact; 
	}
	public void setInCountryContact(String inCountryContact) {
		this.inCountryContact = inCountryContact; 
	}
	public String getScholarshipAccountNo() {
		return scholarshipAccountNo; 
	}
	public void setScholarshipAccountNo(String scholarshipAccountNo) {
		this.scholarshipAccountNo = scholarshipAccountNo; 
	}
	public String getOperatingAccountNo() {
		return operatingAccountNo; 
	}
	public void setOperatingAccountNo(String operatingAccountNo) {
		this.operatingAccountNo = operatingAccountNo; 
	}
	public String getAOA() {
		return AOA; 
	}
	public void setAOA(String AOA) {
		this.AOA = AOA; 
	}
	public String getMPTA() {
		return MPTA; 
	}
	public void setMPTA(String MPTA) {
		this.MPTA = MPTA; 
	}
	public String getStaffCost() {
		return staffCost; 
	}
	public void setStaffCost(String staffCost) {
		this.staffCost = staffCost; 
	}
	public String getStudentCost() {
		return studentCost; 
	}
	public void setStudentCost(String studentCost) {
		this.studentCost = studentCost; 
	}
	public boolean getInsuranceFormsReceived() {
		return insuranceFormsReceived; 
	}
	public void setInsuranceFormsReceived(boolean insuranceFormsReceived) {
		this.insuranceFormsReceived = insuranceFormsReceived; 
	}
	public boolean getCAPSFeePaid() {
		return CAPSFeePaid; 
	}
	public void setCAPSFeePaid(boolean CAPSFeePaid) {
		this.CAPSFeePaid = CAPSFeePaid; 
	}
	public boolean getAdminFeePaid() {
		return adminFeePaid; 
	}
	public void setAdminFeePaid(boolean adminFeePaid) {
		this.adminFeePaid = adminFeePaid; 
	}
	public String getStoriesXX() {
		return storiesXX; 
	}
	public void setStoriesXX(String storiesXX) {
		this.storiesXX = storiesXX; 
	}
	public String getStats() {
		return stats; 
	}
	public void setStats(String stats) {
		this.stats = stats; 
	}
	public boolean getSecure() {
		return secure; 
	}
	public void setSecure(boolean secure) {
		this.secure = secure; 
	}
	public String getDateCreated() {
		return dateCreated; 
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated; 
	}
	public String getLastUpdate() {
		return lastUpdate; 
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate; 
	}
	public int getMaxNoStaff() {
		return maxNoStaff; 
	}
	public void setMaxNoStaff(int maxNoStaff) {
		this.maxNoStaff = maxNoStaff; 
	}
	public int getMaxNoStudents() {
		return maxNoStudents; 
	}
	public void setMaxNoStudents(int maxNoStudents) {
		this.maxNoStudents = maxNoStudents; 
	}
	public boolean getProjEvalCompleted() {
		return projEvalCompleted; 
	}
	public void setProjEvalCompleted(boolean projEvalCompleted) {
		this.projEvalCompleted = projEvalCompleted; 
	}
	public int getEvangelisticExposures() {
		return evangelisticExposures; 
	}
	public void setEvangelisticExposures(int evangelisticExposures) {
		this.evangelisticExposures = evangelisticExposures; 
	}
	public int getReceivedChrist() {
		return receivedChrist; 
	}
	public void setReceivedChrist(int receivedChrist) {
		this.receivedChrist = receivedChrist; 
	}
	public int getJesusFilmExposures() {
		return jesusFilmExposures; 
	}
	public void setJesusFilmExposures(int jesusFilmExposures) {
		this.jesusFilmExposures = jesusFilmExposures; 
	}
	public int getJesusFilmReveivedChrist() {
		return jesusFilmReveivedChrist; 
	}
	public void setJesusFilmReveivedChrist(int jesusFilmReveivedChrist) {
		this.jesusFilmReveivedChrist = jesusFilmReveivedChrist; 
	}
	public int getCoverageActivitiesExposures() {
		return coverageActivitiesExposures; 
	}
	public void setCoverageActivitiesExposures(int coverageActivitiesExposures) {
		this.coverageActivitiesExposures = coverageActivitiesExposures; 
	}
	public int getCoverageActivitiesDecisions() {
		return coverageActivitiesDecisions; 
	}
	public void setCoverageActivitiesDecisions(int coverageActivitiesDecisions) {
		this.coverageActivitiesDecisions = coverageActivitiesDecisions; 
	}
	public int getHolySpiritDecisions() {
		return holySpiritDecisions; 
	}
	public void setHolySpiritDecisions(int holySpiritDecisions) {
		this.holySpiritDecisions = holySpiritDecisions; 
	}
	public String getWebsite() {
		return website; 
	}
	public void setWebsite(String website) {
		this.website = website; 
	}
	public String getDestinationAddress() {
		return destinationAddress; 
	}
	public void setDestinationAddress(String destinationAddress) {
		this.destinationAddress = destinationAddress; 
	}
	public String getDestinationPhone() {
		return destinationPhone; 
	}
	public void setDestinationPhone(String destinationPhone) {
		this.destinationPhone = destinationPhone; 
	}
	public String getWsnYear() {
		return wsnYear; 
	}
	public void setWsnYear(String wsnYear) {
		this.wsnYear = wsnYear; 
	}

	public Vector getIsMember() {
		WsnApplication person = new WsnApplication();
		person.setIsMemberId(this.getWsnProjectID());
		return person.selectList(); 
	}
	public void setIsMember(Collection isMember) {
		Iterator iter = isMember.iterator();
		while (iter.hasNext()) {
			WsnApplication person = (WsnApplication)iter.next();
			person.setIsMemberId(this.getWsnProjectID());
			person.persist();
		}
	}

	public String getIsCoordId() {
		return String.valueOf(fk_isCoord); 
	}
	public void setIsCoordId(int isCoord) {
		this.fk_isCoord = isCoord; 
	}
	public void setIsCoordIdStr(String isCoord) {
		if (isCoord != null && !isCoord.equals("")) {
			this.fk_isCoord = Integer.parseInt(isCoord); 
		}
	}
	public WsnApplication getIsCoord() {
		WsnApplication result = null;
		if (fk_isCoord != 0) { // && !fk_isCoord.equals("")) {
			result = new WsnApplication(fk_isCoord);
		}
		return result; 
	}
	public void setIsCoord(WsnApplication isCoord) {
		if (isCoord != null) {
			this.fk_isCoord = isCoord.getWsnApplicationIdInt();
		} 
		else {
			this.fk_isCoord = 0;
		}
	}
	public String getIsAPDId() {
		return String.valueOf(fk_isAPD); 
	}
	public void setIsAPDId(int isAPD) {
		this.fk_isAPD = isAPD; 
	}
	public void setIsAPDIdStr(String isAPD) {
		if (isAPD != null && !isAPD.equals("")) {
			this.fk_isAPD = Integer.parseInt(isAPD);
		}
	}
	public WsnApplication getIsAPD() {
		WsnApplication result = null;
		if (fk_isAPD != 0) { // && !fk_isAPD.equals("")) {
			result = new WsnApplication(fk_isAPD);
		}
		return result; 
	}
	public void setIsAPD(WsnApplication isAPD) {
		if (isAPD != null) {
			this.fk_isAPD = isAPD.getWsnApplicationIdInt();
		}
		else {
			this.fk_isAPD = 0;
		}
	}
	public String getIsPDId() {
		return String.valueOf(fk_isPD); 
	}
	public void setIsPDId(int isPD) {
		this.fk_isPD = isPD; 
	}
	public void setIsPDIdStr(String isPD) {
		if (isPD != null && !isPD.equals("")) {
			this.fk_isPD = Integer.parseInt(isPD); 
		}
	}
	public WsnApplication getIsPD() {
		WsnApplication result = null;
		if (fk_isPD != 0) { // && !fk_isPD.equals("")) {
			result = new WsnApplication(fk_isPD);
		} 
		return result;
	}
	public void setIsPD(WsnApplication isPD) {
		if (isPD != null) {
			this.fk_isPD = isPD.getWsnApplicationIdInt();
		}
		else {
			this.fk_isPD = 0; 
		}
	}

	/* Model change: functions added for Mobilization System Project :::: 5 September 2002 RDH */
	/* also note that the variables for these functions were declared above */

	public String getProjectType() { return projectType; }
	public void setProjectType(String projectType) { this.projectType = projectType; }
	public Date getStudentStartDate() { return studentStartDate; }
	public void setStudentStartDate(Date studentStartDate) { this.studentStartDate = org.alt60m.util.DateUtils.clearTimeFromDate(studentStartDate); }
	public Date getStudentEndDate() { return studentEndDate; }
	public void setStudentEndDate(Date studentEndDate) { this.studentEndDate = org.alt60m.util.DateUtils.clearTimeFromDate(studentEndDate); }
	public Date getStaffStartDate() { return staffStartDate; }
	public void setStaffStartDate(Date staffStartDate) { this.staffStartDate = org.alt60m.util.DateUtils.clearTimeFromDate(staffStartDate); }
	public Date getStaffEndDate() { return staffEndDate; }
	public void setStaffEndDate(Date staffEndDate) { this.staffEndDate = org.alt60m.util.DateUtils.clearTimeFromDate(staffEndDate); }
	public Date getLeadershipStartDate() { return leadershipStartDate; }
	public void setLeadershipStartDate(Date leadershipStartDate) { this.leadershipStartDate = org.alt60m.util.DateUtils.clearTimeFromDate(leadershipStartDate); }
	public Date getLeadershipEndDate() { return leadershipEndDate; }
	public void setLeadershipEndDate(Date leadershipEndDate) { this.leadershipEndDate = org.alt60m.util.DateUtils.clearTimeFromDate(leadershipEndDate); }

	public Date getCreateDate() { return createDate; }
	public void setCreateDate(Date createDate) { this.createDate = org.alt60m.util.DateUtils.clearTimeFromDate(createDate); }
	public Date getLastChangedDate() { return lastChangedDate; }
	public void setLastChangedDate(Date lastChangedDate) { this.lastChangedDate = org.alt60m.util.DateUtils.clearTimeFromDate(lastChangedDate); }
	
	public String getLastChangedBy() { return lastChangedBy; }
	public void setLastChangedBy(String lastChangedBy) { this.lastChangedBy = lastChangedBy; }
	public String getDisplayLocation() { return displayLocation; }
	public void setDisplayLocation(String displayLocation) { this.displayLocation = displayLocation; }
	public boolean getPartnershipRegionOnly() { return partnershipRegionOnly; }
	public void setPartnershipRegionOnly(boolean partnershipRegionOnly) { this.partnershipRegionOnly = partnershipRegionOnly; }
	public String getInternCost() { return internCost; }
	public void setInternCost(String internCost) { this.internCost = internCost; }
	public boolean getOnHold() { return onHold; }
	public void setOnHold(boolean onHold) { this.onHold = onHold; }

	public void setMaxNoStaffMale(int maxNoStaffMale) { this.maxNoStaffMale = maxNoStaffMale; }
	public void setMaxNoStaffFemale(int maxNoStaffFemale) { this.maxNoStaffFemale = maxNoStaffFemale; }
	public void setMaxNoStaffCouples(int maxNoStaffCouples) { this.maxNoStaffCouples = maxNoStaffCouples; }
	public void setMaxNoStaffFamilies(int maxNoStaffFamilies) { this.maxNoStaffFamilies = maxNoStaffFamilies; }
	public void setMaxNoInternAMale(int maxNoInternAMale) { this.maxNoInternAMale = maxNoInternAMale; }
	public void setMaxNoInternAFemale(int maxNoInternAFemale) { this.maxNoInternAFemale = maxNoInternAFemale; }
	public void setMaxNoInternACouples(int maxNoInternACouples) { this.maxNoInternACouples = maxNoInternACouples; }
	public void setMaxNoInternAFamilies(int maxNoInternAFamilies) { this.maxNoInternAFamilies = maxNoInternAFamilies; }
	public void setMaxNoInternA(int maxNoInternA) { this.maxNoInternA = maxNoInternA; }
	public void setMaxNoInternPMale(int maxNoInternPMale) { this.maxNoInternPMale = maxNoInternPMale; }
	public void setMaxNoInternPFemale(int maxNoInternPFemale) { this.maxNoInternPFemale = maxNoInternPFemale; }
	public void setMaxNoInternPCouples(int maxNoInternPCouples) { this.maxNoInternPCouples = maxNoInternPCouples; }
	public void setMaxNoInternPFamilies(int maxNoInternPFamilies) { this.maxNoInternPFamilies = maxNoInternPFamilies; }
	public void setMaxNoInternP(int maxNoInternP) { this.maxNoInternP = maxNoInternP; }
	public void setMaxNoStudentAMale(int maxNoStudentAMale) { this.maxNoStudentAMale = maxNoStudentAMale; }
	public void setMaxNoStudentAFemale(int maxNoStudentAFemale) { this.maxNoStudentAFemale = maxNoStudentAFemale; }
	public void setMaxNoStudentACouples(int maxNoStudentACouples) { this.maxNoStudentACouples = maxNoStudentACouples; }
	public void setMaxNoStudentAFamilies(int maxNoStudentAFamilies) { this.maxNoStudentAFamilies = maxNoStudentAFamilies; }
	public void setMaxNoStudentA(int maxNoStudentA) { this.maxNoStudentA = maxNoStudentA; }
	public void setMaxNoStudentPMale(int maxNoStudentPMale) { this.maxNoStudentPMale = maxNoStudentPMale; }
	public void setMaxNoStudentPFemale(int maxNoStudentPFemale) { this.maxNoStudentPFemale = maxNoStudentPFemale; }
	public void setMaxNoStudentPCouples(int maxNoStudentPCouples) { this.maxNoStudentPCouples = maxNoStudentPCouples; }
	public void setMaxNoStudentPFamilies(int maxNoStudentPFamilies) { this.maxNoStudentPFamilies = maxNoStudentPFamilies; }
	public int getMaxNoStaffMale(){ return maxNoStaffMale; }
	public int getMaxNoStaffFemale(){ return maxNoStaffFemale; }
	public int getMaxNoStaffCouples() { return maxNoStaffCouples; }
	public int getMaxNoStaffFamilies() { return maxNoStaffFamilies; }
	public int getMaxNoInternAMale() { return maxNoInternAMale; }
	public int getMaxNoInternAFemale() { return maxNoInternAFemale; }
	public int getMaxNoInternACouples() { return maxNoInternACouples; }
	public int getMaxNoInternAFamilies() { return maxNoInternAFamilies; }
	public int getMaxNoInternA() { return maxNoInternA; }
	public int getMaxNoInternPMale() { return maxNoInternPMale; }
	public int getMaxNoInternPFemale() { return maxNoInternPFemale; }
	public int getMaxNoInternPCouples() { return maxNoInternPCouples; }
	public int getMaxNoInternPFamilies() { return maxNoInternPFamilies; }
	public int getMaxNoInternP() { return maxNoInternP; }
	public int getMaxNoStudentAMale() { return maxNoStudentAMale; }
	public int getMaxNoStudentAFemale() { return maxNoStudentAFemale; }
	public int getMaxNoStudentACouples() { return maxNoStudentACouples; }
	public int getMaxNoStudentAFamilies() { return maxNoStudentAFamilies; }
	public int getMaxNoStudentA() { return maxNoStudentA; }
	public int getMaxNoStudentPMale() { return maxNoStudentPMale; }
	public int getMaxNoStudentPFemale() { return maxNoStudentPFemale; }
	public int getMaxNoStudentPCouples() { return maxNoStudentPCouples; }
	public int getMaxNoStudentPFamilies() { return maxNoStudentPFamilies; }

	/* end MS additions */

	/* Model change: added for PS 8 FIN upgrade ::: 2/14/03 SML */
	/* also note that the variables for these functions were declared above */
	public String getOperatingBusinessUnit() {
		return operatingBusinessUnit; 
	}
	public void setOperatingBusinessUnit(String operatingBusinessUnit) {
		this.operatingBusinessUnit = operatingBusinessUnit; 
	}

	public String getOperatingOperatingUnit() {
		return operatingOperatingUnit; 
	}
	public void setOperatingOperatingUnit(String operatingOperatingUnit) {
		this.operatingOperatingUnit = operatingOperatingUnit; 
	}

	public String getOperatingDeptID() {
		return operatingDeptID; 
	}
	public void setOperatingDeptID(String operatingDeptID) {
		this.operatingDeptID = operatingDeptID; 
	}

	public String getOperatingProjectID() {
		return operatingProjectID; 
	}
	public void setOperatingProjectID(String operatingProjectID) {
		this.operatingProjectID = operatingProjectID; 
	}

	public String getOperatingDesignation() {
		return operatingDesignation; 
	}
	public void setOperatingDesignation(String operatingDesignation) {
		this.operatingDesignation = operatingDesignation; 
	}

	public String getScholarshipBusinessUnit() {
		return scholarshipBusinessUnit; 
	}
	public void setScholarshipBusinessUnit(String scholarshipBusinessUnit) {
		this.scholarshipBusinessUnit = scholarshipBusinessUnit; 
	}

	public String getScholarshipOperatingUnit() {
		return scholarshipOperatingUnit; 
	}
	public void setScholarshipOperatingUnit(String scholarshipOperatingUnit) {
		this.scholarshipOperatingUnit = scholarshipOperatingUnit; 
	}

	public String getScholarshipDeptID() {
		return scholarshipDeptID; 
	}
	public void setScholarshipDeptID(String scholarshipDeptID) {
		this.scholarshipDeptID = scholarshipDeptID; 
	}

	public String getScholarshipProjectID() {
		return scholarshipProjectID; 
	}
	public void setScholarshipProjectID(String scholarshipProjectID) {
		this.scholarshipProjectID = scholarshipProjectID; 
	}

	public String getScholarshipDesignation() {
		return scholarshipDesignation; 
	}
	public void setScholarshipDesignation(String scholarshipDesignation) {
		this.scholarshipDesignation = scholarshipDesignation; 
	}

	/* end PS 8 FIN update additions */
	
	/* 4/16/06 Added 4 new fields to Wsn_Project table. Here are the get/set methods for the data
	 * to be entered in those fields.
	 */
	
	public String getStatesideContactName() {
		return statesideContactName;
	}
	
	public void setStatesideContactName(String statesideContactName) {
		this.statesideContactName = statesideContactName;
	}
	
	public String getStatesideContactProjectRole() {
		return statesideContactProjectRole;
	}
	
	public void setStatesideContactProjectRole(String statesideContactProjectRole) {
		this.statesideContactProjectRole = statesideContactProjectRole;
	}
	
	public String getStatesideContactPhone () {
		return statesideContactPhone;
	}
	
	public void setStatesideContactPhone(String statesideContactPhone) {
		this.statesideContactPhone = statesideContactPhone;
	}

	public String getStatesideContactEmail() {
		return statesideContactEmail;
	}
	
	public void setStatesideContactEmail(String statesideContactEmail) {
		this.statesideContactEmail = statesideContactEmail; 
	}
	
}
