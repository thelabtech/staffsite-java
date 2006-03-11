drop table if exists ministryproximity_zipcode;
create table ministryproximity_zipcode (
     zip int not null,
     city varchar(80),
     state char(2),
     latitude float,
     longitude float
);
ALTER TABLE ministryproximity_zipcode ADD PRIMARY KEY (zip);
create index ministryproximity_zipcode_idx_1 on ministryproximity_zipcode(city);
create index ministryproximity_zipcode_idx_2 on ministryproximity_zipcode(state);
     
