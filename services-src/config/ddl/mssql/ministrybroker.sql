
DROP TABLE ministry_assocTeamStaff;
CREATE TABLE ministry_assocTeamStaff
(
    fk_accountNo varchar(64) NOT NULL,
    fk_teamID varchar(64) NOT NULL,
	PRIMARY KEY(fk_accountNo,fk_teamID)
);



DROP TABLE ministry_Activity;
CREATE TABLE ministry_Activity
(
    ActivityID varchar(64) NOT NULL,
    status varchar(2) NULL,
    periodBegin datetime NULL,
    periodEnd datetime NULL,
    strategy varchar(2) NULL,
    transUsername varchar(50) NULL,
    fk_targetAreaID varchar(64) NULL,
    fk_teamID varchar(64) NULL,
    PRIMARY KEY (ActivityID)
);
CREATE INDEX index1 on ministry_Activity(fk_targetAreaID);
CREATE INDEX index2 on ministry_Activity(fk_teamID);
CREATE INDEX index3 on ministry_Activity(periodBegin);
CREATE INDEX index4 on ministry_Activity(periodEnd);
CREATE INDEX index5 on ministry_Activity(strategy);

DROP TABLE ministry_Address;
CREATE TABLE ministry_Address
(
    AddressID varchar(64) NOT NULL,
    startdate datetime NULL,
    enddate datetime NULL,
    address1 varchar(35) NULL,
    address2 varchar(35) NULL,
    address3 varchar(35) NULL,
    address4 varchar(35) NULL,
    city varchar(35) NULL,
    state varchar(6) NULL,
    zip varchar(10) NULL,
    country varchar(64) NULL,
    PRIMARY KEY (AddressID)
);

DROP TABLE ministry_Assoc_activityContact;
CREATE TABLE ministry_Assoc_activityContact
(
    ActivityID varchar(64) NOT NULL,
    accountNo varchar(11) NOT NULL,
    PRIMARY KEY (ActivityID, accountNo)
);

DROP TABLE ministry_Assoc_dependents;
CREATE TABLE ministry_Assoc_dependents
(
    DependentID varchar(64) NOT NULL,
    accountNo varchar(11) NOT NULL,
    PRIMARY KEY (DependentID, accountNo)
);

DROP TABLE ministry_Assoc_intlContact;
CREATE TABLE ministry_Assoc_intlContact
(
    accountNo varchar(11) NOT NULL,
    WsnPartnershipID varchar(64) NOT NULL,
    PRIMARY KEY (accountNo, WsnPartnershipID)
);

DROP TABLE ministry_Assoc_otherMinistries;
CREATE TABLE ministry_Assoc_otherMinistries
(
    NonCccMinID varchar(64) NOT NULL,
    TargetAreaID varchar(64) NOT NULL,
    PRIMARY KEY (NonCccMinID, TargetAreaID)
);

DROP TABLE ministry_Assoc_partCoord;
CREATE TABLE ministry_Assoc_partCoord
(
    accountNo varchar(11) NOT NULL,
    WsnPartnershipID varchar(64) NOT NULL,
    PRIMARY KEY (accountNo, WsnPartnershipID)
);

DROP TABLE ministry_Authorization;
CREATE TABLE ministry_Authorization
(
    AuthorizationID varchar(64) NOT NULL,
    authdate datetime NULL,
    role varchar(30) NULL,
    authorized varchar(1) NULL,
    sequence INTEGER NULL,
    fk_AuthorizedBy varchar(11) NULL,
	fk_AuthorizationNote varchar(64) NULL,
    fk_changeRequestID varchar(64) NULL,
    PRIMARY KEY (AuthorizationID)
);
CREATE INDEX index1 on ministry_Authorization(fk_AuthorizedBy);
CREATE INDEX index2 on ministry_Authorization(fk_changeRequestID);
CREATE INDEX index3 on ministry_Authorization(fk_AuthorizationNote);


DROP TABLE ministry_ChangeRequest;
CREATE TABLE ministry_ChangeRequest
(
    ChangeRequestID varchar(64) NOT NULL,
    requestdate datetime NULL,
    effectivedate datetime NULL,
    applieddate datetime NULL,
    type varchar(30) NULL,
    fk_requestedBy varchar(11) NULL,
    PRIMARY KEY (ChangeRequestID)
);
CREATE INDEX index1 on ministry_ChangeRequest(fk_requestedBy);


DROP TABLE ministry_StaffChangeRequest;
CREATE TABLE ministry_StaffChangeRequest
(
    ChangeRequestID varchar(64) NOT NULL,
	updateStaff varchar(64) NULL,
    PRIMARY KEY (ChangeRequestID)
);

DROP TABLE ministry_Dependent;
CREATE TABLE ministry_Dependent
(
    DependentID varchar(64) NOT NULL,
    firstName varchar(80) NULL,
    middleName varchar(80) NULL,
    lastName varchar(80) NULL,
    birthdate datetime NULL,
    gender varchar(1) NULL,
    PRIMARY KEY (DependentID)
);

DROP TABLE ministry_FieldChange;
CREATE TABLE ministry_FieldChange
(
    FieldChangeID varchar(64) NOT NULL,
    field varchar(30) NULL,
    oldValue varchar(255) NULL,
    newValue varchar(255) NULL,
    Fk_hasFieldChanges varchar(64) NULL,
    PRIMARY KEY (FieldChangeID)
);

DROP TABLE ministry_NonCccMin;
CREATE TABLE ministry_NonCccMin
(
    NonCccMinID varchar(64) NOT NULL,
    ministry varchar(50) NULL,
    firstName varchar(30) NULL,
    lastName varchar(30) NULL,
    address1 varchar(35) NULL,
    address2 varchar(35) NULL,
    city varchar(30) NULL,
    state varchar(6) NULL,
    zip varchar(10) NULL,
    country varchar(64) NULL,
    homePhone varchar(24) NULL,
    workPhone varchar(24) NULL,
    mobilePhone varchar(24) NULL,
    email varchar(24) NULL,
    url varchar(50) NULL,
    pager varchar(24) NULL,
    fax varchar(24) NULL,
    note varchar(255) NULL,
    PRIMARY KEY (NonCccMinID)
);

DROP TABLE ministry_Note;
CREATE TABLE ministry_Note
(
    NoteID varchar(64) NOT NULL,
    dateEntered datetime NULL,
    title varchar(80) NULL,
    note varchar(4000) NULL,
    Fk_loaNote varchar(64) NULL,
    Fk_resignationLetter varchar(64) NULL,
    Fk_authorizationNote varchar(64) NULL,
    PRIMARY KEY (NoteID)
);

DROP TABLE ministry_RegionalStat;
CREATE TABLE ministry_RegionalStat
(
    RegionalStatID varchar(64) NOT NULL,
    periodBegin datetime NULL,
    periodEnd datetime NULL,
    nsSc INTEGER NULL,
    nsWsn INTEGER NULL,
    nsCat INTEGER NULL,
    nsIcrD INTEGER NULL,
    nsIcrI INTEGER NULL,
    nsIcrE INTEGER NULL,
    niSc INTEGER NULL,
    niWsn INTEGER NULL,
    niCat INTEGER NULL,
    niIcrD INTEGER NULL,
    niIcrI INTEGER NULL,
    niIcrE INTEGER NULL,
    fk_regionalTeamID varchar(64) NULL,
    PRIMARY KEY (RegionalStatID)
);

DROP TABLE ministry_Staff;
CREATE TABLE ministry_Staff
(
    accountNo varchar(11) NOT NULL,
    firstName varchar(30) NULL,
    middleInitial varchar(1) NULL,
    lastName varchar(30) NULL,
    isMale CHAR(1) NULL,
    position varchar(30) NULL,
    countryStatus varchar(10) NULL,
    jobStatus varchar(30) NULL,
    ministry varchar(30) NULL,
    strategy varchar(10) NULL,
    isNewStaff CHAR(1) NULL,
    primaryEmpLocState varchar(6) NULL,
    primaryEmpLocCountry varchar(64) NULL,
    primaryEmpLocCity varchar(35) NULL,
    spouseFirstName varchar(15) NULL,
    spouseMiddleName varchar(15) NULL,
    spouseLastName varchar(30) NULL,
    spouseAccountNo varchar(11) NULL,
    spouseEmail varchar(50) NULL,
    fianceeFirstName varchar(15) NULL,
    fianceeMiddleName varchar(15) NULL,
    fianceeLastName varchar(30) NULL,
    finaceeAccountno varchar(11) NULL,
    isFianceeStaff CHAR(1) NULL,
    fianceeJoinStaffDate datetime NULL,
    isFianceeJoiningNS CHAR(1) NULL,
    joiningNS CHAR(1) NULL,
    homePhone varchar(24) NULL,
    workPhone varchar(24) NULL,
    mobilePhone varchar(24) NULL,
    pager varchar(24) NULL,
    email varchar(50) NULL,
    isEmailSecure CHAR(1) NULL,
    url varchar(255) NULL,
    newStaffTrainingdate datetime NULL,
    fax varchar(24) NULL,
    note varchar(2048) NULL,
    region varchar(2) NULL,
    countryCode varchar(3) NULL,
    ssn varchar(9) NULL,
    maritalStatus varchar(1) NULL,
    deptId varchar(10) NULL,
    jobCode varchar(6) NULL,
    accountCode varchar(25) NULL,
    compFreq varchar(1) NULL,
    compRate varchar(20) NULL,
    compChngAmt varchar(21) NULL,
    jobTitle varchar(80) NULL,
    deptName varchar(30) NULL,
    coupleTitle varchar(10) NULL,
    otherPhone varchar(24) NULL,
    preferredName varchar(50) NULL,
    namePrefix varchar(4) NULL,
    origHiredate datetime NULL,
    birthDate datetime NULL,
    marriageDate datetime NULL,
    hireDate datetime NULL,
    rehireDate datetime NULL,
    loaStartDate datetime NULL,
    loaEndDate datetime NULL,
    loaReason varchar(80) NULL,
    severancePayMonthsReq INTEGER NULL,
    serviceDate datetime NULL,
    lastIncDate datetime NULL,
    jobEntryDate datetime NULL,
    deptEntryDate datetime NULL,
    reportingDate datetime NULL,
    employmentType varchar(20) NULL,
    resignationReason varchar(80) NULL,
    resignationDate datetime NULL,
    contributionsToOtherAcct CHAR(1) NULL,
    contributionsToAcntName varchar(80) NULL,
    contributionsToAcntNo varchar(11) NULL,
    fk_primaryAddress varchar(64) NULL,
    fk_secondaryAddress varchar(64) NULL,
    fk_teamID varchar(64) NULL,
    PRIMARY KEY (accountNo)
);
CREATE INDEX index1 on ministry_Staff(fk_teamID);
CREATE INDEX index2 on ministry_Staff(fk_primaryAddress);
CREATE INDEX index3 on ministry_Staff(fk_secondaryAddress);
CREATE INDEX index4 on ministry_Staff(lastName);
CREATE INDEX index5 on ministry_Staff(region);


DROP TABLE ministry_Statistic;
CREATE TABLE ministry_Statistic
(
    StatisticID varchar(64) NOT NULL,
    periodBegin datetime NULL,
    periodEnd datetime NULL,
    exposures INTEGER NULL,
    decisions INTEGER NULL,
    attendedLastConf INTEGER NULL,
    invldNewBlvrs INTEGER NULL,
    invldStudents INTEGER NULL,
    invldFreshmen INTEGER NULL,
    invldSophomores INTEGER NULL,
    invldJuniors INTEGER NULL,
    invldSeniors INTEGER NULL,
    invldGrads INTEGER NULL,
    volunteers INTEGER NULL,
    staff INTEGER NULL,
    nonStaffStint INTEGER NULL,
    staffStint INTEGER NULL,
    fk_Activity varchar(64) NULL,
    PRIMARY KEY (StatisticID)
);
CREATE INDEX index1 on ministry_Statistic(fk_Activity);
CREATE INDEX index2 on ministry_Statistic(periodBegin);
CREATE INDEX index3 on ministry_Statistic(periodEnd);


DROP TABLE ministry_TargetArea;
CREATE TABLE ministry_TargetArea
(
    TargetAreaID varchar(64) NOT NULL,
    name varchar(100) NULL,
    address1 varchar(35) NULL,
    address2 varchar(35) NULL,
    city varchar(30) NULL,
    state varchar(32) NULL,
    zip varchar(10) NULL,
    country varchar(64) NULL,
    phone varchar(24) NULL,
    fax varchar(24) NULL,
    email varchar(50) NULL,
    url varchar(255) NULL,
    abbrv varchar(32) NULL,
    fice varchar(32) NULL,
    population varchar(10) NULL,
    note varchar(255) NULL,
    altName varchar(50) NULL,
    isSecure CHAR(1) NULL,
    region varchar(2) NULL,
    mpta varchar(30) NULL,
    urlToLogo varchar(255) NULL,
    enrollment varchar(10) NULL,
    monthSchoolStarts varchar(10) NULL,
    monthSchoolStops varchar(10) NULL,
    isSemester CHAR(1) NULL,
    isApproved CHAR(1) NULL,
    aoaPriority varchar(10) NULL,
    aoa varchar(100) NULL,
    ciaUrl varchar(255) NULL,
    infoUrl varchar(255) NULL,
    PRIMARY KEY (TargetAreaID)
);
create index index1 on ministry_TargetArea(name);
create index index2 on ministry_TargetArea(isApproved);
create index index3 on ministry_TargetArea(state);
create index index4 on ministry_TargetArea(country);
create index index5 on ministry_TargetArea(isSecure);
create index index6 on ministry_TargetArea(region);






DROP TABLE ministry_LocalLevel;
CREATE TABLE ministry_LocalLevel
(
    teamID varchar(64),
	name varchar(100) null,

    lane varchar(10),

    note varchar(255) NULL,
    region varchar(2) NULL,
    address1 varchar(35) NULL,
    address2 varchar(35) NULL,
    city varchar(30) NULL,
    state varchar(6) NULL,
    zip varchar(10) NULL,
    country varchar(64) NULL,
    phone varchar(24) NULL,
    fax varchar(24) NULL,
    email varchar(50) NULL,
    url varchar(255) NULL,
    isActive CHAR(1) NULL,
    startdate datetime NULL,
    stopdate datetime NULL,
    Fk_OrgRel varchar(64) NULL,
    no varchar(2) NULL,
    abbrv varchar(2) NULL,

	PRIMARY KEY(teamID)
);



DROP TABLE ministry_RegionalTeam;
CREATE TABLE ministry_RegionalTeam(
	teamID varchar(64) not null,
	name varchar(100) null,
    note varchar(255) NULL,
    region varchar(2) NULL,
    address1 varchar(35) NULL,
    address2 varchar(35) NULL,
    city varchar(30) NULL,
    state varchar(6) NULL,
    zip varchar(10) NULL,
    country varchar(64) NULL,
    phone varchar(24) NULL,
    fax varchar(24) NULL,
    email varchar(50) NULL,
    url varchar(255) NULL,
    isActive CHAR(1) NULL,
    startdate datetime NULL,
    stopdate datetime NULL,

	no varchar(80) null,
	abbrv varchar(80) null,
    PRIMARY KEY (teamID)

);

DROP TABLE ministry_WsnPartnership;
CREATE TABLE ministry_WsnPartnership
(
    WsnPartnershipID varchar(64) NOT NULL,
    status varchar(2) NULL,
    periodBegin datetime NULL,
    periodEnd datetime NULL,
    strategy varchar(2) NULL,
    name varchar(100) NULL,
    isApproved CHAR(1) NULL,
    wsnStatus varchar(10) NULL,
    accountingUnit varchar(10) NULL,
    annualBudget varchar(13) NULL,
    notes varchar(255) NULL,
    transUsername varchar(50) NULL,
    PRIMARY KEY (WsnPartnershipID)
);
