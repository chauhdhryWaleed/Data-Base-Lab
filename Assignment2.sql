create table event (

EID int primary key,
Ename varchar(20),
_location varchar(20),
_type varchar(20),
_start_date date,
start_time time,
end_date date,
end_time time,

)


create table organization(

OID int primary key,
Oname varchar(20),
_address varchar(25),

)

create table Participants(

PID int primary key,
Pname varchar(20),
bdate date,
gender char(1),
OID int ,
foreign key(OID) references organization
on delete set null on update cascade
)

create table sponsors (
EID int ,
OID int ,
Amount int,
primary key(EID,OID),
foreign key(EID) references event
on delete cascade on update cascade,
foreign key(OID) references organization
on delete cascade on update cascade,
)

create table attended (

PID int,
EID int,
primary key(PID,EID),
foreign key(PID) references Participants
 on delete cascade on update cascade,
 foreign key(EID) references event
on delete cascade on update cascade,
)


insert into event values (15,'SOFTECH','FAST LAHORE','Seminar','2023-07-16','12:00:00','2023-07-18','12:00:00')
insert into event values (10,'JOB FAIR','FAST LAHORE','Workshop','2022-09-06','10:00:00','2022-09-06','19:00:00')
insert into event values (5,'Mental Health','FAST LAHORE','Seminar','2023-09-16','12:00:00','2023-09-16','14:00:00')
insert into event values (20,'Impact of ROBOTICS','FAST LAHORE','Conference','2023-07-16','12:00:00','2023-07-18','12:00:00')
insert into event values (01,'Orientation 2023','FAST LAHORE','Seminar','2023-09-15','09:00:00','2023-09-15','12:00:00')
insert into event values (09,'Stack Orientation','FAST LAHORE','Seminar','2023-01-03','09:00:00','2023-01-03','12:00:00')
insert into event values (21,'Importance of AI ','FAST LAHORE','Seminar','2023-01-25','11:00:00','2023-01-25','13:00:00')
insert into event values (41,'Web development','FAST LAHORE','Seminar','2022-12-15','15:00:00','2022-12-15','16:00:00')
insert into event values (12,'Cloud Computing','FAST LAHORE','Workshop','2022-12-05','12:00:00','2022-12-05','14:00:00')
insert into event values (23,'Deen and Duniya','FAST LAHORE','Seminar','2023-01-05','09:00:00','2023-01-05','11:00:00')
insert into event values (11,'Purpose of Life','FAST LAHORE','Workshop','2023-02-15','11:00:00','2023-02-15','16:00:00')
insert into event values (13,'Journey to Google','FAST LAHORE','Seminar','2023-02-05','12:00:00','2023-02-05','14:00:00')
insert into event values (14,'Learn Coding','FAST LAHORE','Seminar','2023-03-05','09:00:00','2023-03-05','12:00:00')
insert into event values (62,'Deep into Python ','FAST LAHORE','Workshop','2022-12-08','11:00:00','2022-12-08','12:00:00')
insert into event values (19,'Building Careers','FAST LAHORE','Seminar','2023-01-03','14:00:00','2023-01-03','16:00:00')

insert into organization values(12,'Bitbytes','Model Town,Lahore')
insert into organization values(2,'Devsinc','Township ,Lahore')
insert into organization values(10,'Techlogix','Faisal Town,Lahore')
insert into organization values(22,'Arbisoft','Bahria Town,Lahore')
insert into organization values(32,'NETSOL','Gulberg ,Lahore')
insert into organization values(01,'FAST NUCES','Faisal Town ,Lahore')

insert into participants values(1,'Hassan Ahmad','2004-12-11','M',32)
insert into participants values(11,'Abdullah Ahmad','2003-10-01','M',32)
insert into participants values(03,'Waleed Ishtiaq','2003-07-16','M',2)
insert into participants values(12,'Muhammad Ali','2003-02-11','M',2)
insert into participants values(04,'Talha Dogar','2002-01-11','M',2)
insert into participants values(13,'Ayesha','2001-12-11','F',NULL)
insert into participants values(08,'Fatima','1999-03-21','F',NULL)
insert into participants values(05,'Zainab','2002-02-11','F',NULL)
insert into participants values(23,'Anaya','1991-01-11','F',12)
insert into participants values(19,'Afeefa','2000-02-28','F',10)



insert into sponsors values(15,01,250000)
insert into sponsors values(10,2,50000)
insert into sponsors values(41,2,150000)
insert into sponsors values(62,2,350000)
insert into sponsors values(20,12,40000)
insert into sponsors values(12,12,500000)
insert into sponsors values(13,32,100000)
insert into sponsors values(14,22,210000)
insert into sponsors values(21,10,60000)

insert into attended values(1,21)
insert into attended values(03,23)
insert into attended values(03,20)
insert into attended values(1,23)
insert into attended values(08,23)
insert into attended values(12,21)
insert into attended values(13,21)
insert into attended values(08,21)
insert into attended values(12,15)
insert into attended values(12,10)
insert into attended values(12,20)
insert into attended values(12,05)
insert into attended values(05,13) 
insert into attended values(13,20)

--QUERY 1

select EID as Event_ID ,Ename as Event_Name
from event


--Query 2

select EID as Event_ID ,Ename as Event_Name,start_time
from event
where _start_date='2023-01-03'


--Query 3

select Pname as Participants_Name
from Participants
where gender='F' and Bdate>'1998-01-01' and OID IS NULL


--Query 4

select Oname as Organization_Name, count(sponsors.EID) as NO_of_Events_Sponsored
from (organization join sponsors on organization.OID=sponsors.OID)
group by Oname
having count(sponsors.EID)>=1

--Query 5

select PID as Participants_ID
from (((organization join sponsors on organization.OID=sponsors.OID)join attended on attended.EID=sponsors.EID) join event on event.EID=attended.EID)
where Oname='Techlogix' AND _start_date='2023-01-25'

--Query 6

select Oname as Organization_Name
from ((organization join sponsors on organization.OID=sponsors.OID) join event on sponsors.EID=event.EID)
except
select Oname
from ((organization join sponsors on organization.OID=sponsors.OID) join event on sponsors.EID=event.EID)
where _type ='Seminar'



--Query 7

select attended.PID as Participants_ID 
from attended
group by attended.PID
having count(attended.PID)=5


--Query 8

select Pname as Participants_Name ,count(EID) as NO_of_Events_Attended
from Participants left outer join attended on Participants.PID=attended.PID
group by Pname,Participants.PID

--Query 9

select max (Amount) as MAX_AMOUNT, min(Amount) as MIN_AMOUNT, avg(amount) as AVG_AMOUNT
from sponsors

--Query 10

select Oname as Organization_Name
from ((organization join sponsors on organization.OID=sponsors.OID) join event on sponsors.EID=event.EID)
where _type='Seminar' and (_start_date>='2022-12-01' or _start_date<='2022-12-31')
intersect
select Oname as Organization_Name
from ((organization join sponsors on organization.OID=sponsors.OID) join event on sponsors.EID=event.EID)
where _type='Workshop' and (_start_date>='2022-12-01' or _start_date<='2022-12-31')

--Query 11

select Participants.Pname as Participants_Name
from ((Participants join attended on Participants.PID=attended.PID)join event on attended.EID=event.EID)
where event._type='Seminar'
except
select Participants.Pname as Participants_Name
from ((Participants join attended on Participants.PID=attended.PID)join event on attended.EID=event.EID)
where event._type='Conference'

--Query 12

select Participants.PID AS Participants_ID
from ((Participants join attended on Participants.PID=attended.PID)join event on attended.EID=event.EID)
where event._start_date='2023-01-05'
UNION
(select Participants.PID AS Participants_ID
from Participants
except
select attended.PID
from attended)
