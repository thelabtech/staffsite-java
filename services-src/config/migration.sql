delete from prod.istprod.ministry_Activity;
insert into prod.istprod.ministry_Activity 
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
	
	from secant.istsecant.Activity);

delete from prod.istprod.ministry_Address;
insert into prod.istprod.ministry_Address
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
	country from secant.istsecant.Address);

delete from prod.istprod.ministry_assoc_activityContact;
insert into prod.istprod.ministry_assoc_activityContact
(ActivityID,accountNo)
(select 
	ActivityID,
	accountNo
	from secant.istsecant.Assoc_activityContact);


delete from prod.istprod.ministry_Assoc_dependents;
insert into prod.istprod.ministry_Assoc_dependents
(DependentID, accountNo)
(select 
	DependentID,
	accountNo
	from secant.istsecant.Assoc_Dependents);

delete from prod.istprod.ministry_Assoc_intlContact;
insert into prod.istprod.ministry_Assoc_intlContact
(accountNo, WsnPartnershipID)
(select 
	accountNo,
	WsnPartnershipID
	from secant.istsecant.assoc_intlContact);

delete from prod.istprod.ministry_Assoc_otherMinistries;
insert into prod.istprod.ministry_Assoc_otherMinistries
(NonCccMinID, TargetAreaID)
(select 
	NonCccMinID,
	TargetAreaID
	from secant.istsecant.assoc_otherMinistries);

delete from prod.istprod.ministry_assoc_partCoord;
insert into prod.istprod.ministry_assoc_partCoord
(accountNo, WsnPartnershipID)
(select 
	accountNo,
	WsnPartnershipID
	from secant.istsecant.assoc_partCoord);



delete from prod.istprod.ministry_Authorization;
insert into prod.istprod.ministry_Authorization
(AuthorizationID, authDate, role, authorized, sequence, Fk_AuthorizedBy, fk_AuthorizationNote, fk_changeRequestID)
(select 
	AuthorizationID, 
	authDate, 
	ISNULL(role, ''), 
	ISNULL(authorized, ''), 
	ISNULL(sequence, ''), 
	Fk_AuthorizedBy, 
	null,
	Fk_hasAuthorizations
	from secant.istsecant.Authorization2);

delete from prod.istprod.ministry_ChangeRequest;
insert into prod.istprod.ministry_ChangeRequest
(ChangeRequestID, requestdate, effectivedate, applieddate, type, fk_requestedBy)
(select 
	ChangeRequestID,
	requestDate,
	effectiveDate,
	appliedDate,
	ISNULL(type, ''),
	Fk_RequestedBy
 from secant.istsecant.ChangeRequest);

delete from prod.istprod.ministry_Dependent;
insert into prod.istprod.ministry_Dependent
(DependentID, firstName, middleName, lastName, birthdate, gender)
(select 
	DependentID, 
	ISNULL(firstName, ''), 
	ISNULL(middleName, ''), 
	ISNULL(lastName, ''), 
	birthdate, 
	gender
	from secant.istsecant.Dependent);

delete from prod.istprod.ministry_FieldChange;
insert into prod.istprod.ministry_FieldChange
(FieldChangeID, field, oldValue, newValue, Fk_hasFieldChanges)
(select 
	FieldChangeID,
	ISNULL(field, ''),
	ISNULL(oldValue, ''),
	ISNULL(newValue, ''),
	Fk_hasFieldChanges
	from secant.istsecant.FieldChange);

delete from prod.istprod.ministry_NonCCCMin;
insert into prod.istprod.ministry_NonCCCMin
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
	from secant.istsecant.NonCCCMin);

delete from prod.istprod.ministry_Note;
insert into prod.istprod.ministry_Note
(NoteID, dateEntered, title, note, Fk_loaNote, Fk_resignationLetter, Fk_authorizationNote)
(select 
	NoteID,
	dateEntered,
	ISNULL(title, ''),
	ISNULL(note, ''),
	Fk_loaNote,
	Fk_resignationLetter,
	Fk_authorizationNote
	
	from secant.istsecant.Note);

delete from prod.istprod.ministry_RegionalStat;
insert into prod.istprod.ministry_RegionalStat
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
	Fk_4719206
	
	from secant.istsecant.RegionalStat);

delete from prod.istprod.ministry_Staff;
insert into prod.istprod.ministry_Staff
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
	Fk_membership

	from secant.istsecant.Staff);

update prod.istprod.ministry_Staff 
	set fk_primaryAddress = old_add.AddressID
	from secant.istsecant.Address old_add
	where accountNo = old_add.fk_primaryAddress;

update prod.istprod.ministry_Staff 
	set fk_secondaryAddress = old_add.AddressID
	from secant.istsecant.Address old_add
	where accountNo = old_add.fk_secondaryAddress;


delete from prod.istprod.ministry_Statistic;
insert into prod.istprod.ministry_Statistic
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
	Fk_10617185

	from secant.istsecant.Statistic);

delete from prod.istprod.ministry_TargetArea;
insert into prod.istprod.ministry_TargetArea
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
	
	from secant.istsecant.TargetArea);

delete from prod.istprod.ministry_LocalLevel;
insert into prod.istprod.ministry_LocalLevel
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

	from secant.istsecant.Team where CLASSID=12124805);



delete from prod.istprod.ministry_RegionalTeam;
insert into prod.istprod.ministry_RegionalTeam
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
	from secant.istsecant.Team where CLASSID=15074170)



delete from prod.istprod.ministry_WsnPartnership;
insert into prod.istprod.ministry_WsnPartnership
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
	
	from secant.istsecant.WsnPartnership);


delete from prod.istprod.staffsite_staffsiteprofile;
insert into prod.istprod.staffsite_staffsiteprofile
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
	from secant.istsecant.StaffSiteProfile);
    
	
delete from prod.istprod.staffsite_staffsitepref;
insert into prod.istprod.staffsite_staffsitepref
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
    Fk_preferences
	from secant.istsecant.StaffSitePref);

	

delete from prod.istprod.cms_assoc_fileCategory;
insert into prod.istprod.cms_assoc_fileCategory
( CmsCategoryID, CmsFileID )
(select 
    CmsCategoryID,
    CmsFileID 
	from secant.istsecant.assoc_CmsCategoryFile);

delete from prod.istprod.cms_CmsCategory;
insert into prod.istprod.cms_CmsCategory
(	CmsCategoryID, 
	parentCategory,
	catName, 
    catDesc ,
    path,
    pathid
)
(select
	CmsCategoryID, 
	fk_12649038,
	catName, 
    catDesc ,
    path,
    pathid 
	from secant.istsecant.CmsCategory);

delete from prod.istprod.cms_CmsFile;
insert into prod.istprod.cms_CmsFile
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
	from secant.istsecant.CmsFile);


delete from prod.istprod.hr_review360_ReviewSession;
insert into prod.istprod.hr_review360_ReviewSession
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
	from secant.istsecant.ReviewSession);

delete from prod.istprod.hr_review360_Review360;
insert into prod.istprod.hr_review360_Review360
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
	fk_12583037
	
	from secant.istsecant.Review360);


delete from prod.istprod.hr_review360_ReviewSessionLight;
insert into prod.istprod.hr_review360_ReviewSessionLight
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

	from secant.istsecant.ReviewSessionLight);

delete from prod.istprod.hr_review360_Review360Light;
insert into prod.istprod.hr_review360_Review360Light
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
	fk_16319243

	from secant.istsecant.Review360Light);

delete from prod.istprod.wsn_sp_WsnProject;
insert into prod.istprod.wsn_sp_WsnProject
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
	from secant.istsecant.WsnProject);

update prod.istprod.wsn_sp_WsnProject 
	set fk_IsAPD = person.WsnApplicationID
	from secant.istsecant.WsnApplication person
	where person.fk_IsAPD = WsnProjectID

update prod.istprod.wsn_sp_WsnProject 
	set fk_IsPD = person.WsnApplicationID
	from secant.istsecant.WsnApplication person
	where person.fk_IsPD = WsnProjectID

delete from prod.istprod.wsn_sp_WsnApplication;
insert into prod.istprod.wsn_sp_WsnApplication
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

	from secant.istsecant.WsnApplication);

delete from prod.istprod.ministry_Assoc_activityContact where (accountNo not in (select accountNo from ministry_Staff)) OR (activityID not in (select activityID from ministry_Activity));
delete from prod.istprod.ministry_Assoc_otherMinistries where (NonCccMinID not in (select NonCccMinID from ministry_NonCccMin)) OR (targetAreaID not in (select targetAreaID from ministry_targetArea));
delete from prod.istprod.ministry_Assoc_dependents where (accountNo not in (select accountNo from ministry_Staff));
delete from prod.istprod.cms_assoc_FileCategory where (CmsFileID not in (select CmsFileID from cms_CmsFile)) OR (CmsCategoryID not in (select CmsCategoryID from cms_CmsCategory));