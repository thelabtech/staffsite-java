DROP TABLE fsk_Allocation
GO

CREATE TABLE fsk_Allocation(
allocationID varchar(64) not null,
accountNo varchar(12) null,
natlDonation varchar(12) null,
region varchar(2) null,
regionalAllotment varchar(12) null,
regionallyRaised varchar(12) null,
locallyRaised varchar(12) null,
natlNotes varchar(1024) null,
regNotes varchar(1024) null,
localNotes varchar(1024) null,
firstName varchar(30) null,
lastName varchar(30) null
)
GO

ALTER TABLE fsk_Allocation ADD CONSTRAINT PK_fsk_Allocation PRIMARY KEY (allocationID)
GO


DROP TABLE fsk_FskOrder
GO

CREATE TABLE fsk_FskOrder(
fskOrderID varchar(64) not null,
campusName varchar(128) null,
region varchar(6) null,
localAcctNo1 varchar(10) null,
localAcctNo2 varchar(10) null,
localAcctNo3 varchar(10) null,
localAcctNo4 varchar(10) null,
staffFirstName varchar(30) null,
staffLastName varchar(30) null,
staffPhone varchar(24) null,
staffEmail varchar(50) null,
dateCreated datetime null,
dateUpdated datetime null,
contactFirstName varchar(30) null,
contactLastName varchar(30) null,
contactPhone varchar(24) null,
contactPager varchar(24) null,
contactCell varchar(24) null,
contactEmail varchar(50) null,
kitShipName varchar(30) null,
kitShipAddress1 varchar(35) null,
kitShipAddress2 varchar(35) null,
kitShipCity varchar(30) null,
kitShipState varchar(6) null,
kitShipZip varchar(10) null,
kitShipPhone varchar(24) null,
totalKits varchar(7) null,
bagToyImp varchar(7) null,
bagToyWay varchar(7) null,
bagToyDes varchar(7) null,
bagToyEp varchar(7) null,
bagToyESC varchar(7) null,
bagToyMisc varchar(7) null,
bibleIsiNT varchar(7) null,
bibleTwo varchar(7) null,
bibleThree varchar(7) null,
bibleMisc varchar(7) null,
videoRel varchar(7) null,
videoRelCD varchar(7) null,
videoThirsty varchar(7) null,
videoThirstyCD varchar(7) null,
videoChang varchar(7) null,
videoChangCD varchar(7) null,
videoSurfer varchar(7) null,
videoSurferCD varchar(7) null,
videoClimbing varchar(7) null,
videoClimbingCD varchar(7) null,
videoImpact varchar(7) null,
videoImpactCD varchar(7) null,
videoTestimonyCD varchar(7) null,
videoJfpCD varchar(7) null,
videoJesusVCD varchar(7) null,
videoMisc varchar(7) null,
bookMTAC varchar(7) null,
bookMTACSpan varchar(7) null,
bookCaseForC varchar(7) null,
bookCaseForF varchar(7) null,
bookBeyond varchar(7) null,
bookRelevant varchar(7) null,
bookSurvUS varchar(7) null,
bookMisc varchar(7) null,
cdHipHop varchar(7) null,
cdSetApart varchar(7) null,
cdMisc varchar(7) null,
cdHispanic varchar(7) null,
cardReg varchar(7) null,
cardAfAm varchar(7) null,
cardHispanic varchar(7) null,
cardAsian varchar(7) null,
planner varchar(7) null,
fk_Allocation varchar(64) null
)
GO

ALTER TABLE fsk_FskOrder ADD CONSTRAINT PK_fsk_FskOrder PRIMARY KEY (fskOrderID)
GO

ALTER TABLE fsk_FskOrder FOREIGN KEY (fk_Allocation) REFERENCES fsk_Allocation(allocationID)
GO

CREATE INDEX IDX_fsk_FskOrder_fk_Allocation ON fsk_FskOrder (fk_Allocation)
GO


