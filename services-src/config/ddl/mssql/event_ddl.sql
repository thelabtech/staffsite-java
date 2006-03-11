DROP TABLE event_EventPerson;

CREATE TABLE event_EventPerson(
	firstName varchar(30) null,
	lastName varchar(30) null,
	middleInitial varchar(1) null,
	birthDate varchar(10) null,
	campus varchar(128) null,
	gender varchar(1) null,
	address1 varchar(35) null,
	address2 varchar(35) null,
	city varchar(30) null,
	state varchar(6) null,
	zip varchar(10) null,
	homePhone varchar(24) null,
	email varchar(50) null,
	ssn varchar(9) null,
	maritalStatus varchar(1) null,
	spouseName varchar(30) null,
	numberOfKids varchar(2) null,
	isSpeaker char(1) null,
	isStaff char(1) null,
	accountNo varchar(11) null,
	password varchar(32) null,
	eventPersonID varchar(64) not null,
	PRIMARY KEY(eventPersonID)
);



DROP TABLE event_EventInfo;

CREATE TABLE event_EventInfo(
	name varchar(64) null,
	theme varchar(128) null,
	password varchar(20) null,
	region varchar(3) null,
	beginDate varchar(10) null,
	endDate varchar(10) null,
	briefDescription varchar(1024) null,
	preRegCost varchar(8) null,
	fullCost varchar(8) null,
	checkPayableTo varchar(40) null,
	acceptCreditCards char(1) null,
	merchantAcctNum varchar(64) null,
	contactName varchar(60) null,
	contactEmail varchar(50) null,
	contactPhone varchar(24) null,
	contactAddress1 varchar(35) null,
	contactAddress2 varchar(35) null,
	contactCity varchar(30) null,
	contactState varchar(6) null,
	contactZip varchar(10) null,
	splashPageURL varchar(128) null,
	confImageId varchar(32) null,
	fontFace varchar(32) null,
	backgroundColor varchar(6) null,
	foregroundColor varchar(6) null,
	highlightColor varchar(6) null,
	eventInfoID varchar(64) not null,
	PRIMARY KEY(eventInfoID)
);


DROP TABLE event_EventRegistration;

CREATE TABLE event_EventRegistration(
	preRegistered char(1) null,
	amountPaid varchar(4) null,
	amountScholarship varchar(4) null,
	eventRegistrationID varchar(64) not null,
	fk_EventRegInfo varchar(64) null,
	fk_EventRegPerson varchar(64) null,
	PRIMARY KEY(eventRegistrationID)
);


CREATE INDEX index1 ON event_EventRegistration (fk_EventRegInfo);
CREATE INDEX index2 ON event_EventRegistration (fk_EventRegPerson);


DROP TABLE event_EventCustomAnswer;

CREATE TABLE event_EventCustomAnswer(
	eventCustomAnswerID varchar(64) not null,
	answerNumber int null,
	answer varchar(512) null,
	fk_EventRegistration varchar(64) null,
	PRIMARY KEY(eventCustomAnswerID)
);
CREATE INDEX index1 ON event_EventCustomAnswer (fk_EventRegistration);


DROP TABLE event_EventCustomItem;

CREATE TABLE event_EventCustomItem(
	eventCustomItemID varchar(64) not null,
	title varchar(128) null,
	text varchar(1024) null,
	itemNumber int null,
	fk_EventInfo varchar(64) null,
	PRIMARY KEY(eventCustomItemID)
);
CREATE INDEX index1 ON event_EventCustomItem (fk_EventInfo);


DROP TABLE event_EventCustomQuestion;

CREATE TABLE event_EventCustomQuestion(
	questionNumber int null,
	question varchar(128) null,
	answerType varchar(8) null,
	eventCustomQuestionID varchar(64) not null,
	fk_EventInfo varchar(64) null,
	PRIMARY KEY(eventCustomQuestionID)
);
CREATE INDEX index1 ON event_EventCustomQuestion (fk_EventInfo);


DROP TABLE event_EventSpeaker;

CREATE TABLE event_EventSpeaker(
	eventPersonID varchar(64) not null,
	talkTitle varchar(128) null,
	talkBrief varchar(1024) null,
	speakerBlurb varchar(1024) null,
	textId varchar(255) null,
	PRIMARY KEY(eventPersonID)
);


DROP TABLE event_assocEventsSpeakers;
create table event_assocEventsSpeakers (
	eventPersonID varchar(64) not null,
	eventInfoID varchar(64) not null,
	PRIMARY KEY(eventPersonID, eventInfoID)
);


