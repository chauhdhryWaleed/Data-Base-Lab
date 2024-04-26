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



 --question2 


  create table customer (

  id int,
  namee varchar(20)
primary key(id)

  );

 

  create table order1
  (


   id int,

   cid int,

   primary key(id),
   foreign key(cid) references customer
 

   );

   
drop trigger q2
create trigger q2
on customer
instead of delete
as 
	if exists( select *
				from order1 join deleted on deleted.id=order1.cid)

	begin
		print'Can not deleted customer exists'
	end

	else 
	begin
		delete from customer where id in (select id from deleted)
	end

select * from customer

   select * from order1
insert into customer values(1,'waleed')

insert into customer values(2,'ali')
insert into customer values(3,'tt')


insert into order1 values(11,1)

delete from customer where id = 2










 --question3 





 CREATE TABLE logs (
  id INT IDENTITY(1,1) PRIMARY KEY,
  table_name NVARCHAR(100) NOT NULL,
  column_name NVARCHAR(100) NOT NULL,
  old_value NVARCHAR(MAX),
  new_value NVARCHAR(MAX),
  timestamp DATETIME NOT NULL DEFAULT GETDATE()
);

BEGIN
declare @oldCustomerNo varchar(2),
@oldName varchar(30),
@oldCity varchar(3),
@oldPhone varchar(11),
@newCustomerNo varchar(2),
@newName varchar(30),
@newCity varchar(3),
@newPhone varchar(11)
Select @oldCustomerNo= Deleted.customerNo,
@oldName=Deleted.name,
@oldCity=Deleted.city,
@oldPhone= Deleted.phone
From Deleted
Select @newCustomerNo= Inserted.customerNo,
@newName=Inserted.name,
@newCity=Inserted.city,
@newPhone= Inserted.phone
From Inserted
declare @messageString varchar(100)
set @messageString='The record of a customer updated. The fields that have been updated are: '
if @oldCustomerNo!=@newCustomerNo
Begin
set @messageString=@messageString+'Customer No,'
End
if @oldName!= @newName
Begin
set @messageString= @messageString+'Name, '
End
if @oldPhone!= @newPhone
Begin
set @messageString= @messageString+'Phone, '
End
if @oldCity!= @newCity
Begin
set @messageString= @messageString+'City'
End
print(@messageString)



 --question 4
 CREATE TABLE orderrs (
  id INT PRIMARY KEY,
  customer_id INT,
  total DECIMAL(10,2),
  discount DECIMAL(10,2)
);

insert into orderrs values (104,202,200,21)
--update orderrs set discount = 50 where id = 101

select * from orderrs

drop trigger r

CREATE TRIGGER r
ON orderrs
instead of INSERT, UPDATE
AS
BEGIN
  IF EXISTS(
      SELECT *
      FROM inserted
      WHERE discount > (total * 0.1)
  )
  BEGIN
    RAISERROR (' Discount cannot be greater than 10 percent of the total', 16, 1)
    RETURN;
  END

  else 
	begin 
		
		DECLARE @i INT;
		DECLARE @ci INT;
		declare @t DECIMAL(10,2);
		declare @dis DECIMAL(10,2);


		SELECT @i = id, @ci = customer_id, @t = total, @dis = discount 
		FROM inserted
		if exists (select * from orderrs where id = @i)
		begin 
			delete from orderrs where id = @i
		end
		insert into orderrs values (@i,@ci,@t,@dis);
	end
end