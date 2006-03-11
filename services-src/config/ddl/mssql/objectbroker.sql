DROP TABLE objectbroker_objectwrapper;
CREATE TABLE objectbroker_objectwrapper (
	objectWrapperID varchar(40) not null,
	type varchar(80),
	bytes MEDIUMBLOB
);
ALTER TABLE objectbroker_objectwrapper ADD PRIMARY KEY (objectWrapperID);
     
