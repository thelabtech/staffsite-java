DROP TABLE cms_CmsCategory;
CREATE TABLE cms_CmsCategory(
	CmsCategoryID varchar(64) not null,
	parentCategory varchar(64) null,
	catName varchar(256) null,
	catDesc varchar(2000) null,
	path varchar(2000) null,
	pathid varchar(2000) null,
	PRIMARY KEY(CmsCategoryID)
);
CREATE INDEX index1 on cms_CmsCategory(parentCategory);


DROP TABLE cms_CmsFile;
CREATE TABLE cms_CmsFile(
	CmsFileID varchar(64) not null,
	mime varchar(128) null,
	title varchar(256) null,
	accessCount int null,
	dateAdded datetime null,
	dateModified datetime null,
	moderatedYet char(1) null,
	summary varchar(4000) null,
	quality varchar(256) null,
	expDate datetime null,
	lastAccessed datetime null,
	modMsg varchar(4000) null,
	keywords varchar(4000) null,
	url varchar(128) null,
	detail varchar(4000) null,
	language varchar(128) null,
	version varchar(128) null,
	author varchar(256) null,
	submitter varchar(256) null,
	contact varchar(256) null,
	rating int null
	PRIMARY KEY(CmsFileID)
);


CREATE INDEX index1 on cms_CmsFile(accessCount);

DROP TABLE cms_assoc_FileCategory;
CREATE TABLE cms_assoc_FileCategory (
	CmsFileID varchar(64) not null,
	CmsCategoryID varchar(64) not null,
	PRIMARY KEY(CmsFileID, CmsCategoryID)
);