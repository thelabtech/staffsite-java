DROP TABLE wsn_sp_WsnProject;

CREATE TABLE wsn_sp_WsnProject(
	WsnProjectID varchar(64) not null,
	name varchar(25) null,
	partnershipRegion varchar(2) null,
	history varchar(250) null,
	startDate varchar(22) null,
	stopDate varchar(22) null,
	city varchar(50) null,
	country varchar(50) null,
	details text null,
	status varchar(30) null,
	destinationGatewayCity varchar(50) null,
	departDateFromGateCity varchar(22) null,
	arrivalDateAtLocation varchar(22) null,
	locationGatewayCity varchar(22) null,
	departureDateFromLocation varchar(22) null,
	arrivalDateAtGatewayCity varchar(22) null,
	flightBudget varchar(10) null,
	GatewayCitytoLocationFlightNo varchar(50) null,
	locationToGatewayCityFlightNo varchar(50) null,
	inCountryContact varchar(250) null,
	scholarshipAccountNo varchar(15) null,
	operatingAccountNo varchar(15) null,
	AOA varchar(50) null,
	MPTA varchar(50) null,
	staffCost varchar(10) null,
	studentCost varchar(50) null,
	insuranceFormsReceived char(1) null,
	CAPSFeePaid char(1) null,
	adminFeePaid char(1) null,
	storiesXX varchar(50) null,
	stats varchar(50) null,
	secure char(1) null,
	dateCreated varchar(22) null,
	lastUpdate varchar(22) null,
	maxNoStaff varchar(11) null,
	maxNoStudents varchar(11) null,
	projEvalCompleted char(1) null,
	evangelisticExposures int null,
	receivedChrist int null,
	jesusFilmExposures int null,
	jesusFilmReveivedChrist int null,
	coverageActivitiesExposures int null,
	coverageActivitiesDecisions int null,
	holySpiritDecisions int null,
	website varchar(255) null,
	destinationAddress varchar(255) null,
	destinationPhone varchar(255) null,
	wsnYear varchar(4) null,

	fk_IsCoord varchar(64) null,
	fk_IsAPD varchar(64) null,
	fk_IsPD varchar(64) null,
	PRIMARY KEY(WsnProjectID)
);

CREATE INDEX index1 ON wsn_sp_WsnProject (fk_isAPD);
CREATE INDEX index2 ON wsn_sp_WsnProject (fk_isPD);
CREATE INDEX index3 ON wsn_sp_WsnProject (fk_isCoord);
CREATE INDEX index4 ON wsn_sp_WsnProject (wsnYear);
CREATE INDEX index5 ON wsn_sp_WsnProject (status);
CREATE INDEX index6 ON wsn_sp_WsnProject (name);
CREATE INDEX index7 ON wsn_sp_WsnProject (partnershipRegion);


DROP TABLE wsn_sp_WsnApplication;

CREATE TABLE wsn_sp_WsnApplication(
	WsnApplicationID varchar(64) not null,
	surferID varchar(11) null,
	role varchar(1) null,
	region varchar(2) null,
	legalLastName varchar(50) null,
	legalFirstName varchar(50) null,
	ssn varchar(11) null,
	currentAddress varchar(50) null,
	currentAddress2 varchar(35) null,
	currentCity varchar(35) null,
	currentState varchar(6) null,
	currentZip varchar(10) null,
	currentPhone varchar(24) null,
	currentEmail varchar(50) null,
	dateAddressGoodUntil varchar(22) null,
	birthdate varchar(22) null,
	dateBecameChristian varchar(22) null,
	maritalStatus varchar(22) null,
	universityFullName varchar(50) null,
	major varchar(50) null,
	yearInSchool varchar(12) null,
	graduationDate varchar(22) null,
	earliestAvailableDate varchar(22) null,
	dateMustReturn varchar(22) null,
	willingForDifferentProject char(1) null,
	usCitizen char(1) null,
	citizenship varchar(50) null,
	isApplicationComplete char(1) null,
	applicationCompleteNote char(1) null,
	projectPref1 varchar(11) null,
	projectPref2 varchar(11) null,
	projectPref3 varchar(11) null,
	projectPref4 varchar(11) null,
	projectPref5 varchar(11) null,
	accountNo varchar(11) null,
	supportGoal int null,
	supportReceived int null,
	supportBalance int null,
	insuranceReceived char(1) null,
	waiverReceived char(1) null,
	didGo char(1) null,
	participantEvaluation char(1) null,
	destinationGatewayCity varchar(50) null,
	gatewayCityToLocationFlightNo varchar(50) null,
	departGatewayCityToLocation varchar(22) null,
	arrivalGatewayCityToLocation varchar(22) null,
	locationToGatewayCityFlightNo varchar(50) null,
	departLocationToGatewayCity varchar(22) null,
	arrrivalLocationToGatewayCity varchar(22) null,
	domesticOrigin varchar(50) null,
	domesticOriginToGCFlightNo varchar(50) null,
	departDomesticToGatewayCity varchar(22) null,
	arrivalDomesticToGatewayCity varchar(22) null,
	arrivalAtDomesticOrigin varchar(22) null,
	travelPlans char(1) null,
	travelDeviation char(1) null,
	passportNo varchar(25) null,
	passportCountry varchar(50) null,
	passportIssueDate varchar(22) null,
	passportExpirationDate varchar(22) null,
	visaCountry varchar(50) null,
	visaNo varchar(50) null,
	visaType varchar(50) null,
	visaIsMultipleEntry char(1) null,
	visaIssueDate varchar(22) null,
	visaExpirationDate varchar(22) null,
	emergName varchar(50) null,
	emergAddress varchar(50) null,
	emergCity varchar(50) null,
	emergState varchar(6) null,
	emergZip varchar(10) null,
	emergPhone varchar(24) null,
	emergWorkPhone varchar(24) null,
	emergEmail varchar(50) null,
	gender varchar(1) null,
	dateUpdated varchar(22) null,
	isStaff char(1) null,
	prevIsp char(1) null,
	child char(1) null,
	status varchar(22) null,
	wsnYear varchar(4) null,
	fk_isMember varchar(64) null,
	fk_wsnSpouse varchar(64) null,
	fk_childOf varchar(64) null,
	PRIMARY KEY(WsnApplicationID)
);

CREATE INDEX index1 ON wsn_sp_WsnApplication (fk_isMember);
CREATE INDEX index2 ON wsn_sp_WsnApplication (fk_wsnSpouse);
CREATE INDEX index3 ON wsn_sp_WsnApplication (fk_childOf);
CREATE INDEX index4 ON wsn_sp_WsnApplication (legalLastName);
CREATE INDEX index5 ON wsn_sp_WsnApplication (legalFirstName);
CREATE INDEX index8 ON wsn_sp_WsnApplication (status);
CREATE INDEX index9 ON wsn_sp_WsnApplication (wsnYear);
CREATE INDEX index10 ON wsn_sp_WsnApplication (accountNo);
CREATE INDEX index11 ON wsn_sp_WsnApplication (region);
CREATE INDEX index12 ON wsn_sp_WsnApplication (role);

