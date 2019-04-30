CREATE database DreamHomeRentalDatabase; #create dreamhomerentaldatabase
CREATE TABLE `branch` (      
  `branchNo` char(4) NOT NULL,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postcode` char(10) NOT NULL,
  PRIMARY KEY (`branchNo`)
) ; # Create branch table
INSERT INTO `branch` VALUES
 ('B002','56 Clover Dr','London','NW10 6EU'),
 ('B003','163 Main St','Glasglow','G11 9QX'),
 ('B004','32 Manse Rd','Bristol','BS99 1NZ'),
 ('B005','22 Deer Rd','London','SW1 4EH'),
 ('B007','16 Argyll St','Aberdeen','AB2 3SU');
 # Insert values into branch table
 CREATE TABLE `client` (
  `clientNo` char(4) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `telNo` varchar(45) NOT NULL,
  `prefType` varchar(45) NOT NULL,
  `maxRent` int(11) NOT NULL,
  `eMail` varchar(45) NOT NULL,
  PRIMARY KEY (`clientNo`)
) ; # Create client table
INSERT INTO `client` VALUES 
('CR56','Aline','Stewart','0141-848-1825','Flat',350,'astewart@hotmail.com'),
('CR62','Mary','Tregear','01224-196720','Flat',600,'maryt@hotmail.co.uk'),
('CR74','Mike','Ritchie','01475-392178','House',750,'mritchit01@yahoo.co.uk'),
('CR76','John','Kay','0207-774-5632','Flat',425,'john.kay@gmail.com');
# Insert values into clien table
CREATE TABLE `privateowner` (
  `ownerNo` char(4) NOT NULL,
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `telNo` varchar(45) NOT NULL,
  `eMail` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`ownerNo`)
); # Create private owner table
INSERT INTO `privateowner` VALUES 
('CO40','Tina','Murphy','63 Well St, Glasgow G42',
'0141-943-1728','tinam@hotmail.com','********'),
('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX',
'01224-861212','jkeogh@lhh.com','********'),
('CO87','Carol','Farrel','6 Achray St, Glasgow G32 9DX',
'0141-357-7419','cfarrel@gmail.com','********'),
('CO93','Tony','Shaw','12 Park Pl, Glasgow G4 0QR',
'0141-225-7025','tony.shaww@ark.com','********');
# Insert values into private owner table
CREATE TABLE `propertyforrent` (
  `propertyNo` char(4) NOT NULL,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postcode` char(10) NOT NULL,
  `type` varchar(45) NOT NULL,
  `rooms` int(11) NOT NULL,
  `rent` int(11) NOT NULL,
  `ownerNo` char(4) NOT NULL,
  `staffNo` char(4) DEFAULT NULL,
  `branchNo` char(4) NOT NULL,
  PRIMARY KEY (`propertyNo`)
); # Create property for rent table
INSERT INTO `propertyforrent` VALUES 
('PA14','16 Holhead','Aberdeen','AB7 5SU','House','6',650,'CO46','SA9','B007'),
('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat','4',450,'CO93','SG14','B003'),
('PG21','18 Dale Rd','Glasgow','G12','House','5',600,'CO87','SG37','B003'),
('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat','3',375,'CO93','SG37','B003'),
('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat','3',350,'CO40',NULL,'B003'),
('PL94','6 Argyll St','London','NW2','Flat','4',400,'CO87','SL31','B005');
# Insert valuew into property for rent table
CREATE TABLE `registration` (
  `clientNo` char(4) NOT NULL,
  `branchNo` char(4) NOT NULL,
  `staffNo` varchar(45) NOT NULL,
  `dateJoined` date NOT NULL,
  PRIMARY KEY (`clientNo`),
  KEY `branchNo_idx` (`branchNo`),
  CONSTRAINT `branchNo` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`)
); # Create registration table

INSERT INTO `registration` VALUES 
('CR56','B003','SG37','2012-04-11'),
('CR62','B007','SA9','2012-03-07'),
('CR74','B003','SG37','2011-11-16'),
('CR76','B005','SL41','2013-01-02');
# Insert values into registration table
CREATE TABLE `staff` (
  `staffNo` char(4) NOT NULL,
  `fName` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `salary` int(11) NOT NULL,
  `branchNo` char(4) NOT NULL,
  PRIMARY KEY (`staffNo`),
  CONSTRAINT name_unique UNIQUE (fname, lname)
  
) ; # Create staff table
INSERT INTO `staff` VALUES 
('SA9','Mary','Howe','Assistant','F','1970-02-19',9000,'B007'),
('SG14','David','Ford','Supervisor','M','1958-03-24',18000,'B003'),
('SG37','Ann','Beech','Assistant','F','1960-11-10',12000,'B003'),
('SG5','Susan','Brand','Manager','F','1940-06-03',24000,'B003'),
('SL21','John','White','Manager','M','1945-10-01',30000,'B005'),
('SL41','Julie','Lee','Assistant','F','1965-06-13',9000,'B005');
# Insert values into staff table
alter table staff
add constraint staffno_unique UNIQUE(staffNo);
# Alter staff table to have unique constraint on staffNo
alter table staff 
add constraint chk_sex CHECK (sex in ('M','F'));
# Alter staff table to have check constraint on sex is male or female
CREATE TABLE `viewing` (
  `clientNo` char(4) NOT NULL,
  `propertyNo` char(4) NOT NULL,
  `viewDate` date NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`clientNo`),
  KEY `propertyNo_idx` (`propertyNo`),
  CONSTRAINT `propertyNo` 
  FOREIGN KEY (`propertyNo`)
  REFERENCES `propertyforrent` (`propertyNo`)
); # Create table viewing 
INSERT INTO `viewing` VALUES 
('CR','PG36','2013-04-28',NULL),
('CR5','PG4','2013-05-26',NULL),
('CR56','PA14','2013-05-24','too small'),
('CR62','PA14','2013-05-14','no dining room'),
('CR76','PG4','2013-04-20','too remote');
# Insert values in viewing table
INSERT INTO staff VALUES 
('SA10','Mary','Howe','Assistant','F',
'1997-03-02',10000,'B022');
# Insert new data into staff table
select * from staff;

INSERT INTO staff VALUES 
('SA12','London','Lowe','Assistant','M',
'1965-06-13',1000,'B003','58','9000');
# Insert new data into staff table
alter table viewing add constraint CHECK_CONST check (viewDate);
# Alter table viewing to have check constraint on the date porperty is viewed
INSERT INTO `viewing` VALUES 
('CR90','PG36','2000-09-09',NULL);
# Insert new data into viewing table
create table registration_tmp(
`regNo` char(4) NOT NULL,
`regcliNo` char(4) NOT NULL,
`regstafNo` char(4) NOT NULL);

# Create temporary registration table 
insert into registration_tmp (regNo, regcliNo, regstafNo)
select
	  branchNo, clientNo, staffNo
from 
    registration;

select *
from registration_tmp;
# Insert a set of rows from registration table to new table
create view lyricView as
select *
From clients
where prefType = 'Flat' WITH CHECK OPTION;
# View created for clients to see only property with flat as the prefType
select *
from lyricView;

CREATE VIEW ManagerStaff
AS SELECT *
FROM Staff
WHERE branchNo = 'B003';
# View created for manager to see which staff works from a specific branch
select *
from ManagerStaff;

alter table staff
add column age int not null;
# Alter table to add age column 
alter table staff
add column averageSal int not null;
# Alter table to add averageSal column
select avg(salary) as myavg
from staff;
update staff
set averageSal = (select avg(salary)) ;
# Get average salary from staff and insert data into new column averageSal 
update staff
set age = (
SELECT  YEAR(current_timestamp)-
 YEAR("1959-12-12")-
(RIGHT(current_timestamp,6) < RIGHT("1971-06-08",5)) );
select * 
from staff;
# Get age from staff and insert data into new column averageSal 
Load data 
		infile 'c://ProgramData/MySQL/MySQL Server 
						8.0/Uploads/excelImport.csv'
                        INTO TABLE viewing
                        FIELDS TERMINATED BY ',' 
                        ENCLOSED BY '"'
                        LINES STARTING BY '\n'
                        IGNORE 1 ROWS;
# Load data from excel file into viewing table
DESCRIBE viewing;
# Describe schema of viewing table 
show databases;

use dreamhomerentaldatabase;

show tables;

SELECT * FROM staff
INTO OUTFILE '/tmp/staff.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

# Load data from staff table into csv outfile









