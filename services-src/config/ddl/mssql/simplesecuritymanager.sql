DROP TABLE simplesecuritymanager_user;
CREATE TABLE simplesecuritymanager_user (
	username VARCHAR (80) NOT NULL, 
	password VARCHAR (80), 
	lastLogin datetime, 
	createdOn datetime, 
	PRIMARY KEY(username)
); 

     
