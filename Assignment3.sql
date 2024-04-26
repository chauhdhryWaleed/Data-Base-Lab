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
insert into event values (07,'Career Counselling','FAST LAHORE','Workshop','2023-03-03','12:00:00','2023-03-03','16:00:00')
insert into event values (39,'Book Fair','FAST LAHORE','Workshop','2023-03-12','10:00:00','2023-03-12','17:00:00')


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
insert into participants values(21,'Hakaan Ali','2001-02-28','M',10)

insert into participants values(20,'Riyan','2002-02-28','M',10)
insert into participants values(18,'Shakir','2000-02-28','M',10)

insert into sponsors values(15,01,250000)
insert into sponsors values(10,2,50000)
insert into sponsors values(41,2,150000)
 

insert into sponsors values(39,2,50000)
insert into sponsors values(62,2,350000)
insert into sponsors values(20,12,40000)
insert into sponsors values(12,12,20000)

insert into sponsors values(13,32,125000)
insert into sponsors values(14,22,210000)
insert into sponsors values(32,22,22000)
insert into sponsors values(21,10,60000)
insert into sponsors values(07,10,70000)
insert into sponsors values (34,10,45000)

insert into attended values(1,21)
insert into attended values(1,41)
insert into attended values(1,23)
insert into attended values(03,41)
insert into attended values(03,21)

insert into attended values(03,62)
insert into attended values(03,13)
insert into attended values(03,23)
insert into attended values(03,20)
insert into attended values(04,41)
insert into attended values(04,23)
insert into attended values(05,23)
insert into attended values(05,13)
insert into attended values(05,12)
insert into attended values(05,10)
insert into attended values(05,41)
insert into attended values(08,10)
insert into attended values(08,21)
insert into attended values(08,23)
insert into attended values(08,41)
insert into attended values(12,23)
insert into attended values(11,23)
insert into attended values(11,41)
insert into attended values(12,05)
insert into attended values(12,10)
insert into attended values(12,21)
insert into attended values(12,15)

 insert into attended values(12,62)
 insert into attended values(12,41)
insert into attended values(12,20)
insert into attended values(13,20)
insert into attended values(13,21)
insert into attended values(13,41)
insert into attended values(13,23)
insert into attended values(13,13)
insert into attended values(19,23)


insert into attended values(19,41)
insert into attended values(21,23)
insert into attended values(21,13)
insert into attended values(21,62)
insert into attended values(21,41)
insert into attended values(23,41)
insert into attended values(23,62)
insert into attended values(23,13)
insert into attended values(23,23)
insert into attended values(19,62)
insert into attended values(13,62)
insert into attended values(05,62)
insert into attended values(11,62)
insert into attended values(08,62)
insert into attended values(04,62)
insert into attended values(1,62)
insert into attended values(12,62)
insert into attended values(18,62)
insert into attended values(18,23)
insert into attended values(18,13)
insert into attended values(18,41)







--QUERY 1 





select event._type as Event_Type,event.EID,event.Ename,year(event._start_date) as Year_of_Event,count(attended.PID) as No_of_Participants
from event join attended on event.EID=attended.EID
where event.EID in (select a.EID as Event_id
from event as e join attended as a on e.EID=a.EID
where a.EID in (
select at.EID
from attended as at 
group by at.EID
having count(at.PID)>10
)
group by a.EID,e.Ename
)
group by event._type,event.EID,event.Ename,year(event._start_date)
order by year(event._start_date)





--QUERY 2  

select Participants.PID,Participants.Pname as Name,event.Ename
from  (( Participants left join attended on attended.PID=Participants.PID)  left join   event on event.EID=attended.EID)
where Participants.PID in ( select Participants.PID from Participants)



--query 3 

select E.PID as ID,P.Pname as Name,E.EID
from attended as E join Participants as P on P.PID=E.PID
where not exists (select o.EID
				 from attended as o join Participants as i on o.PID=i.PID
				 where o.PID=E.PID
				 group by o.PID,o.EID
				 except 
				 select attended.EID
				 from attended join Participants on attended.PID=Participants.PID
				 where Participants.Pname='Hakaan Ali' and Participants.PID!=P.PID
				 )
 group by E.PID,P.Pname
having count(E.EID)=(
select count(t.EID)
from Participants as Pa join attended AS t on pa.pid=t.pid
where pa.Pname='Hakaan Ali' 
group by t.PID)



--query 4

select Participants.PID as ID,Participants.Pname as Name
from Participants
where PID in ( 
select attended.PID
from attended join event on attended.EID=event.EID
where event._type='Seminar' and (event._start_date >='2022-01-01'and event._start_date <='2022-12-31')
)


--query 5 


select o.OID,o.Oname
from sponsors as s join organization as o on o.OID=s.OID join event as v on v.EID=s.EID
where not exists  ( select orr.OID,e._type
                   from organization as orr join sponsors as sr on orr.OID=sr.OID join event  as e on e.EID=sr.EID
				   where v._type=e._type  and o.OID!=orr.OID
				   group by e._type,orr.OID
				   )
group by o.OID,o.Oname
having count(s.EID) in (select count(sr.EID)
from sponsors as sr join organization as orr on orr.OID=sr.OID

group by orr.OID)




select sr.OID ,count(*)
from sponsors as sr join event as ev on sr.EID=ev.EID
where exists (select *
              from sponsors as s join event as e on s.EID=E.EID
			  where sr.OID!=s.OID and ev._type=e._type)
group by sr.OID
having count(*)= (select count(*)
                   from sponsors as se join event as ee on se.EID=ee.EID
			  where sr.OID!=se.OID and ev._type=ee._type
			    group by se.OID)
                 


--query 6

select Oname as Organizations_Name
from organization as o
where o.OID not in ( 
select organization.OID 
from ((organization join sponsors on sponsors.OID= organization.OID)join event on event.EID =sponsors.EID)
where event._type='Conference'
)


--query 7
             
			 
select p.Pname as Name, p.PID as ID
from Participants as p
where year(getdate())-year(p.bdate)>(
select year(getdate()) -avg(year(Participants.bdate))
from Participants)


--query 8 

			select event.EID,event.Ename as NAME,count(PID) as Total_Participants
			from event join attended on attended.EID=event.EID
		    where event._start_date>='2022-01-01' and event._start_date<='2022-12-31'
			group by event.EID, event.Ename
			having count(PID)=(
			select min( no_of_participants) 
			from(
			select  count(PID) as no_of_participants
            from event join attended on attended.EID=event.EID
			where event._start_date>='2022-01-01' and event._start_date<='2022-12-31'
			group by event.EID)ab)


		
		
--query 9

select o.OID as Organization_ID, o.OName as Organization_Name
from organization as o
where exists ( select orr.OID 
               from organization as orr join sponsors on orr.OID =sponsors.OID
			   )
--query 10

select Participants.PID as Participant_ID
from Participants
where Participants.PID in(
select attended.PID
from (((organization join sponsors on organization.OID=sponsors.OID)join attended on attended.EID=sponsors.EID) join event on event.EID=attended.EID)
where Oname='Techlogix' AND _start_date='2023-01-25')



--query 11

select pa.PID,pa.Pname as Name
from Participants as pa
where pa.PID in
(select p.PID
  from Participants as p join attended on attended.PID=p.PID
  group by p.PID
  having count (*)=5
  )

  --query 12   


  select p.PID,p.Pname as Name ,count(attended.EID) as Events_Attended_in_2022
  from ((event join attended on event.EID=attended.EID) right join Participants as p on p.PID=attended.PID)
  where exists
  (select e.EID
  from event as e
  where  (e._start_date>='2022-01-01' and e._start_date<='2022-12-31')
  )
  group by p.PID,p.Pname


  -- query 13
  select organization.OID,sponsors.amount,SPONSORS.EID
  from organization join sponsors on sponsors.OID=organization.OID

  select  o.OID as OID,o.Oname as Name,sponsors.Amount as Amount
  from organization as o join sponsors on sponsors.OID= o.OID
  where  sponsors.amount=(select min(Amount)
  from sponsors as s join event on s.EID=event.EID 
  where (event._start_date>='2022-12-01' and event._start_date <='2022-12-31')
  )
  or sponsors.Amount= ( select max(Amount)
  from sponsors as sp join event as e on sp.EID=e.EID 
  where (e._start_date>='2022-12-01' and e._start_date <='2022-12-31')
  )
  

  --query 14

  select o.OID,O.OName as Organization
  from organization as o
  where exists  ( select *
  from (sponsors join event on event.EID= sponsors.EID)
  where o.OID=sponsors.OID and event._type='Seminar' and (event._start_date>='2022-12-01' and event._start_date <='2022-12-31')
  ) AND
  exists(
 select *
  from (sponsors join event on event.EID= sponsors.EID)
  where o.OID=sponsors.OID and event._type='Workshop' and (event._start_date>='2022-12-01' and event._start_date <='2022-12-31')
  )

  --query 15

  select p.PID,p.Pname
  from Participants as p
  where p.PID in (


 (select attended.PID
  from attended join event on event.EID=attended.EID
  where p.PID=attended.PID and event._type='Seminar'
  )
  except
  (
  select attended.PID
  from attended join event  on event.EID=attended.EID
  where p.PID=attended.PID  and event._type='Conference'
  )
  )
  

 

  

                                            --PART B
  --views

  -- view (A)
  
  create view info 
  as select Participants.Pname,event.Ename,event._type ,datediff(day,event._start_date , event.end_date)+1 as Event_Duration_in_Days
  from (( Participants join attended on Participants.PID=attended.PID )join event on event.EID=attended.EID)

  

  -- view (B)
  create view organization_INFO 
  as select organization.OID as Organization_ID,organization.Oname as Name,count(EID) as Total_Events_Sponsored,sum(sponsors.Amount) as Total_Amount
  from organization join sponsors on organization.OID=sponsors.OID
  group by organization.OID,organization.Oname
  having count(EID)>3



  --Triggers (C)
  create trigger reminder
  on sponsors
  for insert,update
  as 
  if exists(select *
             from inserted
			 where inserted.amount>100000)
 begin 
 print'Thankyou for sponsoring such a huge amount'
 end


 
 --TRIGGERS D


 create trigger NEWS
  on event
  for delete
  as
 begin 
 print'Unfortunately the EVENT has been cancelled :( '
 end

 
