if exists (select * from dbo.sysobjects where id = object_id(N'[cms_CmsCategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [cms_CmsCategory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[cms_CmsFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [cms_CmsFile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[cms_assoc_FileCategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [cms_assoc_FileCategory]
GO

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

if exists (select * from dbo.sysobjects where id = object_id(N'[crs_CRSCustomOption_DEPRECATED]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [crs_CRSCustomOption_DEPRECATED]
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

if exists (select * from dbo.sysobjects where id = object_id(N'[event_EventCustomAnswer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [event_EventCustomAnswer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[event_EventCustomItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [event_EventCustomItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[event_EventCustomQuestion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [event_EventCustomQuestion]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[event_EventInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [event_EventInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[event_EventPerson]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [event_EventPerson]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[event_EventRegistration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [event_EventRegistration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[event_EventSpeaker]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [event_EventSpeaker]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[event_assocEventsSpeakers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [event_assocEventsSpeakers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[fsk_Allocation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [fsk_Allocation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[fsk_FskOrder]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [fsk_FskOrder]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[hr_ms_Payment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [hr_ms_Payment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[hr_review360_Review360]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [hr_review360_Review360]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[hr_review360_Review360Light]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [hr_review360_Review360Light]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[hr_review360_ReviewSession]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [hr_review360_ReviewSession]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[hr_review360_ReviewSessionLight]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [hr_review360_ReviewSessionLight]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[import_StaffAcctBal]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [import_StaffAcctBal]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[linczone_contacts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [linczone_contacts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Activity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Activity]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Address]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Address]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Assoc_activityContact]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Assoc_activityContact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Assoc_dependents]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Assoc_dependents]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Assoc_intlContact]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Assoc_intlContact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Assoc_otherMinistries]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Assoc_otherMinistries]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Assoc_partCoord]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Assoc_partCoord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Authorization]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Authorization]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_ChangeRequest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_ChangeRequest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Dependent]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Dependent]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_FieldChange]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_FieldChange]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_LocalLevel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_LocalLevel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_NonCccMin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_NonCccMin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Note]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Note]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_RegionalStat]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_RegionalStat]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_RegionalTeam]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_RegionalTeam]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Staff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Staff]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_StaffChangeRequest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_StaffChangeRequest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_Statistic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_Statistic]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_TargetArea]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_TargetArea]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_WsnPartnership]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_WsnPartnership]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministry_assocTeamStaff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministry_assocTeamStaff]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministrylocator_assoc_contact]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministrylocator_assoc_contact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministrylocator_assoc_ministry_contact]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministrylocator_assoc_ministry_contact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministrylocator_campus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministrylocator_campus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministrylocator_contact]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministrylocator_contact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministrylocator_ministry]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministrylocator_ministry]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ministryproximity_zipcode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ministryproximity_zipcode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ms_MSApplication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ms_MSApplication]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ms_MSReference]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ms_MSReference]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[objectbroker_objectwrapper]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [objectbroker_objectwrapper]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[simplesecuritymanager_user]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [simplesecuritymanager_user]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[staffsite_staffsitepref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [staffsite_staffsitepref]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[staffsite_staffsiteprofile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [staffsite_staffsiteprofile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[temp_TargetImport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [temp_TargetImport]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_Campus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_Campus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_Placement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_Placement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_Placement00]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_Placement00]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_Placement01]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_Placement01]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_Placement99]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_Placement99]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_Project]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_Project]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_Student]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_Student]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_Student01]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_Student01]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ussp_user]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ussp_user]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[wsn_sp_Reference]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [wsn_sp_Reference]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[wsn_sp_WsnApplication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [wsn_sp_WsnApplication]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[wsn_sp_WsnProject]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [wsn_sp_WsnProject]
GO

CREATE TABLE [cms_CmsCategory] (
	[CmsCategoryID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[parentCategory] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[catName] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[catDesc] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[path] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pathid] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [cms_CmsFile] (
	[CmsFileID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[mime] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[title] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accessCount] [int] NULL ,
	[dateAdded] [datetime] NULL ,
	[dateModified] [datetime] NULL ,
	[moderatedYet] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[summary] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[quality] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[expDate] [datetime] NULL ,
	[lastAccessed] [datetime] NULL ,
	[modMsg] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[keywords] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[url] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[detail] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[language] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[version] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[author] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[submitter] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contact] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[rating] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [cms_assoc_FileCategory] (
	[CmsFileID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CmsCategoryID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
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
	[confImageId] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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
	[defaultDateStaffArrive] [datetime] NULL ,
	[defaultDateStaffLeave] [datetime] NULL ,
	[onsiteCost] [float] NULL ,
	[commuterCost] [float] NULL ,
	[preRegDeposit] [float] NULL ,
	[discountFullPayment] [float] NULL ,
	[discountEarlyReg] [float] NULL ,
	[discountEarlyRegDate] [datetime] NULL ,
	[checkPayableTo] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[merchantAcctNum] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
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

CREATE TABLE [crs_CRSCustomOption_DEPRECATED] (
	[customOptionID] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cost] [float] NULL ,
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
	[comments] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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
	[meetingRoomComment] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
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

CREATE TABLE [event_EventCustomAnswer] (
	[eventCustomAnswerID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[answerNumber] [int] NULL ,
	[answer] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_EventRegistration] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [event_EventCustomItem] (
	[eventCustomItemID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[title] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[text] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[itemNumber] [int] NULL ,
	[fk_EventInfo] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [event_EventCustomQuestion] (
	[questionNumber] [int] NULL ,
	[question] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[answerType] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eventCustomQuestionID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_EventInfo] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [event_EventInfo] (
	[name] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[theme] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[beginDate] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[endDate] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[briefDescription] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[preRegCost] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fullCost] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[checkPayableTo] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[acceptCreditCards] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[merchantAcctNum] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactAddress1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactAddress2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactCity] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactState] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactZip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[splashPageURL] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[confImageId] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fontFace] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[backgroundColor] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[foregroundColor] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[highlightColor] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eventInfoID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [event_EventPerson] (
	[firstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[middleInitial] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[birthDate] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campus] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[gender] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[homePhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ssn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maritalStatus] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[numberOfKids] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isSpeaker] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isStaff] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eventPersonID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [event_EventRegistration] (
	[preRegistered] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[amountPaid] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[amountScholarship] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eventRegistrationID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_EventRegInfo] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_EventRegPerson] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [event_EventSpeaker] (
	[eventPersonID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[talkTitle] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[talkBrief] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[speakerBlurb] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[textId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [event_assocEventsSpeakers] (
	[eventPersonID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[eventInfoID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [fsk_Allocation] (
	[allocationID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[accountNo] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[natlDonation] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[regionalAllotment] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[regionallyRaised] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[locallyRaised] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[natlNotes] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[regNotes] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[localNotes] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[firstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [fsk_FskOrder] (
	[fskOrderID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[campusName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[localAcctNo1] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[localAcctNo2] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[localAcctNo3] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[localAcctNo4] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staffFirstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staffLastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staffPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staffEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateCreated] [datetime] NULL ,
	[dateUpdated] [datetime] NULL ,
	[contactFirstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactLastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactPager] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactCell] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contactEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[kitShipName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[kitShipAddress1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[kitShipAddress2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[kitShipCity] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[kitShipState] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[kitShipZip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[kitShipPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[totalKits] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bagToyImp] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bagToyWay] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bagToyDes] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bagToyEp] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bagToyESC] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bagToyMisc] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bibleIsiNT] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bibleTwo] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bibleThree] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bibleMisc] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoRel] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoRelCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoThirsty] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoThirstyCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoChang] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoChangCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoSurfer] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoSurferCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoClimbing] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoClimbingCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoImpact] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoImpactCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoTestimonyCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoJfpCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoJesusVCD] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[videoMisc] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bookMTAC] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bookMTACSpan] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bookCaseForC] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bookCaseForF] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bookBeyond] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bookRelevant] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bookSurvUS] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bookMisc] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cdHipHop] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cdSetApart] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cdMisc] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cdHispanic] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cardReg] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cardAfAm] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cardHispanic] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cardAsian] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[planner] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_Allocation] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [hr_ms_Payment] (
	[paymentID] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[paymentDate] [datetime] NULL ,
	[debit] [float] NULL ,
	[credit] [float] NULL ,
	[type] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[authCode] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[businessUnit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dept] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[project] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountNo] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[posted] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[postedDate] [datetime] NULL ,
	[fk_WsnApplicationID] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[paymentFor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [hr_review360_Review360] (
	[Review360ID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[reviewedByID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateStarted] [datetime] NULL ,
	[dateCompleted] [datetime] NULL ,
	[dateDue] [datetime] NULL ,
	[currentPosition] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[leadershipLevel] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[relationship] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q2] [int] NULL ,
	[q3] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q4] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q5] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q6] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q7] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q8] [int] NULL ,
	[q9] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q10] [int] NULL ,
	[q11] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q12] [int] NULL ,
	[q13] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q14] [int] NULL ,
	[q15] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q16] [int] NULL ,
	[q17] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q18] [int] NULL ,
	[q19] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q20] [int] NULL ,
	[q21] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q22] [int] NULL ,
	[q23] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q24] [int] NULL ,
	[q25] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q26] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q27] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q28f1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q28f2] [int] NULL ,
	[q28l1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q28l2] [int] NULL ,
	[q28o1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q28o2] [int] NULL ,
	[q28a1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q28a2] [int] NULL ,
	[q28t1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q28t2] [int] NULL ,
	[q28s1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q28s2] [int] NULL ,
	[q29] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q30] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q31] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q32] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q33] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q34] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_ReviewSessionID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [hr_review360_Review360Light] (
	[Review360LightID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[reviewedByID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateStarted] [datetime] NULL ,
	[dateCompleted] [datetime] NULL ,
	[dateDue] [datetime] NULL ,
	[currentPosition] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[leadershipLevel] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[relationship] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q2] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q3] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q4] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q5] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q6] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q7] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q8] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[q9] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_ReviewSessionLightID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [hr_review360_ReviewSession] (
	[ReviewSessionID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[purpose] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateDue] [datetime] NULL ,
	[dateStarted] [datetime] NULL ,
	[revieweeID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[administratorID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[requestedByID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [hr_review360_ReviewSessionLight] (
	[ReviewSessionLightID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[purpose] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateDue] [datetime] NULL ,
	[dateStarted] [datetime] NULL ,
	[revieweeID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[administratorID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[requestedByID] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [import_StaffAcctBal] (
	[EMPLID] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CUR_BAL] [numeric](28, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [linczone_contacts] (
	[ContactID] [int] IDENTITY (1, 1) NOT NULL ,
	[EntryDate] [smalldatetime] NULL ,
	[FirstName] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[HomeAddress] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[State] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Zip] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Email] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[HighSchool] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CampusName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CampusID] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReferrerFirstName] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReferrerLastName] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReferrerRelationship] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReferrerEmail] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoCCC] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoNav] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoIV] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoFCA] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoBSU] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoCACM] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoEFCA] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoGCM] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InfoWesley] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Activity] (
	[ActivityID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[status] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[periodBegin] [datetime] NULL ,
	[periodEnd] [datetime] NULL ,
	[strategy] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[transUsername] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_targetAreaID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_teamID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Address] (
	[AddressID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[startdate] [datetime] NULL ,
	[enddate] [datetime] NULL ,
	[address1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address3] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address4] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Assoc_activityContact] (
	[ActivityID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[accountNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Assoc_dependents] (
	[DependentID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[accountNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Assoc_intlContact] (
	[accountNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[WsnPartnershipID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Assoc_otherMinistries] (
	[NonCccMinID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[TargetAreaID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Assoc_partCoord] (
	[accountNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[WsnPartnershipID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Authorization] (
	[AuthorizationID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[authdate] [datetime] NULL ,
	[role] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[authorized] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[sequence] [int] NULL ,
	[fk_AuthorizedBy] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_AuthorizationNote] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_changeRequestID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_ChangeRequest] (
	[ChangeRequestID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[requestdate] [datetime] NULL ,
	[effectivedate] [datetime] NULL ,
	[applieddate] [datetime] NULL ,
	[type] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_requestedBy] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Dependent] (
	[DependentID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[firstName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[middleName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[birthdate] [datetime] NULL ,
	[gender] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_FieldChange] (
	[FieldChangeID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[field] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[oldValue] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[newValue] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fk_hasFieldChanges] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_LocalLevel] (
	[teamID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lane] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[note] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fax] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[url] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[startdate] [datetime] NULL ,
	[stopdate] [datetime] NULL ,
	[Fk_OrgRel] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[no] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[abbrv] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_NonCccMin] (
	[NonCccMinID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ministry] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[firstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[homePhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[workPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mobilePhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[url] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pager] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fax] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[note] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Note] (
	[NoteID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dateEntered] [datetime] NULL ,
	[title] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[note] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fk_loaNote] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fk_resignationLetter] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fk_authorizationNote] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_RegionalStat] (
	[RegionalStatID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[periodBegin] [datetime] NULL ,
	[periodEnd] [datetime] NULL ,
	[nsSc] [int] NULL ,
	[nsWsn] [int] NULL ,
	[nsCat] [int] NULL ,
	[nsIcrD] [int] NULL ,
	[nsIcrI] [int] NULL ,
	[nsIcrE] [int] NULL ,
	[niSc] [int] NULL ,
	[niWsn] [int] NULL ,
	[niCat] [int] NULL ,
	[niIcrD] [int] NULL ,
	[niIcrI] [int] NULL ,
	[niIcrE] [int] NULL ,
	[fk_regionalTeamID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_RegionalTeam] (
	[teamID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[note] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fax] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[url] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[startdate] [datetime] NULL ,
	[stopdate] [datetime] NULL ,
	[no] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[abbrv] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Staff] (
	[accountNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[firstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[middleInitial] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isMale] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[position] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[countryStatus] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[jobStatus] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ministry] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strategy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isNewStaff] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[primaryEmpLocState] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[primaryEmpLocCountry] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[primaryEmpLocCity] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseFirstName] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseMiddleName] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseLastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseAccountNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spouseEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fianceeFirstName] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fianceeMiddleName] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fianceeLastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[finaceeAccountno] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isFianceeStaff] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fianceeJoinStaffDate] [datetime] NULL ,
	[isFianceeJoiningNS] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[joiningNS] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[homePhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[workPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mobilePhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pager] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isEmailSecure] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[url] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[newStaffTrainingdate] [datetime] NULL ,
	[fax] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[note] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[countryCode] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ssn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maritalStatus] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[deptId] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[jobCode] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountCode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[compFreq] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[compRate] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[compChngAmt] [varchar] (21) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[jobTitle] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[deptName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[coupleTitle] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[otherPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[preferredName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[namePrefix] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[origHiredate] [datetime] NULL ,
	[birthDate] [datetime] NULL ,
	[marriageDate] [datetime] NULL ,
	[hireDate] [datetime] NULL ,
	[rehireDate] [datetime] NULL ,
	[loaStartDate] [datetime] NULL ,
	[loaEndDate] [datetime] NULL ,
	[loaReason] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[severancePayMonthsReq] [int] NULL ,
	[serviceDate] [datetime] NULL ,
	[lastIncDate] [datetime] NULL ,
	[jobEntryDate] [datetime] NULL ,
	[deptEntryDate] [datetime] NULL ,
	[reportingDate] [datetime] NULL ,
	[employmentType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[resignationReason] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[resignationDate] [datetime] NULL ,
	[contributionsToOtherAcct] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contributionsToAcntName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contributionsToAcntNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_primaryAddress] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_secondaryAddress] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_teamID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isSecure] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isSupported] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_StaffChangeRequest] (
	[ChangeRequestID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[updateStaff] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_Statistic] (
	[StatisticID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[periodBegin] [datetime] NULL ,
	[periodEnd] [datetime] NULL ,
	[exposures] [int] NULL ,
	[decisions] [int] NULL ,
	[attendedLastConf] [int] NULL ,
	[invldNewBlvrs] [int] NULL ,
	[invldStudents] [int] NULL ,
	[invldFreshmen] [int] NULL ,
	[invldSophomores] [int] NULL ,
	[invldJuniors] [int] NULL ,
	[invldSeniors] [int] NULL ,
	[invldGrads] [int] NULL ,
	[volunteers] [int] NULL ,
	[staff] [int] NULL ,
	[nonStaffStint] [int] NULL ,
	[staffStint] [int] NULL ,
	[fk_Activity] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_TargetArea] (
	[TargetAreaID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fax] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[url] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[abbrv] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fice] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[population] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[note] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[altName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isSecure] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpta] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[urlToLogo] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[enrollment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[monthSchoolStarts] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[monthSchoolStops] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isSemester] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isApproved] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[aoaPriority] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[aoa] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ciaUrl] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[infoUrl] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[calendar] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program3] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program4] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program5] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emphasis] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[sex] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[institutionType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[highestOffering] [varchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[affiliation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[carnegieClassification] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[irsStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[establishedDate] [int] NULL ,
	[tuition] [int] NULL ,
	[modified] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_WsnPartnership] (
	[WsnPartnershipID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[status] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[periodBegin] [datetime] NULL ,
	[periodEnd] [datetime] NULL ,
	[strategy] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isApproved] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[wsnStatus] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountingUnit] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[annualBudget] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[notes] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[transUsername] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministry_assocTeamStaff] (
	[fk_accountNo] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_teamID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministrylocator_assoc_contact] (
	[ministryID] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[contactID] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministrylocator_assoc_ministry_contact] (
	[ministryID] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[contactID] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministrylocator_campus] (
	[campusID] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministrylocator_contact] (
	[contactID] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[firstName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministrylocator_ministry] (
	[ministryID] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[strategy] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[url] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_campusID] [char] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ministryproximity_zipcode] (
	[zip] [int] NOT NULL ,
	[city] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[latitude] [float] NULL ,
	[longitude] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ms_MSApplication] (
	[applicationID] [int] NOT NULL ,
	[createDate] [datetime] NULL ,
	[name] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ssn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[street] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[leaveDate] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tele] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cell] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[checkEmail] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eStreet] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eCity] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eState] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eZip] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eTele] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[eCell] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[university] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staffType] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[project1] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[project2] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[project3] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[project4] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[project5] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[sBreakDate] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fBreakDate] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[finalDate] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fall] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[anotherProject] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[birthDate] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[decisionDate] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[graduationDate] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[major] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[year] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[marital] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[height] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[weight] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1a] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1b] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1c] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_2a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_2b] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_2c] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3a] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3b] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4a] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4b] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5a] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5b] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5c] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5d] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_6a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_7a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_8a] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_8b] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_9a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_10a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_11a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_11b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_12a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_12b] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_13a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_13b] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_13c] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_14a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_15a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_16a] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_17a] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_18a] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_19a] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_19b] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_20a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_20b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_20c] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21b] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_22a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_22b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_23a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_23b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_24a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_24b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_25a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_26a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_26b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_27a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_27b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_28a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_28b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29a] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29b] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29c] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29d] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29e] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_30a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_31a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_32a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_33a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_34a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_35a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ms_MSReference] (
	[referenceID] [int] NOT NULL ,
	[createDate] [datetime] NULL ,
	[name] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staff] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[street] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tele] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cell] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[relation] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[howLong] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[howWell] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[midEval] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_2a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_6a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_7a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_8a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_9a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_10a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_11a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_12a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_13a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_14a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_15a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_16a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_17a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_18a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_19a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_20a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21a] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21b] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_22a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_23a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_24a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_25a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_26a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_26b] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_26c] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_27a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_28a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_30a] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [objectbroker_objectwrapper] (
	[objectWrapperID] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[type] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bytes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [simplesecuritymanager_user] (
	[userID] [int] IDENTITY (1, 1) NOT NULL ,
	[username] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[email] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[passwordQuestion] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[passwordAnswer] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastFailure] [datetime] NULL ,
	[lastFailureCnt] [int] NULL ,
	[lastLogin] [datetime] NULL ,
	[createdOn] [datetime] NULL ,
	[emailVerified] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [staffsite_staffsitepref] (
	[StaffSitePrefID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[displayName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[value] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_StaffSiteProfile] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [staffsite_staffsiteprofile] (
	[StaffSiteProfileID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[firstName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[userName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[changePassword] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountNo] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isStaff] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[passwordQuestion] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[passwordAnswer] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [temp_TargetImport] (
	[TargetAreaID] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fax] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[url] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[abbrv] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fice] [int] NULL ,
	[population] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[note] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[altName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isSecure] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpta] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[urlToLogo] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[enrollment] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[monthSchoolStarts] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[monthSchoolStops] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isSemester] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[aoaPriority] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[aoa] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ciaUrl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[infoUrl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[calendar] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program3] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program4] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[program5] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emphasis] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[sex] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[institutionType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[highestOffering] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[affiliation] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[carnegieClassification] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[irsStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[establishedDate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tuition] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [ussp_Campus] (
	[CampusNumber] [int] NOT NULL ,
	[AreaNumber] [float] NULL ,
	[CampusName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AreaName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ussp_Placement] (
	[ID] [int] IDENTITY (820, 1) NOT NULL ,
	[Region] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nickname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SpouseName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spousenickname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FamilyUnit] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Venue] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Project] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NumofKids] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ageofchildren] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountno] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maritailstatus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ismale] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[schoolenddate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[schoolbegindate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdaddress1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdaddress2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdcity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdstate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdzip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdcountry] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdphone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdbegindate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdenddate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ussp_Placement00] (
	[ID] [int] NOT NULL ,
	[Region] [int] NULL ,
	[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nickname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SpouseName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spousenickname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FamilyUnit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Project] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NumofKids] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ageofchildren] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountno] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maritalstatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ismale] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[schoolenddate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[schoolbegindate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdaddress1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdaddress2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdcity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdstate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdzip] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdcountry] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdphone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdbegindate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdenddate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ussp_Placement01] (
	[ID] [float] NULL ,
	[Region] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nickname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SpouseName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[spousenickname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FamilyUnit] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Venue] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Project] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NumofKids] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ageofchildren] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountno] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maritailstatus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ismale] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[schoolenddate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[schoolbegindate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdaddress1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdaddress2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdcity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdstate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdzip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdcountry] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdphone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdbegindate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[mpdenddate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ussp_Placement99] (
	[ID] [int] NOT NULL ,
	[Region] [int] NULL ,
	[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SpouseName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FamilyUnit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Project] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NumofKids] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ussp_Project] (
	[ProjectCode] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProjectName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CampusPlacement] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ScholarshipAccountNo] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OperatingAccountNo] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ussp_Student] (
	[timestamp] [timestamp] NULL ,
	[StudentID] [int] IDENTITY (1, 1) NOT NULL ,
	[Title] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstName] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Street1] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Street2] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[State] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Zip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PhoneNumber] [float] NULL ,
	[PermanentPhoneNumber] [float] NULL ,
	[CampusName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AreaNumber] [tinyint] NULL ,
	[Pref1] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pref2] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pref3] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pref4] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pref5] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AssignedProject] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ActiveProject] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Status] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StatusDS] [datetime] NULL ,
	[Jan10] [bit] NULL ,
	[Feb10] [bit] NULL ,
	[Mar10] [bit] NULL ,
	[OtherNotes] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DateEnteredCreated] [datetime] NULL ,
	[DateAvailable] [datetime] NULL ,
	[DateTransferred] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ussp_Student01] (
	[StudentId] [numeric](18, 0) NULL ,
	[Title] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstName] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Street1] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Street2] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[State] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Zip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PhoneNumber] [float] NULL ,
	[PermanentPhoneNumber] [float] NULL ,
	[CampusName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AreaNumber] [tinyint] NULL ,
	[Pref1] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pref2] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pref3] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pref4] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pref5] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AssignedProject] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ActiveProject] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Status] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StatusDS] [datetime] NULL ,
	[Jan10] [bit] NULL ,
	[Feb10] [bit] NULL ,
	[Mar10] [bit] NULL ,
	[OtherNotes] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DateEnteredCreated] [datetime] NULL ,
	[DateAvailable] [datetime] NULL ,
	[DateTransferred] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [ussp_user] (
	[userindexkey] [int] NOT NULL ,
	[userid] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[projectcode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [wsn_sp_Reference] (
	[referenceID] [int] NOT NULL ,
	[formWorkflowStatus] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[createDate] [datetime] NULL ,
	[lastChangedDate] [datetime] NULL ,
	[lastChangedBy] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isFormSubmitted] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[formSubmittedDate] [datetime] NULL ,
	[referenceType] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[title] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[firstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isStaff] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staffNumber] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentAddress1] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentAddress2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentCity] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentState] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentZip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cellPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[homePhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[workPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[howKnown] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[howLongKnown] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[howWellKnown] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[sendMidEval] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1a] [int] NULL ,
	[_2a] [int] NULL ,
	[_3a] [int] NULL ,
	[_4a] [int] NULL ,
	[_5a] [int] NULL ,
	[_6a] [int] NULL ,
	[_7a] [int] NULL ,
	[_8a] [int] NULL ,
	[_9a] [int] NULL ,
	[_10a] [int] NULL ,
	[_11a] [int] NULL ,
	[_12a] [int] NULL ,
	[_13a] [int] NULL ,
	[_14a] [int] NULL ,
	[_15a] [int] NULL ,
	[_16a] [int] NULL ,
	[_17a] [int] NULL ,
	[_18a] [int] NULL ,
	[_19a] [int] NULL ,
	[_20a] [int] NULL ,
	[_21a] [int] NULL ,
	[_1sa] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_2sa] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3sa] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4sa] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5sa] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_6sa] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_6sb] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_6sc] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_7sa] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_8sa] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[closingRemarks] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_WsnApplicationID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [wsn_sp_WsnApplication] (
	[WsnApplicationID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[surferID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[role] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[region] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[legalLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[legalFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ssn] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentAddress] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentAddress2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentCity] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentState] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentZip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateAddressGoodUntil] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[birthdate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateBecameChristian] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maritalStatus] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[universityFullName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[major] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[yearInSchool] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[graduationDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[earliestAvailableDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateMustReturn] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[willingForDifferentProject] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[usCitizen] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[citizenship] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isApplicationComplete] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[applicationCompleteNote] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[projectPref1] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[projectPref2] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[projectPref3] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[projectPref4] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[projectPref5] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[accountNo] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[supportGoal] [int] NULL ,
	[supportReceived] [int] NULL ,
	[supportBalance] [int] NULL ,
	[insuranceReceived] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[waiverReceived] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[didGo] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[participantEvaluation] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[destinationGatewayCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[gatewayCityToLocationFlightNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[departGatewayCityToLocation] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[arrivalGatewayCityToLocation] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[locationToGatewayCityFlightNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[departLocationToGatewayCity] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[arrrivalLocationToGatewayCity] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[domesticOrigin] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[domesticOriginToGCFlightNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[departDomesticToGatewayCity] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[arrivalDomesticToGatewayCity] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[arrivalAtDomesticOrigin] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[travelPlans] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[travelDeviation] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[passportNo] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[passportCountry] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[passportIssueDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[passportExpirationDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[visaCountry] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[visaNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[visaType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[visaIsMultipleEntry] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[visaIssueDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[visaExpirationDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergAddress] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergState] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergZip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergWorkPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[gender] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateUpdated] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isStaff] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[prevIsp] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[child] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[status] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[wsnYear] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_isMember] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_wsnSpouse] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_childOf] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_infobaseID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_ssmUserID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[inSchool] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[weight] [int] NULL ,
	[heightFeet] [int] NULL ,
	[heightInches] [int] NULL ,
	[participateImpact] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[participateDestino] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[participateEpic] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[springBreakStart] [datetime] NULL ,
	[springBreakEnd] [datetime] NULL ,
	[isIntern] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1b] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1d] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1e] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_1f] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_2a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_2b] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_2c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3b] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3d] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3e] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3f] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3g] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_3h] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4b] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4d] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4e] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4f] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4g] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4h] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_4i] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5b] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5d] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5e] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5f] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5g] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_5h] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_6] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_7] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_8a] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_8b] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_9] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_10] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_11a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_11b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_12a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_12b] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_13a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_13b] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_13c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_14] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_15] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_16] [int] NULL ,
	[_17] [int] NULL ,
	[_18] [int] NULL ,
	[_19a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_19b] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_19c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_19d] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_19e] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_19f] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_20a] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_20b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_20c] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21b] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21d] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21e] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21f] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21g] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21h] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_21i] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_22a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_22b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_23a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_23b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_24a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_24b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_25] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_26a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_26b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_27a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_27b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_28a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_28b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29a] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29b] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29c] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29d] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_29e] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_30] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_31] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_32] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_33] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_34] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[_35] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isPaid] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[applicationStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isApplyingForStaffInternship] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[createDate] [datetime] NULL ,
	[lastChangedDate] [datetime] NULL ,
	[lastChangedBy] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currentCellPhone] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emergAddress2] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[legalMiddleName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[title] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[isRecruited] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[assignedToProject] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[datePaymentRecieved] [datetime] NULL ,
	[evaluationStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[universityState] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[finalProject] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[electronicSignature] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[submittedDate] [datetime] NULL ,
	[assignedDate] [datetime] NULL ,
	[dateReferencesDone] [datetime] NULL ,
	[acceptedDate] [datetime] NULL ,
	[notAcceptedDate] [datetime] NULL ,
	[withdrawnDate] [datetime] NULL ,
	[finalWsnProjectID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[preferredContactMethod] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[howOftenCheckEmail] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[otherClassDetails] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[participateOtherProjects] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campusHasStaffTeam] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campusHasStaffCoach] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campusHasMetroTeam] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campusHasOther] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[campusHasOtherDetails] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[inSchoolNextFall] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [wsn_sp_WsnProject] (
	[WsnProjectID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[partnershipRegion] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[history] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[startDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[stopDate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[details] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[status] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[destinationGatewayCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[departDateFromGateCity] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[arrivalDateAtLocation] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[locationGatewayCity] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[departureDateFromLocation] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[arrivalDateAtGatewayCity] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[flightBudget] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[GatewayCitytoLocationFlightNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[locationToGatewayCityFlightNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[inCountryContact] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[scholarshipAccountNo] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[operatingAccountNo] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AOA] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPTA] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staffCost] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[studentCost] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[insuranceFormsReceived] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CAPSFeePaid] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[adminFeePaid] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[storiesXX] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[stats] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[secure] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateCreated] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastUpdate] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maxNoStaff] [int] NULL ,
	[maxNoStudents] [int] NULL ,
	[projEvalCompleted] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[evangelisticExposures] [int] NULL ,
	[receivedChrist] [int] NULL ,
	[jesusFilmExposures] [int] NULL ,
	[jesusFilmReveivedChrist] [int] NULL ,
	[coverageActivitiesExposures] [int] NULL ,
	[coverageActivitiesDecisions] [int] NULL ,
	[holySpiritDecisions] [int] NULL ,
	[website] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[destinationAddress] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[destinationPhone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[wsnYear] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_IsCoord] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_IsAPD] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fk_IsPD] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[projectType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[studentStartDate] [datetime] NULL ,
	[studentEndDate] [datetime] NULL ,
	[staffStartDate] [datetime] NULL ,
	[staffEndDate] [datetime] NULL ,
	[leadershipStartDate] [datetime] NULL ,
	[leadershipEndDate] [datetime] NULL ,
	[createDate] [datetime] NULL ,
	[lastChangedDate] [datetime] NULL ,
	[lastChangedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[displayLocation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[partnershipRegionOnly] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[internCost] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[onHold] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[maxNoStaffMale] [int] NULL ,
	[maxNoStaffFemale] [int] NULL ,
	[maxNoStaffCouples] [int] NULL ,
	[maxNoStaffFamilies] [int] NULL ,
	[maxNoInternAMale] [int] NULL ,
	[maxNoInternAFemale] [int] NULL ,
	[maxNoInternACouples] [int] NULL ,
	[maxNoInternAFamilies] [int] NULL ,
	[maxNoInternA] [int] NULL ,
	[maxNoInternPMale] [int] NULL ,
	[maxNoInternPFemale] [int] NULL ,
	[maxNoInternPCouples] [int] NULL ,
	[maxNoInternPFamilies] [int] NULL ,
	[maxNoInternP] [int] NULL ,
	[maxNoStudentAMale] [int] NULL ,
	[maxNoStudentAFemale] [int] NULL ,
	[maxNoStudentACouples] [int] NULL ,
	[maxNoStudentAFamilies] [int] NULL ,
	[maxNoStudentA] [int] NULL ,
	[maxNoStudentPMale] [int] NULL ,
	[maxNoStudentPFemale] [int] NULL ,
	[maxNoStudentPCouples] [int] NULL ,
	[maxNoStudentPFamilies] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [cms_CmsCategory] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[CmsCategoryID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [cms_CmsFile] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[CmsFileID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [cms_assoc_FileCategory] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[CmsFileID],
		[CmsCategoryID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
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

ALTER TABLE [crs_CRSCustomOption_DEPRECATED] WITH NOCHECK ADD 
	CONSTRAINT [PK_crs_CRSCustomOption] PRIMARY KEY  CLUSTERED 
	(
		[customOptionID]
	)  ON [PRIMARY] 
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

ALTER TABLE [event_EventCustomAnswer] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[eventCustomAnswerID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [event_EventCustomItem] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[eventCustomItemID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [event_EventCustomQuestion] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[eventCustomQuestionID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [event_EventInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK__event_EventInfo__440B1D61] PRIMARY KEY  CLUSTERED 
	(
		[eventInfoID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [event_EventPerson] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[eventPersonID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [event_EventRegistration] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[eventRegistrationID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [event_EventSpeaker] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[eventPersonID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [event_assocEventsSpeakers] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[eventPersonID],
		[eventInfoID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [fsk_Allocation] WITH NOCHECK ADD 
	CONSTRAINT [PK_fsk_Allocation] PRIMARY KEY  CLUSTERED 
	(
		[allocationID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [fsk_FskOrder] WITH NOCHECK ADD 
	CONSTRAINT [PK_fsk_FskOrder] PRIMARY KEY  CLUSTERED 
	(
		[fskOrderID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [hr_review360_Review360] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[Review360ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [hr_review360_Review360Light] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[Review360LightID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [hr_review360_ReviewSession] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ReviewSessionID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [hr_review360_ReviewSessionLight] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ReviewSessionLightID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [import_StaffAcctBal] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[EMPLID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [linczone_contacts] WITH NOCHECK ADD 
	CONSTRAINT [PK__linczone_contact__467D75B8] PRIMARY KEY  CLUSTERED 
	(
		[ContactID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Activity] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ActivityID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Address] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[AddressID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Assoc_activityContact] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ActivityID],
		[accountNo]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Assoc_dependents] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[DependentID],
		[accountNo]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Assoc_intlContact] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[accountNo],
		[WsnPartnershipID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Assoc_otherMinistries] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[NonCccMinID],
		[TargetAreaID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Assoc_partCoord] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[accountNo],
		[WsnPartnershipID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Authorization] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[AuthorizationID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_ChangeRequest] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ChangeRequestID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Dependent] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[DependentID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_FieldChange] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[FieldChangeID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_LocalLevel] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[teamID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_NonCccMin] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[NonCccMinID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Note] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[NoteID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_RegionalStat] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[RegionalStatID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_RegionalTeam] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[teamID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Staff] WITH NOCHECK ADD 
	CONSTRAINT [PK__ministry_Staff__339FAB6E] PRIMARY KEY  CLUSTERED 
	(
		[accountNo]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_StaffChangeRequest] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ChangeRequestID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_Statistic] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[StatisticID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_TargetArea] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[TargetAreaID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_WsnPartnership] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[WsnPartnershipID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministry_assocTeamStaff] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[fk_accountNo],
		[fk_teamID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministrylocator_assoc_contact] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ministryID],
		[contactID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministrylocator_assoc_ministry_contact] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ministryID],
		[contactID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministrylocator_campus] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[campusID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministrylocator_contact] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[contactID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministrylocator_ministry] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[ministryID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ministryproximity_zipcode] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[zip]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ms_MSApplication] WITH NOCHECK ADD 
	CONSTRAINT [PK_ms_MSApplication] PRIMARY KEY  CLUSTERED 
	(
		[applicationID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [ms_MSReference] WITH NOCHECK ADD 
	CONSTRAINT [PK_ms_MSReference] PRIMARY KEY  CLUSTERED 
	(
		[referenceID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [objectbroker_objectwrapper] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[objectWrapperID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [simplesecuritymanager_user] WITH NOCHECK ADD 
	CONSTRAINT [PK__simplesecurityma__4BB72C21] PRIMARY KEY  CLUSTERED 
	(
		[userID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [staffsite_staffsitepref] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[StaffSitePrefID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [staffsite_staffsiteprofile] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[StaffSiteProfileID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ussp_Campus] WITH NOCHECK ADD 
	CONSTRAINT [PK_ussp_Campus] PRIMARY KEY  CLUSTERED 
	(
		[CampusNumber]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ussp_Placement] WITH NOCHECK ADD 
	CONSTRAINT [PK_ussp_Placement] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ussp_Project] WITH NOCHECK ADD 
	CONSTRAINT [PK_ussp_Project] PRIMARY KEY  CLUSTERED 
	(
		[ProjectCode]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [ussp_Student] WITH NOCHECK ADD 
	CONSTRAINT [PK_ussp_Student] PRIMARY KEY  CLUSTERED 
	(
		[StudentID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [wsn_sp_WsnApplication] WITH NOCHECK ADD 
	CONSTRAINT [PK__wsn_sp_WsnApplication__114A936A] PRIMARY KEY  CLUSTERED 
	(
		[WsnApplicationID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [wsn_sp_WsnProject] WITH NOCHECK ADD 
	CONSTRAINT [PK__wsn_sp_WsnProjec__53584DE9] PRIMARY KEY  CLUSTERED 
	(
		[WsnProjectID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

 CREATE  INDEX [index1] ON [cms_CmsCategory]([parentCategory]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [cms_CmsFile]([accessCount]) WITH  FILLFACTOR = 90 ON [PRIMARY]
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

 CREATE  INDEX [IX_crs_CRSCustomOption] ON [crs_CRSCustomOption_DEPRECATED]([fk_ConferenceID]) ON [PRIMARY]
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

 CREATE  INDEX [index1] ON [event_EventCustomAnswer]([fk_EventRegistration]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [event_EventCustomItem]([fk_EventInfo]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [event_EventCustomQuestion]([fk_EventInfo]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [event_EventRegistration]([fk_EventRegInfo]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [event_EventRegistration]([fk_EventRegPerson]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [IDX_fsk_FskOrder_fk_Allocation] ON [fsk_FskOrder]([fk_Allocation]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [hr_review360_Review360]([fk_ReviewSessionID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [hr_review360_Review360Light]([fk_ReviewSessionLightID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

ALTER TABLE [linczone_contacts] WITH NOCHECK ADD 
	CONSTRAINT [DF__linczone___Entry__477199F1] DEFAULT (getdate()) FOR [EntryDate],
	CONSTRAINT [DF__linczone___First__4865BE2A] DEFAULT (null) FOR [FirstName],
	CONSTRAINT [DF__linczone___LastN__4959E263] DEFAULT (null) FOR [LastName],
	CONSTRAINT [DF__linczone___HomeA__4A4E069C] DEFAULT (null) FOR [HomeAddress],
	CONSTRAINT [DF__linczone_c__City__4B422AD5] DEFAULT (null) FOR [City],
	CONSTRAINT [DF__linczone___State__4C364F0E] DEFAULT (null) FOR [State],
	CONSTRAINT [DF__linczone_co__Zip__4D2A7347] DEFAULT (null) FOR [Zip],
	CONSTRAINT [DF__linczone___Email__4E1E9780] DEFAULT (null) FOR [Email],
	CONSTRAINT [DF__linczone___HighS__4F12BBB9] DEFAULT (null) FOR [HighSchool],
	CONSTRAINT [DF__linczone___Campu__5006DFF2] DEFAULT (null) FOR [CampusName],
	CONSTRAINT [DF__linczone___Campu__50FB042B] DEFAULT (null) FOR [CampusID],
	CONSTRAINT [DF__linczone___Refer__51EF2864] DEFAULT (null) FOR [ReferrerFirstName],
	CONSTRAINT [DF__linczone___Refer__52E34C9D] DEFAULT (null) FOR [ReferrerLastName],
	CONSTRAINT [DF__linczone___Refer__53D770D6] DEFAULT (null) FOR [ReferrerRelationship],
	CONSTRAINT [DF__linczone___Refer__54CB950F] DEFAULT (null) FOR [ReferrerEmail],
	CONSTRAINT [DF__linczone___InfoC__55BFB948] DEFAULT ('F') FOR [InfoCCC],
	CONSTRAINT [DF__linczone___InfoN__56B3DD81] DEFAULT ('F') FOR [InfoNav],
	CONSTRAINT [DF__linczone___InfoI__57A801BA] DEFAULT ('F') FOR [InfoIV],
	CONSTRAINT [DF__linczone___InfoF__589C25F3] DEFAULT ('F') FOR [InfoFCA],
	CONSTRAINT [DF__linczone___InfoB__59904A2C] DEFAULT ('F') FOR [InfoBSU],
	CONSTRAINT [DF__linczone___InfoC__5A846E65] DEFAULT ('F') FOR [InfoCACM],
	CONSTRAINT [DF__linczone___InfoE__5B78929E] DEFAULT ('F') FOR [InfoEFCA],
	CONSTRAINT [DF__linczone___InfoG__5C6CB6D7] DEFAULT ('F') FOR [InfoGCM],
	CONSTRAINT [DF__linczone___InfoW__5D60DB10] DEFAULT ('F') FOR [InfoWesley]
GO

 CREATE  INDEX [index1] ON [ministry_Activity]([fk_targetAreaID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [ministry_Activity]([fk_teamID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index3] ON [ministry_Activity]([periodBegin]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index4] ON [ministry_Activity]([periodEnd]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index5] ON [ministry_Activity]([strategy]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [ministry_Authorization]([fk_AuthorizedBy]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [ministry_Authorization]([fk_changeRequestID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index3] ON [ministry_Authorization]([fk_AuthorizationNote]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [ministry_ChangeRequest]([fk_requestedBy]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [ministry_Staff]([fk_teamID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [ministry_Staff]([fk_primaryAddress]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index3] ON [ministry_Staff]([fk_secondaryAddress]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index4] ON [ministry_Staff]([lastName]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index5] ON [ministry_Staff]([region]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [ministry_Statistic]([fk_Activity]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [ministry_Statistic]([periodBegin]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index3] ON [ministry_Statistic]([periodEnd]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [ministry_TargetArea]([name]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [ministry_TargetArea]([isApproved]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index3] ON [ministry_TargetArea]([state]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index4] ON [ministry_TargetArea]([country]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index5] ON [ministry_TargetArea]([isSecure]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index6] ON [ministry_TargetArea]([region]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [ministrylocator_campus_idx_1] ON [ministrylocator_campus]([state]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [ministrylocator_campus_idx_2] ON [ministrylocator_campus]([country]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [ministrylocator_ministry_idx_1] ON [ministrylocator_ministry]([fk_campusID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [ministryproximity_zipcode_idx_1] ON [ministryproximity_zipcode]([city]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [ministryproximity_zipcode_idx_2] ON [ministryproximity_zipcode]([state]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

ALTER TABLE [simplesecuritymanager_user] WITH NOCHECK ADD 
	CONSTRAINT [DF_simplesecuritymanager_user_emailVerified] DEFAULT ('F') FOR [emailVerified]
GO

 CREATE  INDEX [index1] ON [staffsite_staffsitepref]([fk_StaffSiteProfile]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [staffsite_staffsitepref]([name]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [staffsite_staffsiteprofile]([userName]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

ALTER TABLE [wsn_sp_WsnApplication] WITH NOCHECK ADD 
	CONSTRAINT [DF_wsn_sp_WsnApplication_submittef] DEFAULT ('F') FOR [applicationStatus],
	CONSTRAINT [DF_wsn_sp_WsnApplication_isApplyingForStaffInternship] DEFAULT ('F') FOR [isApplyingForStaffInternship]
GO

 CREATE  INDEX [index1] ON [wsn_sp_WsnApplication]([fk_isMember]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [wsn_sp_WsnApplication]([fk_wsnSpouse]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index3] ON [wsn_sp_WsnApplication]([fk_childOf]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index4] ON [wsn_sp_WsnApplication]([legalLastName]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index5] ON [wsn_sp_WsnApplication]([legalFirstName]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index8] ON [wsn_sp_WsnApplication]([status]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index9] ON [wsn_sp_WsnApplication]([wsnYear]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index10] ON [wsn_sp_WsnApplication]([accountNo]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index11] ON [wsn_sp_WsnApplication]([region]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index12] ON [wsn_sp_WsnApplication]([role]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index1] ON [wsn_sp_WsnProject]([fk_IsAPD]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index2] ON [wsn_sp_WsnProject]([fk_IsPD]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index3] ON [wsn_sp_WsnProject]([fk_IsCoord]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index4] ON [wsn_sp_WsnProject]([wsnYear]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index5] ON [wsn_sp_WsnProject]([status]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index6] ON [wsn_sp_WsnProject]([name]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [index7] ON [wsn_sp_WsnProject]([partnershipRegion]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

