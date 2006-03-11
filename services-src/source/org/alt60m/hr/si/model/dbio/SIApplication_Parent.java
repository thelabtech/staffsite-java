/*
 * Created on Jul 6, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.hr.si.model.dbio;

import java.util.*;

import com.kenburcham.framework.dbio.DBIOEntity;

/**
 * @author justin.sabelko
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public abstract class SIApplication_Parent extends DBIOEntity {
	public abstract boolean persist();
	public boolean insert() {
		return super.insert();
	}
	public abstract boolean isPKEmpty();
	public abstract void localinit();
	/** The primary key of this object. */
	public abstract String getApplicationID();
	public abstract void setApplicationID(String applicationID);
	public abstract int getApplicationIDInt();
	public abstract void setApplicationIDInt(int applicationID);
	/******************************* get payments */
	public abstract Hashtable getPayments();
	/******************************* Ministry Interests */
	public abstract String getLocationA();
	/**
	 * Sets the locationA.
	 * @param locationA  The locationA to set as a int.
	 */
	public abstract void setLocationA(String locationA);
	/**
	 * Returns the locationAExplanation.
	 * @return String
	 */
	public abstract String getLocationAExplanation();
	/**
	 * Sets the locationAExplanation.
	 * @param locationAExplanation  The locationAExplanation to set as a String.
	 */
	public abstract void setLocationAExplanation(String locationAExplanation);
	/**
	 * Returns the locationB.
	 * @return int
	 */
	public abstract String getLocationB();
	/**
	 * Sets the locationB.
	 * @param locationB  The locationB to set as a String.
	 */
	public abstract void setLocationB(String locationB);
	/**
	 * Returns the locationBExplanation.
	 * @return String
	 */
	public abstract String getLocationBExplanation();
	/**
	 * Sets the locationBExplanation.
	 * @param locationBExplanation  The locationBExplanation to set as a String.
	 */
	public abstract void setLocationBExplanation(String locationBExplanation);
	/**
	 * Returns the locationC.
	 * @return String
	 */
	public abstract String getLocationC();
	/**
	 * Sets the locationC.
	 * @param locationC  The locationC to set as a String.
	 */
	public abstract void setLocationC(String locationC);
	/**
	 * Returns the locationCExplanation.
	 * @return String
	 */
	public abstract String getLocationCExplanation();
	/**
	 * Sets the locationCExplanation.
	 * @param locationCExplanation  The locationCExplanation to set as a String.
	 */
	public abstract void setLocationCExplanation(String locationCExplanation);
	/**
	 * Returns the availableMonth.
	 * @return String
	 */
	public abstract String getAvailableMonth();
	/**
	 * Sets the availableMonth.
	 * @param availableMonth  The availableMonth to set as a String.
	 */
	public abstract void setAvailableMonth(String availableMonth);
	/**
	 * Returns the availableYear.
	 * @return String
	 */
	public abstract String getAvailableYear();
	/**
	 * Sets the availableYear.
	 * @param availableYear  The availableYear to set as a String.
	 */
	public abstract void setAvailableYear(String availableYear);
	/**
	 * Returns the hasMinistryConflict.
	 * @return boolean
	 */
	public abstract boolean getHasMinistryConflict();
	/**
	 * Sets the hasMinistryConflict.
	 * @param hasMinistryConflict  The hasMinistryConflict to set as a boolean.
	 */
	public abstract void setHasMinistryConflict(boolean hasMinistryConflict);
	/**
	 * Returns the ministryConflictExplanation.
	 * @return String
	 */
	public abstract String getMinistryConflictExplanation();
	/**
	 * Sets the ministryConflictExplanation.
	 * @param ministryConflictExplanation  The ministryConflictExplanation to set as a String.
	 */
	public abstract void setMinistryConflictExplanation(String ministryConflictExplanation);
	/**
	 * Returns the hasSpecificLocation.
	 * @return boolean
	 */
	public abstract boolean getHasSpecificLocation();
	/**
	 * Sets the hasSpecificLocation.
	 * @param hasSpecificLocation  The hasSpecificLocation to set as a boolean.
	 */
	public abstract void setHasSpecificLocation(boolean hasSpecificLocation);
	/**
	 * Returns the specificLocationRecruiterName.
	 * @return String
	 */
	public abstract String getSpecificLocationRecruiterName();
	/**
	 * Sets the specificLocationRecruiterName.
	 * @param specificLocationRecruiterName  The specificLocationRecruiterName to set as a String.
	 */
	public abstract void setSpecificLocationRecruiterName(String specificLocationRecruiterName);
	/**
	 * Returns the teamMembers.
	 * @return String
	 */
	public abstract String getTeamMembers();
	/**
	 * Sets the teamMembers.
	 * @param teamMembers  The teamMembers to set as a String.
	 */
	public abstract void setTeamMembers(String teamMembers);
	/**
	 * Returns the isDating.
	 * @return boolean
	 */
	public abstract boolean getIsDating();
	/**
	 * Sets the isDating.
	 * @param isDating  The isDating to set as a boolean.
	 */
	public abstract void setIsDating(boolean isDating);
	/**
	 * Returns the datingLocation.
	 * @return String
	 */
	public abstract String getDatingLocation();
	/**
	 * Sets the datingLocation.
	 * @param datingLocation  The datingLocation to set as a String.
	 */
	public abstract void setDatingLocation(String datingLocation);
	/******************************* STINT */
	public abstract boolean getHasCampusPartnership();
	/**
	 * Sets the hasCampusPartnership.
	 * @param hasCampusPartnership  The hasCampusPartnership to set as a boolean.
	 */
	public abstract void setHasCampusPartnership(boolean hasCampusPartnership);
	/**
	 * Returns the isDatingStint.
	 * @return boolean
	 */
	public abstract boolean getIsDatingStint();
	/**
	 * Sets the isDatingStint.
	 * @param isDatingStint  The isDatingStint to set as a boolean.
	 */
	public abstract void setIsDatingStint(boolean isDatingStint);
	/**
	 * Returns the datingStintName.
	 * @return String
	 */
	public abstract String getDatingStintName();
	/**
	 * Sets the datingStintName.
	 * @param datingStintName  The datingStintName to set as a String.
	 */
	public abstract void setDatingStintName(String datingStintName);
	/**
	 * Returns the language1.
	 * @return String
	 */
	public abstract String getLanguage1();
	/**
	 * Sets the language1.
	 * @param language1  The language1 to set as a String.
	 */
	public abstract void setLanguage1(String language1);
	/**
	 * Returns the language1YearsStudied.
	 * @return String
	 */
	public abstract String getLanguage1YearsStudied();
	/**
	 * Sets the language1YearsStudied.
	 * @param language1YearsStudied  The language1YearsStudied to set as a String.
	 */
	public abstract void setLanguage1YearsStudied(String language1YearsStudied);
	/**
	 * Returns the language1Fluency.
	 * @return int
	 */
	public abstract int getLanguage1Fluency();
	/**
	 * Sets the language1Fluency.
	 * @param language1Fluency  The language1Fluency to set as a int.
	 */
	public abstract void setLanguage1Fluency(int language1Fluency);
	/**
	 * Returns the language2.
	 * @return String
	 */
	public abstract String getLanguage2();
	/**
	 * Sets the language2.
	 * @param language2  The language2 to set as a String.
	 */
	public abstract void setLanguage2(String language2);
	/**
	 * Returns the language2YearsStudied.
	 * @return String
	 */
	public abstract String getLanguage2YearsStudied();
	/**
	 * Sets the language2YearsStudied.
	 * @param language2YearsStudied  The language2YearsStudied to set as a String.
	 */
	public abstract void setLanguage2YearsStudied(String language2YearsStudied);
	/**
	 * Returns the language2Fluency.
	 * @return int
	 */
	public abstract int getLanguage2Fluency();
	/**
	 * Sets the language2Fluency.
	 * @param language2Fluency  The language2Fluency to set as a int.
	 */
	public abstract void setLanguage2Fluency(int language2Fluency);
	/**
	 * Returns the previousMinistryExperience.
	 * @return String
	 */
	public abstract String getPreviousMinistryExperience();
	/**
	 * Sets the previousMinistryExperience.
	 * @param previousMinistryExperience  The previousMinistryExperience to set as a String.
	 */
	public abstract void setPreviousMinistryExperience(String previousMinistryExperience);
	/**  Ministry Experience (experience.jsp)
	
	/**
	* Returns the ministryTraining.
	* @return String
	*/
	public abstract String getMinistryTraining();
	/**
	 * Sets the ministryTraining.
	 * @param ministryTraining  The ministryTraining to set as a String.
	 */
	public abstract void setMinistryTraining(String ministryTraining);
	/**
	 * Returns the evangelismAttitude.
	 * @return String
	 */
	public abstract String getEvangelismAttitude();
	/**
	 * Sets the evangelismAttitude.
	 * @param evangelismAttitude  The evangelismAttitude to set as a String.
	 */
	public abstract void setEvangelismAttitude(String evangelismAttitude);
	/**
	 * Returns the isEvangelismTrainable.
	 * @return boolean
	 */
	public abstract boolean getIsEvangelismTrainable();
	/**
	 * Sets the isEvangelismTrainable.
	 * @param isEvangelismTrainable  The isEvangelismTrainable to set as a boolean.
	 */
	public abstract void setIsEvangelismTrainable(boolean isEvangelismTrainable);
	/**
	 * Returns the participationExplanation.
	 * @return String
	 */
	public abstract String getParticipationExplanation();
	/**
	 * Sets the participationExplanation.
	 * @param participationExplanation  The participationExplanation to set as a String.
	 */
	public abstract void setParticipationExplanation(String participationExplanation);
	/**
	 * Returns the isFamiliarFourSpiritualLaws.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarFourSpiritualLaws();
	/**
	 * Sets the isFamiliarFourSpiritualLaws.
	 * @param isFamiliarFourSpiritualLaws  The isFamiliarFourSpiritualLaws to set as a boolean.
	 */
	public abstract void setIsFamiliarFourSpiritualLaws(boolean isFamiliarFourSpiritualLaws);
	/**
	 * Returns the hasExperienceFourSpiritualLaws.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceFourSpiritualLaws();
	/**
	 * Sets the hasExperienceFourSpiritualLaws.
	 * @param hasExperienceFourSpiritualLaws  The hasExperienceFourSpiritualLaws to set as a boolean.
	 */
	public abstract void setHasExperienceFourSpiritualLaws(boolean hasExperienceFourSpiritualLaws);
	/**
	 * Returns the confidenceFourSpiritualLaws.
	 * @return int
	 */
	public abstract int getConfidenceFourSpiritualLaws();
	/**
	 * Sets the confidenceFourSpiritualLaws.
	 * @param confidenceFourSpiritualLaws  The confidenceFourSpiritualLaws to set as a int.
	 */
	public abstract void setConfidenceFourSpiritualLaws(int confidenceFourSpiritualLaws);
	/**
	 * Returns the isFamiliarLifeAtLarge.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarLifeAtLarge();
	/**
	 * Sets the isFamiliarLifeAtLarge.
	 * @param isFamiliarLifeAtLarge  The isFamiliarLifeAtLarge to set as a boolean.
	 */
	public abstract void setIsFamiliarLifeAtLarge(boolean isFamiliarLifeAtLarge);
	/**
	 * Returns the hasExperienceLifeAtLarge.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceLifeAtLarge();
	/**
	 * Sets the hasExperienceLifeAtLarge.
	 * @param hasExperienceLifeAtLarge  The hasExperienceLifeAtLarge to set as a boolean.
	 */
	public abstract void setHasExperienceLifeAtLarge(boolean hasExperienceLifeAtLarge);
	/**
	 * Returns the confidenceLifeAtLarge.
	 * @return int
	 */
	public abstract int getConfidenceLifeAtLarge();
	/**
	 * Sets the confidenceLifeAtLarge.
	 * @param confidenceLifeAtLarge  The confidenceLifeAtLarge to set as a int.
	 */
	public abstract void setConfidenceLifeAtLarge(int confidenceLifeAtLarge);
	/**
	 * Returns the isFamiliarPersonalTestimony.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarPersonalTestimony();
	/**
	 * Sets the isFamiliarPersonalTestimony.
	 * @param isFamiliarPersonalTestimony  The isFamiliarPersonalTestimony to set as a boolean.
	 */
	public abstract void setIsFamiliarPersonalTestimony(boolean isFamiliarPersonalTestimony);
	/**
	 * Returns the hasExperiencePersonalTestimony.
	 * @return boolean
	 */
	public abstract boolean getHasExperiencePersonalTestimony();
	/**
	 * Sets the hasExperiencePersonalTestimony.
	 * @param hasExperiencePersonalTestimony  The hasExperiencePersonalTestimony to set as a boolean.
	 */
	public abstract void setHasExperiencePersonalTestimony(boolean hasExperiencePersonalTestimony);
	/**
	 * Returns the confidencePersonalTestimony.
	 * @return int
	 */
	public abstract int getConfidencePersonalTestimony();
	/**
	 * Sets the confidencePersonalTestimony.
	 * @param confidencePersonalTestimony  The confidencePersonalTestimony to set as a int.
	 */
	public abstract void setConfidencePersonalTestimony(int confidencePersonalTestimony);
	/**
	 * Returns the isFamiliarExplainingGospel.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarExplainingGospel();
	/**
	 * Sets the isFamiliarExplainingGospel.
	 * @param isFamiliarExplainingGospel  The isFamiliarExplainingGospel to set as a boolean.
	 */
	public abstract void setIsFamiliarExplainingGospel(boolean isFamiliarExplainingGospel);
	/**
	 * Returns the hasExperienceExplainingGospel.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceExplainingGospel();
	/**
	 * Sets the hasExperienceExplainingGospel.
	 * @param hasExperienceExplainingGospel  The hasExperienceExplainingGospel to set as a boolean.
	 */
	public abstract void setHasExperienceExplainingGospel(boolean hasExperienceExplainingGospel);
	/**
	 * Returns the confidenceExplainingGospel.
	 * @return int
	 */
	public abstract int getConfidenceExplainingGospel();
	/**
	 * Sets the confidenceExplainingGospel.
	 * @param confidenceExplainingGospel  The confidenceExplainingGospel to set as a int.
	 */
	public abstract void setConfidenceExplainingGospel(int confidenceExplainingGospel);
	/**
	 * Returns the isFamiliarSharingFaith.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarSharingFaith();
	/**
	 * Sets the isFamiliarSharingFaith.
	 * @param isFamiliarSharingFaith  The isFamiliarSharingFaith to set as a boolean.
	 */
	public abstract void setIsFamiliarSharingFaith(boolean isFamiliarSharingFaith);
	/**
	 * Returns the hasExperienceSharingFaith.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceSharingFaith();
	/**
	 * Sets the hasExperienceSharingFaith.
	 * @param hasExperienceSharingFaith  The hasExperienceSharingFaith to set as a boolean.
	 */
	public abstract void setHasExperienceSharingFaith(boolean hasExperienceSharingFaith);
	/**
	 * Returns the confidenceSharingFaith.
	 * @return int
	 */
	public abstract int getConfidenceSharingFaith();
	/**
	 * Sets the confidenceSharingFaith.
	 * @param confidenceSharingFaith  The confidenceSharingFaith to set as a int.
	 */
	public abstract void setConfidenceSharingFaith(int confidenceSharingFaith);
	/**
	 * Returns the isFamiliarHolySpiritBooklet.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarHolySpiritBooklet();
	/**
	 * Sets the isFamiliarHolySpiritBooklet.
	 * @param isFamiliarHolySpiritBooklet  The isFamiliarHolySpiritBooklet to set as a boolean.
	 */
	public abstract void setIsFamiliarHolySpiritBooklet(boolean isFamiliarHolySpiritBooklet);
	/**
	 * Returns the hasExperienceHolySpiritBooklet.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceHolySpiritBooklet();
	/**
	 * Sets the hasExperienceHolySpiritBooklet.
	 * @param hasExperienceHolySpiritBooklet  The hasExperienceHolySpiritBooklet to set as a boolean.
	 */
	public abstract void setHasExperienceHolySpiritBooklet(boolean hasExperienceHolySpiritBooklet);
	/**
	 * Returns the confidenceHolySpiritBooklet.
	 * @return int
	 */
	public abstract int getConfidenceHolySpiritBooklet();
	/**
	 * Sets the confidenceHolySpiritBooklet.
	 * @param confidenceHolySpiritBooklet  The confidenceHolySpiritBooklet to set as a int.
	 */
	public abstract void setConfidenceHolySpiritBooklet(int confidenceHolySpiritBooklet);
	/**
	 * Returns the isFamiliarFollowUp.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarFollowUp();
	/**
	 * Sets the isFamiliarFollowUp.
	 * @param isFamiliarFollowUp  The isFamiliarFollowUp to set as a boolean.
	 */
	public abstract void setIsFamiliarFollowUp(boolean isFamiliarFollowUp);
	/**
	 * Returns the hasExperienceFollowUp.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceFollowUp();
	/**
	 * Sets the hasExperienceFollowUp.
	 * @param hasExperienceFollowUp  The hasExperienceFollowUp to set as a boolean.
	 */
	public abstract void setHasExperienceFollowUp(boolean hasExperienceFollowUp);
	/**
	 * Returns the confidenceFollowUp.
	 * @return int
	 */
	public abstract int getConfidenceFollowUp();
	/**
	 * Sets the confidenceFollowUp.
	 * @param confidenceFollowUp  The confidenceFollowUp to set as a int.
	 */
	public abstract void setConfidenceFollowUp(int confidenceFollowUp);
	/**
	 * Returns the isFamiliarHelpGrowInFaith.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarHelpGrowInFaith();
	/**
	 * Sets the isFamiliarHelpGrowInFaith.
	 * @param isFamiliarHelpGrowInFaith  The isFamiliarHelpGrowInFaith to set as a boolean.
	 */
	public abstract void setIsFamiliarHelpGrowInFaith(boolean isFamiliarHelpGrowInFaith);
	/**
	 * Returns the hasExperienceHelpGrowInFaith.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceHelpGrowInFaith();
	/**
	 * Sets the hasExperienceHelpGrowInFaith.
	 * @param hasExperienceHelpGrowInFaith  The hasExperienceHelpGrowInFaith to set as a boolean.
	 */
	public abstract void setHasExperienceHelpGrowInFaith(boolean hasExperienceHelpGrowInFaith);
	/**
	 * Returns the confidenceHelpGrowInFaith.
	 * @return int
	 */
	public abstract int getConfidenceHelpGrowInFaith();
	/**
	 * Sets the confidenceHelpGrowInFaith.
	 * @param confidenceHelpGrowInFaith  The confidenceHelpGrowInFaith to set as a int.
	 */
	public abstract void setConfidenceHelpGrowInFaith(int confidenceHelpGrowInFaith);
	/**
	 * Returns the isFamiliarTrainShareFaith.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarTrainShareFaith();
	/**
	 * Sets the isFamiliarTrainShareFaith.
	 * @param isFamiliarTrainShareFaith  The isFamiliarTrainShareFaith to set as a boolean.
	 */
	public abstract void setIsFamiliarTrainShareFaith(boolean isFamiliarTrainShareFaith);
	/**
	 * Returns the hasExperienceTrainShareFaith.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceTrainShareFaith();
	/**
	 * Sets the hasExperienceTrainShareFaith.
	 * @param hasExperienceTrainShareFaith  The hasExperienceTrainShareFaith to set as a boolean.
	 */
	public abstract void setHasExperienceTrainShareFaith(boolean hasExperienceTrainShareFaith);
	/**
	 * Returns the confidenceTrainShareFaith.
	 * @return int
	 */
	public abstract int getConfidenceTrainShareFaith();
	/**
	 * Sets the confidenceTrainShareFaith.
	 * @param confidenceTrainShareFaith  The confidenceTrainShareFaith to set as a int.
	 */
	public abstract void setConfidenceTrainShareFaith(int confidenceTrainShareFaith);
	/**
	 * Returns the isFamiliarOtherReligions.
	 * @return boolean
	 */
	public abstract boolean getIsFamiliarOtherReligions();
	/**
	 * Sets the isFamiliarOtherReligions.
	 * @param isFamiliarOtherReligions  The isFamiliarOtherReligions to set as a boolean.
	 */
	public abstract void setIsFamiliarOtherReligions(boolean isFamiliarOtherReligions);
	/**
	 * Returns the hasExperienceOtherReligions.
	 * @return boolean
	 */
	public abstract boolean getHasExperienceOtherReligions();
	/**
	 * Sets the hasExperienceOtherReligions.
	 * @param hasExperienceOtherReligions  The hasExperienceOtherReligions to set as a boolean.
	 */
	public abstract void setHasExperienceOtherReligions(boolean hasExperienceOtherReligions);
	/**
	 * Returns the confidenceOtherReligions.
	 * @return int
	 */
	public abstract int getConfidenceOtherReligions();
	/**
	 * Sets the confidenceOtherReligions.
	 * @param confidenceOtherReligions  The confidenceOtherReligions to set as a int.
	 */
	public abstract void setConfidenceOtherReligions(int confidenceOtherReligions);
	/**
	 * Returns the leadershipPositions.
	 * @return String
	 */
	public abstract String getLeadershipPositions();
	/**
	 * Sets the leadershipPositions.
	 * @param leadershipPositions  The leadershipPositions to set as a String.
	 */
	public abstract void setLeadershipPositions(String leadershipPositions);
	/**
	 * Returns the hasLedDiscipleshipGroup.
	 * @return boolean
	 */
	public abstract boolean getHasLedDiscipleshipGroup();
	/**
	 * Sets the hasLedDiscipleshipGroup.
	 * @param hasLedDiscipleshipGroup  The hasLedDiscipleshipGroup to set as a boolean.
	 */
	public abstract void setHasLedDiscipleshipGroup(boolean hasLedDiscipleshipGroup);
	/**
	 * Returns the discipleshipGroupSize.
	 * @return String
	 */
	public abstract String getDiscipleshipGroupSize();
	/**
	 * Sets the discipleshipGroupSize.
	 * @param discipleshipGroupSize  The discipleshipGroupSize to set as a String.
	 */
	public abstract void setDiscipleshipGroupSize(String discipleshipGroupSize);
	/**
	 * Returns the leadershipEvaluation.
	 * @return String
	 */
	public abstract String getLeadershipEvaluation();
	/**
	 * Sets the leadershipEvaluation.
	 * @param leadershipEvaluation  The leadershipEvaluation to set as a String.
	 */
	public abstract void setLeadershipEvaluation(String leadershipEvaluation);
	/******************************* Church and Spiritual Background */
	public abstract int getConversionMonth();
	/**
	 * Sets the conversionMonth.
	 * @param conversionMonth  The conversionMonth to set as a int.
	 */
	public abstract void setConversionMonth(int conversionMonth);
	/**
	 * Returns the conversionYear.
	 * @return int
	 */
	public abstract int getConversionYear();
	/**
	 * Sets the conversionYear.
	 * @param conversionYear  The conversionYear to set as a int.
	 */
	public abstract void setConversionYear(int conversionYear);
	/**
	 * Returns the memberChurchDenomination.
	 * @return String
	 */
	public abstract String getMemberChurchDenomination();
	/**
	 * Sets the memberChurchDenomination.
	 * @param memberChurchDenomination  The memberChurchDenomination to set as a String.
	 */
	public abstract void setMemberChurchDenomination(String memberChurchDenomination);
	/**
	 * Returns the memberChurchDuration.
	 * @return String
	 */
	public abstract String getMemberChurchDuration();
	/**
	 * Sets the memberChurchDuration.
	 * @param memberChurchDuration  The memberChurchDuration to set as a String.
	 */
	public abstract void setMemberChurchDuration(String memberChurchDuration);
	/**
	 * Returns the attendingChurchDenomination.
	 * @return String
	 */
	public abstract String getAttendingChurchDenomination();
	/**
	 * Sets the attendingChurchDenomination.
	 * @param attendingChurchDenomination  The attendingChurchDenomination to set as a String.
	 */
	public abstract void setAttendingChurchDenomination(String attendingChurchDenomination);
	/**
	 * Returns the attendingChurchDuration.
	 * @return String
	 */
	public abstract String getAttendingChurchDuration();
	/**
	 * Sets the attendingChurchDuration.
	 * @param attendingChurchDuration  The attendingChurchDuration to set as a String.
	 */
	public abstract void setAttendingChurchDuration(String attendingChurchDuration);
	/**
	 * Returns the attendingChurchInvolvement.
	 * @return String
	 */
	public abstract String getAttendingChurchInvolvement();
	/**
	 * Sets the attendingChurchInvolvement.
	 * @param attendingChurchInvolvement  The attendingChurchInvolvement to set as a String.
	 */
	public abstract void setAttendingChurchInvolvement(String attendingChurchInvolvement);
	/**
	 * Returns the quietTimeQuantity.
	 * @return String
	 */
	public abstract String getQuietTimeQuantity();
	/**
	 * Sets the quietTimeQuantity.
	 * @param quietTimeQuantity  The quietTimeQuantity to set as a String.
	 */
	public abstract void setQuietTimeQuantity(String quietTimeQuantity);
	/**
	 * Returns the quietTimeDescription.
	 * @return String
	 */
	public abstract String getQuietTimeDescription();
	/**
	 * Sets the quietTimeDescription.
	 * @param quietTimeDescription  The quietTimeDescription to set as a String.
	 */
	public abstract void setQuietTimeDescription(String quietTimeDescription);
	/**
	 * Returns the explanationOfSalvation.
	 * @return String
	 */
	public abstract String getExplanationOfSalvation();
	/**
	 * Sets the explanationOfSalvation.
	 * @param explanationOfSalvation  The explanationOfSalvation to set as a String.
	 */
	public abstract void setExplanationOfSalvation(String explanationOfSalvation);
	/**
	 * Returns the explanationOfSpiritFilled.
	 * @return String
	 */
	public abstract String getExplanationOfSpiritFilled();
	/**
	 * Sets the explanationOfSpiritFilled.
	 * @param explanationOfSpiritFilled  The explanationOfSpiritFilled to set as a String.
	 */
	public abstract void setExplanationOfSpiritFilled(String explanationOfSpiritFilled);
	/**
	 * Returns the hasInvolvementSpeakingTongues.
	 * @return boolean
	 */
	public abstract boolean getHasInvolvementSpeakingTongues();
	/**
	 * Sets the hasInvolvementSpeakingTongues.
	 * @param hasInvolvementSpeakingTongues  The hasInvolvementSpeakingTongues to set as a boolean.
	 */
	public abstract void setHasInvolvementSpeakingTongues(boolean hasInvolvementSpeakingTongues);
	/**
	 * Returns the differenceIndwellingFilled.
	 * @return String
	 */
	public abstract String getDifferenceIndwellingFilled();
	/**
	 * Sets the differenceIndwellingFilled.
	 * @param differenceIndwellingFilled  The differenceIndwellingFilled to set as a String.
	 */
	public abstract void setDifferenceIndwellingFilled(String differenceIndwellingFilled);
	/******************************* Personal Information */
	public abstract boolean getHasCrimeConviction();
	/**
	 * Sets the hasCrimeConviction.
	 * @param hasCrimeConviction  The hasCrimeConviction to set as a boolean.
	 */
	public abstract void setHasCrimeConviction(boolean hasCrimeConviction);
	/**
	 * Returns the crimeConvictionExplanation.
	 * @return String
	 */
	public abstract String getCrimeConvictionExplanation();
	/**
	 * Sets the crimeConvictionExplanation.
	 * @param crimeConvictionExplanation  The crimeConvictionExplanation to set as a String.
	 */
	public abstract void setCrimeConvictionExplanation(String crimeConvictionExplanation);
	/**
	 * Returns the hasDrugUse.
	 * @return boolean
	 */
	public abstract boolean getHasDrugUse();
	/**
	 * Sets the hasDrugUse.
	 * @param hasDrugUse  The hasDrugUse to set as a boolean.
	 */
	public abstract void setHasDrugUse(boolean hasDrugUse);
	/**
	 * Returns the isTobaccoUser.
	 * @return boolean
	 */
	public abstract boolean getIsTobaccoUser();
	/**
	 * Sets the isTobaccoUser.
	 * @param isTobaccoUser  The isTobaccoUser to set as a boolean.
	 */
	public abstract void setIsTobaccoUser(boolean isTobaccoUser);
	/**
	 * Returns the isWillingChangeHabits.
	 * @return boolean
	 */
	public abstract boolean getIsWillingChangeHabits();
	/**
	 * Sets the isWillingChangeHabits.
	 * @param isWillingChangeHabits  The isWillingChangeHabits to set as a boolean.
	 */
	public abstract void setIsWillingChangeHabits(boolean isWillingChangeHabits);
	/**
	 * Returns the authorityResponseExplanation.
	 * @return String
	 */
	public abstract String getAuthorityResponseExplanation();
	/**
	 * Sets the authorityResponseExplanation.
	 * @param authorityResponseExplanation  The authorityResponseExplanation to set as a String.
	 */
	public abstract void setAuthorityResponseExplanation(String authorityResponseExplanation);
	/******************************* Alcohol Use */
	public abstract String getAlcoholUseFrequency();
	/**
	 * Sets the alcoholUseFrequency.
	 * @param alcoholUseFrequency  The alcoholUseFrequency to set as a String.
	 */
	public abstract void setAlcoholUseFrequency(String alcoholUseFrequency);
	/**
	 * Returns the alcoholUseDecision.
	 * @return String
	 */
	public abstract String getAlcoholUseDecision();
	/**
	 * Sets the alcoholUseDecision.
	 * @param alcoholUseDecision  The alcoholUseDecision to set as a String.
	 */
	public abstract void setAlcoholUseDecision(String alcoholUseDecision);
	/**
	 * Returns the isWillingRefrainAlcohol.
	 * @return boolean
	 */
	public abstract boolean getIsWillingRefrainAlcohol();
	/**
	 * Sets the isWillingRefrainAlcohol.
	 * @param isWillingRefrainAlcohol  The isWillingRefrainAlcohol to set as a boolean.
	 */
	public abstract void setIsWillingRefrainAlcohol(boolean isWillingRefrainAlcohol);
	/**
	 * Returns the unwillingRefrainAlcoholExplanation.
	 * @return String
	 */
	public abstract String getUnwillingRefrainAlcoholExplanation();
	/**
	 * Sets the unwillingRefrainAlcoholExplanation.
	 * @param unwillingRefrainAlcoholExplanation  The unwillingRefrainAlcoholExplanation to set as a String.
	 */
	public abstract void setUnwillingRefrainAlcoholExplanation(String unwillingRefrainAlcoholExplanation);
	/******************************* Drug Use */
	public abstract String getDrugUseExplanation();
	/**
	 * Sets the drugUseExplanation.
	 * @param drugUseExplanation  The drugUseExplanation to set as a String.
	 */
	public abstract void setDrugUseExplanation(String drugUseExplanation);
	/******************************* Tobacco Use */
	public abstract String getTobaccoUseExplanation();
	/**
	 * Sets the tobaccoUseExplanation.
	 * @param tobaccoUseExplanation  The tobaccoUseExplanation to set as a String.
	 */
	public abstract void setTobaccoUseExplanation(String tobaccoUseExplanation);
	/**
	 * Returns the isWillingAbstainTobacco.
	 * @return boolean
	 */
	public abstract boolean getIsWillingAbstainTobacco();
	/**
	 * Sets the isWillingAbstainTobacco.
	 * @param isWillingAbstainTobacco  The isWillingAbstainTobacco to set as a boolean.
	 */
	public abstract void setIsWillingAbstainTobacco(boolean isWillingAbstainTobacco);
	/******************************* Moral Convictions */
	public abstract boolean getHasRequestedPhoneCall();
	/**
	 * Sets the hasRequestedPhoneCall.
	 * @param hasRequestedPhoneCall  The hasRequestedPhoneCall to set as a boolean.
	 */
	public abstract void setHasRequestedPhoneCall(boolean hasRequestedPhoneCall);
	/**
	 * Returns the contactPhoneNumber.
	 * @return String
	 */
	public abstract String getContactPhoneNumber();
	/**
	 * Sets the contactPhoneNumber.
	 * @param contactPhoneNumber  The contactPhoneNumber to set as a String.
	 */
	public abstract void setContactPhoneNumber(String contactPhoneNumber);
	/**
	 * Returns the contactBestTime.
	 * @return String
	 */
	public abstract String getContactBestTime();
	/**
	 * Sets the contactBestTime.
	 * @param contactBestTime  The contactBestTime to set as a String.
	 */
	public abstract void setContactBestTime(String contactBestTime);
	/**
	 * Returns the contactTimeZone.
	 * @return String
	 */
	public abstract String getContactTimeZone();
	/**
	 * Sets the contactTimeZone.
	 * @param contactTimeZone  The contactTimeZone to set as a String.
	 */
	public abstract void setContactTimeZone(String contactTimeZone);
	/**
	 * Returns the sexualInvolvementExplanation.
	 * @return String
	 */
	public abstract String getSexualInvolvementExplanation();
	/**
	 * Sets the sexualInvolvementExplanation.
	 * @param sexualInvolvementExplanation  The sexualInvolvementExplanation to set as a String.
	 */
	public abstract void setSexualInvolvementExplanation(String sexualInvolvementExplanation);
	/**
	 * Returns the hasSexualGuidelines.
	 * @return boolean
	 */
	public abstract boolean getHasSexualGuidelines();
	/**
	 * Sets the hasSexualGuidelines.
	 * @param hasSexualGuidelines  The hasSexualGuidelines to set as a boolean.
	 */
	public abstract void setHasSexualGuidelines(boolean hasSexualGuidelines);
	/**
	 * Returns the sexualGuidelineExplanation.
	 * @return String
	 */
	public abstract String getSexualGuidelineExplanation();
	/**
	 * Sets the sexualGuidelineExplanation.
	 * @param sexualGuidelineExplanation  The sexualGuidelineExplanation to set as a String.
	 */
	public abstract void setSexualGuidelineExplanation(String sexualGuidelineExplanation);
	/**
	 * Returns the isCurrentlyDating.
	 * @return boolean
	 */
	public abstract boolean getIsCurrentlyDating();
	/**
	 * Sets the isCurrentlyDating.
	 * @param isCurrentlyDating  The isCurrentlyDating to set as a boolean.
	 */
	public abstract void setIsCurrentlyDating(boolean isCurrentlyDating);
	/**
	 * Returns the currentlyDatingLocation.
	 * @return String
	 */
	public abstract String getCurrentlyDatingLocation();
	/**
	 * Sets the currentlyDatingLocation.
	 * @param currentlyDatingLocation  The currentlyDatingLocation to set as a String.
	 */
	public abstract void setCurrentlyDatingLocation(String currentlyDatingLocation);
	/**
	 * Returns the hasHomosexualInvolvement.
	 * @return boolean
	 */
	public abstract boolean getHasHomosexualInvolvement();
	/**
	 * Sets the hasHomosexualInvolvement.
	 * @param hasHomosexualInvolvement  The hasHomosexualInvolvement to set as a boolean.
	 */
	public abstract void setHasHomosexualInvolvement(boolean hasHomosexualInvolvement);
	/**
	 * Returns the homosexualInvolvementExplanation.
	 * @return String
	 */
	public abstract String getHomosexualInvolvementExplanation();
	/**
	 * Sets the homosexualInvolvementExplanation.
	 * @param homosexualInvolvementExplanation  The homosexualInvolvementExplanation to set as a String.
	 */
	public abstract void setHomosexualInvolvementExplanation(String homosexualInvolvementExplanation);
	/**
	 * Returns the hasRecentPornographicInvolvement.
	 * @return boolean
	 */
	public abstract boolean getHasRecentPornographicInvolvement();
	/**
	 * Sets the hasRecentPornographicInvolvement.
	 * @param hasRecentPornographicInvolvement  The hasRecentPornographicInvolvement to set as a boolean.
	 */
	public abstract void setHasRecentPornographicInvolvement(boolean hasRecentPornographicInvolvement);
	/**
	 * Returns the pornographicInvolvementMonth.
	 * @return int
	 */
	public abstract int getPornographicInvolvementMonth();
	/**
	 * Sets the pornographicInvolvementMonth.
	 * @param pornographicInvolvementMonth  The pornographicInvolvementMonth to set as a int.
	 */
	public abstract void setPornographicInvolvementMonth(int pornographicInvolvementMonth);
	/**
	 * Returns the pornographicInvolvementYear.
	 * @return int
	 */
	public abstract int getPornographicInvolvementYear();
	/**
	 * Sets the pornographicInvolvementYear.
	 * @param pornographicInvolvementYear  The pornographicInvolvementYear to set as a int.
	 */
	public abstract void setPornographicInvolvementYear(int pornographicInvolvementYear);
	/**
	 * Returns the pornographicInvolvementExplanation.
	 * @return String
	 */
	public abstract String getPornographicInvolvementExplanation();
	/**
	 * Sets the pornographicInvolvementExplanation.
	 * @param pornographicInvolvementExplanation  The pornographicInvolvementExplanation to set as a String.
	 */
	public abstract void setPornographicInvolvementExplanation(String pornographicInvolvementExplanation);
	/**
	 * Returns the hasRecentSexualImmorality.
	 * @return boolean
	 */
	public abstract boolean getHasRecentSexualImmorality();
	/**
	 * Sets the hasRecentSexualImmorality.
	 * @param hasRecentSexualImmorality  The hasRecentSexualImmorality to set as a boolean.
	 */
	public abstract void setHasRecentSexualImmorality(boolean hasRecentSexualImmorality);
	/**
	 * Returns the sexualImmoralityMonth.
	 * @return int
	 */
	public abstract int getSexualImmoralityMonth();
	/**
	 * Sets the sexualImmoralityMonth.
	 * @param sexualImmoralityMonth  The sexualImmoralityMonth to set as a int.
	 */
	public abstract void setSexualImmoralityMonth(int sexualImmoralityMonth);
	/**
	 * Returns the sexualImmoralityYear.
	 * @return int
	 */
	public abstract int getSexualImmoralityYear();
	/**
	 * Sets the sexualImmoralityYear.
	 * @param sexualImmoralityYear  The sexualImmoralityYear to set as a int.
	 */
	public abstract void setSexualImmoralityYear(int sexualImmoralityYear);
	/**
	 * Returns the sexualImmoralityExplanation.
	 * @return String
	 */
	public abstract String getSexualImmoralityExplanation();
	/**
	 * Sets the sexualImmoralityExplanation.
	 * @param sexualImmoralityExplanation  The sexualImmoralityExplanation to set as a String.
	 */
	public abstract void setSexualImmoralityExplanation(String sexualImmoralityExplanation);
	/**
	 * Returns the hasOtherDateSinceImmorality.
	 * @return boolean
	 */
	public abstract boolean getHasOtherDateSinceImmorality();
	/**
	 * Sets the hasOtherDateSinceImmorality.
	 * @param hasOtherDateSinceImmorality  The hasOtherDateSinceImmorality to set as a boolean.
	 */
	public abstract void setHasOtherDateSinceImmorality(boolean hasOtherDateSinceImmorality);
	/**
	 * Returns the singleImmoralityResultsExplanation.
	 * @return String
	 */
	public abstract String getSingleImmoralityResultsExplanation();
	/**
	 * Sets the singleImmoralityResultsExplanation.
	 * @param singleImmoralityResultsExplanation  The singleImmoralityResultsExplanation to set as a String.
	 */
	public abstract void setSingleImmoralityResultsExplanation(String singleImmoralityResultsExplanation);
	/**
	 * Returns the marriedImmoralityResultsExplanation.
	 * @return String
	 */
	public abstract String getMarriedImmoralityResultsExplanation();
	/**
	 * Sets the marriedImmoralityResultsExplanation.
	 * @param marriedImmoralityResultsExplanation  The marriedImmoralityResultsExplanation to set as a String.
	 */
	public abstract void setMarriedImmoralityResultsExplanation(String marriedImmoralityResultsExplanation);
	/**
	 * Returns the immoralityLifeChangeExplanation.
	 * @return String
	 */
	public abstract String getImmoralityLifeChangeExplanation();
	/**
	 * Sets the immoralityLifeChangeExplanation.
	 * @param immoralityLifeChangeExplanation  The immoralityLifeChangeExplanation to set as a String.
	 */
	public abstract void setImmoralityLifeChangeExplanation(String immoralityLifeChangeExplanation);
	/**
	 * Returns the immoralityCurrentStrugglesExplanation.
	 * @return String
	 */
	public abstract String getImmoralityCurrentStrugglesExplanation();
	/**
	 * Sets the immoralityCurrentStrugglesExplanation.
	 * @param immoralityCurrentStrugglesExplanation  The immoralityCurrentStrugglesExplanation to set as a String.
	 */
	public abstract void setImmoralityCurrentStrugglesExplanation(String immoralityCurrentStrugglesExplanation);
	/**
	 * Returns the additionalMoralComments.
	 * @return String
	 */
	public abstract String getAdditionalMoralComments();
	/**
	 * Sets the additionalMoralComments.
	 * @param additionalMoralComments  The additionalMoralComments to set as a String.
	 */
	public abstract void setAdditionalMoralComments(String additionalMoralComments);
	/******************************* Finanacial Information */
	public abstract boolean getIsAwareMustRaiseSupport();
	/**
	 * Sets the isAwareMustRaiseSupport.
	 * @param isAwareMustRaiseSupport  The isAwareMustRaiseSupport to set as a boolean.
	 */
	public abstract void setIsAwareMustRaiseSupport(boolean isAwareMustRaiseSupport);
	/**
	 * Returns the isInDebt.
	 * @return boolean
	 */
	public abstract boolean getIsInDebt();
	/**
	 * Sets the isInDebt.
	 * @param isInDebt  The isInDebt to set as a boolean.
	 */
	public abstract void setIsInDebt(boolean isInDebt);
	/**
	 * Returns the debtNature1.
	 * @return String
	 */
	public abstract String getDebtNature1();
	/**
	 * Sets the debtNature1.
	 * @param debtNature1  The debtNature1 to set as a String.
	 */
	public abstract void setDebtNature1(String debtNature1);
	/**
	 * Returns the debtTotal1.
	 * @return String
	 */
	public abstract String getDebtTotal1();
	/**
	 * Sets the debtTotal1.
	 * @param debtTotal1  The debtTotal1 to set as a String.
	 */
	public abstract void setDebtTotal1(String debtTotal1);
	/**
	 * Returns the debtMonthlyPayment1.
	 * @return String
	 */
	public abstract String getDebtMonthlyPayment1();
	/**
	 * Sets the debtMonthlyPayment1.
	 * @param debtMonthlyPayment1  The debtMonthlyPayment1 to set as a String.
	 */
	public abstract void setDebtMonthlyPayment1(String debtMonthlyPayment1);
	/**
	 * Returns the debtNature2.
	 * @return String
	 */
	public abstract String getDebtNature2();
	/**
	 * Sets the debtNature2.
	 * @param debtNature2  The debtNature2 to set as a String.
	 */
	public abstract void setDebtNature2(String debtNature2);
	/**
	 * Returns the debtTotal2.
	 * @return String
	 */
	public abstract String getDebtTotal2();
	/**
	 * Sets the debtTotal2.
	 * @param debtTotal2  The debtTotal2 to set as a String.
	 */
	public abstract void setDebtTotal2(String debtTotal2);
	/**
	 * Returns the debtMonthlyPayment2.
	 * @return String
	 */
	public abstract String getDebtMonthlyPayment2();
	/**
	 * Sets the debtMonthlyPayment2.
	 * @param debtMonthlyPayment2  The debtMonthlyPayment2 to set as a String.
	 */
	public abstract void setDebtMonthlyPayment2(String debtMonthlyPayment2);
	/**
	 * Returns the debtNature3.
	 * @return String
	 */
	public abstract String getDebtNature3();
	/**
	 * Sets the debtNature3.
	 * @param debtNature3  The debtNature3 to set as a String.
	 */
	public abstract void setDebtNature3(String debtNature3);
	/**
	 * Returns the debtTotal3.
	 * @return String
	 */
	public abstract String getDebtTotal3();
	/**
	 * Sets the debtTotal3.
	 * @param debtTotal3  The debtTotal3 to set as a String.
	 */
	public abstract void setDebtTotal3(String debtTotal3);
	/**
	 * Returns the debtMonthlyPayment3.
	 * @return String
	 */
	public abstract String getDebtMonthlyPayment3();
	/**
	 * Sets the debtMonthlyPayment3.
	 * @param debtMonthlyPayment3  The debtMonthlyPayment3 to set as a String.
	 */
	public abstract void setDebtMonthlyPayment3(String debtMonthlyPayment3);
	/**
	 * Returns the hasOtherFinancialResponsibility.
	 * @return boolean
	 */
	public abstract boolean getHasOtherFinancialResponsibility();
	/**
	 * Sets the hasOtherFinancialResponsibility.
	 * @param hasOtherFinancialResponsibility  The hasOtherFinancialResponsibility to set as a boolean.
	 */
	public abstract void setHasOtherFinancialResponsibility(boolean hasOtherFinancialResponsibility);
	/**
	 * Returns the otherFinancialResponsibilityExplanation.
	 * @return String
	 */
	public abstract String getOtherFinancialResponsibilityExplanation();
	/**
	 * Sets the otherFinancialResponsibilityExplanation.
	 * @param otherFinancialResponsibilityExplanation  The otherFinancialResponsibilityExplanation to set as a String.
	 */
	public abstract void setOtherFinancialResponsibilityExplanation(String otherFinancialResponsibilityExplanation);
	/**
	 * Returns the debtPaymentPlan.
	 * @return String
	 */
	public abstract String getDebtPaymentPlan();
	/**
	 * Sets the debtPaymentPlan.
	 * @param debtPaymentPlan  The debtPaymentPlan to set as a String.
	 */
	public abstract void setDebtPaymentPlan(String debtPaymentPlan);
	/**
	 * Returns the debtPaymentTimeframe.
	 * @return String
	 */
	public abstract String getDebtPaymentTimeframe();
	/**
	 * Sets the debtPaymentTimeframe.
	 * @param debtPaymentTimeframe  The debtPaymentTimeframe to set as a String.
	 */
	public abstract void setDebtPaymentTimeframe(String debtPaymentTimeframe);
	/******************************* Ministry Partner Development */
	public abstract String getDevelopingPartnersExplanation();
	/**
	 * Sets the developingPartnersExplanation.
	 * @param developingPartnersExplanation  The developingPartnersExplanation to set as a String.
	 */
	public abstract void setDevelopingPartnersExplanation(String developingPartnersExplanation);
	/**
	 * Returns the isWillingDevelopPartners.
	 * @return boolean
	 */
	public abstract boolean getIsWillingDevelopPartners();
	/**
	 * Sets the isWillingDevelopPartners.
	 * @param isWillingDevelopPartners  The isWillingDevelopPartners to set as a boolean.
	 */
	public abstract void setIsWillingDevelopPartners(boolean isWillingDevelopPartners);
	/**
	 * Returns the unwillingDevelopPartnersExplanation.
	 * @return String
	 */
	public abstract String getUnwillingDevelopPartnersExplanation();
	/**
	 * Sets the unwillingDevelopPartnersExplanation.
	 * @param unwillingDevelopPartnersExplanation  The unwillingDevelopPartnersExplanation to set as a String.
	 */
	public abstract void setUnwillingDevelopPartnersExplanation(String unwillingDevelopPartnersExplanation);
	/**
	 * Returns the isCommittedDevelopPartners.
	 * @return boolean
	 */
	public abstract boolean getIsCommittedDevelopPartners();
	/**
	 * Sets the isCommittedDevelopPartners.
	 * @param isCommittedDevelopPartners  The isCommittedDevelopPartners to set as a boolean.
	 */
	public abstract void setIsCommittedDevelopPartners(boolean isCommittedDevelopPartners);
	/**
	 * Returns the uncommittedDevelopPartnersExplanation.
	 * @return String
	 */
	public abstract String getUncommittedDevelopPartnersExplanation();
	/**
	 * Sets the uncommittedDevelopPartnersExplanation.
	 * @param uncommittedDevelopPartnersExplanation  The uncommittedDevelopPartnersExplanation to set as a String.
	 */
	public abstract void setUncommittedDevelopPartnersExplanation(String uncommittedDevelopPartnersExplanation);
	/******************************* Biographical Information */
	public abstract String getPersonalTestimonyGrowth();
	/**
	 * Sets the personalTestimonyGrowth.
	 * @param personalTestimonyGrowth  The personalTestimonyGrowth to set as a String.
	 */
	public abstract void setPersonalTestimonyGrowth(String personalTestimonyGrowth);
	/**
	 * Returns the internshipParticipationExplanation.
	 * @return String
	 */
	public abstract String getInternshipParticipationExplanation();
	/**
	 * Sets the internshipParticipationExplanation.
	 * @param internshipParticipationExplanation  The internshipParticipationExplanation to set as a String.
	 */
	public abstract void setInternshipParticipationExplanation(String internshipParticipationExplanation);
	/**
	 * Returns the internshipObjectives.
	 * @return String
	 */
	public abstract String getInternshipObjectives();
	/**
	 * Sets the internshipObjectives.
	 * @param internshipObjectives  The internshipObjectives to set as a String.
	 */
	public abstract void setInternshipObjectives(String internshipObjectives);
	/**
	 * Returns the currentMinistryDescription.
	 * @return String
	 */
	public abstract String getCurrentMinistryDescription();
	/**
	 * Sets the currentMinistryDescription.
	 * @param currentMinistryDescription  The currentMinistryDescription to set as a String.
	 */
	public abstract void setCurrentMinistryDescription(String currentMinistryDescription);
	/**
	 * Returns the personalStrengthA.
	 * @return String
	 */
	public abstract String getPersonalStrengthA();
	/**
	 * Sets the personalStrengthA.
	 * @param personalStrengthA  The personalStrengthA to set as a String.
	 */
	public abstract void setPersonalStrengthA(String personalStrengthA);
	/**
	 * Returns the personalStrengthB.
	 * @return String
	 */
	public abstract String getPersonalStrengthB();
	/**
	 * Sets the personalStrengthB.
	 * @param personalStrengthB  The personalStrengthB to set as a String.
	 */
	public abstract void setPersonalStrengthB(String personalStrengthB);
	/**
	 * Returns the personalStrengthC.
	 * @return String
	 */
	public abstract String getPersonalStrengthC();
	/**
	 * Sets the personalStrengthC.
	 * @param personalStrengthC  The personalStrengthC to set as a String.
	 */
	public abstract void setPersonalStrengthC(String personalStrengthC);
	/**
	 * Returns the personalDevelopmentA.
	 * @return String
	 */
	public abstract String getPersonalDevelopmentA();
	/**
	 * Sets the personalDevelopmentA.
	 * @param personalDevelopmentA  The personalDevelopmentA to set as a String.
	 */
	public abstract void setPersonalDevelopmentA(String personalDevelopmentA);
	/**
	 * Returns the personalDevelopmentB.
	 * @return String
	 */
	public abstract String getPersonalDevelopmentB();
	/**
	 * Sets the personalDevelopmentB.
	 * @param personalDevelopmentB  The personalDevelopmentB to set as a String.
	 */
	public abstract void setPersonalDevelopmentB(String personalDevelopmentB);
	/**
	 * Returns the personalDevelopmentC.
	 * @return String
	 */
	public abstract String getPersonalDevelopmentC();
	/**
	 * Sets the personalDevelopmentC.
	 * @param personalDevelopmentC  The personalDevelopmentC to set as a String.
	 */
	public abstract void setPersonalDevelopmentC(String personalDevelopmentC);
	/**
	 * Returns the personalDescriptionA.
	 * @return String
	 */
	public abstract String getPersonalDescriptionA();
	/**
	 * Sets the personalDescriptionA.
	 * @param personalDescriptionA  The personalDescriptionA to set as a String.
	 */
	public abstract void setPersonalDescriptionA(String personalDescriptionA);
	/**
	 * Returns the personalDescriptionB.
	 * @return String
	 */
	public abstract String getPersonalDescriptionB();
	/**
	 * Sets the personalDescriptionB.
	 * @param personalDescriptionB  The personalDescriptionB to set as a String.
	 */
	public abstract void setPersonalDescriptionB(String personalDescriptionB);
	/**
	 * Returns the personalDescriptionC.
	 * @return String
	 */
	public abstract String getPersonalDescriptionC();
	/**
	 * Sets the personalDescriptionC.
	 * @param personalDescriptionC  The personalDescriptionC to set as a String.
	 */
	public abstract void setPersonalDescriptionC(String personalDescriptionC);
	/**
	 * Returns the familyRelationshipDescription.
	 * @return String
	 */
	public abstract String getFamilyRelationshipDescription();
	/**
	 * Sets the familyRelationshipDescription.
	 * @param familyRelationshipDescription  The familyRelationshipDescription to set as a String.
	 */
	public abstract void setFamilyRelationshipDescription(String familyRelationshipDescription);
	/******************************* Submit Application */
	public abstract String getElectronicSignature();
	/**
	 * Sets the electronicSignature.
	 * @param electronicSignature  The electronicSignature to set as a String.
	 */
	public abstract void setElectronicSignature(String electronicSignature);
	/**
	 * Returns the ssn (Social Security Number).
	 * @return String
	 */
	public abstract String getSsn();
	/**
	 * Sets the ssn.
	 * @param ssn  The ssn to set as a String.
	 */
	public abstract void setSsn(String ssn);
	/**
	 * Returns the fk_ssmUserID.
	 * @return int
	 */
	public abstract int getFk_ssmUserID();
	/**
	 * Sets the fk_ssmUserID.
	 * @param fk_ssmUserID The fk_ssmUserID to set
	 */
	public abstract void setFk_ssmUserID(int fk_ssmUserID);
	/**
	 * Returns the fk_SIPersonID.
	 * @return String
	 */
	public abstract String getFk_SIPersonID();
	/**
	 * Sets the fk_SIPersonID.
	 * @param fk_SIPersonID The fk_SIPersonID to set
	 */
	public abstract void setFk_SIPersonID(String fk_SIPersonID);
	/**
	 * gets the appFee
	 * @return int
	 */
	public abstract int getAppFee();
	/**
	 * Returns the isPaid.
	 * @return boolean
	 */
	public abstract boolean getIsPaid();
	/**
	 * Sets the appFee.
	 * @param appFee The appFee to set
	 */
	public abstract void setAppFee(int appFee);
	/**
	 * Sets the isPaid.
	 * @param isPaid The isPaid to set
	 */
	public abstract void setIsPaid(boolean isPaid);
	/**
	 * Returns the appStatus.
	 * @return String
	 */
	public abstract String getAppStatus();
	/**
	 * Returns the dateAppLastChanged.
	 * @return Date
	 */
	public abstract Date getDateAppLastChanged();
	/**
	 * Returns the dateAppStarted.
	 * @return Date
	 */
	public abstract Date getDateAppStarted();
	/**
	 * Returns the dateSubmitted.
	 * @return Date
	 */
	public abstract Date getDateSubmitted();
	/**
	 * Returns the isSubmitted.
	 * @return boolean
	 */
	public abstract boolean getIsSubmitted();
	/**
	 * Sets the appStatus.
	 * @param appStatus The appStatus to set
	 */
	public abstract void setAppStatus(String appStatus);
	/**
	 * Sets the dateAppLastChanged.
	 * @param dateAppLastChanged The dateAppLastChanged to set
	 */
	public abstract void setDateAppLastChanged(Date dateAppLastChanged);
	/**
	 * Sets the dateAppStarted.
	 * @param dateAppStarted The dateAppStarted to set
	 */
	public abstract void setDateAppStarted(Date dateAppStarted);
	/**
	 * Sets the dateSubmitted.
	 * @param dateSubmitted The dateSubmitted to set
	 */
	public abstract void setDateSubmitted(Date dateSubmitted);
	/**
	 * Sets the isSubmitted.
	 * @param isSubmitted The isSubmitted to set
	 */
	public abstract void setIsSubmitted(boolean isSubmitted);
	/**
	 * Returns the assignedToProject.
	 * @return int
	 */
	public abstract int getAssignedToProject();
	/**
	 * Sets the assignedToProject.
	 * @param assignedToProject The assignedToProject to set
	 */
	public abstract void setAssignedToProject(int assignedToProject);
	/**
	 * Returns the finalProject.
	 * @return int
	 */
	public abstract int getFinalProject();
	/**
	 * Sets the finalProject.
	 * @param finalProject The finalProject to set
	 */
	public abstract void setFinalProject(int finalProject);
	/**
	 * Returns the siYear.
	 * @return String
	 */
	public abstract String getSiYear();
	/**
	 * Sets the siYear.
	 * @param siYear The siYear to set
	 */
	public abstract void setSiYear(String siYear);
	/**
	 * Returns the status.
	 * @return String
	 */
	public abstract String getStatus();
	/**
	 * Sets the status.
	 * @param status The status to set
	 */
	public abstract void setStatus(String status);
	/**
	 * Returns the appType.
	 * @return String
	 */
	public abstract String getAppType();
	/**
	 * Sets the appType.
	 * @param appType The appType to set
	 */
	public abstract void setAppType(String appType);
}