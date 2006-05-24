package org.alt60m.hr.si.model.dbio;

import org.alt60m.hr.si.servlet.dbio.SIUtil;

import com.kenburcham.framework.dbio.DBIOEntity;

import java.util.Date;
import java.util.Hashtable;
//import com.kenburcham.framework.dbio.DBIOEntity;
//import com.kenburcham.framework.dbio.DBIOEntityException;

/**
 * Contains data needed to apply for a STINT Internship (A one year ministry
 * commitment).  [creating a <B>S</B>TINT <B>I</B>n<B>T</B>ernship
 * <B>Application</B>.]
 *
 * This includes data for the following pages (starting after contact, also
 * excluding refs + belief): "apphome", "instruct", "faq", "contact",
 * "interests", "stintonly", "experience", "church", "personal", "ause",
 * "duse", "tuse", "moral", "financial", "mpd", "bio", "refs", "belief",
 * "payment", "submit".  The data is persisted through and XML mapping file
 * to the database.
 */
public class SIApplication extends DBIOEntity {

	private static final String TABLENAME_BASE = "hr_si_Application_";

	public SIApplication() {
//		dc added 12-12-02: initialize some data fields when object is created
//		dateAppLastChanged = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
//		dateAppStarted = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
	}
	public boolean persist() { return isPKEmpty() ? insert() : update(); }
	public boolean insert() {
		// kl 12-1-03: initialize some data fields only when object is created
		appStatus = STATUS_CREATED;
		dateAppLastChanged = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
		dateAppStarted = org.alt60m.util.DateUtils.clearTimeFromDate(new Date());
		return super.insert();
	}
	public boolean isPKEmpty() {
		return applicationID == 0;
	}
	public void changeYear(String yearID) {
		changeTargetTable(TABLENAME_BASE + yearID);
	}
	public SIApplication(String id) {
		applicationID = (new Integer(id)).intValue();
		select();
	}
	public SIApplication(String id, String yearid) {
		changeYear(yearid);
		applicationID = (new Integer(id)).intValue();
		select();
	}
	public SIApplication(int id) {
		applicationID = id;
		select();
	}
	
	public void localinit() {
		String table = TABLENAME_BASE + SIUtil.CURRENT_SI_YEAR;

		setMetadata("ApplicationIDInt", "applicationID", "IDENTITY");
		setMetadata("LocationAInt", "locationA", table);
		setMetadata("LocationAExplanation", "locationAExplanation", table);
		setMetadata("LocationBInt", "locationB", table);
		setMetadata("LocationBExplanation", "locationBExplanation", table);
		setMetadata("LocationCInt", "locationC", table);
		setMetadata("LocationCExplanation", "locationCExplanation", table);
		setMetadata("AvailableMonth", "availableMonth", table);
		setMetadata("AvailableYear", "availableYear", table);
		setMetadata("HasMinistryConflict", "hasMinistryConflict", table);
		setMetadata("MinistryConflictExplanation", "ministryConflictExplanation", table);
		setMetadata("HasSpecificLocation", "hasSpecificLocation", table);
		setMetadata("SpecificLocationRecruiterName", "specificLocationRecruiterName", table);
		setMetadata("TeamMembers", "teamMembers", table);
		setMetadata("IsDating", "isDating", table);
		setMetadata("DatingLocation", "datingLocation", table);
		setMetadata("HasCampusPartnership", "hasCampusPartnership", table);
		setMetadata("IsDatingStint", "isDatingStint", table);
		setMetadata("DatingStintName", "datingStintName", table);
		setMetadata("Language1", "language1", table);
		setMetadata("Language1YearsStudied", "language1YearsStudied", table);
		setMetadata("Language1Fluency", "language1Fluency", table);
		setMetadata("Language2", "language2", table);
		setMetadata("Language2YearsStudied", "language2YearsStudied", table);
		setMetadata("Language2Fluency", "language2Fluency", table);
		setMetadata("PreviousMinistryExperience", "previousMinistryExperience", table);
		setMetadata("MinistryTraining", "ministryTraining", table);
		setMetadata("EvangelismAttitude", "evangelismAttitude", table);
		setMetadata("IsEvangelismTrainable", "isEvangelismTrainable", table);
		setMetadata("ParticipationExplanation", "participationExplanation", table);
		setMetadata("IsFamiliarFourSpiritualLaws", "isFamiliarFourSpiritualLaws", table);
		setMetadata("HasExperienceFourSpiritualLaws", "hasExperienceFourSpiritualLaws", table);
		setMetadata("ConfidenceFourSpiritualLaws", "confidenceFourSpiritualLaws", table);
		setMetadata("IsFamiliarLifeAtLarge", "isFamiliarLifeAtLarge", table);
		setMetadata("HasExperienceLifeAtLarge", "hasExperienceLifeAtLarge", table);
		setMetadata("ConfidenceLifeAtLarge", "confidenceLifeAtLarge", table);
		setMetadata("IsFamiliarPersonalTestimony", "isFamiliarPersonalTestimony", table);
		setMetadata("HasExperiencePersonalTestimony", "hasExperiencePersonalTestimony", table);
		setMetadata("ConfidencePersonalTestimony", "confidencePersonalTestimony", table);
		setMetadata("IsFamiliarExplainingGospel", "isFamiliarExplainingGospel", table);
		setMetadata("HasExperienceExplainingGospel", "hasExperienceExplainingGospel", table);
		setMetadata("ConfidenceExplainingGospel", "confidenceExplainingGospel", table);
		setMetadata("IsFamiliarSharingFaith", "isFamiliarSharingFaith", table);
		setMetadata("HasExperienceSharingFaith", "hasExperienceSharingFaith", table);
		setMetadata("ConfidenceSharingFaith", "confidenceSharingFaith", table);
		setMetadata("IsFamiliarHolySpiritBooklet", "isFamiliarHolySpiritBooklet", table);
		setMetadata("HasExperienceHolySpiritBooklet", "hasExperienceHolySpiritBooklet", table);
		setMetadata("ConfidenceHolySpiritBooklet", "confidenceHolySpiritBooklet", table);
		setMetadata("IsFamiliarFollowUp", "isFamiliarFollowUp", table);
		setMetadata("HasExperienceFollowUp", "hasExperienceFollowUp", table);
		setMetadata("ConfidenceFollowUp", "confidenceFollowUp", table);
		setMetadata("IsFamiliarHelpGrowInFaith", "isFamiliarHelpGrowInFaith", table);
		setMetadata("HasExperienceHelpGrowInFaith", "hasExperienceHelpGrowInFaith", table);
		setMetadata("ConfidenceHelpGrowInFaith", "confidenceHelpGrowInFaith", table);
		setMetadata("IsFamiliarTrainShareFaith", "isFamiliarTrainShareFaith", table);
		setMetadata("HasExperienceTrainShareFaith", "hasExperienceTrainShareFaith", table);
		setMetadata("ConfidenceTrainShareFaith", "confidenceTrainShareFaith", table);
		setMetadata("IsFamiliarOtherReligions", "isFamiliarOtherReligions", table);
		setMetadata("HasExperienceOtherReligions", "hasExperienceOtherReligions", table);
		setMetadata("ConfidenceOtherReligions", "confidenceOtherReligions", table);
		setMetadata("LeadershipPositions", "leadershipPositions", table);
		setMetadata("HasLedDiscipleshipGroup", "hasLedDiscipleshipGroup", table);
		setMetadata("DiscipleshipGroupSize", "discipleshipGroupSize", table);
		setMetadata("LeadershipEvaluation", "leadershipEvaluation", table);
		setMetadata("ConversionMonth", "conversionMonth", table);
		setMetadata("ConversionYear", "conversionYear", table);
		setMetadata("MemberChurchDenomination", "memberChurchDenomination", table);
		setMetadata("MemberChurchDuration", "memberChurchDuration", table);
		setMetadata("AttendingChurchDenomination", "attendingChurchDenomination", table);
		setMetadata("AttendingChurchDuration", "attendingChurchDuration", table);
		setMetadata("AttendingChurchInvolvement", "attendingChurchInvolvement", table);
		setMetadata("QuietTimeQuantity", "quietTimeQuantity", table);
		setMetadata("QuietTimeDescription", "quietTimeDescription", table);
		setMetadata("ExplanationOfSalvation", "explanationOfSalvation", table);
		setMetadata("ExplanationOfSpiritFilled", "explanationOfSpiritFilled", table);
		setMetadata("HasInvolvementSpeakingTongues", "hasInvolvementSpeakingTongues", table);
		setMetadata("DifferenceIndwellingFilled", "differenceIndwellingFilled", table);
		setMetadata("HasCrimeConviction", "hasCrimeConviction", table);
		setMetadata("CrimeConvictionExplanation", "crimeConvictionExplanation", table);
		setMetadata("HasDrugUse", "hasDrugUse", table);
		setMetadata("IsTobaccoUser", "isTobaccoUser", table);
		setMetadata("IsWillingChangeHabits", "isWillingChangeHabits", table);
		setMetadata("AuthorityResponseExplanation", "authorityResponseExplanation", table);
		setMetadata("AlcoholUseFrequency", "alcoholUseFrequency", table);
		setMetadata("AlcoholUseDecision", "alcoholUseDecision", table);
		setMetadata("IsWillingRefrainAlcohol", "isWillingRefrainAlcohol", table);
		setMetadata("UnwillingRefrainAlcoholExplanation", "unwillingRefrainAlcoholExplanation", table);
		setMetadata("DrugUseExplanation", "drugUseExplanation", table);
		setMetadata("TobaccoUseExplanation", "tobaccoUseExplanation", table);
		setMetadata("IsWillingAbstainTobacco", "isWillingAbstainTobacco", table);
		setMetadata("HasRequestedPhoneCall", "hasRequestedPhoneCall", table);
		setMetadata("ContactPhoneNumber", "contactPhoneNumber", table);
		setMetadata("ContactBestTime", "contactBestTime", table);
		setMetadata("ContactTimeZone", "contactTimeZone", table);
		setMetadata("SexualInvolvementExplanation", "sexualInvolvementExplanation", table);
		setMetadata("HasSexualGuidelines", "hasSexualGuidelines", table);
		setMetadata("SexualGuidelineExplanation", "sexualGuidelineExplanation", table);
		setMetadata("IsCurrentlyDating", "isCurrentlyDating", table);
		setMetadata("CurrentlyDatingLocation", "currentlyDatingLocation", table);
		setMetadata("HasHomosexualInvolvement", "hasHomosexualInvolvement", table);
		setMetadata("HomosexualInvolvementExplanation", "homosexualInvolvementExplanation", table);
		setMetadata("HasRecentPornographicInvolvement", "hasRecentPornographicInvolvement", table);
		setMetadata("PornographicInvolvementMonth", "pornographicInvolvementMonth", table);
		setMetadata("PornographicInvolvementYear", "pornographicInvolvementYear", table);
		setMetadata("PornographicInvolvementExplanation", "pornographicInvolvementExplanation", table);
		setMetadata("HasRecentSexualImmorality", "hasRecentSexualImmorality", table);
		setMetadata("SexualImmoralityMonth", "sexualImmoralityMonth", table);
		setMetadata("SexualImmoralityYear", "sexualImmoralityYear", table);
		setMetadata("SexualImmoralityExplanation", "sexualImmoralityExplanation", table);
		setMetadata("HasOtherDateSinceImmorality", "hasOtherDateSinceImmorality", table);
		setMetadata("SingleImmoralityResultsExplanation", "singleImmoralityResultsExplanation", table);
		setMetadata("MarriedImmoralityResultsExplanation", "marriedImmoralityResultsExplanation",table);
		setMetadata("ImmoralityLifeChangeExplanation", "immoralityLifeChangeExplanation", table);
		setMetadata("ImmoralityCurrentStrugglesExplanation", "immoralityCurrentStrugglesExplanation", table);
		setMetadata("AdditionalMoralComments", "additionalMoralComments", table);
		setMetadata("IsAwareMustRaiseSupport", "isAwareMustRaiseSupport", table);
		setMetadata("IsInDebt", "isInDebt", table);
		setMetadata("DebtNature1", "debtNature1", table);
		setMetadata("DebtTotal1", "debtTotal1", table);
		setMetadata("DebtMonthlyPayment1", "debtMonthlyPayment1", table);
		setMetadata("DebtNature2", "debtNature2", table);
		setMetadata("DebtTotal2", "debtTotal2", table);
		setMetadata("DebtMonthlyPayment2", "debtMonthlyPayment2", table);
		setMetadata("DebtNature3", "debtNature3", table);
		setMetadata("DebtTotal3", "debtTotal3", table);
		setMetadata("DebtMonthlyPayment3", "debtMonthlyPayment3", table);
		setMetadata("HasOtherFinancialResponsibility", "hasOtherFinancialResponsibility", table);
		setMetadata("OtherFinancialResponsibilityExplanation", "otherFinancialResponsibilityExplanation", table);
		setMetadata("DebtPaymentPlan", "debtPaymentPlan", table);
		setMetadata("DebtPaymentTimeframe", "debtPaymentTimeframe", table);
		setMetadata("DevelopingPartnersExplanation", "developingPartnersExplanation", table);
		setMetadata("IsWillingDevelopPartners", "isWillingDevelopPartners", table);
		setMetadata("UnwillingDevelopPartnersExplanation", "unwillingDevelopPartnersExplanation", table);
		setMetadata("IsCommittedDevelopPartners", "isCommittedDevelopPartners", table);
		setMetadata("UncommittedDevelopPartnersExplanation", "uncommittedDevelopPartnersExplanation", table);
		setMetadata("PersonalTestimonyGrowth", "personalTestimonyGrowth", table);
		setMetadata("InternshipParticipationExplanation", "internshipParticipationExplanation", table);
		setMetadata("InternshipObjectives", "internshipObjectives", table);
		setMetadata("CurrentMinistryDescription", "currentMinistryDescription", table);
		setMetadata("PersonalStrengthA", "personalStrengthA", table);
		setMetadata("PersonalStrengthB", "personalStrengthB", table);
		setMetadata("PersonalStrengthC", "personalStrengthC", table);
		setMetadata("PersonalDevelopmentA", "personalDevelopmentA", table);
		setMetadata("PersonalDevelopmentB", "personalDevelopmentB", table);
		setMetadata("PersonalDevelopmentC", "personalDevelopmentC", table);
		setMetadata("PersonalDescriptionA", "personalDescriptionA", table);
		setMetadata("PersonalDescriptionB", "personalDescriptionB", table);
		setMetadata("PersonalDescriptionC", "personalDescriptionC", table);
		setMetadata("FamilyRelationshipDescription", "familyRelationshipDescription", table);
		setMetadata("ElectronicSignature", "electronicSignature", table);
		setMetadata("Ssn", "ssn", table);
		setMetadata("Fk_ssmUserID", "fk_ssmUserID", table);
		//setMetadata("Fk_SIPersonID", "fk_SIPersonID", table);
		setMetadata("Fk_PersonID", "fk_PersonID", table);
		setMetadata("IsPaid", "isPaid", table);
		setMetadata("AppFee", "appFee", table);
		setMetadata("DateAppLastChanged", "dateAppLastChanged", table);
		setMetadata("DateAppStarted", "dateAppStarted", table);
		setMetadata("DateSubmitted", "dateSubmitted", table);
		setMetadata("IsSubmitted", "isSubmitted", table);
		setMetadata("AppStatus", "appStatus", table);
		setMetadata("AssignedToProject", "assignedToProject", table);
		setMetadata("FinalProject", "finalProject", table);
		setMetadata("SiYear", "siYear", table);
		setMetadata("Status", "status", table);
		setMetadata("AppType", "appType", table);

		setAutodetectProperties(false);
	}

	/**  Contact Information in SIPerson.java (contact.jsp) */
	private int applicationID = 0;
	private String appType = "";

	/**  Ministry Interests (interests.jsp) */
	private int locationA;
	private String locationAExplanation = "";
	private int locationB;
	private String locationBExplanation = "";
	private int locationC;
	private String locationCExplanation = "";
	private String availableMonth = "";
	private String availableYear = "";
	private int hasMinistryConflict;
	private String ministryConflictExplanation = "";
	private int hasSpecificLocation;
	private String specificLocationRecruiterName = "";
	private String teamMembers = "";
	private int isDating;
	private String datingLocation = "";

	/**  STINT (stintonly.jsp) */
	private int hasCampusPartnership;
	private int isDatingStint;
	private String datingStintName = "";
	private String language1 = "";
	private String language1YearsStudied = "";
	private int language1Fluency;
	private String language2 = "";
	private String language2YearsStudied = "";
	private int language2Fluency;
	private String previousMinistryExperience = "";

	/**  Ministry Experience (experience.jsp) */
	private String ministryTraining = "";
	private String evangelismAttitude = "";
	private int isEvangelismTrainable;
	private String participationExplanation = "";
	private int isFamiliarFourSpiritualLaws;
	private int hasExperienceFourSpiritualLaws;
	private int confidenceFourSpiritualLaws;
	private int isFamiliarLifeAtLarge;
	private int hasExperienceLifeAtLarge;
	private int confidenceLifeAtLarge;
	private int isFamiliarPersonalTestimony;
	private int hasExperiencePersonalTestimony;
	private int confidencePersonalTestimony;
	private int isFamiliarExplainingGospel;
	private int hasExperienceExplainingGospel;
	private int confidenceExplainingGospel;
	private int isFamiliarSharingFaith;
	private int hasExperienceSharingFaith;
	private int confidenceSharingFaith;
	private int isFamiliarHolySpiritBooklet;
	private int hasExperienceHolySpiritBooklet;
	private int confidenceHolySpiritBooklet;
	private int isFamiliarFollowUp;
	private int hasExperienceFollowUp;
	private int confidenceFollowUp;
	private int isFamiliarHelpGrowInFaith;
	private int hasExperienceHelpGrowInFaith;
	private int confidenceHelpGrowInFaith;
	private int isFamiliarTrainShareFaith;
	private int hasExperienceTrainShareFaith;
	private int confidenceTrainShareFaith;
	private int isFamiliarOtherReligions;
	private int hasExperienceOtherReligions;
	private int confidenceOtherReligions;
	private String leadershipPositions = "";
	private int hasLedDiscipleshipGroup;
	private String discipleshipGroupSize = "";
	private String leadershipEvaluation = "";

	/**  Church and Spiritual Background (church.jsp) */
	private int conversionMonth;
	private int conversionYear;
	private String memberChurchDenomination = "";
	private String memberChurchDuration = "";
	private String attendingChurchDenomination = "";
	private String attendingChurchDuration = "";
	private String attendingChurchInvolvement = "";
	private String quietTimeQuantity = "";
	private String quietTimeDescription = "";
	private String explanationOfSalvation = "";
	private String explanationOfSpiritFilled = "";
	private int hasInvolvementSpeakingTongues;
	private String differenceIndwellingFilled = "";

	/**  Personal Information (personal.jsp) */
	private int hasCrimeConviction;
	private String crimeConvictionExplanation = "";
	private int hasDrugUse;
	private int isTobaccoUser;
	private int isWillingChangeHabits;
	private String authorityResponseExplanation = "";

	/**  Alcohol Use (ause.jsp) */
	private String alcoholUseFrequency = "";
	private String alcoholUseDecision = "";
	private int isWillingRefrainAlcohol;
	private String unwillingRefrainAlcoholExplanation = "";

	/**  Drug Use (duse.jsp) */
	private String drugUseExplanation = "";

	/**  Tobacco Use (tuse.jsp) */
	private String tobaccoUseExplanation = "";
	private int isWillingAbstainTobacco;

	/**  Moral Convictions (moral.jsp) */
	private int hasRequestedPhoneCall;
	private String contactPhoneNumber = "";
	private String contactBestTime = "";
	private String contactTimeZone = "";
	private String sexualInvolvementExplanation = "";
	private int hasSexualGuidelines;
	private String sexualGuidelineExplanation = "";
	private int isCurrentlyDating;
	private String currentlyDatingLocation = "";
	private int hasHomosexualInvolvement;
	private String homosexualInvolvementExplanation = "";
	private int hasRecentPornographicInvolvement;
	private int pornographicInvolvementMonth;
	private int pornographicInvolvementYear;
	private String pornographicInvolvementExplanation = "";
	private int hasRecentSexualImmorality;
	private int sexualImmoralityMonth;
	private int sexualImmoralityYear;
	private String sexualImmoralityExplanation = "";
	private int hasOtherDateSinceImmorality;
	private String singleImmoralityResultsExplanation = "";
	private String marriedImmoralityResultsExplanation = "";
	private String immoralityLifeChangeExplanation = "";
	private String immoralityCurrentStrugglesExplanation = "";
	private String additionalMoralComments = "";

	/**  Finanacial Information (financial.jsp) */
	private int isAwareMustRaiseSupport;
	private int isInDebt;
	private String debtNature1 = "";
	private String debtTotal1 = "";
	private String debtMonthlyPayment1 = "";
	private String debtNature2 = "";
	private String debtTotal2 = "";
	private String debtMonthlyPayment2 = "";
	private String debtNature3 = "";
	private String debtTotal3 = "";
	private String debtMonthlyPayment3 = "";
	private int hasOtherFinancialResponsibility;
	private String otherFinancialResponsibilityExplanation = "";
	private String debtPaymentPlan = "";
	private String debtPaymentTimeframe = "";

	/**  Ministry Partner Development (mpd.jsp) */
	private String developingPartnersExplanation = "";
	private int isWillingDevelopPartners;
	private String unwillingDevelopPartnersExplanation = "";
	private int isCommittedDevelopPartners;
	private String uncommittedDevelopPartnersExplanation = "";

	/**  Biographical Information (bio.jsp) */
	private String personalTestimonyGrowth = "";
	private String internshipParticipationExplanation = "";
	private String internshipObjectives = "";
	private String currentMinistryDescription = "";
	private String personalStrengthA = "";
	private String personalStrengthB = "";
	private String personalStrengthC = "";
	private String personalDevelopmentA = "";
	private String personalDevelopmentB = "";
	private String personalDevelopmentC = "";
	private String personalDescriptionA = "";
	private String personalDescriptionB = "";
	private String personalDescriptionC = "";
	private String familyRelationshipDescription = "";

	/**  Submit Application (submit.jsp) */
	private String electronicSignature = "";
	private String ssn = "";
	private int fk_ssmUserID;
	private int fk_PersonID;

	/** Admin fields */
	private boolean isPaid;
	private int appFee = 0; //this is the storage value, untouched by calcApplicationFee
	private Date dateAppLastChanged;
	private Date dateAppStarted;
	private Date dateSubmitted;
	private boolean isSubmitted = false;
	private String appStatus = "";
	private int assignedToProject = 0;
	private int finalProject = 0;
	private String siYear = "";
	private String status = "";

	/** static field related to calcApplicationFee */
	public static final int APPFEE = 35; //default fee for this application
	public static final int APPFEELATE = 50; //amount to add if after latefeeDeadline
	public static final Date APPFEEDEADLINE = new Date("03/01/" + SIUtil.CURRENT_SI_YEAR); //Mar 1, 2004

	/** static fields related to status */
	public static final String STATUS_CREATED = "CREATED";
	public static final String STATUS_EDITING = "EDITING";
	public static final String STATUS_COMPLETE = "COMPLETE";
	public static final String STATUS_EVALUATION = "EVALUATION";
	public static final String STATUS_DECISION = "DECISION";
	public static final String STATUS_WITHDRAWN = "WITHDRAWN";

	/** The primary key of this object. */
	public String getApplicationID() {
		return String.valueOf(applicationID); }
	public void setApplicationID(String applicationID) {
		this.applicationID = Integer.parseInt(applicationID); }

	public int getApplicationIDInt() { return applicationID; }
	public void setApplicationIDInt(int applicationID) { this.applicationID = applicationID; }


	/******************************* get payments */

	/**
	 * returns a vector of payments for this application.
	 * @return Hashtable 
	 */
	public Hashtable getPayments() {
		return SIUtil.getPaymentsForApplication(this.getApplicationID());
	}

	/******************************* Ministry Interests */

	/**
	 * Returns the locationA.
	 * @return int
	 */
	public String getLocationA() {
		return String.valueOf(this.locationA);
	}
	public int getLocationAInt() {
		return this.locationA;
	}

	/**
	 * Sets the locationA.
	 * @param locationA  The locationA to set as a int.
	 */
	public void setLocationA(String locationA) {
		this.locationA = Integer.parseInt(locationA);
	}
	public void setLocationAInt(int locationA) {
		this.locationA = locationA;
	}

	/**
	 * Returns the locationAExplanation.
	 * @return String
	 */
	public String getLocationAExplanation() {
		return this.locationAExplanation;
	}

	/**
	 * Sets the locationAExplanation.
	 * @param locationAExplanation  The locationAExplanation to set as a String.
	 */
	public void setLocationAExplanation(String locationAExplanation) {
		this.locationAExplanation = locationAExplanation;
	}

	/**
	 * Returns the locationB.
	 * @return int
	 */
	public String getLocationB() {
		return String.valueOf(this.locationB);
	}
	public int getLocationBInt() {
		return this.locationB;
	}

	/**
	 * Sets the locationB.
	 * @param locationB  The locationB to set as a String.
	 */
	public void setLocationB(String locationB) {
		this.locationB = Integer.parseInt(locationB);
	}
	public void setLocationBInt(int locationB) {
		this.locationB = locationB;
	}

	/**
	 * Returns the locationBExplanation.
	 * @return String
	 */
	public String getLocationBExplanation() {
		return this.locationBExplanation;
	}

	/**
	 * Sets the locationBExplanation.
	 * @param locationBExplanation  The locationBExplanation to set as a String.
	 */
	public void setLocationBExplanation(String locationBExplanation) {
		this.locationBExplanation = locationBExplanation;
	}

	/**
	 * Returns the locationC.
	 * @return String
	 */
	public String getLocationC() {
		return String.valueOf(this.locationC);
	}
	public int getLocationCInt() {
		return this.locationC;
	}

	/**
	 * Sets the locationC.
	 * @param locationC  The locationC to set as a String.
	 */
	public void setLocationC(String locationC) {
		this.locationC = Integer.parseInt(locationC);
	}
	public void setLocationCInt(int locationC) {
		this.locationC = locationC;
	}

	/**
	 * Returns the locationCExplanation.
	 * @return String
	 */
	public String getLocationCExplanation() {
		return this.locationCExplanation;
	}

	/**
	 * Sets the locationCExplanation.
	 * @param locationCExplanation  The locationCExplanation to set as a String.
	 */
	public void setLocationCExplanation(String locationCExplanation) {
		this.locationCExplanation = locationCExplanation;
	}

	/**
	 * Returns the availableMonth.
	 * @return String
	 */
	public String getAvailableMonth() {
		return this.availableMonth;
	}

	/**
	 * Sets the availableMonth.
	 * @param availableMonth  The availableMonth to set as a String.
	 */
	public void setAvailableMonth(String availableMonth) {
		this.availableMonth = availableMonth;
	}

	/**
	 * Returns the availableYear.
	 * @return String
	 */
	public String getAvailableYear() {
		return this.availableYear;
	}

	/**
	 * Sets the availableYear.
	 * @param availableYear  The availableYear to set as a String.
	 */
	public void setAvailableYear(String availableYear) {
		this.availableYear = availableYear;
	}

	/**
	 * Returns the hasMinistryConflict.
	 * @return String
	 */
	public int getHasMinistryConflict() {
		return this.hasMinistryConflict;
	}

	/**
	 * Sets the hasMinistryConflict.
	 * @param hasMinistryConflict  The hasMinistryConflict to set as a String.
	 */
	public void setHasMinistryConflict(int hasMinistryConflict) {
		this.hasMinistryConflict = hasMinistryConflict;
	}

	/**
	 * Returns the ministryConflictExplanation.
	 * @return String
	 */
	public String getMinistryConflictExplanation() {
		return this.ministryConflictExplanation;
	}

	/**
	 * Sets the ministryConflictExplanation.
	 * @param ministryConflictExplanation  The ministryConflictExplanation to set as a String.
	 */
	public void setMinistryConflictExplanation(String ministryConflictExplanation) {
		this.ministryConflictExplanation = ministryConflictExplanation;
	}

	/**
	 * Returns the hasSpecificLocation.
	 * @return String
	 */
	public int getHasSpecificLocation() {
		return this.hasSpecificLocation;
	}

	/**
	 * Sets the hasSpecificLocation.
	 * @param hasSpecificLocation  The hasSpecificLocation to set as a String.
	 */
	public void setHasSpecificLocation(int hasSpecificLocation) {
		this.hasSpecificLocation = hasSpecificLocation;
	}

	/**
	 * Returns the specificLocationRecruiterName.
	 * @return String
	 */
	public String getSpecificLocationRecruiterName() {
		return this.specificLocationRecruiterName;
	}

	/**
	 * Sets the specificLocationRecruiterName.
	 * @param specificLocationRecruiterName  The specificLocationRecruiterName to set as a String.
	 */
	public void setSpecificLocationRecruiterName(String specificLocationRecruiterName) {
		this.specificLocationRecruiterName = specificLocationRecruiterName;
	}

	/**
	 * Returns the teamMembers.
	 * @return String
	 */
	public String getTeamMembers() {
		return this.teamMembers;
	}

	/**
	 * Sets the teamMembers.
	 * @param teamMembers  The teamMembers to set as a String.
	 */
	public void setTeamMembers(String teamMembers) {
		this.teamMembers = teamMembers;
	}

	/**
	 * Returns the isDating.
	 * @return String
	 */
	public int getIsDating() {
		return this.isDating;
	}

	/**
	 * Sets the isDating.
	 * @param isDating  The isDating to set as a String.
	 */
	public void setIsDating(int isDating) {
		this.isDating = isDating;
	}

	/**
	 * Returns the datingLocation.
	 * @return String
	 */
	public String getDatingLocation() {
		return this.datingLocation;
	}

	/**
	 * Sets the datingLocation.
	 * @param datingLocation  The datingLocation to set as a String.
	 */
	public void setDatingLocation(String datingLocation) {
		this.datingLocation = datingLocation;
	}

	/******************************* STINT */

	/**
	 * Returns the hasCampusPartnership.
	 * @return String
	 */
	public int getHasCampusPartnership() {
		return this.hasCampusPartnership;
	}

	/**
	 * Sets the hasCampusPartnership.
	 * @param hasCampusPartnership  The hasCampusPartnership to set as a String.
	 */
	public void setHasCampusPartnership(int hasCampusPartnership) {
		this.hasCampusPartnership = hasCampusPartnership;
	}

	/**
	 * Returns the isDatingStint.
	 * @return String
	 */
	public int getIsDatingStint() {
		return this.isDatingStint;
	}

	/**
	 * Sets the isDatingStint.
	 * @param isDatingStint  The isDatingStint to set as a String.
	 */
	public void setIsDatingStint(int isDatingStint) {
		this.isDatingStint = isDatingStint;
	}

	/**
	 * Returns the datingStintName.
	 * @return String
	 */
	public String getDatingStintName() {
		return this.datingStintName;
	}

	/**
	 * Sets the datingStintName.
	 * @param datingStintName  The datingStintName to set as a String.
	 */
	public void setDatingStintName(String datingStintName) {
		this.datingStintName = datingStintName;
	}

	/**
	 * Returns the language1.
	 * @return String
	 */
	public String getLanguage1() {
		return this.language1;
	}

	/**
	 * Sets the language1.
	 * @param language1  The language1 to set as a String.
	 */
	public void setLanguage1(String language1) {
		this.language1 = language1;
	}

	/**
	 * Returns the language1YearsStudied.
	 * @return String
	 */
	public String getLanguage1YearsStudied() {
		return this.language1YearsStudied;
	}

	/**
	 * Sets the language1YearsStudied.
	 * @param language1YearsStudied  The language1YearsStudied to set as a String.
	 */
	public void setLanguage1YearsStudied(String language1YearsStudied) {
		this.language1YearsStudied = language1YearsStudied;
	}

	/**
	 * Returns the language1Fluency.
	 * @return int
	 */
	public int getLanguage1Fluency() {
		return this.language1Fluency;
	}

	/**
	 * Sets the language1Fluency.
	 * @param language1Fluency  The language1Fluency to set as a int.
	 */
	public void setLanguage1Fluency(int language1Fluency) {
		this.language1Fluency = language1Fluency;
	}

	/**
	 * Returns the language2.
	 * @return String
	 */
	public String getLanguage2() {
		return this.language2;
	}

	/**
	 * Sets the language2.
	 * @param language2  The language2 to set as a String.
	 */
	public void setLanguage2(String language2) {
		this.language2 = language2;
	}

	/**
	 * Returns the language2YearsStudied.
	 * @return String
	 */
	public String getLanguage2YearsStudied() {
		return this.language2YearsStudied;
	}

	/**
	 * Sets the language2YearsStudied.
	 * @param language2YearsStudied  The language2YearsStudied to set as a String.
	 */
	public void setLanguage2YearsStudied(String language2YearsStudied) {
		this.language2YearsStudied = language2YearsStudied;
	}

	/**
	 * Returns the language2Fluency.
	 * @return int
	 */
	public int getLanguage2Fluency() {
		return this.language2Fluency;
	}

	/**
	 * Sets the language2Fluency.
	 * @param language2Fluency  The language2Fluency to set as a int.
	 */
	public void setLanguage2Fluency(int language2Fluency) {
		this.language2Fluency = language2Fluency;
	}

	/**
	 * Returns the previousMinistryExperience.
	 * @return String
	 */
	public String getPreviousMinistryExperience() {
		return this.previousMinistryExperience;
	}

	/**
	 * Sets the previousMinistryExperience.
	 * @param previousMinistryExperience  The previousMinistryExperience to set as a String.
	 */
	public void setPreviousMinistryExperience(String previousMinistryExperience) {
		this.previousMinistryExperience = previousMinistryExperience;
	}

	/**  Ministry Experience (experience.jsp)
	
	/**
	* Returns the ministryTraining.
	* @return String
	*/
	public String getMinistryTraining() {
		return this.ministryTraining;
	}

	/**
	 * Sets the ministryTraining.
	 * @param ministryTraining  The ministryTraining to set as a String.
	 */
	public void setMinistryTraining(String ministryTraining) {
		this.ministryTraining = ministryTraining;
	}

	/**
	 * Returns the evangelismAttitude.
	 * @return String
	 */
	public String getEvangelismAttitude() {
		return this.evangelismAttitude;
	}

	/**
	 * Sets the evangelismAttitude.
	 * @param evangelismAttitude  The evangelismAttitude to set as a String.
	 */
	public void setEvangelismAttitude(String evangelismAttitude) {
		this.evangelismAttitude = evangelismAttitude;
	}

	/**
	 * Returns the isEvangelismTrainable.
	 * @return String
	 */
	public int getIsEvangelismTrainable() {
		return this.isEvangelismTrainable;
	}

	/**
	 * Sets the isEvangelismTrainable.
	 * @param isEvangelismTrainable  The isEvangelismTrainable to set as a String.
	 */
	public void setIsEvangelismTrainable(int isEvangelismTrainable) {
		this.isEvangelismTrainable = isEvangelismTrainable;
	}

	/**
	 * Returns the participationExplanation.
	 * @return String
	 */
	public String getParticipationExplanation() {
		return this.participationExplanation;
	}

	/**
	 * Sets the participationExplanation.
	 * @param participationExplanation  The participationExplanation to set as a String.
	 */
	public void setParticipationExplanation(String participationExplanation) {
		this.participationExplanation = participationExplanation;
	}

	/**
	 * Returns the isFamiliarFourSpiritualLaws.
	 * @return String
	 */
	public int getIsFamiliarFourSpiritualLaws() {
		return this.isFamiliarFourSpiritualLaws;
	}

	/**
	 * Sets the isFamiliarFourSpiritualLaws.
	 * @param isFamiliarFourSpiritualLaws  The isFamiliarFourSpiritualLaws to set as a String.
	 */
	public void setIsFamiliarFourSpiritualLaws(int isFamiliarFourSpiritualLaws) {
		this.isFamiliarFourSpiritualLaws = isFamiliarFourSpiritualLaws;
	}

	/**
	 * Returns the hasExperienceFourSpiritualLaws.
	 * @return String
	 */
	public int getHasExperienceFourSpiritualLaws() {
		return this.hasExperienceFourSpiritualLaws;
	}

	/**
	 * Sets the hasExperienceFourSpiritualLaws.
	 * @param hasExperienceFourSpiritualLaws  The hasExperienceFourSpiritualLaws to set as a String.
	 */
	public void setHasExperienceFourSpiritualLaws(int hasExperienceFourSpiritualLaws) {
		this.hasExperienceFourSpiritualLaws = hasExperienceFourSpiritualLaws;
	}

	/**
	 * Returns the confidenceFourSpiritualLaws.
	 * @return int
	 */
	public int getConfidenceFourSpiritualLaws() {
		return this.confidenceFourSpiritualLaws;
	}

	/**
	 * Sets the confidenceFourSpiritualLaws.
	 * @param confidenceFourSpiritualLaws  The confidenceFourSpiritualLaws to set as a int.
	 */
	public void setConfidenceFourSpiritualLaws(int confidenceFourSpiritualLaws) {
		this.confidenceFourSpiritualLaws = confidenceFourSpiritualLaws;
	}

	/**
	 * Returns the isFamiliarLifeAtLarge.
	 * @return String
	 */
	public int getIsFamiliarLifeAtLarge() {
		return this.isFamiliarLifeAtLarge;
	}

	/**
	 * Sets the isFamiliarLifeAtLarge.
	 * @param isFamiliarLifeAtLarge  The isFamiliarLifeAtLarge to set as a String.
	 */
	public void setIsFamiliarLifeAtLarge(int isFamiliarLifeAtLarge) {
		this.isFamiliarLifeAtLarge = isFamiliarLifeAtLarge;
	}

	/**
	 * Returns the hasExperienceLifeAtLarge.
	 * @return String
	 */
	public int getHasExperienceLifeAtLarge() {
		return this.hasExperienceLifeAtLarge;
	}

	/**
	 * Sets the hasExperienceLifeAtLarge.
	 * @param hasExperienceLifeAtLarge  The hasExperienceLifeAtLarge to set as a String.
	 */
	public void setHasExperienceLifeAtLarge(int hasExperienceLifeAtLarge) {
		this.hasExperienceLifeAtLarge = hasExperienceLifeAtLarge;
	}

	/**
	 * Returns the confidenceLifeAtLarge.
	 * @return int
	 */
	public int getConfidenceLifeAtLarge() {
		return this.confidenceLifeAtLarge;
	}

	/**
	 * Sets the confidenceLifeAtLarge.
	 * @param confidenceLifeAtLarge  The confidenceLifeAtLarge to set as a int.
	 */
	public void setConfidenceLifeAtLarge(int confidenceLifeAtLarge) {
		this.confidenceLifeAtLarge = confidenceLifeAtLarge;
	}

	/**
	 * Returns the isFamiliarPersonalTestimony.
	 * @return String
	 */
	public int getIsFamiliarPersonalTestimony() {
		return this.isFamiliarPersonalTestimony;
	}

	/**
	 * Sets the isFamiliarPersonalTestimony.
	 * @param isFamiliarPersonalTestimony  The isFamiliarPersonalTestimony to set as a String.
	 */
	public void setIsFamiliarPersonalTestimony(int isFamiliarPersonalTestimony) {
		this.isFamiliarPersonalTestimony = isFamiliarPersonalTestimony;
	}

	/**
	 * Returns the hasExperiencePersonalTestimony.
	 * @return String
	 */
	public int getHasExperiencePersonalTestimony() {
		return this.hasExperiencePersonalTestimony;
	}

	/**
	 * Sets the hasExperiencePersonalTestimony.
	 * @param hasExperiencePersonalTestimony  The hasExperiencePersonalTestimony to set as a String.
	 */
	public void setHasExperiencePersonalTestimony(int hasExperiencePersonalTestimony) {
		this.hasExperiencePersonalTestimony = hasExperiencePersonalTestimony;
	}

	/**
	 * Returns the confidencePersonalTestimony.
	 * @return int
	 */
	public int getConfidencePersonalTestimony() {
		return this.confidencePersonalTestimony;
	}

	/**
	 * Sets the confidencePersonalTestimony.
	 * @param confidencePersonalTestimony  The confidencePersonalTestimony to set as a int.
	 */
	public void setConfidencePersonalTestimony(int confidencePersonalTestimony) {
		this.confidencePersonalTestimony = confidencePersonalTestimony;
	}

	/**
	 * Returns the isFamiliarExplainingGospel.
	 * @return String
	 */
	public int getIsFamiliarExplainingGospel() {
		return this.isFamiliarExplainingGospel;
	}

	/**
	 * Sets the isFamiliarExplainingGospel.
	 * @param isFamiliarExplainingGospel  The isFamiliarExplainingGospel to set as a String.
	 */
	public void setIsFamiliarExplainingGospel(int isFamiliarExplainingGospel) {
		this.isFamiliarExplainingGospel = isFamiliarExplainingGospel;
	}

	/**
	 * Returns the hasExperienceExplainingGospel.
	 * @return String
	 */
	public int getHasExperienceExplainingGospel() {
		return this.hasExperienceExplainingGospel;
	}

	/**
	 * Sets the hasExperienceExplainingGospel.
	 * @param hasExperienceExplainingGospel  The hasExperienceExplainingGospel to set as a String.
	 */
	public void setHasExperienceExplainingGospel(int hasExperienceExplainingGospel) {
		this.hasExperienceExplainingGospel = hasExperienceExplainingGospel;
	}

	/**
	 * Returns the confidenceExplainingGospel.
	 * @return int
	 */
	public int getConfidenceExplainingGospel() {
		return this.confidenceExplainingGospel;
	}

	/**
	 * Sets the confidenceExplainingGospel.
	 * @param confidenceExplainingGospel  The confidenceExplainingGospel to set as a int.
	 */
	public void setConfidenceExplainingGospel(int confidenceExplainingGospel) {
		this.confidenceExplainingGospel = confidenceExplainingGospel;
	}

	/**
	 * Returns the isFamiliarSharingFaith.
	 * @return String
	 */
	public int getIsFamiliarSharingFaith() {
		return this.isFamiliarSharingFaith;
	}

	/**
	 * Sets the isFamiliarSharingFaith.
	 * @param isFamiliarSharingFaith  The isFamiliarSharingFaith to set as a String.
	 */
	public void setIsFamiliarSharingFaith(int isFamiliarSharingFaith) {
		this.isFamiliarSharingFaith = isFamiliarSharingFaith;
	}

	/**
	 * Returns the hasExperienceSharingFaith.
	 * @return String
	 */
	public int getHasExperienceSharingFaith() {
		return this.hasExperienceSharingFaith;
	}

	/**
	 * Sets the hasExperienceSharingFaith.
	 * @param hasExperienceSharingFaith  The hasExperienceSharingFaith to set as a String.
	 */
	public void setHasExperienceSharingFaith(int hasExperienceSharingFaith) {
		this.hasExperienceSharingFaith = hasExperienceSharingFaith;
	}

	/**
	 * Returns the confidenceSharingFaith.
	 * @return int
	 */
	public int getConfidenceSharingFaith() {
		return this.confidenceSharingFaith;
	}

	/**
	 * Sets the confidenceSharingFaith.
	 * @param confidenceSharingFaith  The confidenceSharingFaith to set as a int.
	 */
	public void setConfidenceSharingFaith(int confidenceSharingFaith) {
		this.confidenceSharingFaith = confidenceSharingFaith;
	}

	/**
	 * Returns the isFamiliarHolySpiritBooklet.
	 * @return String
	 */
	public int getIsFamiliarHolySpiritBooklet() {
		return this.isFamiliarHolySpiritBooklet;
	}

	/**
	 * Sets the isFamiliarHolySpiritBooklet.
	 * @param isFamiliarHolySpiritBooklet  The isFamiliarHolySpiritBooklet to set as a String.
	 */
	public void setIsFamiliarHolySpiritBooklet(int isFamiliarHolySpiritBooklet) {
		this.isFamiliarHolySpiritBooklet = isFamiliarHolySpiritBooklet;
	}

	/**
	 * Returns the hasExperienceHolySpiritBooklet.
	 * @return String
	 */
	public int getHasExperienceHolySpiritBooklet() {
		return this.hasExperienceHolySpiritBooklet;
	}

	/**
	 * Sets the hasExperienceHolySpiritBooklet.
	 * @param hasExperienceHolySpiritBooklet  The hasExperienceHolySpiritBooklet to set as a String.
	 */
	public void setHasExperienceHolySpiritBooklet(int hasExperienceHolySpiritBooklet) {
		this.hasExperienceHolySpiritBooklet = hasExperienceHolySpiritBooklet;
	}

	/**
	 * Returns the confidenceHolySpiritBooklet.
	 * @return int
	 */
	public int getConfidenceHolySpiritBooklet() {
		return this.confidenceHolySpiritBooklet;
	}

	/**
	 * Sets the confidenceHolySpiritBooklet.
	 * @param confidenceHolySpiritBooklet  The confidenceHolySpiritBooklet to set as a int.
	 */
	public void setConfidenceHolySpiritBooklet(int confidenceHolySpiritBooklet) {
		this.confidenceHolySpiritBooklet = confidenceHolySpiritBooklet;
	}

	/**
	 * Returns the isFamiliarFollowUp.
	 * @return String
	 */
	public int getIsFamiliarFollowUp() {
		return this.isFamiliarFollowUp;
	}

	/**
	 * Sets the isFamiliarFollowUp.
	 * @param isFamiliarFollowUp  The isFamiliarFollowUp to set as a String.
	 */
	public void setIsFamiliarFollowUp(int isFamiliarFollowUp) {
		this.isFamiliarFollowUp = isFamiliarFollowUp;
	}

	/**
	 * Returns the hasExperienceFollowUp.
	 * @return String
	 */
	public int getHasExperienceFollowUp() {
		return this.hasExperienceFollowUp;
	}

	/**
	 * Sets the hasExperienceFollowUp.
	 * @param hasExperienceFollowUp  The hasExperienceFollowUp to set as a String.
	 */
	public void setHasExperienceFollowUp(int hasExperienceFollowUp) {
		this.hasExperienceFollowUp = hasExperienceFollowUp;
	}

	/**
	 * Returns the confidenceFollowUp.
	 * @return int
	 */
	public int getConfidenceFollowUp() {
		return this.confidenceFollowUp;
	}

	/**
	 * Sets the confidenceFollowUp.
	 * @param confidenceFollowUp  The confidenceFollowUp to set as a int.
	 */
	public void setConfidenceFollowUp(int confidenceFollowUp) {
		this.confidenceFollowUp = confidenceFollowUp;
	}

	/**
	 * Returns the isFamiliarHelpGrowInFaith.
	 * @return String
	 */
	public int getIsFamiliarHelpGrowInFaith() {
		return this.isFamiliarHelpGrowInFaith;
	}

	/**
	 * Sets the isFamiliarHelpGrowInFaith.
	 * @param isFamiliarHelpGrowInFaith  The isFamiliarHelpGrowInFaith to set as a String.
	 */
	public void setIsFamiliarHelpGrowInFaith(int isFamiliarHelpGrowInFaith) {
		this.isFamiliarHelpGrowInFaith = isFamiliarHelpGrowInFaith;
	}

	/**
	 * Returns the hasExperienceHelpGrowInFaith.
	 * @return String
	 */
	public int getHasExperienceHelpGrowInFaith() {
		return this.hasExperienceHelpGrowInFaith;
	}

	/**
	 * Sets the hasExperienceHelpGrowInFaith.
	 * @param hasExperienceHelpGrowInFaith  The hasExperienceHelpGrowInFaith to set as a String.
	 */
	public void setHasExperienceHelpGrowInFaith(int hasExperienceHelpGrowInFaith) {
		this.hasExperienceHelpGrowInFaith = hasExperienceHelpGrowInFaith;
	}

	/**
	 * Returns the confidenceHelpGrowInFaith.
	 * @return int
	 */
	public int getConfidenceHelpGrowInFaith() {
		return this.confidenceHelpGrowInFaith;
	}

	/**
	 * Sets the confidenceHelpGrowInFaith.
	 * @param confidenceHelpGrowInFaith  The confidenceHelpGrowInFaith to set as a int.
	 */
	public void setConfidenceHelpGrowInFaith(int confidenceHelpGrowInFaith) {
		this.confidenceHelpGrowInFaith = confidenceHelpGrowInFaith;
	}

	/**
	 * Returns the isFamiliarTrainShareFaith.
	 * @return String
	 */
	public int getIsFamiliarTrainShareFaith() {
		return this.isFamiliarTrainShareFaith;
	}

	/**
	 * Sets the isFamiliarTrainShareFaith.
	 * @param isFamiliarTrainShareFaith  The isFamiliarTrainShareFaith to set as a String.
	 */
	public void setIsFamiliarTrainShareFaith(int isFamiliarTrainShareFaith) {
		this.isFamiliarTrainShareFaith = isFamiliarTrainShareFaith;
	}

	/**
	 * Returns the hasExperienceTrainShareFaith.
	 * @return String
	 */
	public int getHasExperienceTrainShareFaith() {
		return this.hasExperienceTrainShareFaith;
	}

	/**
	 * Sets the hasExperienceTrainShareFaith.
	 * @param hasExperienceTrainShareFaith  The hasExperienceTrainShareFaith to set as a String.
	 */
	public void setHasExperienceTrainShareFaith(int hasExperienceTrainShareFaith) {
		this.hasExperienceTrainShareFaith = hasExperienceTrainShareFaith;
	}

	/**
	 * Returns the confidenceTrainShareFaith.
	 * @return int
	 */
	public int getConfidenceTrainShareFaith() {
		return this.confidenceTrainShareFaith;
	}

	/**
	 * Sets the confidenceTrainShareFaith.
	 * @param confidenceTrainShareFaith  The confidenceTrainShareFaith to set as a int.
	 */
	public void setConfidenceTrainShareFaith(int confidenceTrainShareFaith) {
		this.confidenceTrainShareFaith = confidenceTrainShareFaith;
	}

	/**
	 * Returns the isFamiliarOtherReligions.
	 * @return String
	 */
	public int getIsFamiliarOtherReligions() {
		return this.isFamiliarOtherReligions;
	}

	/**
	 * Sets the isFamiliarOtherReligions.
	 * @param isFamiliarOtherReligions  The isFamiliarOtherReligions to set as a String.
	 */
	public void setIsFamiliarOtherReligions(int isFamiliarOtherReligions) {
		this.isFamiliarOtherReligions = isFamiliarOtherReligions;
	}

	/**
	 * Returns the hasExperienceOtherReligions.
	 * @return String
	 */
	public int getHasExperienceOtherReligions() {
		return this.hasExperienceOtherReligions;
	}

	/**
	 * Sets the hasExperienceOtherReligions.
	 * @param hasExperienceOtherReligions  The hasExperienceOtherReligions to set as a String.
	 */
	public void setHasExperienceOtherReligions(int hasExperienceOtherReligions) {
		this.hasExperienceOtherReligions = hasExperienceOtherReligions;
	}

	/**
	 * Returns the confidenceOtherReligions.
	 * @return int
	 */
	public int getConfidenceOtherReligions() {
		return this.confidenceOtherReligions;
	}

	/**
	 * Sets the confidenceOtherReligions.
	 * @param confidenceOtherReligions  The confidenceOtherReligions to set as a int.
	 */
	public void setConfidenceOtherReligions(int confidenceOtherReligions) {
		this.confidenceOtherReligions = confidenceOtherReligions;
	}

	/**
	 * Returns the leadershipPositions.
	 * @return String
	 */
	public String getLeadershipPositions() {
		return this.leadershipPositions;
	}

	/**
	 * Sets the leadershipPositions.
	 * @param leadershipPositions  The leadershipPositions to set as a String.
	 */
	public void setLeadershipPositions(String leadershipPositions) {
		this.leadershipPositions = leadershipPositions;
	}

	/**
	 * Returns the hasLedDiscipleshipGroup.
	 * @return String
	 */
	public int getHasLedDiscipleshipGroup() {
		return this.hasLedDiscipleshipGroup;
	}

	/**
	 * Sets the hasLedDiscipleshipGroup.
	 * @param hasLedDiscipleshipGroup  The hasLedDiscipleshipGroup to set as a String.
	 */
	public void setHasLedDiscipleshipGroup(int hasLedDiscipleshipGroup) {
		this.hasLedDiscipleshipGroup = hasLedDiscipleshipGroup;
	}

	/**
	 * Returns the discipleshipGroupSize.
	 * @return String
	 */
	public String getDiscipleshipGroupSize() {
		return this.discipleshipGroupSize;
	}

	/**
	 * Sets the discipleshipGroupSize.
	 * @param discipleshipGroupSize  The discipleshipGroupSize to set as a String.
	 */
	public void setDiscipleshipGroupSize(String discipleshipGroupSize) {
		this.discipleshipGroupSize = discipleshipGroupSize;
	}

	/**
	 * Returns the leadershipEvaluation.
	 * @return String
	 */
	public String getLeadershipEvaluation() {
		return this.leadershipEvaluation;
	}

	/**
	 * Sets the leadershipEvaluation.
	 * @param leadershipEvaluation  The leadershipEvaluation to set as a String.
	 */
	public void setLeadershipEvaluation(String leadershipEvaluation) {
		this.leadershipEvaluation = leadershipEvaluation;
	}

	/******************************* Church and Spiritual Background */

	/**
	 * Returns the conversionMonth.
	 * @return int
	 */
	public int getConversionMonth() {
		return this.conversionMonth;
	}

	/**
	 * Sets the conversionMonth.
	 * @param conversionMonth  The conversionMonth to set as a int.
	 */
	public void setConversionMonth(int conversionMonth) {
		this.conversionMonth = conversionMonth;
	}

	/**
	 * Returns the conversionYear.
	 * @return int
	 */
	public int getConversionYear() {
		return this.conversionYear;
	}

	/**
	 * Sets the conversionYear.
	 * @param conversionYear  The conversionYear to set as a int.
	 */
	public void setConversionYear(int conversionYear) {
		this.conversionYear = conversionYear;
	}

	/**
	 * Returns the memberChurchDenomination.
	 * @return String
	 */
	public String getMemberChurchDenomination() {
		return this.memberChurchDenomination;
	}

	/**
	 * Sets the memberChurchDenomination.
	 * @param memberChurchDenomination  The memberChurchDenomination to set as a String.
	 */
	public void setMemberChurchDenomination(String memberChurchDenomination) {
		this.memberChurchDenomination = memberChurchDenomination;
	}

	/**
	 * Returns the memberChurchDuration.
	 * @return String
	 */
	public String getMemberChurchDuration() {
		return this.memberChurchDuration;
	}

	/**
	 * Sets the memberChurchDuration.
	 * @param memberChurchDuration  The memberChurchDuration to set as a String.
	 */
	public void setMemberChurchDuration(String memberChurchDuration) {
		this.memberChurchDuration = memberChurchDuration;
	}

	/**
	 * Returns the attendingChurchDenomination.
	 * @return String
	 */
	public String getAttendingChurchDenomination() {
		return this.attendingChurchDenomination;
	}

	/**
	 * Sets the attendingChurchDenomination.
	 * @param attendingChurchDenomination  The attendingChurchDenomination to set as a String.
	 */
	public void setAttendingChurchDenomination(String attendingChurchDenomination) {
		this.attendingChurchDenomination = attendingChurchDenomination;
	}

	/**
	 * Returns the attendingChurchDuration.
	 * @return String
	 */
	public String getAttendingChurchDuration() {
		return this.attendingChurchDuration;
	}

	/**
	 * Sets the attendingChurchDuration.
	 * @param attendingChurchDuration  The attendingChurchDuration to set as a String.
	 */
	public void setAttendingChurchDuration(String attendingChurchDuration) {
		this.attendingChurchDuration = attendingChurchDuration;
	}

	/**
	 * Returns the attendingChurchInvolvement.
	 * @return String
	 */
	public String getAttendingChurchInvolvement() {
		return this.attendingChurchInvolvement;
	}

	/**
	 * Sets the attendingChurchInvolvement.
	 * @param attendingChurchInvolvement  The attendingChurchInvolvement to set as a String.
	 */
	public void setAttendingChurchInvolvement(String attendingChurchInvolvement) {
		this.attendingChurchInvolvement = attendingChurchInvolvement;
	}

	/**
	 * Returns the quietTimeQuantity.
	 * @return String
	 */
	public String getQuietTimeQuantity() {
		return this.quietTimeQuantity;
	}

	/**
	 * Sets the quietTimeQuantity.
	 * @param quietTimeQuantity  The quietTimeQuantity to set as a String.
	 */
	public void setQuietTimeQuantity(String quietTimeQuantity) {
		this.quietTimeQuantity = quietTimeQuantity;
	}

	/**
	 * Returns the quietTimeDescription.
	 * @return String
	 */
	public String getQuietTimeDescription() {
		return this.quietTimeDescription;
	}

	/**
	 * Sets the quietTimeDescription.
	 * @param quietTimeDescription  The quietTimeDescription to set as a String.
	 */
	public void setQuietTimeDescription(String quietTimeDescription) {
		this.quietTimeDescription = quietTimeDescription;
	}

	/**
	 * Returns the explanationOfSalvation.
	 * @return String
	 */
	public String getExplanationOfSalvation() {
		return this.explanationOfSalvation;
	}

	/**
	 * Sets the explanationOfSalvation.
	 * @param explanationOfSalvation  The explanationOfSalvation to set as a String.
	 */
	public void setExplanationOfSalvation(String explanationOfSalvation) {
		this.explanationOfSalvation = explanationOfSalvation;
	}

	/**
	 * Returns the explanationOfSpiritFilled.
	 * @return String
	 */
	public String getExplanationOfSpiritFilled() {
		return this.explanationOfSpiritFilled;
	}

	/**
	 * Sets the explanationOfSpiritFilled.
	 * @param explanationOfSpiritFilled  The explanationOfSpiritFilled to set as a String.
	 */
	public void setExplanationOfSpiritFilled(String explanationOfSpiritFilled) {
		this.explanationOfSpiritFilled = explanationOfSpiritFilled;
	}

	/**
	 * Returns the hasInvolvementSpeakingTongues.
	 * @return String
	 */
	public int getHasInvolvementSpeakingTongues() {
		return this.hasInvolvementSpeakingTongues;
	}

	/**
	 * Sets the hasInvolvementSpeakingTongues.
	 * @param hasInvolvementSpeakingTongues  The hasInvolvementSpeakingTongues to set as a String.
	 */
	public void setHasInvolvementSpeakingTongues(int hasInvolvementSpeakingTongues) {
		this.hasInvolvementSpeakingTongues = hasInvolvementSpeakingTongues;
	}

	/**
	 * Returns the differenceIndwellingFilled.
	 * @return String
	 */
	public String getDifferenceIndwellingFilled() {
		return this.differenceIndwellingFilled;
	}

	/**
	 * Sets the differenceIndwellingFilled.
	 * @param differenceIndwellingFilled  The differenceIndwellingFilled to set as a String.
	 */
	public void setDifferenceIndwellingFilled(String differenceIndwellingFilled) {
		this.differenceIndwellingFilled = differenceIndwellingFilled;
	}

	/******************************* Personal Information */

	/**
	 * Returns the hasCrimeConviction.
	 * @return String
	 */
	public int getHasCrimeConviction() {
		return this.hasCrimeConviction;
	}

	/**
	 * Sets the hasCrimeConviction.
	 * @param hasCrimeConviction  The hasCrimeConviction to set as a String.
	 */
	public void setHasCrimeConviction(int hasCrimeConviction) {
		this.hasCrimeConviction = hasCrimeConviction;
	}

	/**
	 * Returns the crimeConvictionExplanation.
	 * @return String
	 */
	public String getCrimeConvictionExplanation() {
		return this.crimeConvictionExplanation;
	}

	/**
	 * Sets the crimeConvictionExplanation.
	 * @param crimeConvictionExplanation  The crimeConvictionExplanation to set as a String.
	 */
	public void setCrimeConvictionExplanation(String crimeConvictionExplanation) {
		this.crimeConvictionExplanation = crimeConvictionExplanation;
	}

	/**
	 * Returns the hasDrugUse.
	 * @return String
	 */
	public int getHasDrugUse() {
		return this.hasDrugUse;
	}

	/**
	 * Sets the hasDrugUse.
	 * @param hasDrugUse  The hasDrugUse to set as a String.
	 */
	public void setHasDrugUse(int hasDrugUse) {
		this.hasDrugUse = hasDrugUse;
	}

	/**
	 * Returns the isTobaccoUser.
	 * @return String
	 */
	public int getIsTobaccoUser() {
		return this.isTobaccoUser;
	}

	/**
	 * Sets the isTobaccoUser.
	 * @param isTobaccoUser  The isTobaccoUser to set as a String.
	 */
	public void setIsTobaccoUser(int isTobaccoUser) {
		this.isTobaccoUser = isTobaccoUser;
	}

	/**
	 * Returns the isWillingChangeHabits.
	 * @return String
	 */
	public int getIsWillingChangeHabits() {
		return this.isWillingChangeHabits;
	}

	/**
	 * Sets the isWillingChangeHabits.
	 * @param isWillingChangeHabits  The isWillingChangeHabits to set as a String.
	 */
	public void setIsWillingChangeHabits(int isWillingChangeHabits) {
		this.isWillingChangeHabits = isWillingChangeHabits;
	}

	/**
	 * Returns the authorityResponseExplanation.
	 * @return String
	 */
	public String getAuthorityResponseExplanation() {
		return this.authorityResponseExplanation;
	}

	/**
	 * Sets the authorityResponseExplanation.
	 * @param authorityResponseExplanation  The authorityResponseExplanation to set as a String.
	 */
	public void setAuthorityResponseExplanation(String authorityResponseExplanation) {
		this.authorityResponseExplanation = authorityResponseExplanation;
	}

	/******************************* Alcohol Use */

	/**
	 * Returns the alcoholUseFrequency.
	 * @return String
	 */
	public String getAlcoholUseFrequency() {
		return this.alcoholUseFrequency;
	}

	/**
	 * Sets the alcoholUseFrequency.
	 * @param alcoholUseFrequency  The alcoholUseFrequency to set as a String.
	 */
	public void setAlcoholUseFrequency(String alcoholUseFrequency) {
		this.alcoholUseFrequency = alcoholUseFrequency;
	}

	/**
	 * Returns the alcoholUseDecision.
	 * @return String
	 */
	public String getAlcoholUseDecision() {
		return this.alcoholUseDecision;
	}

	/**
	 * Sets the alcoholUseDecision.
	 * @param alcoholUseDecision  The alcoholUseDecision to set as a String.
	 */
	public void setAlcoholUseDecision(String alcoholUseDecision) {
		this.alcoholUseDecision = alcoholUseDecision;
	}

	/**
	 * Returns the isWillingRefrainAlcohol.
	 * @return String
	 */
	public int getIsWillingRefrainAlcohol() {
		return this.isWillingRefrainAlcohol;
	}

	/**
	 * Sets the isWillingRefrainAlcohol.
	 * @param isWillingRefrainAlcohol  The isWillingRefrainAlcohol to set as a String.
	 */
	public void setIsWillingRefrainAlcohol(int isWillingRefrainAlcohol) {
		this.isWillingRefrainAlcohol = isWillingRefrainAlcohol;
	}

	/**
	 * Returns the unwillingRefrainAlcoholExplanation.
	 * @return String
	 */
	public String getUnwillingRefrainAlcoholExplanation() {
		return this.unwillingRefrainAlcoholExplanation;
	}

	/**
	 * Sets the unwillingRefrainAlcoholExplanation.
	 * @param unwillingRefrainAlcoholExplanation  The unwillingRefrainAlcoholExplanation to set as a String.
	 */
	public void setUnwillingRefrainAlcoholExplanation(String unwillingRefrainAlcoholExplanation) {
		this.unwillingRefrainAlcoholExplanation = unwillingRefrainAlcoholExplanation;
	}

	/******************************* Drug Use */

	/**
	 * Returns the drugUseExplanation.
	 * @return String
	 */
	public String getDrugUseExplanation() {
		return this.drugUseExplanation;
	}

	/**
	 * Sets the drugUseExplanation.
	 * @param drugUseExplanation  The drugUseExplanation to set as a String.
	 */
	public void setDrugUseExplanation(String drugUseExplanation) {
		this.drugUseExplanation = drugUseExplanation;
	}

	/******************************* Tobacco Use */

	/**
	 * Returns the tobaccoUseExplanation.
	 * @return String
	 */
	public String getTobaccoUseExplanation() {
		return this.tobaccoUseExplanation;
	}

	/**
	 * Sets the tobaccoUseExplanation.
	 * @param tobaccoUseExplanation  The tobaccoUseExplanation to set as a String.
	 */
	public void setTobaccoUseExplanation(String tobaccoUseExplanation) {
		this.tobaccoUseExplanation = tobaccoUseExplanation;
	}

	/**
	 * Returns the isWillingAbstainTobacco.
	 * @return String
	 */
	public int getIsWillingAbstainTobacco() {
		return this.isWillingAbstainTobacco;
	}

	/**
	 * Sets the isWillingAbstainTobacco.
	 * @param isWillingAbstainTobacco  The isWillingAbstainTobacco to set as a String.
	 */
	public void setIsWillingAbstainTobacco(int isWillingAbstainTobacco) {
		this.isWillingAbstainTobacco = isWillingAbstainTobacco;
	}

	/******************************* Moral Convictions */

	/**
	 * Returns the hasRequestedPhoneCall.
	 * @return String
	 */
	public int getHasRequestedPhoneCall() {
		return this.hasRequestedPhoneCall;
	}

	/**
	 * Sets the hasRequestedPhoneCall.
	 * @param hasRequestedPhoneCall  The hasRequestedPhoneCall to set as a String.
	 */
	public void setHasRequestedPhoneCall(int hasRequestedPhoneCall) {
		this.hasRequestedPhoneCall = hasRequestedPhoneCall;
	}

	/**
	 * Returns the contactPhoneNumber.
	 * @return String
	 */
	public String getContactPhoneNumber() {
		return this.contactPhoneNumber;
	}

	/**
	 * Sets the contactPhoneNumber.
	 * @param contactPhoneNumber  The contactPhoneNumber to set as a String.
	 */
	public void setContactPhoneNumber(String contactPhoneNumber) {
		this.contactPhoneNumber = contactPhoneNumber;
	}

	/**
	 * Returns the contactBestTime.
	 * @return String
	 */
	public String getContactBestTime() {
		return this.contactBestTime;
	}

	/**
	 * Sets the contactBestTime.
	 * @param contactBestTime  The contactBestTime to set as a String.
	 */
	public void setContactBestTime(String contactBestTime) {
		this.contactBestTime = contactBestTime;
	}

	/**
	 * Returns the contactTimeZone.
	 * @return String
	 */
	public String getContactTimeZone() {
		return this.contactTimeZone;
	}

	/**
	 * Sets the contactTimeZone.
	 * @param contactTimeZone  The contactTimeZone to set as a String.
	 */
	public void setContactTimeZone(String contactTimeZone) {
		this.contactTimeZone = contactTimeZone;
	}

	/**
	 * Returns the sexualInvolvementExplanation.
	 * @return String
	 */
	public String getSexualInvolvementExplanation() {
		return this.sexualInvolvementExplanation;
	}

	/**
	 * Sets the sexualInvolvementExplanation.
	 * @param sexualInvolvementExplanation  The sexualInvolvementExplanation to set as a String.
	 */
	public void setSexualInvolvementExplanation(String sexualInvolvementExplanation) {
		this.sexualInvolvementExplanation = sexualInvolvementExplanation;
	}

	/**
	 * Returns the hasSexualGuidelines.
	 * @return String
	 */
	public int getHasSexualGuidelines() {
		return this.hasSexualGuidelines;
	}

	/**
	 * Sets the hasSexualGuidelines.
	 * @param hasSexualGuidelines  The hasSexualGuidelines to set as a String.
	 */
	public void setHasSexualGuidelines(int hasSexualGuidelines) {
		this.hasSexualGuidelines = hasSexualGuidelines;
	}

	/**
	 * Returns the sexualGuidelineExplanation.
	 * @return String
	 */
	public String getSexualGuidelineExplanation() {
		return this.sexualGuidelineExplanation;
	}

	/**
	 * Sets the sexualGuidelineExplanation.
	 * @param sexualGuidelineExplanation  The sexualGuidelineExplanation to set as a String.
	 */
	public void setSexualGuidelineExplanation(String sexualGuidelineExplanation) {
		this.sexualGuidelineExplanation = sexualGuidelineExplanation;
	}

	/**
	 * Returns the isCurrentlyDating.
	 * @return String
	 */
	public int getIsCurrentlyDating() {
		return this.isCurrentlyDating;
	}

	/**
	 * Sets the isCurrentlyDating.
	 * @param isCurrentlyDating  The isCurrentlyDating to set as a String.
	 */
	public void setIsCurrentlyDating(int isCurrentlyDating) {
		this.isCurrentlyDating = isCurrentlyDating;
	}

	/**
	 * Returns the currentlyDatingLocation.
	 * @return String
	 */
	public String getCurrentlyDatingLocation() {
		return this.currentlyDatingLocation;
	}

	/**
	 * Sets the currentlyDatingLocation.
	 * @param currentlyDatingLocation  The currentlyDatingLocation to set as a String.
	 */
	public void setCurrentlyDatingLocation(String currentlyDatingLocation) {
		this.currentlyDatingLocation = currentlyDatingLocation;
	}

	/**
	 * Returns the hasHomosexualInvolvement.
	 * @return String
	 */
	public int getHasHomosexualInvolvement() {
		return this.hasHomosexualInvolvement;
	}

	/**
	 * Sets the hasHomosexualInvolvement.
	 * @param hasHomosexualInvolvement  The hasHomosexualInvolvement to set as a String.
	 */
	public void setHasHomosexualInvolvement(int hasHomosexualInvolvement) {
		this.hasHomosexualInvolvement = hasHomosexualInvolvement;
	}

	/**
	 * Returns the homosexualInvolvementExplanation.
	 * @return String
	 */
	public String getHomosexualInvolvementExplanation() {
		return this.homosexualInvolvementExplanation;
	}

	/**
	 * Sets the homosexualInvolvementExplanation.
	 * @param homosexualInvolvementExplanation  The homosexualInvolvementExplanation to set as a String.
	 */
	public void setHomosexualInvolvementExplanation(String homosexualInvolvementExplanation) {
		this.homosexualInvolvementExplanation = homosexualInvolvementExplanation;
	}

	/**
	 * Returns the hasRecentPornographicInvolvement.
	 * @return String
	 */
	public int getHasRecentPornographicInvolvement() {
		return this.hasRecentPornographicInvolvement;
	}

	/**
	 * Sets the hasRecentPornographicInvolvement.
	 * @param hasRecentPornographicInvolvement  The hasRecentPornographicInvolvement to set as a String.
	 */
	public void setHasRecentPornographicInvolvement(int hasRecentPornographicInvolvement) {
		this.hasRecentPornographicInvolvement = hasRecentPornographicInvolvement;
	}

	/**
	 * Returns the pornographicInvolvementMonth.
	 * @return int
	 */
	public int getPornographicInvolvementMonth() {
		return this.pornographicInvolvementMonth;
	}

	/**
	 * Sets the pornographicInvolvementMonth.
	 * @param pornographicInvolvementMonth  The pornographicInvolvementMonth to set as a int.
	 */
	public void setPornographicInvolvementMonth(int pornographicInvolvementMonth) {
		this.pornographicInvolvementMonth = pornographicInvolvementMonth;
	}

	/**
	 * Returns the pornographicInvolvementYear.
	 * @return int
	 */
	public int getPornographicInvolvementYear() {
		return this.pornographicInvolvementYear;
	}

	/**
	 * Sets the pornographicInvolvementYear.
	 * @param pornographicInvolvementYear  The pornographicInvolvementYear to set as a int.
	 */
	public void setPornographicInvolvementYear(int pornographicInvolvementYear) {
		this.pornographicInvolvementYear = pornographicInvolvementYear;
	}

	/**
	 * Returns the pornographicInvolvementExplanation.
	 * @return String
	 */
	public String getPornographicInvolvementExplanation() {
		return this.pornographicInvolvementExplanation;
	}

	/**
	 * Sets the pornographicInvolvementExplanation.
	 * @param pornographicInvolvementExplanation  The pornographicInvolvementExplanation to set as a String.
	 */
	public void setPornographicInvolvementExplanation(String pornographicInvolvementExplanation) {
		this.pornographicInvolvementExplanation = pornographicInvolvementExplanation;
	}

	/**
	 * Returns the hasRecentSexualImmorality.
	 * @return String
	 */
	public int getHasRecentSexualImmorality() {
		return this.hasRecentSexualImmorality;
	}

	/**
	 * Sets the hasRecentSexualImmorality.
	 * @param hasRecentSexualImmorality  The hasRecentSexualImmorality to set as a String.
	 */
	public void setHasRecentSexualImmorality(int hasRecentSexualImmorality) {
		this.hasRecentSexualImmorality = hasRecentSexualImmorality;
	}

	/**
	 * Returns the sexualImmoralityMonth.
	 * @return int
	 */
	public int getSexualImmoralityMonth() {
		return this.sexualImmoralityMonth;
	}

	/**
	 * Sets the sexualImmoralityMonth.
	 * @param sexualImmoralityMonth  The sexualImmoralityMonth to set as a int.
	 */
	public void setSexualImmoralityMonth(int sexualImmoralityMonth) {
		this.sexualImmoralityMonth = sexualImmoralityMonth;
	}

	/**
	 * Returns the sexualImmoralityYear.
	 * @return int
	 */
	public int getSexualImmoralityYear() {
		return this.sexualImmoralityYear;
	}

	/**
	 * Sets the sexualImmoralityYear.
	 * @param sexualImmoralityYear  The sexualImmoralityYear to set as a int.
	 */
	public void setSexualImmoralityYear(int sexualImmoralityYear) {
		this.sexualImmoralityYear = sexualImmoralityYear;
	}

	/**
	 * Returns the sexualImmoralityExplanation.
	 * @return String
	 */
	public String getSexualImmoralityExplanation() {
		return this.sexualImmoralityExplanation;
	}

	/**
	 * Sets the sexualImmoralityExplanation.
	 * @param sexualImmoralityExplanation  The sexualImmoralityExplanation to set as a String.
	 */
	public void setSexualImmoralityExplanation(String sexualImmoralityExplanation) {
		this.sexualImmoralityExplanation = sexualImmoralityExplanation;
	}

	/**
	 * Returns the hasOtherDateSinceImmorality.
	 * @return String
	 */
	public int getHasOtherDateSinceImmorality() {
		return this.hasOtherDateSinceImmorality;
	}

	/**
	 * Sets the hasOtherDateSinceImmorality.
	 * @param hasOtherDateSinceImmorality  The hasOtherDateSinceImmorality to set as a String.
	 */
	public void setHasOtherDateSinceImmorality(int hasOtherDateSinceImmorality) {
		this.hasOtherDateSinceImmorality = hasOtherDateSinceImmorality;
	}

	/**
	 * Returns the singleImmoralityResultsExplanation.
	 * @return String
	 */
	public String getSingleImmoralityResultsExplanation() {
		return this.singleImmoralityResultsExplanation;
	}

	/**
	 * Sets the singleImmoralityResultsExplanation.
	 * @param singleImmoralityResultsExplanation  The singleImmoralityResultsExplanation to set as a String.
	 */
	public void setSingleImmoralityResultsExplanation(String singleImmoralityResultsExplanation) {
		this.singleImmoralityResultsExplanation = singleImmoralityResultsExplanation;
	}

	/**
	 * Returns the marriedImmoralityResultsExplanation.
	 * @return String
	 */
	public String getMarriedImmoralityResultsExplanation() {
		return this.marriedImmoralityResultsExplanation;
	}

	/**
	 * Sets the marriedImmoralityResultsExplanation.
	 * @param marriedImmoralityResultsExplanation  The marriedImmoralityResultsExplanation to set as a String.
	 */
	public void setMarriedImmoralityResultsExplanation(String marriedImmoralityResultsExplanation) {
		this.marriedImmoralityResultsExplanation = marriedImmoralityResultsExplanation;
	}

	/**
	 * Returns the immoralityLifeChangeExplanation.
	 * @return String
	 */
	public String getImmoralityLifeChangeExplanation() {
		return this.immoralityLifeChangeExplanation;
	}

	/**
	 * Sets the immoralityLifeChangeExplanation.
	 * @param immoralityLifeChangeExplanation  The immoralityLifeChangeExplanation to set as a String.
	 */
	public void setImmoralityLifeChangeExplanation(String immoralityLifeChangeExplanation) {
		this.immoralityLifeChangeExplanation = immoralityLifeChangeExplanation;
	}

	/**
	 * Returns the immoralityCurrentStrugglesExplanation.
	 * @return String
	 */
	public String getImmoralityCurrentStrugglesExplanation() {
		return this.immoralityCurrentStrugglesExplanation;
	}

	/**
	 * Sets the immoralityCurrentStrugglesExplanation.
	 * @param immoralityCurrentStrugglesExplanation  The immoralityCurrentStrugglesExplanation to set as a String.
	 */
	public void setImmoralityCurrentStrugglesExplanation(String immoralityCurrentStrugglesExplanation) {
		this.immoralityCurrentStrugglesExplanation = immoralityCurrentStrugglesExplanation;
	}

	/**
	 * Returns the additionalMoralComments.
	 * @return String
	 */
	public String getAdditionalMoralComments() {
		return this.additionalMoralComments;
	}

	/**
	 * Sets the additionalMoralComments.
	 * @param additionalMoralComments  The additionalMoralComments to set as a String.
	 */
	public void setAdditionalMoralComments(String additionalMoralComments) {
		this.additionalMoralComments = additionalMoralComments;
	}

	/******************************* Finanacial Information */

	/**
	 * Returns the isAwareMustRaiseSupport.
	 * @return String
	 */
	public int getIsAwareMustRaiseSupport() {
		return this.isAwareMustRaiseSupport;
	}

	/**
	 * Sets the isAwareMustRaiseSupport.
	 * @param isAwareMustRaiseSupport  The isAwareMustRaiseSupport to set as a String.
	 */
	public void setIsAwareMustRaiseSupport(int isAwareMustRaiseSupport) {
		this.isAwareMustRaiseSupport = isAwareMustRaiseSupport;
	}

	/**
	 * Returns the isInDebt.
	 * @return String
	 */
	public int getIsInDebt() {
		return this.isInDebt;
	}

	/**
	 * Sets the isInDebt.
	 * @param isInDebt  The isInDebt to set as a String.
	 */
	public void setIsInDebt(int isInDebt) {
		this.isInDebt = isInDebt;
	}

	/**
	 * Returns the debtNature1.
	 * @return String
	 */
	public String getDebtNature1() {
		return this.debtNature1;
	}

	/**
	 * Sets the debtNature1.
	 * @param debtNature1  The debtNature1 to set as a String.
	 */
	public void setDebtNature1(String debtNature1) {
		this.debtNature1 = debtNature1;
	}

	/**
	 * Returns the debtTotal1.
	 * @return String
	 */
	public String getDebtTotal1() {
		return this.debtTotal1;
	}

	/**
	 * Sets the debtTotal1.
	 * @param debtTotal1  The debtTotal1 to set as a String.
	 */
	public void setDebtTotal1(String debtTotal1) {
		this.debtTotal1 = debtTotal1;
	}

	/**
	 * Returns the debtMonthlyPayment1.
	 * @return String
	 */
	public String getDebtMonthlyPayment1() {
		return this.debtMonthlyPayment1;
	}

	/**
	 * Sets the debtMonthlyPayment1.
	 * @param debtMonthlyPayment1  The debtMonthlyPayment1 to set as a String.
	 */
	public void setDebtMonthlyPayment1(String debtMonthlyPayment1) {
		this.debtMonthlyPayment1 = debtMonthlyPayment1;
	}

	/**
	 * Returns the debtNature2.
	 * @return String
	 */
	public String getDebtNature2() {
		return this.debtNature2;
	}

	/**
	 * Sets the debtNature2.
	 * @param debtNature2  The debtNature2 to set as a String.
	 */
	public void setDebtNature2(String debtNature2) {
		this.debtNature2 = debtNature2;
	}

	/**
	 * Returns the debtTotal2.
	 * @return String
	 */
	public String getDebtTotal2() {
		return this.debtTotal2;
	}

	/**
	 * Sets the debtTotal2.
	 * @param debtTotal2  The debtTotal2 to set as a String.
	 */
	public void setDebtTotal2(String debtTotal2) {
		this.debtTotal2 = debtTotal2;
	}

	/**
	 * Returns the debtMonthlyPayment2.
	 * @return String
	 */
	public String getDebtMonthlyPayment2() {
		return this.debtMonthlyPayment2;
	}

	/**
	 * Sets the debtMonthlyPayment2.
	 * @param debtMonthlyPayment2  The debtMonthlyPayment2 to set as a String.
	 */
	public void setDebtMonthlyPayment2(String debtMonthlyPayment2) {
		this.debtMonthlyPayment2 = debtMonthlyPayment2;
	}

	/**
	 * Returns the debtNature3.
	 * @return String
	 */
	public String getDebtNature3() {
		return this.debtNature3;
	}

	/**
	 * Sets the debtNature3.
	 * @param debtNature3  The debtNature3 to set as a String.
	 */
	public void setDebtNature3(String debtNature3) {
		this.debtNature3 = debtNature3;
	}

	/**
	 * Returns the debtTotal3.
	 * @return String
	 */
	public String getDebtTotal3() {
		return this.debtTotal3;
	}

	/**
	 * Sets the debtTotal3.
	 * @param debtTotal3  The debtTotal3 to set as a String.
	 */
	public void setDebtTotal3(String debtTotal3) {
		this.debtTotal3 = debtTotal3;
	}

	/**
	 * Returns the debtMonthlyPayment3.
	 * @return String
	 */
	public String getDebtMonthlyPayment3() {
		return this.debtMonthlyPayment3;
	}

	/**
	 * Sets the debtMonthlyPayment3.
	 * @param debtMonthlyPayment3  The debtMonthlyPayment3 to set as a String.
	 */
	public void setDebtMonthlyPayment3(String debtMonthlyPayment3) {
		this.debtMonthlyPayment3 = debtMonthlyPayment3;
	}

	/**
	 * Returns the hasOtherFinancialResponsibility.
	 * @return String
	 */
	public int getHasOtherFinancialResponsibility() {
		return this.hasOtherFinancialResponsibility;
	}

	/**
	 * Sets the hasOtherFinancialResponsibility.
	 * @param hasOtherFinancialResponsibility  The hasOtherFinancialResponsibility to set as a String.
	 */
	public void setHasOtherFinancialResponsibility(int hasOtherFinancialResponsibility) {
		this.hasOtherFinancialResponsibility = hasOtherFinancialResponsibility;
	}

	/**
	 * Returns the otherFinancialResponsibilityExplanation.
	 * @return String
	 */
	public String getOtherFinancialResponsibilityExplanation() {
		return this.otherFinancialResponsibilityExplanation;
	}

	/**
	 * Sets the otherFinancialResponsibilityExplanation.
	 * @param otherFinancialResponsibilityExplanation  The otherFinancialResponsibilityExplanation to set as a String.
	 */
	public void setOtherFinancialResponsibilityExplanation(String otherFinancialResponsibilityExplanation) {
		this.otherFinancialResponsibilityExplanation = otherFinancialResponsibilityExplanation;
	}

	/**
	 * Returns the debtPaymentPlan.
	 * @return String
	 */
	public String getDebtPaymentPlan() {
		return this.debtPaymentPlan;
	}

	/**
	 * Sets the debtPaymentPlan.
	 * @param debtPaymentPlan  The debtPaymentPlan to set as a String.
	 */
	public void setDebtPaymentPlan(String debtPaymentPlan) {
		this.debtPaymentPlan = debtPaymentPlan;
	}

	/**
	 * Returns the debtPaymentTimeframe.
	 * @return String
	 */
	public String getDebtPaymentTimeframe() {
		return this.debtPaymentTimeframe;
	}

	/**
	 * Sets the debtPaymentTimeframe.
	 * @param debtPaymentTimeframe  The debtPaymentTimeframe to set as a String.
	 */
	public void setDebtPaymentTimeframe(String debtPaymentTimeframe) {
		this.debtPaymentTimeframe = debtPaymentTimeframe;
	}

	/******************************* Ministry Partner Development */

	/**
	 * Returns the developingPartnersExplanation.
	 * @return String
	 */
	public String getDevelopingPartnersExplanation() {
		return this.developingPartnersExplanation;
	}

	/**
	 * Sets the developingPartnersExplanation.
	 * @param developingPartnersExplanation  The developingPartnersExplanation to set as a String.
	 */
	public void setDevelopingPartnersExplanation(String developingPartnersExplanation) {
		this.developingPartnersExplanation = developingPartnersExplanation;
	}

	/**
	 * Returns the isWillingDevelopPartners.
	 * @return String
	 */
	public int getIsWillingDevelopPartners() {
		return this.isWillingDevelopPartners;
	}

	/**
	 * Sets the isWillingDevelopPartners.
	 * @param isWillingDevelopPartners  The isWillingDevelopPartners to set as a String.
	 */
	public void setIsWillingDevelopPartners(int isWillingDevelopPartners) {
		this.isWillingDevelopPartners = isWillingDevelopPartners;
	}

	/**
	 * Returns the unwillingDevelopPartnersExplanation.
	 * @return String
	 */
	public String getUnwillingDevelopPartnersExplanation() {
		return this.unwillingDevelopPartnersExplanation;
	}

	/**
	 * Sets the unwillingDevelopPartnersExplanation.
	 * @param unwillingDevelopPartnersExplanation  The unwillingDevelopPartnersExplanation to set as a String.
	 */
	public void setUnwillingDevelopPartnersExplanation(String unwillingDevelopPartnersExplanation) {
		this.unwillingDevelopPartnersExplanation = unwillingDevelopPartnersExplanation;
	}

	/**
	 * Returns the isCommittedDevelopPartners.
	 * @return String
	 */
	public int getIsCommittedDevelopPartners() {
		return this.isCommittedDevelopPartners;
	}

	/**
	 * Sets the isCommittedDevelopPartners.
	 * @param isCommittedDevelopPartners  The isCommittedDevelopPartners to set as a String.
	 */
	public void setIsCommittedDevelopPartners(int isCommittedDevelopPartners) {
		this.isCommittedDevelopPartners = isCommittedDevelopPartners;
	}

	/**
	 * Returns the uncommittedDevelopPartnersExplanation.
	 * @return String
	 */
	public String getUncommittedDevelopPartnersExplanation() {
		return this.uncommittedDevelopPartnersExplanation;
	}

	/**
	 * Sets the uncommittedDevelopPartnersExplanation.
	 * @param uncommittedDevelopPartnersExplanation  The uncommittedDevelopPartnersExplanation to set as a String.
	 */
	public void setUncommittedDevelopPartnersExplanation(String uncommittedDevelopPartnersExplanation) {
		this.uncommittedDevelopPartnersExplanation = uncommittedDevelopPartnersExplanation;
	}

	/******************************* Biographical Information */

	/**
	 * Returns the personalTestimonyGrowth.
	 * @return String
	 */
	public String getPersonalTestimonyGrowth() {
		return this.personalTestimonyGrowth;
	}

	/**
	 * Sets the personalTestimonyGrowth.
	 * @param personalTestimonyGrowth  The personalTestimonyGrowth to set as a String.
	 */
	public void setPersonalTestimonyGrowth(String personalTestimonyGrowth) {
		this.personalTestimonyGrowth = personalTestimonyGrowth;
	}

	/**
	 * Returns the internshipParticipationExplanation.
	 * @return String
	 */
	public String getInternshipParticipationExplanation() {
		return this.internshipParticipationExplanation;
	}

	/**
	 * Sets the internshipParticipationExplanation.
	 * @param internshipParticipationExplanation  The internshipParticipationExplanation to set as a String.
	 */
	public void setInternshipParticipationExplanation(String internshipParticipationExplanation) {
		this.internshipParticipationExplanation = internshipParticipationExplanation;
	}

	/**
	 * Returns the internshipObjectives.
	 * @return String
	 */
	public String getInternshipObjectives() {
		return this.internshipObjectives;
	}

	/**
	 * Sets the internshipObjectives.
	 * @param internshipObjectives  The internshipObjectives to set as a String.
	 */
	public void setInternshipObjectives(String internshipObjectives) {
		this.internshipObjectives = internshipObjectives;
	}

	/**
	 * Returns the currentMinistryDescription.
	 * @return String
	 */
	public String getCurrentMinistryDescription() {
		return this.currentMinistryDescription;
	}

	/**
	 * Sets the currentMinistryDescription.
	 * @param currentMinistryDescription  The currentMinistryDescription to set as a String.
	 */
	public void setCurrentMinistryDescription(String currentMinistryDescription) {
		this.currentMinistryDescription = currentMinistryDescription;
	}

	/**
	 * Returns the personalStrengthA.
	 * @return String
	 */
	public String getPersonalStrengthA() {
		return this.personalStrengthA;
	}

	/**
	 * Sets the personalStrengthA.
	 * @param personalStrengthA  The personalStrengthA to set as a String.
	 */
	public void setPersonalStrengthA(String personalStrengthA) {
		this.personalStrengthA = personalStrengthA;
	}

	/**
	 * Returns the personalStrengthB.
	 * @return String
	 */
	public String getPersonalStrengthB() {
		return this.personalStrengthB;
	}

	/**
	 * Sets the personalStrengthB.
	 * @param personalStrengthB  The personalStrengthB to set as a String.
	 */
	public void setPersonalStrengthB(String personalStrengthB) {
		this.personalStrengthB = personalStrengthB;
	}

	/**
	 * Returns the personalStrengthC.
	 * @return String
	 */
	public String getPersonalStrengthC() {
		return this.personalStrengthC;
	}

	/**
	 * Sets the personalStrengthC.
	 * @param personalStrengthC  The personalStrengthC to set as a String.
	 */
	public void setPersonalStrengthC(String personalStrengthC) {
		this.personalStrengthC = personalStrengthC;
	}

	/**
	 * Returns the personalDevelopmentA.
	 * @return String
	 */
	public String getPersonalDevelopmentA() {
		return this.personalDevelopmentA;
	}

	/**
	 * Sets the personalDevelopmentA.
	 * @param personalDevelopmentA  The personalDevelopmentA to set as a String.
	 */
	public void setPersonalDevelopmentA(String personalDevelopmentA) {
		this.personalDevelopmentA = personalDevelopmentA;
	}

	/**
	 * Returns the personalDevelopmentB.
	 * @return String
	 */
	public String getPersonalDevelopmentB() {
		return this.personalDevelopmentB;
	}

	/**
	 * Sets the personalDevelopmentB.
	 * @param personalDevelopmentB  The personalDevelopmentB to set as a String.
	 */
	public void setPersonalDevelopmentB(String personalDevelopmentB) {
		this.personalDevelopmentB = personalDevelopmentB;
	}

	/**
	 * Returns the personalDevelopmentC.
	 * @return String
	 */
	public String getPersonalDevelopmentC() {
		return this.personalDevelopmentC;
	}

	/**
	 * Sets the personalDevelopmentC.
	 * @param personalDevelopmentC  The personalDevelopmentC to set as a String.
	 */
	public void setPersonalDevelopmentC(String personalDevelopmentC) {
		this.personalDevelopmentC = personalDevelopmentC;
	}

	/**
	 * Returns the personalDescriptionA.
	 * @return String
	 */
	public String getPersonalDescriptionA() {
		return this.personalDescriptionA;
	}

	/**
	 * Sets the personalDescriptionA.
	 * @param personalDescriptionA  The personalDescriptionA to set as a String.
	 */
	public void setPersonalDescriptionA(String personalDescriptionA) {
		this.personalDescriptionA = personalDescriptionA;
	}

	/**
	 * Returns the personalDescriptionB.
	 * @return String
	 */
	public String getPersonalDescriptionB() {
		return this.personalDescriptionB;
	}

	/**
	 * Sets the personalDescriptionB.
	 * @param personalDescriptionB  The personalDescriptionB to set as a String.
	 */
	public void setPersonalDescriptionB(String personalDescriptionB) {
		this.personalDescriptionB = personalDescriptionB;
	}

	/**
	 * Returns the personalDescriptionC.
	 * @return String
	 */
	public String getPersonalDescriptionC() {
		return this.personalDescriptionC;
	}

	/**
	 * Sets the personalDescriptionC.
	 * @param personalDescriptionC  The personalDescriptionC to set as a String.
	 */
	public void setPersonalDescriptionC(String personalDescriptionC) {
		this.personalDescriptionC = personalDescriptionC;
	}

	/**
	 * Returns the familyRelationshipDescription.
	 * @return String
	 */
	public String getFamilyRelationshipDescription() {
		return this.familyRelationshipDescription;
	}

	/**
	 * Sets the familyRelationshipDescription.
	 * @param familyRelationshipDescription  The familyRelationshipDescription to set as a String.
	 */
	public void setFamilyRelationshipDescription(String familyRelationshipDescription) {
		this.familyRelationshipDescription = familyRelationshipDescription;
	}

	/******************************* Submit Application */

	/**
	 * Returns the electronicSignature.
	 * @return String
	 */
	public String getElectronicSignature() {
		return this.electronicSignature;
	}

	/**
	 * Sets the electronicSignature.
	 * @param electronicSignature  The electronicSignature to set as a String.
	 */
	public void setElectronicSignature(String electronicSignature) {
		this.electronicSignature = electronicSignature;
	}

	/**
	 * Returns the ssn (Social Security Number).
	 * @return String
	 */
	public String getSsn() {
		return this.ssn;
	}

	/**
	 * Sets the ssn.
	 * @param ssn  The ssn to set as a String.
	 */
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	/**
	 * Returns the fk_ssmUserID.
	 * @return int
	 */
	public int getFk_ssmUserID() {
		return fk_ssmUserID;
	}

	/**
	 * Sets the fk_ssmUserID.
	 * @param fk_ssmUserID The fk_ssmUserID to set
	 */
	public void setFk_ssmUserID(int fk_ssmUserID) {
		this.fk_ssmUserID = fk_ssmUserID;
	}

	public int getFk_PersonID() {
		return fk_PersonID;
	}
	public void setFk_PersonID(int fk_PersonID) {
		this.fk_PersonID = fk_PersonID;
	}

	/**
	 * Returns the fk_SIPersonID.
	 * @return String
	 */
	public String getFk_PersonIDString() {
		return String.valueOf(getFk_PersonID());
	}

	/**
	 * Sets the fk_SIPersonID.
	 * @param fk_SIPersonID The fk_SIPersonID to set
	 */
	public void setFk_PersonIDString(String fk_SIPersonID) {
		setFk_PersonID(Integer.parseInt(fk_SIPersonID));
	}

	/**
	 * gets the appFee
	 * @return int
	 */
	public int getAppFee() {
		return appFee;
	}

	/**
	 * returns the application fee based upon current date.
	 * takes into account late fee if after latefeeDate
	 * 
	 * @return int
	 */
	public static int calcApplicationFee() {
		if (APPFEEDEADLINE.after(new Date())) {
			return APPFEE;
		} else {
			return APPFEELATE;
		}
	}

	/**
	 * Returns the isPaid.
	 * @return boolean
	 */
	public boolean getIsPaid() {
		return isPaid;
	}

	/**
	 * Sets the appFee.
	 * @param appFee The appFee to set
	 */
	public void setAppFee(int appFee) {
		this.appFee = appFee;
	}

	/**
	 * Sets the isPaid.
	 * @param isPaid The isPaid to set
	 */
	public void setIsPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}

	/**
	 * Returns the appStatus.
	 * @return String
	 */
	public String getAppStatus() {
		return appStatus;
	}

	/**
	 * Returns the dateAppLastChanged.
	 * @return Date
	 */
	public Date getDateAppLastChanged() {
		return dateAppLastChanged;
	}

	/**
	 * Returns the dateAppStarted.
	 * @return Date
	 */
	public Date getDateAppStarted() {
		return dateAppStarted;
	}

	/**
	 * Returns the dateSubmitted.
	 * @return Date
	 */
	public Date getDateSubmitted() {
		return dateSubmitted;
	}

	/**
	 * Returns the isSubmitted.
	 * @return boolean
	 */
	public boolean getIsSubmitted() {
		return isSubmitted;
	}

	/**
	 * Sets the appStatus.
	 * @param appStatus The appStatus to set
	 */
	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}

	/**
	 * Sets the dateAppLastChanged.
	 * @param dateAppLastChanged The dateAppLastChanged to set
	 */
	public void setDateAppLastChanged(Date dateAppLastChanged) {
		this.dateAppLastChanged = dateAppLastChanged;
	}

	/**
	 * Sets the dateAppStarted.
	 * @param dateAppStarted The dateAppStarted to set
	 */
	public void setDateAppStarted(Date dateAppStarted) {
		this.dateAppStarted = dateAppStarted;
	}

	/**
	 * Sets the dateSubmitted.
	 * @param dateSubmitted The dateSubmitted to set
	 */
	public void setDateSubmitted(Date dateSubmitted) {
		this.dateSubmitted = dateSubmitted;
	}

	/**
	 * Sets the isSubmitted.
	 * @param isSubmitted The isSubmitted to set
	 */
	public void setIsSubmitted(boolean isSubmitted) {
		this.isSubmitted = isSubmitted;
	}

	/**
	 * Returns the assignedToProject.
	 * @return int
	 */
	public int getAssignedToProject() {
		return assignedToProject;
	}

	/**
	 * Sets the assignedToProject.
	 * @param assignedToProject The assignedToProject to set
	 */
	public void setAssignedToProject(int assignedToProject) {
		this.assignedToProject = assignedToProject;
	}

	/**
	 * Returns the finalProject.
	 * @return int
	 */
	public int getFinalProject() {
		return finalProject;
	}

	/**
	 * Sets the finalProject.
	 * @param finalProject The finalProject to set
	 */
	public void setFinalProject(int finalProject) {
		this.finalProject = finalProject;
	}

	/**
	 * Returns the siYear.
	 * @return String
	 */
	public String getSiYear() {
		return siYear;
	}

	/**
	 * Sets the siYear.
	 * @param siYear The siYear to set
	 */
	public void setSiYear(String siYear) {
		this.siYear = siYear;
	}

	/**
	 * Returns the status.
	 * @return String
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * Sets the status.
	 * @param status The status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * Returns the appType.
	 * @return String
	 */
	public String getAppType() {
		return appType;
	}

	/**
	 * Sets the appType.
	 * @param appType The appType to set
	 */
	public void setAppType(String appType) {
		this.appType = appType;
	}

}
/**
   Here are some possible shared/similiar answered info:
   ministry.isDating vs morals.isCurrentlyDating
   ministry.datingLocation vs morals.currentlyDatingLocation

   The payment.billingState seems to use something special, not sure if I
   interfaced with it correctly, but I did include it in the billing
   address...please verify the JSP.

   The payment.billingCounty...seems odd..couNTY; not couNTRY.  I think it
   is probably country, but left it county as I don't know how you work.  If
   state and zip had been right up there, it would have made logical
   sense...but they are way off at the bottom.

   Didn't know how you handle money...so financial.debtTotal# are all
   Strings, for later conversion and evaluation.  (I don't think JSP will
   convert to BigDecimal anyway...)
*/
