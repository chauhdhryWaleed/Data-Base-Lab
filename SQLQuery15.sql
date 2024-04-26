create table login (
username varchar(20) primary key,
password_ varchar(20)

);



CREATE TABLE person (
  ssn INT PRIMARY KEY,
  fname VARCHAR(50),
  lname VARCHAR(50),
  phone_no VARCHAR(15),
  age INT,
  gender VARCHAR(10)
);

CREATE TABLE employee (
  eid INT PRIMARY KEY,
  ssn  int,

  foreign key(ssn) references person
);

CREATE TABLE patient (
  pid INT PRIMARY KEY,
  ssn  int,
  diseaseid int,
  aid int,
  bedid int,
  appointment int,
  foreign key(ssn) references person
);
alter table patient
ADD CONSTRAINT fk_constraint_name1 FOREIGN KEY (diseaseid) REFERENCES disease ;
alter table patient
ADD CONSTRAINT fk_constraint_name FOREIGN KEY (bedid) REFERENCES bed ;
alter table patient
add aid int
alter table patient
ADD CONSTRAINT fk_constraint_name2 FOREIGN KEY (aid) REFERENCES appointment ;

alter table patient
add diseaseid  int

CREATE TABLE doctor (
  eid INT PRIMARY KEY,
  expertise varchar(15),
  qualification varchar(30),
  did int,

 foreign key(did) references department,
 foreign key(eid) references employee


 
);

CREATE TABLE doctor (
  drname INT PRIMARY KEY,
  expertise varchar(15),
  qualification varchar(30),
  gender varchar(10),
  department varchar(15),
  phoneno varchar(12),
 




 
);

create table admin (

eid int primary key,
did int,
deskno int,

 foreign key(did) references department,
foreign key(eid) references employee

);

create table department (

did int primary key,

dlocation varchar(15),

dname varchar(15)

);

create table ward (

wardno int,

did int,
primary key(wardno,did),
 foreign key(did) references department

 );


 create table bed (

 bedno int,
 wardno int,
 did int,

 bedid int primary key,
 FOREIGN KEY (wardno, did) REFERENCES ward (wardno, did)
 );


 create table disease (


 dname varchar(15),
 diseaseid int primary key,
 did int,

  foreign key(did) references department

  );

  create table appointment (
    
	aid int primary key,
	patname varchar(15),
	patage int,
    drEID int,
	drName varchar(15),
	patID int ,
	department_ varchar(20),


	diseaseName varchar(15),
	_date date,

	_time time ,

);



