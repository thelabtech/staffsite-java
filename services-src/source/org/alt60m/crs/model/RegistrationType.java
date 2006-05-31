package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.log.*;
import com.kenburcham.framework.system.*;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

public class RegistrationType extends DBIOEntity {

//	IDENTITY
	private int registrationTypeID = 0;

	public static String[] profileNames = { "Middle Initial", "Birthdate",
			"Current Address", "Current Phone Number", "Permanent Address",
			"Permanent Phone number", "Campus", "Year in School", "Grad Date",
			"Greek affiliation", "Arrival/Departure Dates", "Account Number",
			"Marital Status" };

	public static String[] regTypes = { "Student", "Staff", "Guest" };

//	KEY

	private String registrationType = "";		
	private String acceptCreditCards = "";
	private String acceptChecks = "";
	private String acceptEChecks = "";			
	private String acceptMinistryAcctTransfer = "";		
	private String acceptScholarships = "";		
	private String acceptStaffAcctTransfer = "";		
	private Date defaultDateArrive = null;	
	private Date defaultDateLeave = null;	
	private Date  preRegStart = null;
	private Date  preRegEnd = null;
	private float singlePreRegDeposit = 0;			
	private float singleOnsiteCost = 0;				
	private float singleCommuteCost = 0;				
	private float singleDiscountFullPayment = 0;		
	private float singleDiscountEarlyReg = 0;			
	private Date singleDiscountEarlyRegDate = null;	
	private float marriedPreRegDeposit = 0;			
	private float marriedOnsiteCost = 0;				
	private float marriedCommuteCost = 0;				
	private float marriedDiscountFullPayment = 0;		
	private float marriedDiscountEarlyReg = 0;			
	private Date marriedDiscountEarlyRegDate = null;	
	private int profileNumber = 0;			
	private int profileReqNumber = 0;		
	private String askChildren = "";		
	private String askSpouse = "";
	private String askChildCare = ""; // Added 1/12/05 SRW
	private String askAdditionalRooms = ""; // Added 1/12/05 SRW
	private String label = "";			
	private String description = "";
	private int displayOrder = 0;
	private int fk_ConferenceID = 0;


	public void localinit() throws DBIOEntityException {
		String table = "crs_registrationtype";

		setMetadata("RegistrationTypeID", "registrationTypeID", "IDENTITY");
		setMetadata("ConferenceID", "fk_ConferenceID", "KEY");

		setMetadata("AcceptCreditCardsString", "acceptCreditCards", table);
		setMetadata("AcceptChecksString", "acceptChecks", table);
		setMetadata("AcceptEChecksString", "acceptEChecks", table);
		setMetadata("AcceptMinistryAcctTransferString", "acceptMinistryAcctTransfer", table);
		setMetadata("AcceptScholarshipsString", "acceptScholarships", table);
		setMetadata("AcceptStaffAcctTransferString", "acceptStaffAcctTransfer", table);

		setMetadata("DefaultDateArrive", "defaultDateArrive", table);
		setMetadata("DefaultDateLeave", "defaultDateLeave", table);
		setMetadata("PreRegStart", "preRegStart", table);
		setMetadata("PreRegEnd", "preRegEnd", table);
		setMetadata("SinglePreRegDeposit", "singlePreRegDeposit", table);
		setMetadata("SingleOnsiteCost", "singleOnsiteCost", table);
		setMetadata("SingleCommuteCost", "singleCommuteCost", table);
		setMetadata("SingleDiscountFullPayment", "singleDiscountFullPayment", table);
		setMetadata("SingleDiscountEarlyReg", "singleDiscountEarlyReg", table);
		setMetadata("SingleDiscountEarlyRegDate", "singleDiscountEarlyRegDate", table);
		setMetadata("MarriedPreRegDeposit", "marriedPreRegDeposit", table);
		setMetadata("MarriedOnsiteCost", "marriedOnsiteCost", table);
		setMetadata("MarriedCommuteCost", "marriedCommuteCost", table);
		setMetadata("MarriedDiscountFullPayment", "marriedDiscountFullPayment", table);
		setMetadata("MarriedDiscountEarlyReg", "marriedDiscountEarlyReg", table);
		setMetadata("MarriedDiscountEarlyRegDate", "marriedDiscountEarlyRegDate", table);
		setMetadata("AskChildrenString", "askChildren", table);
		setMetadata("ProfileNumber", "profileNumber", table);
		setMetadata("ProfileReqNumber", "profileReqNumber", table);
		setMetadata("AskSpouseString", "askSpouse", table);
		setMetadata("AskChildCareString", "askChildCare", table); //Added 1/12/05 SRW
		setMetadata("AskAdditionalRoomsString", "askAdditionalRooms", table); //Added 1/12/05 SRW
		setMetadata("Description", "description", table);
		setMetadata("Label", "label", table);
		setMetadata("RegistrationType", "registrationType", table);
		setMetadata("DisplayOrder", "displayOrder", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getRegistrationTypeID() == 0;
	}

	public RegistrationType() {
	}

	public int getRegistrationTypeID() {
		return registrationTypeID;
	}

	public void setRegistrationTypeID(int registrationTypeID) {
		this.registrationTypeID = registrationTypeID;
	}

	public boolean getAcceptStaffAcctTransfer() {
		return acceptStaffAcctTransfer != null && acceptStaffAcctTransfer.equals("T");
	}

	public void setAcceptStaffAcctTransfer(boolean acceptStaffAcctTransfer) {
		this.acceptStaffAcctTransfer = acceptStaffAcctTransfer ? "T" : "F";
	}

	public String getAcceptStaffAcctTransferString() {
		return acceptStaffAcctTransfer;
	}

	public void setAcceptStaffAcctTransferString(String acceptStaffAcctTransfer) {
		this.acceptStaffAcctTransfer = acceptStaffAcctTransfer;
	}

	public boolean getAcceptMinistryAcctTransfer() {
		return acceptMinistryAcctTransfer != null && acceptMinistryAcctTransfer.equals("T");
	}

	public void setAcceptMinistryAcctTransfer(boolean acceptMinistryAcctTransfer) {
		this.acceptMinistryAcctTransfer = acceptMinistryAcctTransfer ? "T" : "F";
	}

	public String getAcceptMinistryAcctTransferString() {
		return acceptMinistryAcctTransfer;
	}

	public void setAcceptMinistryAcctTransferString(String acceptMinistryAcctTransfer) {
		this.acceptMinistryAcctTransfer = acceptMinistryAcctTransfer;
	}

	public boolean getAcceptCreditCards() {
		return acceptCreditCards != null && acceptCreditCards.equals("T");
	}

	public void setAcceptCreditCards(boolean acceptCreditCards) {
		this.acceptCreditCards = acceptCreditCards ? "T" : "F";
	}

	public String getAcceptCreditCardsString() {
		return acceptCreditCards;
	}

	public void setAcceptCreditCardsString(String acceptCreditCards) {
		this.acceptCreditCards = acceptCreditCards;
	}

	public boolean getAcceptChecks() {
		return acceptChecks != null && acceptChecks.equals("T");
	}

	public void setAcceptChecks(boolean acceptChecks) {
		this.acceptChecks = acceptChecks ? "T" : "F";
	}

	public String getAcceptChecksString() {
		return acceptChecks;
	}

	public void setAcceptChecksString(String acceptChecks) {
		this.acceptChecks = acceptChecks;
	}

	public boolean getAcceptEChecks() {
		return acceptEChecks != null && acceptEChecks.equals("T");
	}

	public void setAcceptEChecks(boolean acceptEChecks) {
		this.acceptEChecks = acceptEChecks ? "T" : "F";
	}

	public String getAcceptEChecksString() {
		return acceptEChecks;
	}

	public void setAcceptEChecksString(String acceptEChecks) {
		this.acceptEChecks = acceptEChecks;
	}

	public boolean getAcceptScholarships() {
		return acceptScholarships != null && acceptScholarships.equals("T");
	}

	public void setAcceptScholarships(boolean acceptScholarships) {
		this.acceptScholarships = acceptScholarships ? "T" : "F";
	}

	public String getAcceptScholarshipsString() {
		return acceptScholarships;
	}

	public void setAcceptScholarshipsString(String acceptScholarships) {
		this.acceptScholarships = acceptScholarships;
	}

	public Date getPreRegStart() {
		return preRegStart;
	}

	public void setPreRegStart(Date preRegStart) {
		this.preRegStart = org.alt60m.util.DateUtils
				.clearTimeFromDate(preRegStart);
	}

	public Date getPreRegEnd() {
		return preRegEnd;
	}

	public void setPreRegEnd(Date preRegEnd) {
		this.preRegEnd = org.alt60m.util.DateUtils.clearTimeFromDate(preRegEnd);
	}

	public Date getDefaultDateArrive() {
		return defaultDateArrive;
	}

	public void setDefaultDateArrive(Date defaultDateArrive) {
		this.defaultDateArrive = org.alt60m.util.DateUtils
				.clearTimeFromDate(defaultDateArrive);
	}

	public Date getDefaultDateLeave() {
		return defaultDateLeave;
	}

	public void setDefaultDateLeave(Date defaultDateLeave) {
		this.defaultDateLeave = org.alt60m.util.DateUtils
				.clearTimeFromDate(defaultDateLeave);
	}

	public float getSinglePreRegDeposit() {
		return singlePreRegDeposit;
	}

	public void setSinglePreRegDeposit(float preRegDeposit) {
		this.singlePreRegDeposit = preRegDeposit;
	}

	public float getMarriedPreRegDeposit() {
		return marriedPreRegDeposit;
	}

	public void setMarriedPreRegDeposit(float preRegDeposit) {
		this.marriedPreRegDeposit = preRegDeposit;
	}

	public float getSingleOnsiteCost() {
		return singleOnsiteCost;
	}

	public void setSingleOnsiteCost(float onsiteCost) {
		this.singleOnsiteCost = onsiteCost;
	}

	public float getSingleCommuteCost() {
		return singleCommuteCost;
	}

	public void setSingleCommuteCost(float commuteCost) {
		this.singleCommuteCost = commuteCost;
	}

	public float getSingleDiscountFullPayment() {
		return singleDiscountFullPayment;
	}

	public void setSingleDiscountFullPayment(float discountFullPayment) {
		this.singleDiscountFullPayment = discountFullPayment;
	}

	public float getSingleDiscountEarlyReg() {
		return singleDiscountEarlyReg;
	}

	public void setSingleDiscountEarlyReg(float discountEarlyReg) {
		this.singleDiscountEarlyReg = discountEarlyReg;
	}

	public Date getSingleDiscountEarlyRegDate() {
		return singleDiscountEarlyRegDate;
	}

	public void setSingleDiscountEarlyRegDate(Date discountEarlyRegDate) {
		this.singleDiscountEarlyRegDate = org.alt60m.util.DateUtils
				.clearTimeFromDate(discountEarlyRegDate);
	}

	public float getMarriedOnsiteCost() {
		return marriedOnsiteCost;
	}

	public void setMarriedOnsiteCost(float onsiteCost) {
		this.marriedOnsiteCost = onsiteCost;
	}

	public float getMarriedCommuteCost() {
		return marriedCommuteCost;
	}

	public void setMarriedCommuteCost(float commuteCost) {
		this.marriedCommuteCost = commuteCost;
	}

	public float getMarriedDiscountFullPayment() {
		return marriedDiscountFullPayment;
	}

	public void setMarriedDiscountFullPayment(float discountFullPayment) {
		this.marriedDiscountFullPayment = discountFullPayment;
	}

	public float getMarriedDiscountEarlyReg() {
		return marriedDiscountEarlyReg;
	}

	public void setMarriedDiscountEarlyReg(float discountEarlyReg) {
		this.marriedDiscountEarlyReg = discountEarlyReg;
	}

	public Date getMarriedDiscountEarlyRegDate() {
		return marriedDiscountEarlyRegDate;
	}

	public void setMarriedDiscountEarlyRegDate(Date discountEarlyRegDate) {
		this.marriedDiscountEarlyRegDate = org.alt60m.util.DateUtils
				.clearTimeFromDate(discountEarlyRegDate);
	}

	public int getProfileNumber() {
		return profileNumber;
	}

	public void setProfileNumber(int profileNumber) {
		this.profileNumber = profileNumber;
	}

	public int getProfileReqNumber() {
		return profileReqNumber;
	}

	public void setProfileReqNumber(int profileReqNumber) {
		this.profileReqNumber = profileReqNumber;
	}

	/**
	 * Finds out if a question should be asked for the given conference and
	 * registration type.
	 * 
	 * @param check -
	 *            the profile number to check for
	 * @return
	 *            <ul>
	 *            <li>0 - Don't ask question</li>
	 *            <li>1 - Ask question, don't require answer</li>
	 *            <li>2 - Ask question, require answer</li>
	 *            </ul>
	 */
	public int decodeProfile(int check) {
		return decodeNumber(profileNumber, profileReqNumber, check);
	}

	private int decodeNumber(int number, int req, int check) {
		return ((number & (int) java.lang.Math.pow(2, check)) == (int) java.lang.Math
				.pow(2, check)) ? (((req & (int) java.lang.Math.pow(2, check)) == (int) java.lang.Math
				.pow(2, check)) ? 2 : 1)
				: 0;
	}

	public boolean getAskChildren() {
		return askChildren != null && askChildren.equals("T");
	}

	public void setAskChildren(boolean askChildren) {
		this.askChildren = askChildren ? "T" : "F";
	}

	public String getAskChildrenString() {
		return askChildren;
	}

	public void setAskChildrenString(String askChildren) {
		this.askChildren = askChildren;
	}

	public boolean getAskSpouse() {
		return askSpouse != null && askSpouse.equals("T");
	}

	public void setAskSpouse(boolean askSpouse) {
		this.askSpouse = askSpouse ? "T" : "F";
	}

	public String getAskSpouseString() {
		return askSpouse;
	}
	
	public void setAskSpouseString(String askSpouse) {
		this.askSpouse = askSpouse;
	}
//	1/12/05 - Added getAskChildCare, setChildCare, getChildCareString,
//	setChildCareString methods -SRW
	public boolean getAskChildCare() {
		return askChildCare != null && askChildCare.equals("T");
	}

	public void setAskChildCare(boolean askChildCare) {
		this.askChildCare = askChildCare ? "T" : "F";
	}

	public String getAskChildCareString() {
		return askChildCare;
	}

	public void setAskChildCareString(String askChildCare) {
		this.askChildCare = askChildCare;
	}
	
//	1/12/05 SRW - Added getAskAdditionalRooms, setAskAdditionalRooms, 
//	getAskAdditionalRooms, setAskAdditionalRooms methods.
	public boolean getAskAdditionalRooms() {
		return askAdditionalRooms != null && askAdditionalRooms.equals("T");
	}

	public void setAskAdditionalRooms(boolean askAdditionalRooms) {
		this.askAdditionalRooms = askAdditionalRooms ? "T" : "F";
	}

	public String getAskAdditionalRoomsString() {
		return askAdditionalRooms;
	}

	public void setAskAdditionalRoomsString(String askAdditionalRooms) {
		this.askAdditionalRooms = askAdditionalRooms;
	}
	
	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description= description;
	}

	public String getRegistrationType() {
		return this.registrationType;
	}

	public void setRegistrationType(String type) {
		this.registrationType= type;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int order) {
		this.displayOrder= order;
	}

//	 Associations

	public int getConferenceID() {
		return fk_ConferenceID;
	}

	public void setConferenceID(int conferenceID) {
		this.fk_ConferenceID = conferenceID;
	}

	public Conference getConference() {
		Conference c = new Conference();
		c.setConferenceID(fk_ConferenceID);
		c.select();
		return c;
	}

	public void setConference(Conference c) {
		fk_ConferenceID = c.getConferenceID();
	}

	public Vector getRegistrations() {
		Registration r = new Registration();
		r.setConferenceID(fk_ConferenceID);
		r.setRegistrationTypeID(registrationTypeID);
		return r.selectList();
	}

	public Vector getRegistrations(String orderField, boolean DESC) {
		Registration r = new Registration();
		return r.selectList("fk_ConferenceID = '" + fk_ConferenceID
				+ "' AND fk_RegistrationTypeID = '" + registrationTypeID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocRegistration(Registration r) {
		r.setRegistrationTypeID(registrationTypeID);
		r.update();
	}

	public void dissocRegistration(Registration r) {
		r.setConferenceID(0);
		r.setRegistrationTypeID(0);
		r.update();
	}

	public Vector getQuestions() {
		Question q = new Question();
		q.setConferenceID(fk_ConferenceID);
		q.setRegistrationTypeID(registrationTypeID);
		return q.selectList();
	}

	public Vector getQuestions(String orderField, boolean DESC) {
		Question q = new Question();
		return q.selectList("fk_ConferenceID = '" + fk_ConferenceID
				+ "' AND fk_registrationTypeID = '" + registrationTypeID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocQuestion(Question q) {
		q.setConferenceID(fk_ConferenceID);
		q.setRegistrationTypeID(registrationTypeID);
		q.update();
	}

	public void dissocQuestion(Question q) {
		q.setConferenceID(0);
		q.setRegistrationTypeID(0);
		q.update();
	}

	public Vector getMerchandise() {
		Merchandise m = new Merchandise();
		m.setConferenceID(fk_ConferenceID);
		m.setRegistrationTypeID(registrationTypeID);
		return m.selectList();
	}

	public Vector getMerchandise(String orderField, boolean DESC) {
		Merchandise m = new Merchandise();
		return m.selectList("fk_ConferenceID = '" + fk_ConferenceID
				+ "' AND fk_registrationTypeID = '" + registrationTypeID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocMerchandise(Merchandise m) {
		m.setConferenceID(fk_ConferenceID);
		m.setRegistrationTypeID(registrationTypeID);
		m.update();
	}

	public void dissocMerchandise(Merchandise m) {
		m.setConferenceID(0);
		m.setRegistrationTypeID(0);
		m.update();
	}

}
