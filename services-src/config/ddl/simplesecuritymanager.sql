drop table if exists simplesecuritymanager_user;
CREATE TABLE simplesecuritymanager_user (
	username VARCHAR (80) NOT NULL, 
	password VARCHAR (80), 
	lastLogin DATETIME, 
	createdOn DATETIME, 
	PRIMARY KEY(username)
); 

     
