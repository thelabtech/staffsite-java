DROP TABLE ministrylocator_campus;
CREATE TABLE ministrylocator_campus
(
	campusID varchar(16) NOT NULL,
	name varchar(80),
	city varchar(80),
	state char(2) 
);
ALTER TABLE ministrylocator_campus ADD PRIMARY KEY (campusID);
create index ministrylocator_campus_idx_1 on ministrylocator_campus(state);

DROP TABLE ministrylocator_ministry;
CREATE TABLE ministrylocator_ministry
(
	ministryID varchar(16) NOT NULL,
	strategy varchar(2),
	url varchar(120),
	fk_campusID char(16)
);
ALTER TABLE ministrylocator_ministry ADD PRIMARY KEY (ministryID);
create index ministrylocator_ministry_idx_1 on ministrylocator_ministry(fk_campusID);

DROP TABLE ministrylocator_contact;
CREATE TABLE ministrylocator_contact
(
	contactID varchar(16) NOT NULL,
	firstName varchar(80),
	lastName varchar(80),
	phone varchar(80),
	email varchar(80)
);
ALTER TABLE ministrylocator_contact ADD PRIMARY KEY (contactID);

DROP TABLE ministrylocator_assoc_contact;
CREATE TABLE ministrylocator_assoc_contact
(
	ministryID varchar(16) NOT NULL,
	contactID varchar(16) NOT NULL
);
ALTER TABLE ministrylocator_assoc_contact ADD PRIMARY KEY (ministryID, contactID);
