

--question 1 

create table products(

id int,
namee varchar(20),
price float,
quantity int,

primary key(id),

);

insert into products values (1,'waleed',150,2)

create trigger reminder
on products
instead of insert
as if exists ( select *
              from inserted
			  where inserted.price<0 or inserted.price>1000)
 begin 
 print'Error value outside range'
 end



 --question 2

  create table customer (

  id int,
  namee varchar(20)
primary key(id)

  );

  

  create table orders
  (


   id int,

   cid int,

   primary key(id),
   foreign key(cid) references customer
  

   );

   







	 CREATE TRIGGER r
ON orders
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT *
               FROM deleted d
               INNER JOIN customers c ON d.CID = c.ID)
    BEGIN
        PRINT 'Cannot delete customer because associated orders exist.'
    END
    ELSE
    BEGIN
        DELETE o
        FROM orders o
        INNER JOIN deleted d ON o.CID = d.CID;
    END
END

	 
delete from customer
where id=2


insert into customer values(1,'waleed')

insert into customer values(2,'ali')


insert into orders values(1,1)


delete from customer
where id=1

select * from customer


--question 4 






create table businos (

  id int,
  cid int,
  total float,
  discount float,
  
primary key(id)

  );



  
   create trigger r1
   on businos
   instead of insert ,update
   as if exists( select *
                 from inserted
				 where inserted.discount> 0.1*inserted.total)

	begin 
	 print'Can not execute'
	  
     end



	 drop trigger r1

insert into businos values (3,3,100,23)
update businos
set discount=11
where id=2

select * from businos