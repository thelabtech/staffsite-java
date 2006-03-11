DROP TABLE IF EXISTS ministry_Bookmark;

CREATE TABLE ministry_Bookmark(
bookmarkID varchar(64) not null,
ownerID varchar(64) not null,
dateCreated date null,
type varchar(64) null,
referencesID varchar(64) null
);

ALTER TABLE ministry_Bookmark ADD CONSTRAINT PK_ministry_Bookmark PRIMARY KEY (bookmarkID);
CREATE INDEX IDX_ministry_Bookmark_ownerID ON ministry_Bookmark (ownerID);




drop table IF EXISTS ministry_assocTeamStaff;
CREATE TABLE ministry_assocTeamStaff
(
    fk_accountNo varchar(64) NOT NULL,
    fk_teamID varchar(64) NOT NULL
);
ALTER TABLE ministry_assocTeamStaff ADD INDEX index1 (fk_accountNo, fk_teamID);

drop table IF EXISTS ministry_assocActivityStaff;
CREATE TABLE ministry_assocActivityStaff
(
    fk_accountNo varchar(64) NOT NULL,
    fk_activityID varchar(64) NOT NULL
);
ALTER TABLE ministry_assocActivityStaff ADD INDEX index1 (fk_accountNo, fk_activityID);

drop table IF EXISTS ministry_Activity;
CREATE TABLE ministry_Activity
(
    ActivityID varchar(64) NOT NULL,
    status varchar(2) NULL,
    periodBegin DATE NULL,
    periodEnd DATE NULL,
    strategy varchar(2) NULL,
    transUsername varchar(50) NULL,
    fk_targetAreaID varchar(64) NULL,
    fk_teamID varchar(64) NULL,
    PRIMARY KEY (ActivityID)
);
ALTER TABLE ministry_activity ADD INDEX index1 (fk_targetAreaID);
ALTER TABLE ministry_activity ADD INDEX index2 (fk_teamID);
ALTER TABLE ministry_activity ADD INDEX index3 (periodBegin);
ALTER TABLE ministry_activity ADD INDEX index4 (periodEnd);
ALTER TABLE ministry_activity ADD INDEX index5 (strategy);

drop table IF EXISTS ministry_Address;
CREATE TABLE ministry_Address
(
    AddressID varchar(64) NOT NULL,
    startDate DATE NULL,
    endDate DATE NULL,
    address1 varchar(35) NULL,
    address2 varchar(35) NULL,
    address3 varchar(35) NULL,
    address4 varchar(35) NULL,
    city varchar(35) NULL,
    state varchar(6) NULL,
    zip varchar(10) NULL,
    country varchar(64) NULL,
    Fk_primaryAddress varchar(11) NULL,
    Fk_secondaryAddress varchar(11) NULL,
    Fk_currentAddress varchar(11) NULL,
    PRIMARY KEY (AddressID)
);
ALTER TABLE ministry_Address ADD INDEX index1 (Fk_primaryAddress);
ALTER TABLE ministry_Address ADD INDEX index2 (Fk_secondaryAddress);
ALTER TABLE ministry_Address ADD INDEX index3 (Fk_currentAddress);

drop table IF EXISTS ministry_Assoc_activityContact;
CREATE TABLE ministry_Assoc_activityContact
(
    ActivityID varchar(64) NOT NULL,
    accountNo varchar(11) NOT NULL,
    PRIMARY KEY (ActivityID, accountNo)
);

drop table IF EXISTS ministry_Assoc_dependents;
CREATE TABLE ministry_Assoc_dependents
(
    DependentID varchar(64) NOT NULL,
    accountNo varchar(11) NOT NULL,
    PRIMARY KEY (DependentID, accountNo)
);

drop table IF EXISTS ministry_Assoc_intlContact;
CREATE TABLE ministry_Assoc_intlContact
(
    accountNo varchar(11) NOT NULL,
    WsnPartnershipID varchar(64) NOT NULL,
    PRIMARY KEY (accountNo, WsnPartnershipID)
);

drop table IF EXISTS ministry_Assoc_otherMinistries;
CREATE TABLE ministry_Assoc_otherMinistries
(
    NonCccMinID varchar(64) NOT NULL,
    TargetAreaID varchar(64) NOT NULL,
    PRIMARY KEY (NonCccMinID, TargetAreaID)
);

drop table IF EXISTS ministry_Assoc_partCoord;
CREATE TABLE ministry_Assoc_partCoord
(
    accountNo varchar(11) NOT NULL,
    WsnPartnershipID varchar(64) NOT NULL,
    PRIMARY KEY (accountNo, WsnPartnershipID)
);

drop table IF EXISTS ministry_Authorization;
CREATE TABLE ministry_Authorization
(
    AuthorizationID varchar(64) NOT NULL,
    authDate DATE NULL,
    role varchar(30) NULL,
    authorized varchar(1) NULL,
    sequence INTEGER NULL,
    Fk_AuthorizedBy varchar(11) NULL,
    Fk_hasAuthorizations varchar(64) NULL,
    PRIMARY KEY (AuthorizationID)
);

drop table IF EXISTS ministry_ChangeRequest;
CREATE TABLE ministry_ChangeRequest
(
    ChangeRequestID varchar(64) NOT NULL,
    requestDate DATE NULL,
    effectiveDate DATE NULL,
    appliedDate DATE NULL,
    type varchar(30) NULL,
    Fk_RequestedBy varchar(11) NULL,
    CLASSID INTEGER NOT NULL,
    Fk_hasChangeRequest varchar(11) NULL,
    PRIMARY KEY (ChangeRequestID)
);

drop table IF EXISTS ministry_Dependent;
CREATE TABLE ministry_Dependent
(
    DependentID varchar(64) NOT NULL,
    firstName varchar(80) NULL,
    middleName varchar(80) NULL,
    lastName varchar(80) NULL,
    birthDate DATE NULL,
    gender varchar(1) NULL,
    PRIMARY KEY (DependentID)
);

drop table IF EXISTS ministry_FieldChange;
CREATE TABLE ministry_FieldChange
(
    FieldChangeID varchar(64) NOT NULL,
    field varchar(30) NULL,
    oldValue varchar(255) NULL,
    newValue varchar(255) NULL,
    Fk_hasFieldChanges varchar(64) NULL,
    PRIMARY KEY (FieldChangeID)
);

drop table IF EXISTS ministry_NonCccMin;
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

drop table IF EXISTS ministry_Note;
CREATE TABLE ministry_Note
(
    NoteID varchar(64) NOT NULL,
    dateEntered DATE NULL,
    title varchar(80) NULL,
    note varchar(255) NULL,
    Fk_loaNote varchar(11) NULL,
    Fk_resignationLetter varchar(11) NULL,
    Fk_authorizationNote varchar(64) NULL,
    PRIMARY KEY (NoteID)
);

drop table IF EXISTS ministry_RegionalStat;
CREATE TABLE ministry_RegionalStat
(
    RegionalStatID varchar(64) NOT NULL,
    periodBegin DATE NULL,
    periodEnd DATE NULL,
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

drop table IF EXISTS ministry_Staff;
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
    fianceeJoinStaffDate DATE NULL,
    isFianceeJoiningNS CHAR(1) NULL,
    joiningNS CHAR(1) NULL,
    homePhone varchar(24) NULL,
    workPhone varchar(24) NULL,
    mobilePhone varchar(24) NULL,
    pager varchar(24) NULL,
    email varchar(50) NULL,
    isEmailSecure CHAR(1) NULL,
    url varchar(255) NULL,
    newStaffTrainingDate DATE NULL,
    fax varchar(24) NULL,
    note varchar(255) NULL,
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
    jobTitle varchar(30) NULL,
    deptName varchar(30) NULL,
    coupleTitle varchar(10) NULL,
    otherPhone varchar(24) NULL,
    preferredName varchar(50) NULL,
    namePrefix varchar(4) NULL,
    origHireDate DATE NULL,
    birthDate DATE NULL,
    marriageDate DATE NULL,
    hireDate DATE NULL,
    rehireDate DATE NULL,
    loaStartDate DATE NULL,
    loaEndDate DATE NULL,
    loaReason varchar(80) NULL,
    severancePayMonthsReq INTEGER NULL,
    serviceDate DATE NULL,
    lastIncDate DATE NULL,
    jobEntryDate DATE NULL,
    deptEntryDate DATE NULL,
    reportingDate DATE NULL,
    employmentType varchar(20) NULL,
    resignationReason varchar(80) NULL,
    resignationDate DATE NULL,
    contributionsToOtherAcct CHAR(1) NULL,
    contributionsToAcntName varchar(80) NULL,
    contributionsToAcntNo varchar(11) NULL,
    fk_primaryAddress varchar(64),
    fk_secondaryAddress varchar(64),
    Fk_membership varchar(64) NULL,
    PRIMARY KEY (accountNo)
);
ALTER TABLE ministry_Staff ADD INDEX index1 (Fk_membership);

drop table IF EXISTS ministry_Statistic;
CREATE TABLE ministry_Statistic
(
    StatisticID varchar(64) NOT NULL,
    periodBegin DATE NULL,
    periodEnd DATE NULL,
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

drop table IF EXISTS ministry_TargetArea;
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

drop table IF EXISTS ministry_LocalLevel;
CREATE TABLE ministry_LocalLevel
(
    teamID varchar(64),
    lane varchar(10)
);

drop table IF EXISTS ministry_Team;
CREATE TABLE ministry_Team
(
    TeamID varchar(64) NOT NULL,
    name varchar(100) NULL,
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
    startDate DATE NULL,
    stopDate DATE NULL,
    Fk_OrgRel varchar(64) NULL,
    CLASSID INTEGER NOT NULL,
    lane varchar(2) NULL,
    no varchar(2) NULL,
    abbrv varchar(2) NULL,
    PRIMARY KEY (TeamID)
);

DROP TABLE IF EXISTS ministry_RegionalTeam;
CREATE TABLE ministry_RegionalTeam(
	teamID varchar(64) not null,
	no varchar(80) null,
	abbrv varchar(80) null,
    PRIMARY KEY (teamID)

);

drop table IF EXISTS ministry_WsnPartnership;
CREATE TABLE ministry_WsnPartnership
(
    WsnPartnershipID varchar(64) NOT NULL,
    status varchar(2) NULL,
    periodBegin DATE NULL,
    periodEnd DATE NULL,
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
