
BEGIN TRAN T1

UPDATE isttemp.hr_si_Application_Archive2003 SET hasMinistryConflict = '1' WHERE hasMinistryConflict = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasMinistryConflict = '0' WHERE hasMinistryConflict <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasSpecificLocation = '1' WHERE hasSpecificLocation = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasSpecificLocation = '0' WHERE hasSpecificLocation <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isDating = '1' WHERE isDating = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isDating = '0' WHERE isDating <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasCampusPartnership = '1' WHERE hasCampusPartnership = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasCampusPartnership = '0' WHERE hasCampusPartnership <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isDatingStint = '1' WHERE isDatingStint = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isDatingStint = '0' WHERE isDatingStint <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isEvangelismTrainable = '1' WHERE isEvangelismTrainable = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isEvangelismTrainable = '0' WHERE isEvangelismTrainable <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarFourSpiritualLaws = '1' WHERE isFamiliarFourSpiritualLaws = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarFourSpiritualLaws = '0' WHERE isFamiliarFourSpiritualLaws <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceFourSpiritualLaws = '1' WHERE hasExperienceFourSpiritualLaws = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceFourSpiritualLaws = '0' WHERE hasExperienceFourSpiritualLaws <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarLifeAtLarge = '1' WHERE isFamiliarLifeAtLarge = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarLifeAtLarge = '0' WHERE isFamiliarLifeAtLarge <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceLifeAtLarge = '1' WHERE hasExperienceLifeAtLarge = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceLifeAtLarge = '0' WHERE hasExperienceLifeAtLarge <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarPersonalTestimony = '1' WHERE isFamiliarPersonalTestimony = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarPersonalTestimony = '0' WHERE isFamiliarPersonalTestimony <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperiencePersonalTestimony = '1' WHERE hasExperiencePersonalTestimony = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperiencePersonalTestimony = '0' WHERE hasExperiencePersonalTestimony <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarExplainingGospel = '1' WHERE isFamiliarExplainingGospel = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarExplainingGospel = '0' WHERE isFamiliarExplainingGospel <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceExplainingGospel = '1' WHERE hasExperienceExplainingGospel = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceExplainingGospel = '0' WHERE hasExperienceExplainingGospel <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarSharingFaith = '1' WHERE isFamiliarSharingFaith = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarSharingFaith = '0' WHERE isFamiliarSharingFaith <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceSharingFaith = '1' WHERE hasExperienceSharingFaith = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceSharingFaith = '0' WHERE hasExperienceSharingFaith <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarHolySpiritBooklet = '1' WHERE isFamiliarHolySpiritBooklet = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarHolySpiritBooklet = '0' WHERE isFamiliarHolySpiritBooklet <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceHolySpiritBooklet = '1' WHERE hasExperienceHolySpiritBooklet = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceHolySpiritBooklet = '0' WHERE hasExperienceHolySpiritBooklet <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarFollowUp = '1' WHERE isFamiliarFollowUp = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarFollowUp = '0' WHERE isFamiliarFollowUp <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceFollowUp = '1' WHERE hasExperienceFollowUp = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceFollowUp = '0' WHERE hasExperienceFollowUp <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarHelpGrowInFaith = '1' WHERE isFamiliarHelpGrowInFaith = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarHelpGrowInFaith = '0' WHERE isFamiliarHelpGrowInFaith <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceHelpGrowInFaith = '1' WHERE hasExperienceHelpGrowInFaith = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceHelpGrowInFaith = '0' WHERE hasExperienceHelpGrowInFaith <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarTrainShareFaith = '1' WHERE isFamiliarTrainShareFaith = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarTrainShareFaith = '0' WHERE isFamiliarTrainShareFaith <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceTrainShareFaith = '1' WHERE hasExperienceTrainShareFaith = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceTrainShareFaith = '0' WHERE hasExperienceTrainShareFaith <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarOtherReligions = '1' WHERE isFamiliarOtherReligions = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isFamiliarOtherReligions = '0' WHERE isFamiliarOtherReligions <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceOtherReligions = '1' WHERE hasExperienceOtherReligions = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasExperienceOtherReligions = '0' WHERE hasExperienceOtherReligions <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasLedDiscipleshipGroup = '1' WHERE hasLedDiscipleshipGroup = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasLedDiscipleshipGroup = '0' WHERE hasLedDiscipleshipGroup <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasInvolvementSpeakingTongues = '1' WHERE hasInvolvementSpeakingTongues = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasInvolvementSpeakingTongues = '0' WHERE hasInvolvementSpeakingTongues <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasCrimeConviction = '1' WHERE hasCrimeConviction = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasCrimeConviction = '0' WHERE hasCrimeConviction <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasDrugUse = '1' WHERE hasDrugUse = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasDrugUse = '0' WHERE hasDrugUse <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isTobaccoUser = '1' WHERE isTobaccoUser = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isTobaccoUser = '0' WHERE isTobaccoUser <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isWillingChangeHabits = '1' WHERE isWillingChangeHabits = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isWillingChangeHabits = '0' WHERE isWillingChangeHabits <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isWillingRefrainAlcohol = '1' WHERE isWillingRefrainAlcohol = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isWillingRefrainAlcohol = '0' WHERE isWillingRefrainAlcohol <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isWillingAbstainTobacco = '1' WHERE isWillingAbstainTobacco = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isWillingAbstainTobacco = '0' WHERE isWillingAbstainTobacco <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasRequestedPhoneCall = '1' WHERE hasRequestedPhoneCall = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasRequestedPhoneCall = '0' WHERE hasRequestedPhoneCall <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasSexualGuidelines = '1' WHERE hasSexualGuidelines = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasSexualGuidelines = '0' WHERE hasSexualGuidelines <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isCurrentlyDating = '1' WHERE isCurrentlyDating = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isCurrentlyDating = '0' WHERE isCurrentlyDating <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasHomosexualInvolvement = '1' WHERE hasHomosexualInvolvement = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasHomosexualInvolvement = '0' WHERE hasHomosexualInvolvement <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasRecentPornographicInvolvement = '1' WHERE hasRecentPornographicInvolvement = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasRecentPornographicInvolvement = '0' WHERE hasRecentPornographicInvolvement <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasRecentSexualImmorality = '1' WHERE hasRecentSexualImmorality = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasRecentSexualImmorality = '0' WHERE hasRecentSexualImmorality <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasOtherDateSinceImmorality = '1' WHERE hasOtherDateSinceImmorality = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasOtherDateSinceImmorality = '0' WHERE hasOtherDateSinceImmorality <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isAwareMustRaiseSupport = '1' WHERE isAwareMustRaiseSupport = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isAwareMustRaiseSupport = '0' WHERE isAwareMustRaiseSupport <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isInDebt = '1' WHERE isInDebt = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isInDebt = '0' WHERE isInDebt <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET hasOtherFinancialResponsibility = '1' WHERE hasOtherFinancialResponsibility = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET hasOtherFinancialResponsibility = '0' WHERE hasOtherFinancialResponsibility <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isWillingDevelopPartners = '1' WHERE isWillingDevelopPartners = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isWillingDevelopPartners = '0' WHERE isWillingDevelopPartners <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isCommittedDevelopPartners = '1' WHERE isCommittedDevelopPartners = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isCommittedDevelopPartners = '0' WHERE isCommittedDevelopPartners <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isPaid = '1' WHERE isPaid = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isPaid = '0' WHERE isPaid <> '1'

UPDATE isttemp.hr_si_Application_Archive2003 SET isSubmitted = '1' WHERE isSubmitted = 'T'
UPDATE isttemp.hr_si_Application_Archive2003 SET isSubmitted = '0' WHERE isSubmitted <> '1'


ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasMinistryConflict bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasSpecificLocation bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isDating bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasCampusPartnership bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isDatingStint bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isEvangelismTrainable bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarFourSpiritualLaws bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceFourSpiritualLaws bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarLifeAtLarge bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceLifeAtLarge bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarPersonalTestimony bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperiencePersonalTestimony bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarExplainingGospel bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceExplainingGospel bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarSharingFaith bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceSharingFaith bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarHolySpiritBooklet bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceHolySpiritBooklet bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarFollowUp bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceFollowUp bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarHelpGrowInFaith bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceHelpGrowInFaith bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarTrainShareFaith bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceTrainShareFaith bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isFamiliarOtherReligions bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasExperienceOtherReligions bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasLedDiscipleshipGroup bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasInvolvementSpeakingTongues bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasCrimeConviction bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasDrugUse bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isTobaccoUser bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isWillingChangeHabits bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isWillingRefrainAlcohol bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isWillingAbstainTobacco bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasRequestedPhoneCall bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasSexualGuidelines bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isCurrentlyDating bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasHomosexualInvolvement bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasRecentPornographicInvolvement bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasRecentSexualImmorality bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasOtherDateSinceImmorality bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isAwareMustRaiseSupport bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isInDebt bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN hasOtherFinancialResponsibility bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isWillingDevelopPartners bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isCommittedDevelopPartners bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isPaid bit
ALTER TABLE isttemp.hr_si_Application_Archive2003 ALTER COLUMN isSubmitted bit

SELECT * FROM isttemp.hr_si_Application_Archive2003


ROLLBACK TRAN T1

/*
ROLLBACK TRAN T1
COMMIT TRAN T1
*/
