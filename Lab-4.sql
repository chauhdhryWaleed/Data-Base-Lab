create table salesman(id int NOT NULL,salesman varchar(30),city varchar(30),commission float);

insert into salesman VALUES(5001, 'James Hoog','New York', 0.15);
insert into salesman VALUES(5002, 'Nail Knite', 'Paris', 0.13);
insert into salesman VALUES(5005, 'Pit Alex', 'London', 0.11);
insert into salesman VALUES(5006, 'Mc Lyon' ,'Paris', 0.14);
insert into salesman VALUES(5007, 'Paul Adam' ,'San Jose', 0.13);
insert into salesman VALUES(5003, 'Lauson Hen', 'San Jose', 0.12);

create table orders(order_no int NOT NULL,purchamt float ,ord_date date,customer_id int NOT NULL,salesman_id int);


INSERT INTO orders VALUES(70001, 150.5, '2012-10-05', 3005, 5006);
INSERT INTO orders VALUES(70009, 270.65, '2011-09-10', 3001 ,5005);
INSERT INTO orders VALUES(70002, 65.26, '2014-10-05' ,3002 ,5001);
INSERT INTO orders VALUES(70004, 110.5, '2011-08-17' ,3009 ,5003);
INSERT INTO orders VALUES(70007, 948.5, '2012-09-10', 3005 ,5006);
INSERT INTO orders VALUES(70005, 2400.6, '2010-07-27', 3007 ,5001);
INSERT INTO orders VALUES(70008, 5760, '2013-09-10' ,3002 ,5001);
INSERT INTO orders VALUES(70010, 1983.43, '2010-10-10', 3004 ,5005);
INSERT INTO orders VALUES(70003, 2480.4, '2013-10-10', 3009 ,5003);
INSERT INTO orders VALUES(70012, 250.45, '2010-06-27', 3008 ,5002);
INSERT INTO orders VALUES(70011, 75.29, '2014-08-17', 3003 ,NULL);
INSERT INTO orders VALUES(70013, 3045.6, '2010-04-25', 3002 ,NULL);
create table customers(id int NOT NULL,name varchar(30),city varchar(30),grade int,salesman_id int);

INSERT INTO customers VALUES(3002, 'Nick Rimando', 'New York', 100 ,5001);
INSERT INTO customers VALUES(3007, 'John Brad Davis', 'New York', 200, 5001);
INSERT INTO customers VALUES(3005, 'Graham Zusi', 'California' ,200, 5002);
INSERT INTO customers VALUES(3008, 'Julian Green', 'London' ,300 ,5002);
INSERT INTO customers VALUES(3004, 'Fabian Johnson', 'Paris' ,300, 5006);
INSERT INTO customers VALUES(3009, 'Geoff Cameron', 'Berlin' ,100, 5003);
INSERT INTO customers VALUES(3003, 'Jozy Altidor', 'Moscow' ,200, 5007);
INSERT INTO customers VALUES(3001, 'John Brad Guzan', 'London', Null, 5005);

alter table customers add constraint pk_customers primary key(id);
alter table orders add constraint pk_orders primary key (order_no);
alter table salesman add constraint pk_salesman primary key (id);
alter table customers add constraint fk_customers foreign key(salesman_id) references salesman
on delete set null on update cascade
alter table orders add constraint fk_orders foreign key (salesman_id) references salesman
on delete set null on update cascade
alter table orders add constraint fk1_orders foreign key (customer_id) references customers


--query 3

select id,city
from salesman

--query 4
select name
from customers
where city='New York'
order by name asc

--query 5

sp_rename 'salesman.salesman','full_name','COLUMN';


--query 6
select *
from customers
where (city='New York' or city='London' or city='Paris') and name like '%John%'

--query 7

select name
from customers
where name like '%a%'
--query 8
select *
from orders
order by ord_date desc

--query 9

select *
from orders
where month(ord_date)=1

--query 10
select ord_date ,Year(ord_date) as Year, day(ord_date)/7 + 1 as week, day(ord_date) + 273 as total_days_of_year, month (ord_date) as month, day (ord_date)as day, day(ord_date)%7  as day_of_week
from orders
where month (ord_date) =10

--query 11
select customer_id
from orders
where (ord_date>='2012-1-1' and ord_date<='2012-12-31') and (ord_date>='2014-1-1' and ord_date<='2014-12-31')

--query 12 
select distinct name, customer_id
from orders join customers on customer_id=id
where (ord_date>='2012-1-1' and ord_date<='2012-12-31') and not (ord_date>='2014-1-1' and ord_date<='2014-12-31')

--query 13
update orders
set purchamt=purchamt*3
where month(ord_date)=10

--query 14
update salesman
set commission=commission+0.5
where city='San Jose'

--query 15
select commission,ord_date,full_name
from orders join salesman on id=orders.salesman_id