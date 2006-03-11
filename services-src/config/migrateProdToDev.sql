delete from dev.istdev.fsk_Allocation;
insert into dev.istdev.fsk_Allocation 
(allocationID,accountNo,natlDonation,region,regionalAllotment,regionallyRaised,locallyRaised,natlNotes,regNotes,localNotes)
(select 
	allocationID,
	ISNULL(accountNo, ''),
	ISNULL(natlDonation, ''),
	ISNULL(region, ''),
	ISNULL(regionalAllotment, ''),
	ISNULL(regionallyRaised, ''),
	ISNULL(locallyRaised, ''),
	ISNULL(natlNotes, ''),
	ISNULL(regNotes, ''),
	ISNULL(localNotes, '')
	
	from prod.istprod.fsk_Allocation);

delete from dev.istdev.fsk_FskOrder;
insert into dev.istdev.fsk_FskOrder 
(fskOrderID,campusName,region,localAcctNo1,localAcctNo2,localAcctNo3,localAcctNo4,staffFirstName,staffLastName,staffPhone,staffEmail,dateCreated,dateUpdated,contactFirstName,contactLastName,contactPhone,contactPager,contactCell,contactEmail,kitShipName,kitShipAddress1,kitShipAddress2,kitShipCity,kitShipState,kitShipZip,kitShipPhone,totalKits,bagToyImp,bagToyWay,bagToyDes,bagToyEp,bagToyESC,bagToyMisc,bibleIsiNT,bibleTwo,bibleThree,bibleMisc,videoRel,videoRelCD,videoThirsty,videoThirstyCD,videoChang,videoChangCD,videoSurfer,videoSurferCD,videoClimbing,videoClimbingCD,videoImpact,videoImpactCD,videoTestimonyCD,videoJfpCD,videoJesusVCD,videoMisc,bookMTAC,bookMTACSpan,bookCaseForC,bookCaseForF,bookBeyond,bookRelevant,bookSurvUS,bookMisc,cdHipHop,cdSetApart,cdMisc,cdHispanic,cardReg,cardAfAm,cardHispanic,cardAsian,planner,fk_Allocation)
(select 
	fskOrderID,
	ISNULL(campusName, ''),
	ISNULL(region, ''),
	ISNULL(localAcctNo1, ''),
	ISNULL(localAcctNo2, ''),
	ISNULL(localAcctNo3, ''),
	ISNULL(localAcctNo4, ''),
	ISNULL(staffFirstName, ''),
	ISNULL(staffLastName, ''),
	ISNULL(staffPhone, ''),
	ISNULL(staffEmail, ''),
	dateCreated,
	dateUpdated,
	ISNULL(contactFirstName, ''),
	ISNULL(contactLastName, ''),
	ISNULL(contactPhone, ''),
	ISNULL(contactPager, ''),
	ISNULL(contactCell, ''),
	ISNULL(contactEmail, ''),
	ISNULL(kitShipName, ''),
	ISNULL(kitShipAddress1, ''),
	ISNULL(kitShipAddress2, ''),
	ISNULL(kitShipCity, ''),
	ISNULL(kitShipState, ''),
	ISNULL(kitShipZip, ''),
	ISNULL(kitShipPhone, ''),
	ISNULL(totalKits, ''),
	ISNULL(bagToyImp, ''),
	ISNULL(bagToyWay, ''),
	ISNULL(bagToyDes, ''),
	ISNULL(bagToyEp, ''),
	ISNULL(bagToyESC, ''),
	ISNULL(bagToyMisc, ''),
	ISNULL(bibleIsiNT, ''),
	ISNULL(bibleTwo, ''),
	ISNULL(bibleThree, ''),
	ISNULL(bibleMisc, ''),
	ISNULL(videoRel, ''),
	ISNULL(videoRelCD, ''),
	ISNULL(videoThirsty, ''),
	ISNULL(videoThirstyCD, ''),
	ISNULL(videoChang, ''),
	ISNULL(videoChangCD, ''),
	ISNULL(videoSurfer, ''),
	ISNULL(videoSurferCD, ''),
	ISNULL(videoClimbing, ''),
	ISNULL(videoClimbingCD, ''),
	ISNULL(videoImpact, ''),
	ISNULL(videoImpactCD, ''),
	ISNULL(videoTestimonyCD, ''),
	ISNULL(videoJfpCD, ''),
	ISNULL(videoJesusVCD, ''),
	ISNULL(videoMisc, ''),
	ISNULL(bookMTAC, ''),
	ISNULL(bookMTACSpan, ''),
	ISNULL(bookCaseForC, ''),
	ISNULL(bookCaseForF, ''),
	ISNULL(bookBeyond, ''),
	ISNULL(bookRelevant, ''),
	ISNULL(bookSurvUS, ''),
	ISNULL(bookMisc, ''),
	ISNULL(cdHipHop, ''),
	ISNULL(cdSetApart, ''),
	ISNULL(cdMisc, ''),
	ISNULL(cdHispanic, ''),
	ISNULL(cardReg, ''),
	ISNULL(cardAfAm, ''),
	ISNULL(cardHispanic, ''),
	ISNULL(cardAsian, ''),
	ISNULL(planner, ''),
	fk_Allocation
	
	from prod.istprod.fsk_FskOrder);

delete from dev.istdev.event_EventCustomAnswer;
insert into dev.istdev.event_EventCustomAnswer 
(eventCustomAnswerID,answerNumber,answer,fk_EventRegistration)
(select 
	eventCustomAnswerID,
	ISNULL(answerNumber, ''),
	ISNULL(answer, ''),
	fk_EventRegistration
	
	from prod.istprod.event_EventCustomAnswer);

delete from dev.istdev.event_EventCustomItem;
insert into dev.istdev.event_EventCustomItem 
(eventCustomItemID,title,text,itemNumber,fk_EventInfo)
(select 
	eventCustomItemID,
	ISNULL(title, ''),
	ISNULL(text, ''),
	ISNULL(itemNumber, ''),
	fk_EventInfo
	
	from prod.istprod.event_EventCustomItem);

delete from dev.istdev.event_EventCustomQuestion;
insert into dev.istdev.event_EventCustomQuestion 
(questionNumber,question,answerType,eventCustomQuestionID,fk_EventInfo)
(select 
	ISNULL(questionNumber, ''),
	ISNULL(question, ''),
	ISNULL(answerType, ''),
	eventCustomQuestionID,
	fk_EventInfo
	
	from prod.istprod.event_EventCustomQuestion);

delete from dev.istdev.event_EventInfo;
insert into dev.istdev.event_EventInfo 
(name,theme,password,region,beginDate,endDate,briefDescription,preRegCost,fullCost,checkPayableTo,acceptCreditCards,merchantAcctNum,contactName,contactEmail,contactPhone,contactAddress1,contactAddress2,contactCity,contactState,contactZip,splashPageURL,confImageId,fontFace,backgroundColor,foregroundColor,highlightColor,eventInfoID)
(select 
	ISNULL(name, ''),
	ISNULL(theme, ''),
	ISNULL(password, ''),
	ISNULL(region, ''),
	ISNULL(beginDate, ''),
	ISNULL(endDate, ''),
	ISNULL(briefDescription, ''),
	ISNULL(preRegCost, ''),
	ISNULL(fullCost, ''),
	ISNULL(checkPayableTo, ''),
	ISNULL(acceptCreditCards, ''),
	ISNULL(merchantAcctNum, ''),
	ISNULL(contactName, ''),
	ISNULL(contactEmail, ''),
	ISNULL(contactPhone, ''),
	ISNULL(contactAddress1, ''),
	ISNULL(contactAddress2, ''),
	ISNULL(contactCity, ''),
	ISNULL(contactState, ''),
	ISNULL(contactZip, ''),
	ISNULL(splashPageURL, ''),
	ISNULL(confImageId, ''),
	ISNULL(fontFace, ''),
	ISNULL(backgroundColor, ''),
	ISNULL(foregroundColor, ''),
	ISNULL(highlightColor, ''),
	eventInfoID
	
	from prod.istprod.event_EventInfo);

delete from dev.istdev.event_EventPerson;
insert into dev.istdev.event_EventPerson 
(firstName,lastName,middleInitial,birthDate,campus,gender,address1,address2,city,state,zip,homePhone,email,ssn,maritalStatus,spouseName,numberOfKids,isSpeaker,isStaff,accountNo,password,eventPersonID)
(select 
	ISNULL(firstName, ''),
	ISNULL(lastName, ''),
	ISNULL(middleInitial, ''),
	ISNULL(birthDate, ''),
	ISNULL(campus, ''),
	ISNULL(gender, ''),
	ISNULL(address1, ''),
	ISNULL(address2, ''),
	ISNULL(city, ''),
	ISNULL(state, ''),
	ISNULL(zip, ''),
	ISNULL(homePhone, ''),
	ISNULL(email, ''),
	ISNULL(ssn, ''),
	ISNULL(maritalStatus, ''),
	ISNULL(spouseName, ''),
	ISNULL(numberOfKids, ''),
	isSpeaker,
	isStaff,
	ISNULL(accountNo, ''),
	ISNULL(password, ''),
	eventPersonID
	
	from prod.istprod.event_EventPerson);

delete from dev.istdev.event_EventRegistration;
insert into dev.istdev.event_EventRegistration 
(preRegistered,amountPaid,amountScholarship,eventRegistrationID,fk_EventRegInfo,fk_EventRegPerson)
(select 
	preRegistered,
	ISNULL(amountPaid, ''),
	ISNULL(amountScholarship, ''),
	eventRegistrationID,
	fk_EventRegInfo,
	fk_EventRegPerson
	
	from prod.istprod.event_EventRegistration);

delete from dev.istdev.ministry_Activity;
insert into dev.istdev.ministry_Activity 
(ActivityID,status,periodBegin,periodEnd,strategy,transUsername,fk_targetAreaID,fk_teamID)
(select 
	ActivityID,
	ISNULL(status, ''),
	periodBegin,
	periodEnd,
	ISNULL(strategy, ''),
	ISNULL(transUsername, ''),
	Fk_hasActivity,
	Fk_doesActivity
	
	from prod.istprod.event_Activity);

delete from dev.istdev.ministry_Address;
insert into dev.istdev.ministry_Address
(AddressID,startDate,endDate,address1,address2,address3,address4,city,state,zip,country)
(select 
	AddressID,
	startDate,
	endDate,
	ISNULL(address1, ''),
	ISNULL(address2, ''),
	ISNULL(address3, ''),
	ISNULL(address4, ''),
	ISNULL(city, ''),
	ISNULL(state, ''),
	ISNULL(zip, ''),
	country from prod.istprod.ministry_Address);

delete from dev.istdev.ministry_assoc_activityContact;
insert into dev.istdev.ministry_assoc_activityContact
(ActivityID,accountNo)
(select 
	ActivityID,
	accountNo
	from prod.istprod.Assoc_activityContact);


delete from dev.istdev.ministry_Assoc_dependents;
insert into dev.istdev.ministry_Assoc_dependents
(DependentID, accountNo)
(select 
	DependentID,
	accountNo
	from prod.istprod.ministry_Assoc_dependents);

delete from dev.istdev.ministry_Assoc_intlContact;
insert into dev.istdev.ministry_Assoc_intlContact
(accountNo, WsnPartnershipID)
(select 
	accountNo,
	WsnPartnershipID
	from prod.istprod.ministry_Assoc_intlContact);

delete from dev.istdev.ministry_Assoc_otherMinistries;
insert into dev.istdev.ministry_Assoc_otherMinistries
(NonCccMinID, TargetAreaID)
(select 
	NonCccMinID,
	TargetAreaID
	from prod.istprod.ministry_Assoc_otherMinistries);

delete from dev.istdev.ministry_assoc_partCoord;
insert into dev.istdev.ministry_assoc_partCoord
(accountNo, WsnPartnershipID)
(select 
	accountNo,
	WsnPartnershipID
	from prod.istprod.ministry_assoc_partCoord);



delete from dev.istdev.ministry_Authorization;
insert into dev.istdev.ministry_Authorization
(AuthorizationID, authDate, role, authorized, sequence, Fk_AuthorizedBy, fk_AuthorizationNote, fk_changeRequestID)
(select 
	AuthorizationID, 
	authDate, 
	ISNULL(role, ''), 
	ISNULL(authorized, ''), 
	ISNULL(sequence, ''), 
	Fk_AuthorizedBy, 
	null,
	fk_changeRequestID
	from prod.istprod.ministry_Authorization);

delete from dev.istdev.ministry_ChangeRequest;
insert into dev.istdev.ministry_ChangeRequest
(ChangeRequestID, requestdate, effectivedate, applieddate, type, fk_requestedBy)
(select 
	ChangeRequestID,
	requestDate,
	effectiveDate,
	appliedDate,
	ISNULL(type, ''),
	Fk_RequestedBy
 from prod.istprod.ministry_ChangeRequest);

delete from dev.istdev.ministry_Dependent;
insert into dev.istdev.ministry_Dependent
(DependentID, firstName, middleName, lastName, birthdate, gender)
(select 
	DependentID, 
	ISNULL(firstName, ''), 
	ISNULL(middleName, ''), 
	ISNULL(lastName, ''), 
	birthdate, 
	gender
	from prod.istprod.ministry_Dependent);

delete from dev.istdev.ministry_FieldChange;
insert into dev.istdev.ministry_FieldChange
(FieldChangeID, field, oldValue, newValue, Fk_hasFieldChanges)
(select 
	FieldChangeID,
	ISNULL(field, ''),
	ISNULL(oldValue, ''),
	ISNULL(newValue, ''),
	Fk_hasFieldChanges
	from prod.istprod.ministry_FieldChange);

delete from dev.istdev.ministry_NonCCCMin;
insert into dev.istdev.ministry_NonCCCMin
(NonCccMinID, ministry, firstName, lastName, address1, address2, city, state, zip, country, homePhone, workPhone, mobilePhone, email, url, pager, fax, note)
(select 
	NonCccMinID,
	ISNULL(ministry, ''),
	ISNULL(firstName, ''),
	ISNULL(lastName, ''),
	ISNULL(address1, ''),
	ISNULL(address2, ''),
	ISNULL(city, ''),
	ISNULL(state, ''),
	ISNULL(zip, ''),
	ISNULL(country, ''),
	ISNULL(homePhone, ''),
	ISNULL(workPhone, ''),
	ISNULL(mobilePhone, ''),
	ISNULL(email, ''),
	ISNULL(url, ''),
	ISNULL(pager, ''),
	ISNULL(fax, ''),
	note
	from prod.istprod.ministry_NonCCCMin);

delete from dev.istdev.ministry_Note;
insert into dev.istdev.ministry_Note
(NoteID, dateEntered, title, note, Fk_loaNote, Fk_resignationLetter, Fk_authorizationNote)
(select 
	NoteID,
	dateEntered,
	ISNULL(title, ''),
	ISNULL(note, ''),
	Fk_loaNote,
	Fk_resignationLetter,
	Fk_authorizationNote
	
	from prod.istprod.ministry_Note);

delete from dev.istdev.ministry_RegionalStat;
insert into dev.istdev.ministry_RegionalStat
(RegionalStatID, periodBegin, periodEnd, nsSc, nsWsn, nsCat, nsIcrD, nsIcrI, nsIcrE, niSc, niWsn, niCat, niIcrD, niIcrI, niIcrE, fk_regionalTeamID)
(select 
	RegionalStatID,
	periodBegin,
	periodEnd,
	nsSc,
	nsWsn,
	nsCat,
	nsIcrD,
	nsIcrI,
	nsIcrE,
	niSc,
	niWsn,
	niCat,
	niIcrD,
	niIcrI,
	niIcrE,
	fk_regionalTeamID
	
	from prod.istprod.ministry_RegionalStat);

delete from dev.istdev.ministry_Staff;
insert into dev.istdev.ministry_Staff
(accountNo, firstName, middleInitial, lastName, isMale, position, countryStatus, jobStatus, ministry, strategy, isNewStaff, primaryEmpLocState, primaryEmpLocCountry, primaryEmpLocCity, spouseFirstName, spouseMiddleName, spouseLastName, spouseAccountNo, spouseEmail, fianceeFirstName, fianceeMiddleName, fianceeLastName, finaceeAccountno, isFianceeStaff, fianceeJoinStaffDate, isFianceeJoiningNS, joiningNS, homePhone, workPhone, mobilePhone, pager, email, isEmailSecure, url, newStaffTrainingdate, fax, note, region, countryCode, ssn, maritalStatus, deptId, jobCode, accountCode, compFreq, compRate, compChngAmt, jobTitle, deptName, coupleTitle, otherPhone, preferredName, namePrefix, origHiredate, birthDate, marriageDate, hireDate, rehireDate, loaStartDate, loaEndDate, loaReason, severancePayMonthsReq, serviceDate, lastIncDate, jobEntryDate, deptEntryDate, reportingDate, employmentType, resignationReason, resignationDate, contributionsToOtherAcct, contributionsToAcntName, contributionsToAcntNo, fk_primaryAddress, fk_secondaryAddress, fk_teamID)
(select 
	accountNo,
	ISNULL(firstName, ''),
	ISNULL(middleInitial, ''),
	ISNULL(lastName, ''),
	ISNULL(isMale, ''),
	ISNULL(position, ''),
	ISNULL(countryStatus, ''),
	ISNULL(jobStatus, ''),
	ISNULL(ministry, ''),
	ISNULL(strategy, ''),
	ISNULL(isNewStaff, ''),
	ISNULL(primaryEmpLocState, ''),
	ISNULL(primaryEmpLocCountry, ''),
	ISNULL(primaryEmpLocCity, ''),
	ISNULL(spouseFirstName, ''),
	ISNULL(spouseMiddleName, ''),
	ISNULL(spouseLastName, ''),
	ISNULL(spouseAccountNo, ''),
	ISNULL(spouseEmail, ''),
	ISNULL(fianceeFirstName, ''),
	ISNULL(fianceeMiddleName, ''),
	ISNULL(fianceeLastName, ''),
	ISNULL(finaceeAccountno, ''),
	ISNULL(isFianceeStaff, ''),
	ISNULL(fianceeJoinStaffDate, ''),
	ISNULL(isFianceeJoiningNS, ''),
	ISNULL(joiningNS, ''),
	ISNULL(homePhone, ''),
	ISNULL(workPhone, ''),
	ISNULL(mobilePhone, ''),
	ISNULL(pager, ''),
	ISNULL(email, ''),
	ISNULL(isEmailSecure, ''),
	ISNULL(url, ''),
	newStaffTrainingdate,
	ISNULL(fax, ''),
	ISNULL(note, ''),
	ISNULL(region, ''),
	ISNULL(countryCode, ''),
	ISNULL(ssn, ''),
	ISNULL(maritalStatus, ''),
	ISNULL(deptId, ''),
	ISNULL(jobCode, ''),
	ISNULL(accountCode, ''),
	ISNULL(compFreq, ''),
	ISNULL(compRate, ''),
	ISNULL(compChngAmt, ''),
	ISNULL(jobTitle, ''),
	ISNULL(deptName, ''),
	ISNULL(coupleTitle, ''),
	ISNULL(otherPhone, ''),
	ISNULL(preferredName, ''),
	ISNULL(namePrefix, ''),
	origHiredate,
	birthDate,
	marriageDate,
	hireDate,
	rehireDate,
	loaStartDate,
	loaEndDate,
	loaReason,
	ISNULL(severancePayMonthsReq, ''),
	serviceDate,
	lastIncDate,
	jobEntryDate,
	deptEntryDate,
	reportingDate,
	ISNULL(employmentType, ''),
	ISNULL(resignationReason, ''),
	resignationDate,
	ISNULL(contributionsToOtherAcct, ''),
	ISNULL(contributionsToAcntName, ''),
	ISNULL(contributionsToAcntNo, ''),
	null,
	null,
	fk_teamID

	from prod.istprod.ministry_Staff);

update dev.istdev.ministry_Staff 
	set fk_primaryAddress = old_add.AddressID
	from prod.istprod.Address old_add
	where accountNo = old_add.fk_primaryAddress;

update dev.istdev.ministry_Staff 
	set fk_secondaryAddress = old_add.AddressID
	from prod.istprod.Address old_add
	where accountNo = old_add.fk_secondaryAddress;


delete from dev.istdev.ministry_Statistic;
insert into dev.istdev.ministry_Statistic
(StatisticID, periodBegin, periodEnd, exposures, decisions, attendedLastConf, invldNewBlvrs, invldStudents, invldFreshmen, invldSophomores, invldJuniors, invldSeniors, invldGrads, volunteers, staff, nonStaffStint, staffStint, fk_Activity)
(select 
	StatisticID,
	periodBegin,
	periodEnd,
	exposures,
	decisions,
	attendedLastConf,
	invldNewBlvrs,
	invldStudents,
	invldFreshmen,
	invldSophomores,
	invldJuniors,
	invldSeniors,
	invldGrads,
	volunteers,
	staff,
	nonStaffStint,
	staffStint,
	fk_Activity

	from prod.istprod.ministry_Statistic);

delete from dev.istdev.ministry_TargetArea;
insert into dev.istdev.ministry_TargetArea
(TargetAreaID, name, address1, address2, city, state, zip, country, phone, fax, email, url, abbrv, fice, population, note, altName, isSecure, region, mpta, urlToLogo, enrollment, monthSchoolStarts, monthSchoolStops, isSemester, isApproved, aoaPriority, aoa, ciaUrl, infoUrl)
(select 
	TargetAreaID,
	ISNULL(name, ''),
	ISNULL(address1, ''),
	ISNULL(address2, ''),
	ISNULL(city, ''),
	ISNULL(state, ''),
	ISNULL(zip, ''),
	ISNULL(country, ''),
	ISNULL(phone, ''),
	ISNULL(fax, ''),
	ISNULL(email, ''),
	ISNULL(url, ''),
	ISNULL(abbrv, ''),
	ISNULL(fice, ''),
	ISNULL(population, ''),
	ISNULL(note, ''),
	ISNULL(altName, ''),
	ISNULL(isSecure, ''),
	ISNULL(region, ''),
	ISNULL(mpta, ''),
	ISNULL(urlToLogo, ''),
	ISNULL(enrollment, ''),
	ISNULL(monthSchoolStarts, ''),
	ISNULL(monthSchoolStops, ''),
	ISNULL(isSemester, ''),
	'T',
	ISNULL(aoaPriority, ''),
	ISNULL(aoa, ''),
	ISNULL(ciaUrl, ''),
	infoUrl
	
	from prod.istprod.ministry_TargetArea);

delete from dev.istdev.ministry_LocalLevel;
insert into dev.istdev.ministry_LocalLevel
(TeamID, name, note, region, address1, address2, city, state, zip, country, phone, fax, email, url, isActive, startdate, stopdate, Fk_OrgRel, lane, no, abbrv)
(select 
	TeamID,  
	ISNULL(name, ''), 
	ISNULL(note, ''), 
	ISNULL(region, ''), 
	ISNULL(address1, ''), 
	ISNULL(address2, ''), 
	ISNULL(city, ''), 
	ISNULL(state, ''), 
	ISNULL(zip, ''), 
	ISNULL(country, ''), 
	ISNULL(phone, ''), 
	ISNULL(fax, ''), 
	ISNULL(email, ''), 
	ISNULL(url, ''), 
	ISNULL(isActive, ''), 
	startdate, 
	stopdate, 
	Fk_OrgRel, 
	ISNULL(lane, ''), 
	ISNULL(no, ''), 
	abbrv

	from prod.istprod.ministry_LocalLevel);



delete from dev.istdev.ministry_RegionalTeam;
insert into dev.istdev.ministry_RegionalTeam
(TeamID, name, note, region, address1, address2, city, state, zip, country, phone, fax, email, url, no, abbrv)
(select
	TeamID,

	ISNULL(name, ''), 
	ISNULL(note, ''), 
	ISNULL(region, ''), 
	ISNULL(address1, ''), 
	ISNULL(address2, ''), 
	ISNULL(city, ''), 
	ISNULL(state, ''), 
	ISNULL(zip, ''), 
	ISNULL(country, ''), 
	ISNULL(phone, ''), 
	ISNULL(fax, ''), 
	ISNULL(email, ''), 
	ISNULL(url, ''), 
	ISNULL(no, ''),
	abbrv
	from prod.istprod.ministry_RegionalTeam)



delete from dev.istdev.ministry_WsnPartnership;
insert into dev.istdev.ministry_WsnPartnership
(WsnPartnershipID, status, periodBegin, periodEnd, strategy, name, isApproved, wsnStatus, accountingUnit, annualBudget, notes, transUsername)
(select 
	WsnPartnershipID, 
	ISNULL(status, ''), 
	periodBegin, 
	periodEnd, 
	ISNULL(strategy, ''), 
	ISNULL(name, ''), 
	ISNULL(isApproved, ''), 
	ISNULL(wsnStatus, ''), 
	ISNULL(accountingUnit, ''), 
	ISNULL(annualBudget, ''), 
	ISNULL(notes, ''), 
	transUsername
	
	from prod.istprod.ministry_WsnPartnership);


delete from dev.istdev.staffsite_staffsiteprofile;
insert into dev.istdev.staffsite_staffsiteprofile
(	StaffSiteProfileID,
    firstName,
    lastName, 
    userName, 
    changePassword,
    accountNo, 
    isStaff,
    email, 
    passwordQuestion, 
    passwordAnswer )
(select 
	StaffSiteProfileID,
    firstName,
    lastName, 
    userName, 
    changePassword,
    accountNo, 
    isStaff,
    email, 
    passwordQuestion, 
    passwordAnswer 	
	from prod.istprod.staffsite_staffsiteprofile);
    
	
delete from dev.istdev.staffsite_staffsitepref;
insert into dev.istdev.staffsite_staffsitepref
(	
	StaffSitePrefID,
    name,
    displayName,
    value,
    fk_StaffSiteProfile)
(select
	StaffSitePrefID,
    name,
    displayName,
    value,
    fk_StaffSiteProfile
	from prod.istprod.staffsite_staffsitepref);

	

delete from dev.istdev.cms_assoc_fileCategory;
insert into dev.istdev.cms_assoc_fileCategory
( CmsCategoryID, CmsFileID )
(select 
    CmsCategoryID,
    CmsFileID 
	from prod.istprod.cms_assoc_fileCategory);

delete from dev.istdev.cms_CmsCategory;
insert into dev.istdev.cms_CmsCategory
(	CmsCategoryID, 
	parentCategory,
	catName, 
    catDesc ,
    path,
    pathid
)
(select
	CmsCategoryID, 
	parentCategory,
	catName, 
    catDesc ,
    path,
    pathid 
	from prod.istprod.cms_CmsCategory);

delete from dev.istdev.cms_CmsFile;
insert into dev.istdev.cms_CmsFile
(	CmsFileID,
    mime, 
    title, 
	accessCount, 
    dateAdded,
	dateModified, 
    moderatedYet ,
    summary ,
    quality ,
    expDate ,
    lastAccessed, 
    modMsg ,
    keywords, 
    url ,
    detail, 
	language, 
    version,
    author,
    submitter, 
    contact ,
    rating
 )   
 (select 
	CmsFileID,
    mime, 
    title, 
	accessCount, 
    dateAdded,
	dateModified, 
    moderatedYet ,
    summary ,
    quality ,
    expDate ,
    lastAccessed, 
    modMsg ,
    keywords, 
    url ,
    detail, 
	language, 
    version,
    author,
    submitter, 
    contact ,
    rating
	from prod.istprod.cms_CmsFile);


delete from dev.istdev.hr_review360_ReviewSession;
insert into dev.istdev.hr_review360_ReviewSession
(
	ReviewSessionID,
	name,
	purpose,
	dateDue,
	dateStarted,
	revieweeID,
	administratorID,
	requestedByID
)
(select 
	ReviewSessionID,
	name,
	purpose,
	dateDue,
	dateStarted,
	revieweeID,
	administratorID,
	requestedByID
	from prod.istprod.hr_review360_ReviewSession);

delete from dev.istdev.hr_review360_Review360;
insert into dev.istdev.hr_review360_Review360
(
	Review360ID, 
	reviewedByID, 
	dateStarted, 
	dateCompleted, 
	dateDue, 
	currentPosition, 
	leadershipLevel, 
	relationship, 
	q1, 
	q2, 
	q3, 
	q4, 
	q5, 
	q6, 
	q7, 
	q8, 
	q9, 
	q10, 
	q11, 
	q12, 
	q13, 
	q14, 
	q15, 
	q16, 
	q17, 
	q18, 
	q19, 
	q20, 
	q21, 
	q22, 
	q23, 
	q24, 
	q25, 
	q26, 
	q27, 
	q28f1, 
	q28f2, 
	q28l1, 
	q28l2, 
	q28o1, 
	q28o2, 
	q28a1, 
	q28a2, 
	q28t1, 
	q28t2, 
	q28s1, 
	q28s2, 
	q29, 
	q30, 
	q31, 
	q32, 
	q33, 
	q34, 
	fk_ReviewSessionID
)
(select
	Review360ID, 
	reviewedByID, 
	dateStarted, 
	dateCompleted, 
	dateDue, 
	currentPosition, 
	leadershipLevel, 
	relationship, 
	q1, 
	q2, 
	q3, 
	q4, 
	q5, 
	q6, 
	q7, 
	q8, 
	q9, 
	q10, 
	q11, 
	q12, 
	q13, 
	q14, 
	q15, 
	q16, 
	q17, 
	q18, 
	q19, 
	q20, 
	q21, 
	q22, 
	q23, 
	q24, 
	q25, 
	q26, 
	q27, 
	q28f1, 
	q28f2, 
	q28l1, 
	q28l2, 
	q28o1, 
	q28o2, 
	q28a1, 
	q28a2, 
	q28t1, 
	q28t2, 
	q28s1, 
	q28s2, 
	q29, 
	q30, 
	q31, 
	q32, 
	q33, 
	q34, 
	fk_ReviewSessionID
	
	from prod.istprod.hr_review360_Review360);


delete from dev.istdev.hr_review360_ReviewSessionLight;
insert into dev.istdev.hr_review360_ReviewSessionLight
(
	ReviewSessionLightID, 
	name, 
	purpose, 
	dateDue, 
	dateStarted, 
	revieweeID, 
	administratorID, 
	requestedByID
) 
( select 
	ReviewSessionLightID, 
	name, 
	purpose, 
	dateDue, 
	dateStarted, 
	revieweeID, 
	administratorID, 
	requestedByID

	from prod.istprod.hr_review360_ReviewSessionLight);

delete from dev.istdev.hr_review360_Review360Light;
insert into dev.istdev.hr_review360_Review360Light
(
	Review360LightID, 
	reviewedByID, 
	dateStarted, 
	dateCompleted, 
	dateDue, 
	currentPosition, 
	leadershipLevel, 
	relationship, 
	q1, 
	q2, 
	q3, 
	q4, 
	q5, 
	q6, 
	q7, 
	q8, 
	q9,
	fk_ReviewSessionLightID
)

(select
	Review360LightID, 
	reviewedByID, 
	dateStarted, 
	dateCompleted, 
	dateDue, 
	currentPosition, 
	leadershipLevel, 
	relationship, 
	q1, 
	q2, 
	q3, 
	q4, 
	q5, 
	q6, 
	q7, 
	q8, 
	q9,
	fk_ReviewSessionLightID

	from prod.istprod.hr_review360_Review360Light);

delete from dev.istdev.wsn_sp_WsnProject;
insert into dev.istdev.wsn_sp_WsnProject
(
	WsnProjectID,
	name,
	partnershipRegion,
	history,
	startDate,
	stopDate,
	city,
	country,
	details,
	status,
	destinationGatewayCity,
	departDateFromGateCity,
	arrivalDateAtLocation,
	locationGatewayCity,
	departureDateFromLocation,
	arrivalDateAtGatewayCity,
	flightBudget,
	GatewayCitytoLocationFlightNo,
	locationToGatewayCityFlightNo,
	inCountryContact,
	scholarshipAccountNo,
	operatingAccountNo,
	AOA,
	MPTA,
	staffCost,
	studentCost,
	insuranceFormsReceived,
	CAPSFeePaid,
	adminFeePaid,
	storiesXX,
	stats,
	secure,
	dateCreated,
	lastUpdate,
	maxNoStaff,
	maxNoStudents,
	projEvalCompleted,
	evangelisticExposures,
	receivedChrist,
	jesusFilmExposures,
	jesusFilmReveivedChrist,
	coverageActivitiesExposures,
	coverageActivitiesDecisions,
	holySpiritDecisions,
	website,
	destinationAddress,
	destinationPhone,
	wsnYear,
	fk_IsCoord,
	fk_IsAPD,
	fk_IsPD
)
(select
	WsnProjectID,
	name,
	partnershipRegion,
	history,
	startDate,
	stopDate,
	city,
	country,
	details,
	status,
	destinationGatewayCity,
	departDateFromGateCity,
	arrivalDateAtLocation,
	locationGatewayCity,
	departureDateFromLocation,
	arrivalDateAtGatewayCity,
	flightBudget,
	GatewayCitytoLocationFlightNo,
	locationToGatewayCityFlightNo,
	inCountryContact,
	scholarshipAccountNo,
	operatingAccountNo,
	AOA,
	MPTA,
	staffCost,
	studentCost,
	insuranceFormsReceived,
	CAPSFeePaid,
	adminFeePaid,
	storiesXX,
	stats,
	secure,
	dateCreated,
	lastUpdate,
	maxNoStaff,
	maxNoStudents,
	projEvalCompleted,
	evangelisticExposures,
	receivedChrist,
	jesusFilmExposures,
	jesusFilmReveivedChrist,
	coverageActivitiesExposures,
	coverageActivitiesDecisions,
	holySpiritDecisions,
	website,
	destinationAddress,
	destinationPhone,
	wsnYear,
	fk_IsCoord,
	null,
	null
	from prod.istprod.wsn_sp_WsnProject);

update dev.istdev.wsn_sp_WsnProject 
	set fk_IsAPD = person.WsnApplicationID
	from prod.istprod.WsnApplication person
	where person.fk_IsAPD = WsnProjectID

update dev.istdev.wsn_sp_WsnProject 
	set fk_IsPD = person.WsnApplicationID
	from prod.istprod.WsnApplication person
	where person.fk_IsPD = WsnProjectID

delete from dev.istdev.wsn_sp_WsnApplication;
insert into dev.istdev.wsn_sp_WsnApplication
(
	WsnApplicationID,
	surferID,
	role,
	region,
	legalLastName,
	legalFirstName,
	ssn,
	currentAddress,
	currentAddress2,
	currentCity,
	currentState,
	currentZip,
	currentPhone,
	currentEmail,
	dateAddressGoodUntil,
	birthdate,
	dateBecameChristian,
	maritalStatus,
	universityFullName,
	major,
	yearInSchool,
	graduationDate,
	earliestAvailableDate,
	dateMustReturn,
	willingForDifferentProject,
	usCitizen,
	citizenship,
	isApplicationComplete,
	applicationCompleteNote,
	projectPref1,
	projectPref2,
	projectPref3,
	projectPref4,
	projectPref5,
	accountNo,
	supportGoal,
	supportReceived,
	supportBalance,
	insuranceReceived,
	waiverReceived,
	didGo,
	participantEvaluation,
	destinationGatewayCity,
	gatewayCityToLocationFlightNo,
	departGatewayCityToLocation,
	arrivalGatewayCityToLocation,
	locationToGatewayCityFlightNo,
	departLocationToGatewayCity,
	arrrivalLocationToGatewayCity,
	domesticOrigin,
	domesticOriginToGCFlightNo,
	departDomesticToGatewayCity,
	arrivalDomesticToGatewayCity,
	arrivalAtDomesticOrigin,
	travelPlans,
	travelDeviation,
	passportNo,
	passportCountry,
	passportIssueDate,
	passportExpirationDate,
	visaCountry,
	visaNo,
	visaType,
	visaIsMultipleEntry,
	visaIssueDate,
	visaExpirationDate,
	emergName,
	emergAddress,
	emergCity,
	emergState,
	emergZip,
	emergPhone,
	emergWorkPhone,
	emergEmail,
	gender,
	dateUpdated,
	isStaff,
	prevIsp,
	child,
	status,
	wsnYear,
	fk_isMember,
	fk_wsnSpouse,
	fk_childOf

) 
( select
	WsnApplicationID,
	surferID,
	role,
	region,
	legalLastName,
	legalFirstName,
	ssn,
	currentAddress,
	currentAddress2,
	currentCity,
	currentState,
	currentZip,
	currentPhone,
	currentEmail,
	dateAddressGoodUntil,
	birthdate,
	dateBecameChristian,
	maritalStatus,
	universityFullName,
	major,
	yearInSchool,
	graduationDate,
	earliestAvailableDate,
	dateMustReturn,
	willingForDifferentProject,
	usCitizen,
	citizenship,
	isApplicationComplete,
	applicationCompleteNote,
	projectPref1,
	projectPref2,
	projectPref3,
	projectPref4,
	projectPref5,
	accountNo,
	supportGoal,
	supportReceived,
	supportBalance,
	insuranceReceived,
	waiverReceived,
	didGo,
	participantEvaluation,
	destinationGatewayCity,
	gatewayCityToLocationFlightNo,
	departGatewayCityToLocation,
	arrivalGatewayCityToLocation,
	locationToGatewayCityFlightNo,
	departLocationToGatewayCity,
	arrrivalLocationToGatewayCity,
	domesticOrigin,
	domesticOriginToGCFlightNo,
	departDomesticToGatewayCity,
	arrivalDomesticToGatewayCity,
	arrivalAtDomesticOrigin,
	travelPlans,
	travelDeviation,
	passportNo,
	passportCountry,
	passportIssueDate,
	passportExpirationDate,
	visaCountry,
	visaNo,
	visaType,
	visaIsMultipleEntry,
	visaIssueDate,
	visaExpirationDate,
	emergName,
	emergAddress,
	emergCity,
	emergState,
	emergZip,
	emergPhone,
	emergWorkPhone,
	emergEmail,
	gender,
	dateUpdated,
	isStaff,
	prevIsp,
	child,
	status,
	wsnYear,
	fk_isMember,
	fk_wsnSpouse,
	fk_childOf

	from prod.istprod.wsn_sp_WsnApplication);

delete from dev.istdev.ministry_Assoc_activityContact where (accountNo not in (select accountNo from ministry_Staff)) OR (activityID not in (select activityID from ministry_Activity));
delete from dev.istdev.ministry_Assoc_otherMinistries where (NonCccMinID not in (select NonCccMinID from ministry_NonCccMin)) OR (targetAreaID not in (select targetAreaID from ministry_targetArea));
delete from dev.istdev.ministry_Assoc_dependents where (accountNo not in (select accountNo from ministry_Staff));
delete from dev.istdev.cms_assoc_FileCategory where (CmsFileID not in (select CmsFileID from cms_CmsFile)) OR (CmsCategoryID not in (select CmsCategoryID from cms_CmsCategory));