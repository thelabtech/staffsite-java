DROP TABLE IF EXISTS cms_CmsCategory;

CREATE TABLE cms_CmsCategory(
CmsCategoryID varchar(64) not null,
parentCategory varchar(64) null,
catName varchar(255) null,
catDesc varchar(255) null,
path text null,
pathid text null
);

ALTER TABLE cms_CmsCategory ADD CONSTRAINT PK_cms_CmsCategory PRIMARY KEY (CmsCategoryID);


DROP TABLE IF EXISTS cms_CmsFile;

CREATE TABLE cms_CmsFile(
CmsFileID varchar(64) not null,
mime varchar(128) null,
title varchar(256) null,
accessCount int null,
dateAdded date null,
dateModified date null,
moderatedYet char(1) null,
summary text null,
quality varchar(256) null,
expDate date null,
lastAccessed date null,
modMsg text null,
keywords text null,
url varchar(128) null,
detail text null,
language varchar(128) null,
version varchar(128) null,
author varchar(256) null,
submitter varchar(256) null,
contact varchar(256) null,
rating int null
);

ALTER TABLE cms_CmsFile ADD CONSTRAINT PK_cms_CmsFile PRIMARY KEY (CmsFileID);
ALTER TABLE cms_CmsFile ADD INDEX idx_cms_CmsFile_1(accessCount);

DROP TABLE IF EXISTS cms_assoc_FileCategory;
CREATE TABLE cms_assoc_FileCategory (
	CmsFileID varchar(64) not null,
	CmsCategoryID varchar(64) not null
);
ALTER TABLE cms_assoc_FileCategory ADD CONSTRAINT PK_cms_assoc_FileCategory PRIMARY KEY (CmsFileID, CmsCategoryID);
