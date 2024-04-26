create table Products(
ProductId int primary key,
ProductName varchar(200),
CategoryId int,
Price float
);
create table Customers
(
CustomerId int primary key,
CustomerName varchar(20),
City varchar(20)
);
create table Orders
(
OrderId int primary key,
CustomerId int,
OrderDate date,
foreign key (CustomerId) references Customers
on delete set null on update cascade
);
create table OrderDetails
(
OrderDetailId int primary key,
OrderId int,
ProductId int,
Quantity int,
foreign key(OrderId) references Orders
on delete cascade on update cascade,
foreign key(ProductId) references Products
on delete set null on update cascade
);
Insert into Products values(1,'Lays Salted 200mg',1,18),(2,'Coca Cola 500 ml',1,19),
(3,'Dairy Milk Chocolate 100 mg',2,10),(4,'Nestle Water Bottle 250ml',2,22),
(5,'Lipton Tea 500 mg',2,21.35),(6,'Kitkat 100mg',2,25),(7,'Pears Soap',7,30),
(8,'Coca Cola Diet 500 ml',2,40),(9,'Sprite 1.5L',6,97),(10,'Pepsi 1.5L',8,31),
(11,'Dollar Pen',4,21),(12,'Aquafina Water Bottle 250 ml',4,38),(13,'Notebook',8,6),
(14,'Wallet',7,230),(15,'Keychain Batman',2,15.5),(16,'Lu Gala',3,17.45)

insert into customers values (1,'Furqan', 'Lahore');
insert into customers values (2,'Ahmad', 'Lahore');
insert into customers values (3,'Ali', 'Karachi');
insert into customers values (4,'Hamza', 'Islamabad');
insert into customers values (5,'Ayesha', 'Sahiwal');
insert into customers values (6,'Fatima', 'Lahore');
insert into customers values (7,'Nabeel', 'Quetta');
insert into customers values (8,'Asad', 'Lahore');
insert into customers values (9,'Imtiaz', 'Peshawar');
insert into customers values (10,'Kashif', 'Rawalpindi');
insert into customers values (11,'Hammad', 'Lahore');
insert into customers values (12,'Burhan', 'Islamabad');
insert into customers values (13,'Rida', 'Karachi');


insert into orders values('10248',9,'1996-07-04'),('10249',2,'1996-07-05'),('10250',3,'1996-07-08'),('10251',1,'1996-07-08'),('10252',4,'1996-07-09'),('10253',5,'1996-07-10'),('10254',6,'1996-07-11')

insert into OrderDetails values(1,10248,1,12),(2,10248,2,10),(3,10248,7,5),
(4,10249,1,9),(5,10249,2,40),(6,10250,2,10),(7,10250,2,35),(8,10250,4,15),(9,10251,5,6),
(10,10251,6,15),(11,10251,9,20),(12,10252,10,40),(13,10252,2,25),(14,10252,3,40),
(15,10253,3,20),(16,10253,5,42),(17,10253,8,40),(18,10254,7,15),(19,10254,12,21)

--Q-1
select CustomerName,ProductName
from ((Customers join Orders on Customers.CustomerId=Orders.CustomerId) join OrderDetails on Orders.OrderId=OrderDetails.OrderId) join Products on Products.ProductId=OrderDetails.ProductId

--q2
select CustomerName,sum(Products.Price) as Total_Purchase_Price
from ((Customers join Orders on Customers.CustomerId=Orders.CustomerId) join OrderDetails on Orders.OrderId=OrderDetails.OrderId) join Products on Products.ProductId=OrderDetails.ProductId
group by CustomerName, Customers.CustomerId
--q3
select CustomerName
from ((Customers join Orders on Customers.CustomerId=Orders.CustomerId) join OrderDetails on Orders.OrderId=OrderDetails.OrderId) join Products on Products.ProductId=OrderDetails.ProductId
where ProductName='Nestle Water Bottle 250ml'


--q4
select ProductName
from ((Customers join Orders on Customers.CustomerId=Orders.CustomerId) join OrderDetails on Orders.OrderId=OrderDetails.OrderId) join Products on Products.ProductId=OrderDetails.ProductId
where CustomerName='Ayesha'

--q5
select CustomerName,count (Products.ProductId) as No_of_Total_Purchase_Products
from ((Customers join Orders on Customers.CustomerId=Orders.CustomerId) join OrderDetails on Orders.OrderId=OrderDetails.OrderId) join Products on Products.ProductId=OrderDetails.ProductId
group by CustomerName

--q6

select CustomerName,sum(Products.Price) as Total_Purchase_Price
from ((Customers join Orders on Customers.CustomerId=Orders.CustomerId) join OrderDetails on Orders.OrderId=OrderDetails.OrderId) join Products on Products.ProductId=OrderDetails.ProductId
group by CustomerName


--q7 
select ProductId, count (OrderDetails.Quantity) as Total_Sold
from OrderDetails
group by ProductId

--q8 
select CustomerName, count(Orders.OrderId) as total_sold
from (((Customers join Orders on Customers.CustomerId=Orders.CustomerId) join OrderDetails on Orders.OrderId=OrderDetails.OrderId)join Products on Products.ProductId=OrderDetails.ProductId)
group by Customers.CustomerId,CustomerName
Having count(Orders.OrderId)<10


