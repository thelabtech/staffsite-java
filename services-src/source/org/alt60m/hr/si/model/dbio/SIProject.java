package org.alt60m.hr.si.model.dbio;

import java.util.Date;
import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import org.alt60m.hr.si.servlet.dbio.SIUtil;
import org.alt60m.util.DateUtils;
/**
 * @persistent 
 * @table wsn_sp_WsnProject
 * @cache-type none
 * @access shared
 * @key-generator UUID
 */
public class SIProject extends DBIOEntity {
	public SIProject() {
//		createDate = DateUtils.clearTimeFromDate(new Date());
//		siYear = SIUtil.CURRENT_SI_YEAR;
	}
	public boolean persist() { return isPKEmpty() ? insert() : update(); }
	public boolean insert() {
		createDate = DateUtils.clearTimeFromDate(new Date());
		siYear = SIUtil.CURRENT_SI_YEAR;
		return super.insert();
	}
	public boolean isPKEmpty() {
		return SIProjectID == 0;
	}
	public SIProject(String id) {
		if(id != null) {
			SIProjectID = (new Integer(id)).intValue();
			select();
		}
	}
	public SIProject(int id) {
		SIProjectID = id;
		select();
	}

	public void localinit() {
		String table = "hr_si_Project";

		setMetadata("SIProjectID", "SIProjectID", "IDENTITY");
		setMetadata("Name", "name", table);
		setMetadata("PartnershipRegion", "partnershipRegion", table);
		setMetadata("History", "history", table);
		setMetadata("City", "city", table);
		setMetadata("Country", "country", table);
		setMetadata("Details", "details", table);
		setMetadata("Status", "status", table);
		setMetadata("DestinationGatewayCity", "destinationGatewayCity", table);
		setMetadata("DepartDateFromGateCity", "departDateFromGateCity", table);
		setMetadata("ArrivalDateAtLocation", "arrivalDateAtLocation", table);
		setMetadata("LocationGatewayCity", "locationGatewayCity", table);
		setMetadata("DepartDateFromLocation", "departDateFromLocation", table);
		setMetadata("ArrivalDateAtGatewayCity", "arrivalDateAtGatewayCity", table);
		setMetadata("FlightBudget", "flightBudget", table);
		setMetadata("GatewayCitytoLocationFlightNo", "gatewayCitytoLocationFlightNo", table);
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
		setMetadata("StudentCostExplaination", "studentCostExplaination", table);
		setMetadata("Stats", "stats", table);
		setMetadata("Secure", "secure", table);
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
		setMetadata("SiYear", "siYear", table);
		setMetadata("Fk_isCoord", "fk_isCoord", table);
		setMetadata("Fk_isAPD", "fk_isAPD", table);
		setMetadata("Fk_isPD", "fk_isPD", table);
		setMetadata("ProjectType", "projectType", table);
		setMetadata("StudentStartDate", "studentStartDate", table);
		setMetadata("StudentEndDate", "studentEndDate", table);
		setMetadata("StaffStartDate", "staffStartDate", table);
		setMetadata("StaffEndDate", "staffEndDate", table);
		setMetadata("LeadershipStartDate", "leadershipStartDate", table);
		setMetadata("LeadershipEndDate", "leadershipEndDate", table);
		setMetadata("CreateDate", "createDate", table);
		setMetadata("LastChangedBy", "lastChangedBy", table);
		setMetadata("DisplayLocation", "displayLocation", table);
		setMetadata("PartnershipRegionOnly", "partnershipRegionOnly", table);
		setMetadata("InternCost", "internCost", table);
		setMetadata("OnHold", "onHold", table);
		setMetadata("MaxNoStaffPMale", "maxNoStaffPMale", table);
		setMetadata("MaxNoStaffPFemale", "maxNoStaffPFemale", table);
		setMetadata("MaxNoStaffPCouples", "maxNoStaffPCouples", table);
		setMetadata("MaxNoStaffPFamilies", "maxNoStaffPFamilies", table);
		setMetadata("MaxNoStaffP", "maxNoStaffP", table);
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
		setMetadata("MaxNoStudentP", "maxNoStudentP", table);

		setAutodetectProperties(false);
	}

	private int SIProjectID = 0,
		flightBudget,
		staffCost,
		studentCost,
		evangelisticExposures,
		receivedChrist,
		jesusFilmExposures,
		jesusFilmReveivedChrist,
		coverageActivitiesExposures,
		coverageActivitiesDecisions,
		holySpiritDecisions,
		internCost,
		maxNoStaffPMale,
		maxNoStaffPFemale,
		maxNoStaffPCouples,
		maxNoStaffPFamilies,
		maxNoStaffP,
		maxNoInternAMale,
		maxNoInternAFemale,
		maxNoInternACouples,
		maxNoInternAFamilies,
		maxNoInternA,
		maxNoInternPMale,
		maxNoInternPFemale,
		maxNoInternPCouples,
		maxNoInternPFamilies,
		maxNoInternP,
		maxNoStudentAMale,
		maxNoStudentAFemale,
		maxNoStudentACouples,
		maxNoStudentAFamilies,
		maxNoStudentA,
		maxNoStudentPMale,
		maxNoStudentPFemale,
		maxNoStudentPCouples,
		maxNoStudentPFamilies,
		maxNoStudentP;

	private String name = "",
		partnershipRegion = "",
		history = "",
		city = "",
		country = "",
		details = "",
		status = "",
		destinationGatewayCity = "",
		locationGatewayCity = "",
		gatewayCitytoLocationFlightNo = "",
		locationToGatewayCityFlightNo = "",
		inCountryContact = "",
		scholarshipAccountNo = "",
		operatingAccountNo = "",
		AOA = "",
		MPTA = "",
		storiesXX = "",
		studentCostExplaination = "",
		stats = "",
		website = "",
		destinationAddress = "",
		destinationPhone = "",
		siYear = "",
		displayLocation;
	// projectType is a char in the database
	private String projectType;

	/* The following are SI_Person keys. They may be changed to ints before we deploy this.
	lastChangedBy may end up being the email address or staffSiteProfileID of whomever is
	logged in and changing this. */
	private String lastChangedBy, fk_isCoord, fk_isAPD, fk_isPD;

	private Date departDateFromGateCity, arrivalDateAtLocation, departDateFromLocation, arrivalDateAtGatewayCity, studentStartDate, studentEndDate, staffStartDate, staffEndDate, leadershipStartDate, leadershipEndDate, createDate;

	private boolean insuranceFormsReceived, CAPSFeePaid, adminFeePaid, secure, projEvalCompleted, partnershipRegionOnly, onHold;

	// private java.SQL.Timestamp lastChangedDate = "";

	public int getSIProjectID() {
		return SIProjectID;
	}
	public void setSIProjectID(int SIProjectID) {
		this.SIProjectID = SIProjectID;
	}
	public int getFlightBudget() {
		return flightBudget;
	}
	public void setFlightBudget(int flightBudget) {
		this.flightBudget = flightBudget;
	}
	public int getStaffCost() {
		return staffCost;
	}
	public void setStaffCost(int staffCost) {
		this.staffCost = staffCost;
	}
	public int getStudentCost() {
		return studentCost;
	}
	public void setStudentCost(int studentCost) {
		this.studentCost = studentCost;
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
	public int getInternCost() {
		return internCost;
	}
	public void setInternCost(int internCost) {
		this.internCost = internCost;
	}
	public int getMaxNoStaffPMale() {
		return maxNoStaffPMale;
	}
	public void setMaxNoStaffPMale(int maxNoStaffPMale) {
		this.maxNoStaffPMale = maxNoStaffPMale;
	}
	public int getMaxNoStaffPFemale() {
		return maxNoStaffPFemale;
	}
	public void setMaxNoStaffPFemale(int maxNoStaffPFemale) {
		this.maxNoStaffPFemale = maxNoStaffPFemale;
	}
	public int getMaxNoStaffPCouples() {
		return maxNoStaffPCouples;
	}
	public void setMaxNoStaffPCouples(int maxNoStaffPCouples) {
		this.maxNoStaffPCouples = maxNoStaffPCouples;
	}
	public int getMaxNoStaffPFamilies() {
		return maxNoStaffPFamilies;
	}
	public void setMaxNoStaffPFamilies(int maxNoStaffPFamilies) {
		this.maxNoStaffPFamilies = maxNoStaffPFamilies;
	}
	public int getMaxNoStaffP() {
		return maxNoStaffP;
	}
	public void setMaxNoStaffP(int maxNoStaffP) {
		this.maxNoStaffP = maxNoStaffP;
	}
	public int getMaxNoInternAMale() {
		return maxNoInternAMale;
	}
	public void setMaxNoInternAMale(int maxNoInternAMale) {
		this.maxNoInternAMale = maxNoInternAMale;
	}
	public int getMaxNoInternAFemale() {
		return maxNoInternAFemale;
	}
	public void setMaxNoInternAFemale(int maxNoInternAFemale) {
		this.maxNoInternAFemale = maxNoInternAFemale;
	}
	public int getMaxNoInternACouples() {
		return maxNoInternACouples;
	}
	public void setMaxNoInternACouples(int maxNoInternACouples) {
		this.maxNoInternACouples = maxNoInternACouples;
	}
	public int getMaxNoInternAFamilies() {
		return maxNoInternAFamilies;
	}
	public void setMaxNoInternAFamilies(int maxNoInternAFamilies) {
		this.maxNoInternAFamilies = maxNoInternAFamilies;
	}
	public int getMaxNoInternA() {
		return maxNoInternA;
	}
	public void setMaxNoInternA(int maxNoInternA) {
		this.maxNoInternA = maxNoInternA;
	}
	public int getMaxNoInternPMale() {
		return maxNoInternPMale;
	}
	public void setMaxNoInternPMale(int maxNoInternPMale) {
		this.maxNoInternPMale = maxNoInternPMale;
	}
	public int getMaxNoInternPFemale() {
		return maxNoInternPFemale;
	}
	public void setMaxNoInternPFemale(int maxNoInternPFemale) {
		this.maxNoInternPFemale = maxNoInternPFemale;
	}
	public int getMaxNoInternPCouples() {
		return maxNoInternPCouples;
	}
	public void setMaxNoInternPCouples(int maxNoInternPCouples) {
		this.maxNoInternPCouples = maxNoInternPCouples;
	}
	public int getMaxNoInternPFamilies() {
		return maxNoInternPFamilies;
	}
	public void setMaxNoInternPFamilies(int maxNoInternPFamilies) {
		this.maxNoInternPFamilies = maxNoInternPFamilies;
	}
	public int getMaxNoInternP() {
		return maxNoInternP;
	}
	public void setMaxNoInternP(int maxNoInternP) {
		this.maxNoInternP = maxNoInternP;
	}
	public int getMaxNoStudentAMale() {
		return maxNoStudentAMale;
	}
	public void setMaxNoStudentAMale(int maxNoStudentAMale) {
		this.maxNoStudentAMale = maxNoStudentAMale;
	}
	public int getMaxNoStudentAFemale() {
		return maxNoStudentAFemale;
	}
	public void setMaxNoStudentAFemale(int maxNoStudentAFemale) {
		this.maxNoStudentAFemale = maxNoStudentAFemale;
	}
	public int getMaxNoStudentACouples() {
		return maxNoStudentACouples;
	}
	public void setMaxNoStudentACouples(int maxNoStudentACouples) {
		this.maxNoStudentACouples = maxNoStudentACouples;
	}
	public int getMaxNoStudentAFamilies() {
		return maxNoStudentAFamilies;
	}
	public void setMaxNoStudentAFamilies(int maxNoStudentAFamilies) {
		this.maxNoStudentAFamilies = maxNoStudentAFamilies;
	}
	public int getMaxNoStudentA() {
		return maxNoStudentA;
	}
	public void setMaxNoStudentA(int maxNoStudentA) {
		this.maxNoStudentA = maxNoStudentA;
	}
	public int getMaxNoStudentPMale() {
		return maxNoStudentPMale;
	}
	public void setMaxNoStudentPMale(int maxNoStudentPMale) {
		this.maxNoStudentPMale = maxNoStudentPMale;
	}
	public int getMaxNoStudentPFemale() {
		return maxNoStudentPFemale;
	}
	public void setMaxNoStudentPFemale(int maxNoStudentPFemale) {
		this.maxNoStudentPFemale = maxNoStudentPFemale;
	}
	public int getMaxNoStudentPCouples() {
		return maxNoStudentPCouples;
	}
	public void setMaxNoStudentPCouples(int maxNoStudentPCouples) {
		this.maxNoStudentPCouples = maxNoStudentPCouples;
	}
	public int getMaxNoStudentPFamilies() {
		return maxNoStudentPFamilies;
	}
	public void setMaxNoStudentPFamilies(int maxNoStudentPFamilies) {
		this.maxNoStudentPFamilies = maxNoStudentPFamilies;
	}
	public int getMaxNoStudentP() {
		return maxNoStudentP;
	}
	public void setMaxNoStudentP(int maxNoStudentP) {
		this.maxNoStudentP = maxNoStudentP;
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
	public String getLocationGatewayCity() {
		return locationGatewayCity;
	}
	public void setLocationGatewayCity(String locationGatewayCity) {
		this.locationGatewayCity = locationGatewayCity;
	}
	public String getGatewayCitytoLocationFlightNo() {
		return gatewayCitytoLocationFlightNo;
	}
	public void setGatewayCitytoLocationFlightNo(String gatewayCitytoLocationFlightNo) {
		this.gatewayCitytoLocationFlightNo = gatewayCitytoLocationFlightNo;
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
	public String getStudentCostExplaination() {
		return studentCostExplaination;
	}
	public void setStudentCostExplaination(String studentCostExplaination) {
		this.studentCostExplaination = studentCostExplaination;
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
	public String getSiYear() {
		return siYear;
	}
	public void setSiYear(String siYear) {
		this.siYear = siYear;
	}
	public String getDisplayLocation() {
		return displayLocation;
	}
	public void setDisplayLocation(String displayLocation) {
		this.displayLocation = displayLocation;
	}
	public String getLastChangedBy() {
		return lastChangedBy;
	}
	public void setLastChangedBy(String lastChangedBy) {
		this.lastChangedBy = lastChangedBy;
	}
	public String getFk_isCoord() {
		return fk_isCoord;
	}
	public void setFk_isCoord(String fk_isCoord) {
		this.fk_isCoord = fk_isCoord;
	}
	public String getFk_isAPD() {
		return fk_isAPD;
	}
	public void setFk_isAPD(String fk_isAPD) {
		this.fk_isAPD = fk_isAPD;
	}
	public String getFk_isPD() {
		return fk_isPD;
	}
	public void setFk_isPD(String fk_isPD) {
		this.fk_isPD = fk_isPD;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public Date getDepartDateFromGateCity() {
		return departDateFromGateCity;
	}
	public void setDepartDateFromGateCity(Date departDateFromGateCity) {
		this.departDateFromGateCity = departDateFromGateCity;
	}
	public Date getArrivalDateAtLocation() {
		return arrivalDateAtLocation;
	}
	public void setArrivalDateAtLocation(Date arrivalDateAtLocation) {
		this.arrivalDateAtLocation = arrivalDateAtLocation;
	}
	public Date getDepartDateFromLocation() {
		return departDateFromLocation;
	}
	public void setDepartDateFromLocation(Date departDateFromLocation) {
		this.departDateFromLocation = departDateFromLocation;
	}
	public Date getArrivalDateAtGatewayCity() {
		return arrivalDateAtGatewayCity;
	}
	public void setArrivalDateAtGatewayCity(Date arrivalDateAtGatewayCity) {
		this.arrivalDateAtGatewayCity = arrivalDateAtGatewayCity;
	}
	public Date getStudentStartDate() {
		return studentStartDate;
	}
	public void setStudentStartDate(Date studentStartDate) {
		this.studentStartDate = studentStartDate;
	}
	public Date getStudentEndDate() {
		return studentEndDate;
	}
	public void setStudentEndDate(Date studentEndDate) {
		this.studentEndDate = studentEndDate;
	}
	public Date getStaffStartDate() {
		return staffStartDate;
	}
	public void setStaffStartDate(Date staffStartDate) {
		this.staffStartDate = staffStartDate;
	}
	public Date getStaffEndDate() {
		return staffEndDate;
	}
	public void setStaffEndDate(Date staffEndDate) {
		this.staffEndDate = staffEndDate;
	}
	public Date getLeadershipStartDate() {
		return leadershipStartDate;
	}
	public void setLeadershipStartDate(Date leadershipStartDate) {
		this.leadershipStartDate = leadershipStartDate;
	}
	public Date getLeadershipEndDate() {
		return leadershipEndDate;
	}
	public void setLeadershipEndDate(Date leadershipEndDate) {
		this.leadershipEndDate = leadershipEndDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
	public boolean getSecure() {
		return secure;
	}
	public void setSecure(boolean secure) {
		this.secure = secure;
	}
	public boolean getProjEvalCompleted() {
		return projEvalCompleted;
	}
	public void setProjEvalCompleted(boolean projEvalCompleted) {
		this.projEvalCompleted = projEvalCompleted;
	}
	public boolean getPartnershipRegionOnly() {
		return partnershipRegionOnly;
	}
	public void setPartnershipRegionOnly(boolean partnershipRegionOnly) {
		this.partnershipRegionOnly = partnershipRegionOnly;
	}
	public boolean getOnHold() {
		return onHold;
	}
	public void setOnHold(boolean onHold) {
		this.onHold = onHold;
	}
}
