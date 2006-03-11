DROP TABLE IF EXISTS staffsite_staffsitepref;
CREATE TABLE staffsite_staffsitepref (
  StaffSitePrefID varchar(64) NOT NULL,
  name varchar(64) ,
  displayName varchar(255) ,
  value varchar(255) ,
  fk_StaffSiteProfile varchar(64) ,
  PRIMARY KEY (StaffSitePrefID),
  INDEX IDX_staffSite_StaffSitePref_fk_StaffSiteProfile (fk_StaffSiteProfile)
);

DROP TABLE IF EXISTS staffsite_staffsiteprofile;
CREATE TABLE staffsite_staffsiteprofile (
  StaffSiteProfileID varchar(64) NOT NULL,
  firstName varchar(64) ,
  lastName varchar(64) ,
  userName varchar(64) ,
  changePassword char(1) ,
  accountNo varchar(64) ,
  isStaff char(1) ,
  email varchar(64) ,
  passwordQuestion varchar(64) ,
  passwordAnswer varchar(64) ,
  PRIMARY KEY (StaffSiteProfileID),
  INDEX IDX_staffSite_StaffSiteProfile_userName (userName)
);


