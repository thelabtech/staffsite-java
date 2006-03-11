DROP TABLE IF EXISTS hr_review360_ReviewSession;

CREATE TABLE hr_review360_ReviewSession(
ReviewSessionID varchar(64) not null,
name varchar(80) null,
purpose varchar(255) null,
dateDue date null,
dateStarted date null,
revieweeID varchar(128) null,
administratorID varchar(128) null,
requestedByID varchar(128) null
);

ALTER TABLE hr_review360_ReviewSession ADD CONSTRAINT PK_hr_review360_ReviewSession PRIMARY KEY (ReviewSessionID);


DROP TABLE IF EXISTS hr_review360_Review360;

CREATE TABLE hr_review360_Review360(
fk_ReviewSessionID varchar(64) null,
Review360ID varchar(64) not null,
reviewedByID varchar(64) null,
dateStarted date null,
dateCompleted date null,
dateDue date null,
currentPosition varchar(128) null,
leadershipLevel varchar(128) null,
relationship varchar(128) null,
q1 text null,
q2 int null,
q3 text null,
q4 text null,
q5 text null,
q6 text null,
q7 text null,
q8 int null,
q9 text null,
q10 int null,
q11 text null,
q12 int null,
q13 text null,
q14 int null,
q15 text null,
q16 int null,
q17 text null,
q18 int null,
q19 text null,
q20 int null,
q21 text null,
q22 int null,
q23 text null,
q24 int null,
q25 text null,
q26 text null,
q27 text null,
q28f1 text null,
q28f2 int null,
q28l1 text null,
q28l2 int null,
q28o1 text null,
q28o2 int null,
q28a1 text null,
q28a2 int null,
q28t1 text null,
q28t2 int null,
q28s1 text null,
q28s2 int null,
q29 text null,
q30 text null,
q31 text null,
q32 text null,
q33 text null,
q34 text null
);


CREATE INDEX IDX_hr_review360_Review360_fk_ReviewSessionID ON hr_review360_Review360 (fk_ReviewSessionID);

ALTER TABLE hr_review360_Review360 ADD CONSTRAINT PK_hr_review360_Review360 PRIMARY KEY (Review360ID);


