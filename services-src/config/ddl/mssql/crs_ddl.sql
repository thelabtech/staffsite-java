if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSChildRegistration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSChildRegistration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSConference]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSConference]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSCustomAnswer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSCustomAnswer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSCustomItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSCustomItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSCustomQuestion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSCustomQuestion]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSGuestRegistration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSGuestRegistration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSPayment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSPayment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSPerson]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSPerson]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSPersonAttribute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSPersonAttribute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSRegistration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSRegistration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSStaffRegistration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSStaffRegistration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSStudentRegistration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSStudentRegistration]
GO

CREATE TABLE [crs_CRSChildRegistration] (
	[childRegistrationID] [int] IDENTITY (1, 1) NOT NULL ,
	[firstName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[age] [int] NULL ,
	[arriveDate] [datetime] NULL ,
	[birthDate] [datetime] NULL ,
	[leaveDate] [datetime] NULL ,
	[inChildCare] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_RegistrationID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSConference] (
	[conferenceID] [int] IDENTITY (1, 1) NOT NULL ,
	[createDate] [datetime] NULL ,
	[attributesAsked] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[name] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[theme] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staffPassword] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[briefDescription] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactAddress1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactAddress2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactCity] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactState] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactZip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[splashPageURL] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[confImageId] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fontFace] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[backgroundColor] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[foregroundColor] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[highlightColor] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[confirmationEmail] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[acceptCreditCards] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[acceptEChecks] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[acceptScholarships] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[authnetPassword] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[preRegStart] [datetime] NULL ,
	[preRegEnd] [datetime] NULL ,
	[onsiteCost] [float] NULL ,
	[commuterCost] [float] NULL ,
	[preRegDeposit] [float] NULL ,
	[discountFullPayment] [float] NULL ,
	[discountEarlyReg] [float] NULL ,
	[discountEarlyRegDate] [datetime] NULL ,
	[checkPayableTo] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[merchantAcctNum] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[defaultDateStaffArrive] [datetime] NULL ,
	[defaultDateStaffLeave] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSCustomAnswer] (
	[customAnswerID] [int] IDENTITY (1, 1) NOT NULL ,
	[answerNumber] [int] NULL ,
	[answer] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_RegistrationID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSCustomItem] (
	[customItemID] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[text] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[itemNumber] [int] NULL ,
	[fk_ConferenceID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSCustomQuestion] (
	[customQuestionID] [int] IDENTITY (1, 1) NOT NULL ,
	[questionNumber] [int] NULL ,
	[question] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[answerType] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[required] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[editable] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_ConferenceID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSGuestRegistration] (
	[guestRegistrationID] [int] IDENTITY (1, 1) NOT NULL ,
	[comments] [varchar] (7500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ministryName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[roomWith] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[additionalRooms] [int] NULL ,
	[arriveDate] [datetime] NULL ,
	[leaveDate] [datetime] NULL ,
	[booth] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[breakoutSession] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseComing] [int] NULL ,
	[fk_RegistrationID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSLog] (
	[conferenceID] [int] NOT NULL ,
	[logDate] [datetime] NULL ,
	[type] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[result] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[message] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSPayment] (
	[paymentID] [int] IDENTITY (1, 1) NOT NULL ,
	[paymentDate] [datetime] NULL ,
	[debit] [float] NULL ,
	[credit] [float] NULL ,
	[type] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[authCode] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[businessUnit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dept] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[project] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountNo] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[comment] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[posted] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[postedDate] [datetime] NULL ,
	[fk_RegistrationID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSPerson] (
	[personID] [int] IDENTITY (1, 1) NOT NULL ,
	[username] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[createdDate] [datetime] NULL ,
	[firstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[middleInitial] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[birthDate] [datetime] NULL ,
	[campus] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[yearInSchool] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[graduationDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[greekAffiliation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[gender] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[homePhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[permanentAddress1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[permanentAddress2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[permanentCity] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[permanentState] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[permanentZip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[permanentPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[permanentCountry] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ssn] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maritalStatus] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[numberOfKids] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSPersonAttribute] (
	[personAttributeID] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[value] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_PersonID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSRegistration] (
	[registrationID] [int] IDENTITY (1, 1) NOT NULL ,
	[registrationDate] [datetime] NULL ,
	[registrationType] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[preRegistered] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_PersonID] [int] NULL ,
	[fk_ConferenceID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSStaffRegistration] (
	[staffRegistrationID] [int] IDENTITY (1, 1) NOT NULL ,
	[teamName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountNo] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[roomWith] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[inHotel] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[inNCO] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[arriveDate] [datetime] NULL ,
	[leaveDate] [datetime] NULL ,
	[additionalRooms] [int] NULL ,
	[meetingRoomComment] [varchar] (7500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseComing] [int] NULL ,
	[fk_RegistrationID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [crs_CRSStudentRegistration] (
	[studentRegistrationID] [int] IDENTITY (1, 1) NOT NULL ,
	[comments] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_RegistrationID] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [crs_CRSChildRegistration] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSChildRegistration] PRIMARY KEY  CLUSTERED 
	(
		[childRegistrationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [crs_CRSConference] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSConference] PRIMARY KEY  CLUSTERED 
	(
		[conferenceID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [crs_CRSCustomQuestion] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSCustomQuestion] PRIMARY KEY  CLUSTERED 
	(
		[customQuestionID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [crs_CRSGuestRegistration] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSGuestRegistration] PRIMARY KEY  CLUSTERED 
	(
		[guestRegistrationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [crs_CRSPersonAttribute] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSPersonAttribute] PRIMARY KEY  CLUSTERED 
	(
		[personAttributeID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [crs_CRSStaffRegistration] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSStaffRegistration] PRIMARY KEY  CLUSTERED 
	(
		[staffRegistrationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [crs_CRSStudentRegistration] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSStudentRegistration] PRIMARY KEY  CLUSTERED 
	(
		[studentRegistrationID]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_crs_CRSChildRegistration] ON [crs_CRSChildRegistration]([fk_RegistrationID]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_crs_CRSConference] ON [crs_CRSConference]([preRegStart]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_crs_CRSConference_1] ON [crs_CRSConference]([preRegEnd]) ON [PRIMARY]
GO

ALTER TABLE [crs_CRSCustomAnswer] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSCustomAnswer] PRIMARY KEY  NONCLUSTERED 
	(
		[customAnswerID]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_crs_CRSCustomAnswer] ON [crs_CRSCustomAnswer]([fk_RegistrationID]) ON [PRIMARY]
GO

ALTER TABLE [crs_CRSCustomItem] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSCustomItem] PRIMARY KEY  NONCLUSTERED 
	(
		[customItemID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_crs_CRSCustomItem] ON [crs_CRSCustomItem]([fk_ConferenceID]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_crs_CRSCustomQuestion] ON [crs_CRSCustomQuestion]([fk_ConferenceID]) ON [PRIMARY]
GO

ALTER TABLE [crs_CRSPayment] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSPayment] PRIMARY KEY  NONCLUSTERED 
	(
		[paymentID]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_crs_CRSPayment] ON [crs_CRSPayment]([fk_RegistrationID]) ON [PRIMARY]
GO

ALTER TABLE [crs_CRSPerson] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSPerson] PRIMARY KEY  NONCLUSTERED 
	(
		[personID]
	)  ON [PRIMARY] ,
	CONSTRAINT [IX_crs_CRSPerson] UNIQUE  NONCLUSTERED 
	(
		[username]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_crs_CRSPerson_1] ON [crs_CRSPerson]([email]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_crs_CRSPerson_2] ON [crs_CRSPerson]([lastName]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_crs_CRSPerson_3] ON [crs_CRSPerson]([personID]) ON [PRIMARY]
GO

ALTER TABLE [crs_CRSRegistration] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSRegistration] PRIMARY KEY  NONCLUSTERED 
	(
		[registrationID]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_crs_CRSRegistration] ON [crs_CRSRegistration]([fk_PersonID]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_crs_CRSRegistration_1] ON [crs_CRSRegistration]([fk_ConferenceID]) ON [PRIMARY]
GO
