package org.alt60m.crs.model;

import com.kenburcham.framework.dbio.DBIOEntity;
import com.kenburcham.framework.dbio.DBIOEntityException;
import java.util.*;

/**
 * @author andy
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class Conference extends DBIOEntity {
	//IDENTITY
	private int conferenceID = 0;

	public static String[] profileNames = { "Middle Initial", "Birthdate",
			"Current Address", "Current Phone Number", "Permanent Address",
			"Permanent Phone number", "Campus", "Year in School", "Grad Date",
			"Greek affiliation", "Arrival/Departure Dates", "Account Number",
			"Marital Status" };

	//KEY

	private Date createDate = null;

	private String name = "";

	private String theme = "";

	private String password = "";

	private String staffPassword = "";

	private String region = "";

	private String briefDescription = "";

	private String contactName = "";

	private String contactEmail = "";

	private String contactPhone = "";

	private String contactAddress1 = "";

	private String contactAddress2 = "";

	private String contactCity = "";

	private String contactState = "";

	private String contactZip = "";

	private String splashPageURL = "";

	private String acceptVisa = "";

	private String acceptMasterCard = "";

	private String acceptAmericanExpress = "";

	private String acceptDiscover = "";

	private String acceptScholarships = "";

	private String acceptEChecks = "";

	private String authnetPassword = "";

	private Date preRegStart = null;

	private Date preRegEnd = null;

	private Date masterDefaultDateArrive = null;

	private Date masterDefaultDateLeave = null;

	private Date defaultDateStaffArrive = null;

	private Date defaultDateStaffLeave = null;

	private Date defaultDateGuestArrive = null;

	private Date defaultDateGuestLeave = null;

	private Date defaultDateStudentArrive = null;

	private Date defaultDateStudentLeave = null;
	
	private String isCloaked = ""; //Added 12/15/05 SRW

	private float onsiteCost = 0;

	private float commuterCost = 0;

	private float preRegDeposit = 0;

	private float discountFullPayment = 0;

	private float discountEarlyReg = 0;

	private Date discountEarlyRegDate = null;

	private String checkPayableTo = "";

	private String merchantAcctNum = "";

	private String confirmationEmail = "";

	private String confImageID = "";

	private String fontFace = "";

	private String backgroundColor = "";

	private String backgroundColor2 = "";

	private String backgroundColor3 = "";

	private String foregroundColor = "";

	private String highlightColor = "";

	private String highlightColor2 = "";

	private String requiredColor = "";

	private int guestProfileNumber = 0;

	private int guestProfileReqNumber = 0;

	private int studentProfileNumber = 0;

	private int studentProfileReqNumber = 0;

	private int staffProfileNumber = 0;

	private int staffProfileReqNumber = 0;

	private String askStudentChildren = "";

	private String askGuestChildren = "";

	private String askStaffChildren = "";

	private String askStudentSpouse = "";

	private String askGuestSpouse = "";

	private String askStaffSpouse = "";

	private String studentLabel = "";

	private String guestLabel = "";

	private String staffLabel = "";

	private String studentDesc = "";

	private String guestDesc = "";

	private String staffDesc = "";
	
	private String ministryType = ""; //Added 2/22/2006 SRW

	public void localinit() throws DBIOEntityException {
		String table = "crs_conference";

		setMetadata("ConferenceID", "conferenceID", "IDENTITY");

		setMetadata("Name", "name", table);
		setMetadata("Theme", "theme", table);
		setMetadata("Password", "password", table);
		setMetadata("StaffPassword", "staffPassword", table);
		setMetadata("Region", "region", table);
		setMetadata("BriefDescription", "briefDescription", table);
		setMetadata("ContactName", "contactName", table);
		setMetadata("ContactEmail", "contactEmail", table);
		setMetadata("ContactPhone", "contactPhone", table);
		setMetadata("ContactAddress1", "contactAddress1", table);
		setMetadata("ContactAddress2", "contactAddress2", table);
		setMetadata("ContactCity", "contactCity", table);
		setMetadata("ContactState", "contactState", table);
		setMetadata("ContactZip", "contactZip", table);
		setMetadata("SplashPageURL", "splashPageURL", table);
		setMetadata("AcceptVisaString", "acceptVisa", table);
		setMetadata("AcceptMasterCardString", "acceptMasterCard", table);
		setMetadata("AcceptAmericanExpressString", "acceptAmericanExpress",
				table);
		setMetadata("AcceptDiscoverString", "acceptDiscover", table);
		setMetadata("AcceptScholarshipsString", "acceptScholarships", table);
		setMetadata("AcceptEChecksString", "acceptEChecks", table);
		setMetadata("AuthnetPassword", "authnetPassword", table);
		setMetadata("PreRegStart", "preRegStart", table);
		setMetadata("PreRegEnd", "preRegEnd", table);
		setMetadata("MasterDefaultDateArrive", "masterDefaultDateArrive", table);
		setMetadata("MasterDefaultDateLeave", "masterDefaultDateLeave", table);
		setMetadata("DefaultDateStaffArrive", "defaultDateStaffArrive", table);
		setMetadata("DefaultDateStaffLeave", "defaultDateStaffLeave", table);
		setMetadata("DefaultDateGuestArrive", "defaultDateGuestArrive", table);
		setMetadata("DefaultDateGuestLeave", "defaultDateGuestLeave", table);
		setMetadata("DefaultDateStudentArrive", "defaultDateStudentArrive",
				table);
		setMetadata("DefaultDateStudentLeave", "defaultDateStudentLeave", table);
		setMetadata("IsCloakedString", "isCloaked", table); //Added 12/15/05 SRW
		setMetadata("OnsiteCost", "onsiteCost", table);
		setMetadata("CommuterCost", "commuterCost", table);
		setMetadata("PreRegDeposit", "preRegDeposit", table);
		setMetadata("DiscountFullPayment", "discountFullPayment", table);
		setMetadata("DiscountEarlyReg", "discountEarlyReg", table);
		setMetadata("DiscountEarlyRegDate", "discountEarlyRegDate", table);
		setMetadata("CheckPayableTo", "checkPayableTo", table);
		setMetadata("MerchantAcctNum", "merchantAcctNum", table);
		setMetadata("ConfImageID", "confImageID", table);
		setMetadata("FontFace", "fontFace", table);
		setMetadata("BackgroundColor", "backgroundColor", table);
		setMetadata("ForegroundColor", "foregroundColor", table);
		setMetadata("HighlightColor", "highlightColor", table);
		setMetadata("BackgroundColor2", "backgroundColor2", table);
		setMetadata("BackgroundColor3", "backgroundColor3", table);
		setMetadata("RequiredColor", "requiredColor", table);
		setMetadata("HighlightColor2", "highlightColor2", table);
		setMetadata("ConfirmationEmail", "confirmationEmail", table);

		setMetadata("AskStaffChildrenString", "askStaffChildren", table);
		setMetadata("AskGuestChildrenString", "askGuestChildren", table);
		setMetadata("AskStudentChildrenString", "askStudentChildren", table);

		setMetadata("GuestProfileNumber", "guestProfileNumber", table);
		setMetadata("GuestProfileReqNumber", "guestProfileReqNumber", table);
		setMetadata("StaffProfileNumber", "staffProfileNumber", table);
		setMetadata("StaffProfileReqNumber", "staffProfileReqNumber", table);
		setMetadata("StudentProfileNumber", "studentProfileNumber", table);
		setMetadata("StudentProfileReqNumber", "studentProfileReqNumber", table);

		setMetadata("AskStaffSpouseString", "askStaffSpouse", table);
		setMetadata("AskGuestSpouseString", "askGuestSpouse", table);
		setMetadata("AskStudentSpouseString", "askStudentSpouse", table);

		setMetadata("StaffDesc", "staffDesc", table);
		setMetadata("StudentDesc", "studentDesc", table);
		setMetadata("GuestDesc", "guestDesc", table);

		setMetadata("StaffLabel", "staffLabel", table);
		setMetadata("StudentLabel", "studentLabel", table);
		setMetadata("GuestLabel", "guestLabel", table);
		setMetadata("MinistryType", "ministryType", table);

		// For migration
		setMetadata("AcceptCreditCardsString", "acceptCreditCards", table);

		setAutodetectProperties(false);
	}

	public boolean isPKEmpty() {
		return getConferenceID() == 0;
	}

	public Conference() {
		createDate = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
	}

	public int getConferenceID() {
		return conferenceID;
	}

	public void setConferenceID(int conferenceID) {
		this.conferenceID = conferenceID;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = org.alt60m.util.DateUtils.clearTimeFromDate(createDate);
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTheme() {
		return this.theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStaffPassword() {
		return this.staffPassword;
	}

	public void setStaffPassword(String staffPassword) {
		this.staffPassword = staffPassword;
	}

	public String getRegion() {
		return this.region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getBriefDescription() {
		return this.briefDescription;
	}

	public void setBriefDescription(String briefDescription) {
		this.briefDescription = briefDescription;
	}

	public String getContactName() {
		return this.contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactEmail() {
		return this.contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactPhone() {
		return this.contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getContactAddress1() {
		return this.contactAddress1;
	}

	public void setContactAddress1(String contactAddress1) {
		this.contactAddress1 = contactAddress1;
	}

	public String getContactAddress2() {
		return this.contactAddress2;
	}

	public void setContactAddress2(String contactAddress2) {
		this.contactAddress2 = contactAddress2;
	}

	public String getContactCity() {
		return this.contactCity;
	}

	public void setContactCity(String contactCity) {
		this.contactCity = contactCity;
	}

	public String getContactState() {
		return this.contactState;
	}

	public void setContactState(String contactState) {
		this.contactState = contactState;
	}

	public String getContactZip() {
		return this.contactZip;
	}

	public void setContactZip(String contactZip) {
		this.contactZip = contactZip;
	}

	public String getSplashPageURL() {
		return this.splashPageURL;
	}

	public void setSplashPageURL(String splashPageURL) {
		this.splashPageURL = splashPageURL;
	}

	public String getConfirmationEmail() {
		return confirmationEmail;
	}

	public void setConfirmationEmail(String confirmationEmail) {
		this.confirmationEmail = confirmationEmail;
	}

	public boolean getAcceptVisa() {
		return acceptVisa != null && acceptVisa.equals("T");
	}

	public void setAcceptVisa(boolean acceptVisa) {
		this.acceptVisa = acceptVisa ? "T" : "F";
	}

	public String getAcceptVisaString() {
		return acceptVisa;
	}

	public void setAcceptVisaString(String acceptVisa) {
		this.acceptVisa = acceptVisa;
	}

	public boolean getAcceptMasterCard() {
		return acceptMasterCard != null && acceptMasterCard.equals("T");
	}	

	public void setAcceptMasterCard(boolean acceptMasterCard) {
		this.acceptMasterCard = acceptMasterCard ? "T" : "F";
	}

	public String getAcceptMasterCardString() {
		return acceptMasterCard;
	}

	public void setAcceptMasterCardString(String acceptMasterCard) {
		this.acceptMasterCard = acceptMasterCard;
	}

	public boolean getAcceptAmericanExpress() {
		return acceptAmericanExpress != null
				&& acceptAmericanExpress.equals("T");
	}

	public void setAcceptAmericanExpress(boolean acceptAmericanExpress) {
		this.acceptAmericanExpress = acceptAmericanExpress ? "T" : "F";
	}

	public String getAcceptAmericanExpressString() {
		return acceptAmericanExpress;
	}

	public void setAcceptAmericanExpressString(String acceptAmericanExpress) {
		this.acceptAmericanExpress = acceptAmericanExpress;
	}

	public boolean getAcceptDiscover() {
		return acceptDiscover != null && acceptDiscover.equals("T");
	}

	public void setAcceptDiscover(boolean acceptDiscover) {
		this.acceptDiscover = acceptDiscover ? "T" : "F";
	}

	public String getAcceptDiscoverString() {
		return acceptDiscover;
	}

	public void setAcceptDiscoverString(String acceptDiscover) {
		this.acceptDiscover = acceptDiscover;
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

	public String getAuthnetPassword() {
		return authnetPassword;
	}

	public void setAuthnetPassword(String authnetPassword) {
		this.authnetPassword = authnetPassword;
	}

	public Date getPreRegStart() {
		return preRegStart;
	}

	public void setPreRegStart(Date preRegStart) {
		this.preRegStart = org.alt60m.util.DateUtils.clearTimeFromDate(preRegStart);
	}

	public Date getPreRegEnd() {
		return preRegEnd;
	}

	public void setPreRegEnd(Date preRegEnd) {
		this.preRegEnd = org.alt60m.util.DateUtils.clearTimeFromDate(preRegEnd);
	}

	public Date getMasterDefaultDateArrive() {
		return masterDefaultDateArrive;
	}

	public void setMasterDefaultDateArrive(Date masterDefaultDateArrive) {
		this.masterDefaultDateArrive = org.alt60m.util.DateUtils.clearTimeFromDate(masterDefaultDateArrive);
	}

	public Date getMasterDefaultDateLeave() {
		return masterDefaultDateLeave;
	}

	public void setMasterDefaultDateLeave(Date masterDefaultDateLeave) {
		this.masterDefaultDateLeave = org.alt60m.util.DateUtils.clearTimeFromDate(masterDefaultDateLeave);
	}

	public Date getDefaultDateStaffArrive() {
		return defaultDateStaffArrive;
	}

	public void setDefaultDateStaffArrive(Date defaultDateStaffArrive) {
		this.defaultDateStaffArrive = org.alt60m.util.DateUtils.clearTimeFromDate(defaultDateStaffArrive);
	}

	public Date getDefaultDateStaffLeave() {
		return defaultDateStaffLeave;
	}

	public void setDefaultDateStaffLeave(Date defaultDateStaffLeave) {
		this.defaultDateStaffLeave = org.alt60m.util.DateUtils.clearTimeFromDate(defaultDateStaffLeave);
	}

	public Date getDefaultDateGuestArrive() {
		return defaultDateGuestArrive;
	}

	public void setDefaultDateGuestArrive(Date defaultDateGuestArrive) {
		this.defaultDateGuestArrive = org.alt60m.util.DateUtils.clearTimeFromDate(defaultDateGuestArrive);
	}

	public Date getDefaultDateGuestLeave() {
		return defaultDateGuestLeave;
	}

	public void setDefaultDateGuestLeave(Date defaultDateGuestLeave) {
		this.defaultDateGuestLeave = org.alt60m.util.DateUtils.clearTimeFromDate(defaultDateGuestLeave);
	}

	public Date getDefaultDateStudentArrive() {
		return defaultDateStudentArrive;
	}

	public void setDefaultDateStudentArrive(Date defaultDateStudentArrive) {
		this.defaultDateStudentArrive = org.alt60m.util.DateUtils.clearTimeFromDate(defaultDateStudentArrive);
	}

	public Date getDefaultDateStudentLeave() {
		return defaultDateStudentLeave;
	}

	public void setDefaultDateStudentLeave(Date defaultDateStudentLeave) {
		this.defaultDateStudentLeave = org.alt60m.util.DateUtils.clearTimeFromDate(defaultDateStudentLeave);
	}

	public Date getDefaultDateArrive(String registrationType) {
		if (registrationType.equals("staff")) {
			return getDefaultDateStaffArrive();
		} else if (registrationType.equals("student")) {
			return getDefaultDateStudentArrive();
		} else if (registrationType.equals("guest")) {
			return getDefaultDateGuestArrive();
		}
		return null;
	}

	public Date getDefaultDateLeave(String registrationType) {
		if (registrationType.equals("staff")) {
			return getDefaultDateStaffLeave();
		} else if (registrationType.equals("student")) {
			return getDefaultDateStudentLeave();
		} else if (registrationType.equals("guest")) {
			return getDefaultDateGuestLeave();
		}
		return null;
	}
/* 
 * 11/23/2005 Added getIsCloaked, setIsCloaked methods. Used to set and 
 * retrieve data from the isCloaked field in crs_conference table.
 * 12/06/2006 Added getIsCloakedString, setIsCloakedString methods
*/
	public boolean getIsCloaked() {
		return isCloaked != null && isCloaked.equals("T");
	}
	
	public void setIsCloaked(boolean isCloaked) {
		this.isCloaked = isCloaked ? "T" : "F";
	}

	public String getIsCloakedString() {
		return isCloaked;
	}

	public void setIsCloakedString(String isCloaked) {
		this.isCloaked = isCloaked;
	}

	public float getOnsiteCost() {
		return onsiteCost;
	}

	public void setOnsiteCost(float onsiteCost) {
		this.onsiteCost = onsiteCost;
	}

	public float getCommuterCost() {
		return commuterCost;
	}

	public void setCommuterCost(float commuterCost) {
		this.commuterCost = commuterCost;
	}

	public float getPreRegDeposit() {
		return preRegDeposit;
	}

	public void setPreRegDeposit(float preRegDeposit) {
		this.preRegDeposit = preRegDeposit;
	}

	public float getDiscountFullPayment() {
		return discountFullPayment;
	}

	public void setDiscountFullPayment(float discountFullPayment) {
		this.discountFullPayment = discountFullPayment;
	}

	public float getDiscountEarlyReg() {
		return discountEarlyReg;
	}

	public void setDiscountEarlyReg(float discountEarlyReg) {
		this.discountEarlyReg = discountEarlyReg;
	}

	public Date getDiscountEarlyRegDate() {
		return discountEarlyRegDate;
	}

	public void setDiscountEarlyRegDate(Date discountEarlyRegDate) {
		this.discountEarlyRegDate = org.alt60m.util.DateUtils.clearTimeFromDate(discountEarlyRegDate);
	}

	public String getCheckPayableTo() {
		return this.checkPayableTo;
	}

	public void setCheckPayableTo(String checkPayableTo) {
		this.checkPayableTo = checkPayableTo;
	}

	public String getMerchantAcctNum() {
		return this.merchantAcctNum;
	}

	public void setMerchantAcctNum(String merchantAcctNum) {
		this.merchantAcctNum = merchantAcctNum;
	}

	public String getConfImageID() {
		return this.confImageID;
	}

	public void setConfImageID(String confImageID) {
		this.confImageID = confImageID;
	}

	public String getFontFace() {
		return this.fontFace;
	}

	public void setFontFace(String fontFace) {
		this.fontFace = fontFace;
	}

	public String getBackgroundColor() {
		return this.backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getForegroundColor() {
		return this.foregroundColor;
	}

	public void setForegroundColor(String foregroundColor) {
		this.foregroundColor = foregroundColor;
	}

	public String getHighlightColor() {
		return this.highlightColor;
	}

	public void setHighlightColor(String highlightColor) {
		this.highlightColor = highlightColor;
	}

	public String getBackgroundColor2() {
		return this.backgroundColor2;
	}

	public void setBackgroundColor2(String backgroundColor2) {
		this.backgroundColor2 = backgroundColor2;
	}

	public String getBackgroundColor3() {
		return this.backgroundColor3;
	}

	public void setBackgroundColor3(String backgroundColor3) {
		this.backgroundColor3 = backgroundColor3;
	}

	public String getHighlightColor2() {
		return this.highlightColor2;
	}

	public void setHighlightColor2(String highlightColor2) {
		this.highlightColor2 = highlightColor2;
	}

	public String getRequiredColor() {
		return this.requiredColor;
	}

	public void setRequiredColor(String requiredColor) {
		this.requiredColor = requiredColor;
	}

	public int getGuestProfileNumber() {
		return guestProfileNumber;
	}

	public void setGuestProfileNumber(int guestProfileNumber) {
		this.guestProfileNumber = guestProfileNumber;
	}

	public int getGuestProfileReqNumber() {
		return guestProfileReqNumber;
	}

	public void setGuestProfileReqNumber(int guestProfileReqNumber) {
		this.guestProfileReqNumber = guestProfileReqNumber;
	}

	public int decodeGuestProfile(int check) {
		return decodeNumber(guestProfileNumber, guestProfileReqNumber, check);
	}

	public int getStudentProfileNumber() {
		return studentProfileNumber;
	}

	public void setStudentProfileNumber(int studentProfileNumber) {
		this.studentProfileNumber = studentProfileNumber;
	}

	public int getStudentProfileReqNumber() {
		return studentProfileReqNumber;
	}

	public void setStudentProfileReqNumber(int studentProfileReqNumber) {
		this.studentProfileReqNumber = studentProfileReqNumber;
	}

	public int decodeStudentProfile(int check) {
		return decodeNumber(studentProfileNumber, studentProfileReqNumber,
				check);
	}

	public int getStaffProfileNumber() {
		return staffProfileNumber;
	}

	public void setStaffProfileNumber(int staffProfileNumber) {
		this.staffProfileNumber = staffProfileNumber;
	}

	public int getStaffProfileReqNumber() {
		return staffProfileReqNumber;
	}

	public void setStaffProfileReqNumber(int staffProfileReqNumber) {
		this.staffProfileReqNumber = staffProfileReqNumber;
	}

	public int decodeStaffProfile(int check) {
		return decodeNumber(staffProfileNumber, staffProfileReqNumber, check);
	}

	/**
	 * Finds out if a question should be asked for the given conference and
	 * registration type.
	 * 
	 * @param registrationType -
	 *            the string representation of the profile to check against
	 * @param check -
	 *            the profile number to check for
	 * @return
	 *            <ul>
	 *            <li>0 - Don't ask question</li>
	 *            <li>1 - Ask question, don't require answer</li>
	 *            <li>2 - Ask question, require answer</li>
	 *            </ul>
	 */
	public int decodeProfile(String registrationType, int check) {
		if (registrationType.equals("staff")) {
			return decodeStaffProfile(check);
		} else if (registrationType.equals("student")) {
			return decodeStudentProfile(check);
		} else if (registrationType.equals("guest")) {
			return decodeGuestProfile(check);
		}
		return 0;
	}

	private int decodeNumber(int number, int req, int check) {
		return ((number & (int) java.lang.Math.pow(2, check)) == (int) java.lang.Math.pow(
				2, check)) ? (((req & (int) java.lang.Math.pow(2, check)) == (int) java.lang.Math.pow(
				2, check)) ? 2 : 1)
				: 0;
	}

	public boolean getAskGuestChildren() {
		return askGuestChildren != null && askGuestChildren.equals("T");
	}

	public void setAskGuestChildren(boolean askGuestChildren) {
		this.askGuestChildren = askGuestChildren ? "T" : "F";
	}

	public String getAskGuestChildrenString() {
		return askGuestChildren;
	}

	public void setAskGuestChildrenString(String askGuestChildren) {
		this.askGuestChildren = askGuestChildren;
	}

	public boolean getAskStaffChildren() {
		return askStaffChildren != null && askStaffChildren.equals("T");
	}

	public void setAskStaffChildren(boolean askStaffChildren) {
		this.askStaffChildren = askStaffChildren ? "T" : "F";
	}

	public String getAskStaffChildrenString() {
		return askStaffChildren;
	}

	public void setAskStaffChildrenString(String askStaffChildren) {
		this.askStaffChildren = askStaffChildren;
	}

	public boolean getAskStudentChildren() {
		return askStudentChildren != null && askStudentChildren.equals("T");
	}

	public void setAskStudentChildren(boolean askStudentChildren) {
		this.askStudentChildren = askStudentChildren ? "T" : "F";
	}

	public String getAskStudentChildrenString() {
		return askStudentChildren;
	}

	public void setAskStudentChildrenString(String askStudentChildren) {
		this.askStudentChildren = askStudentChildren;
	}

	public boolean getAskChildren(String registrationType) {
		if (registrationType.equals("staff")) {
			return getAskStaffChildren();
		} else if (registrationType.equals("student")) {
			return getAskStudentChildren();
		} else if (registrationType.equals("guest")) {
			return getAskGuestChildren();
		}
		return false;
	}

	public boolean getAskGuestSpouse() {
		return askGuestSpouse != null && askGuestSpouse.equals("T");
	}

	public void setAskGuestSpouse(boolean askGuestSpouse) {
		this.askGuestSpouse = askGuestSpouse ? "T" : "F";
	}

	public String getAskGuestSpouseString() {
		return askGuestSpouse;
	}

	public void setAskGuestSpouseString(String askGuestSpouse) {
		this.askGuestSpouse = askGuestSpouse;
	}

	public boolean getAskStaffSpouse() {
		return askStaffSpouse != null && askStaffSpouse.equals("T");
	}

	public void setAskStaffSpouse(boolean askStaffSpouse) {
		this.askStaffSpouse = askStaffSpouse ? "T" : "F";
	}

	public String getAskStaffSpouseString() {
		return askStaffSpouse;
	}

	public void setAskStaffSpouseString(String askStaffSpouse) {
		this.askStaffSpouse = askStaffSpouse;
	}

	public boolean getAskStudentSpouse() {
		return askStudentSpouse != null && askStudentSpouse.equals("T");
	}

	public void setAskStudentSpouse(boolean askStudentSpouse) {
		this.askStudentSpouse = askStudentSpouse ? "T" : "F";
	}

	public String getAskStudentSpouseString() {
		return askStudentSpouse;
	}

	public void setAskStudentSpouseString(String askStudentSpouse) {
		this.askStudentSpouse = askStudentSpouse;
	}

	public boolean getAskSpouse(String registrationType) {
		if (registrationType.equals("staff")) {
			return getAskStaffSpouse();
		} else if (registrationType.equals("student")) {
			return getAskStudentSpouse();
		} else if (registrationType.equals("guest")) {
			return getAskGuestSpouse();
		}
		return false;
	}

	public String getStaffLabel() {
		return this.staffLabel;
	}

	public void setStaffLabel(String staffLabel) {
		this.staffLabel = staffLabel;
	}

	public String getGuestLabel() {
		return this.guestLabel;
	}

	public void setGuestLabel(String guestLabel) {
		this.guestLabel = guestLabel;
	}

	public String getStudentLabel() {
		return this.studentLabel;
	}

	public void setStudentLabel(String studentLabel) {
		this.studentLabel = studentLabel;
	}

	public String getLabel(String registrationType) {
		if (registrationType.equals("staff")) {
			return getStaffLabel();
		} else if (registrationType.equals("student")) {
			return getStudentLabel();
		} else if (registrationType.equals("guest")) {
			return getGuestLabel();
		}
		return "";
	}

	public String getStaffDesc() {
		return this.staffDesc;
	}

	public void setStaffDesc(String staffDesc) {
		this.staffDesc = staffDesc;
	}

	public String getGuestDesc() {
		return this.guestDesc;
	}

	public void setGuestDesc(String guestDesc) {
		this.guestDesc = guestDesc;
	}

	public String getStudentDesc() {
		return this.studentDesc;
	}

	public void setStudentDesc(String studentDesc) {
		this.studentDesc = studentDesc;
	}
// Added 2/22/2006 SRW - added getMinistryType, setMinistryType
	public String getMinistryType() {
		return ministryType;
	}
	
	public void setMinistryType(String ministryType) {
		this.ministryType = ministryType;
	}

	public String getDesc(String registrationType) {
		if (registrationType.equals("staff")) {
			return getStaffDesc();
		} else if (registrationType.equals("student")) {
			return getStudentDesc();
		} else if (registrationType.equals("guest")) {
			return getGuestDesc();
		}
		return "";
	}

	// Associations

	public Vector getRegistrations() {
		Registration r = new Registration();
		r.setConferenceID(conferenceID);
		return r.selectList();
	}

	public Vector getRegistrations(String orderField, boolean DESC) {
		Registration r = new Registration();
		return r.selectList("fk_ConferenceID = '" + conferenceID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public Vector getRegistrationTypes() {
		RegistrationType rt = new RegistrationType();
		rt.setConferenceID(conferenceID);
		return rt.selectList();
	}

	public Vector getRegistrationTypes(String orderField, boolean DESC) {
		RegistrationType rt = new RegistrationType();
		return rt.selectList("fk_ConferenceID = '" + conferenceID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocRegistration(Registration r) {
		r.setConferenceID(conferenceID);
		r.update();
	}

	public void dissocRegistration(Registration r) {
		r.setConferenceID(0);
		r.update();
	}

	public Vector getQuestions() {
		Question q = new Question();
		q.setConferenceID(conferenceID);
		return q.selectList();
	}

	public Vector getQuestions(String orderField, boolean DESC) {
		Question q = new Question();
		return q.selectList("fk_ConferenceID = '" + conferenceID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocQuestion(Question q) {
		q.setConferenceID(conferenceID);
		q.update();
	}

	public void dissocQuestion(Question q) {
		q.setConferenceID(0);
		q.update();
	}

	public Vector getCustomItems() {
		CustomItem ci = new CustomItem();
		ci.setConferenceID(conferenceID);
		return ci.selectList();
	}

	public Vector getCustomItems(String orderField, boolean DESC) {
		CustomItem ci = new CustomItem();
		return ci.selectList("fk_ConferenceID = '" + conferenceID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocCustomItem(CustomItem ci) {
		ci.setConferenceID(conferenceID);
		ci.update();
	}

	public void dissocCustomItem(CustomItem ci) {
		ci.setConferenceID(0);
		ci.update();
	}

	public Vector getMerchandise() {
		Merchandise m = new Merchandise();
		m.setConferenceID(conferenceID);
		return m.selectList();
	}

	public Vector getMerchandise(String orderField, boolean DESC) {
		Merchandise m = new Merchandise();
		return m.selectList("fk_ConferenceID = '" + conferenceID
				+ "' ORDER BY " + orderField + " " + (DESC ? "DESC" : "ASC"));
	}

	public void assocMerchandise(Merchandise m) {
		m.setConferenceID(conferenceID);
		m.update();
	}

	public void dissocMerchandise(Merchandise m) {
		m.setConferenceID(0);
		m.update();
	}

	// For migration

	private String acceptCreditCards = "";

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

	//	private Vector customMigrate = new Vector();
	//	public Vector getCustomMigrate(){ return customMigrate; }
	//	public void setCustomMigrate(Vector options){
	//		customMigrate = options;
	//	}
}
