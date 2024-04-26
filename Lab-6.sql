SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[ItemNo] [int] NOT NULL,
	[Name] [varchar](10) NULL,
	[Price] [int] NULL,
	[Quantity in Store] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (100, N'A', 1000, 100)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (200, N'B', 2000, 50)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (300, N'C', 3000, 60)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (400, N'D', 6000, 400)
/****** Object:  Table [dbo].[Courses]    Script Date: 02/17/2017 13:04:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerNo] [varchar](2) NOT NULL,
	[Name] [varchar](30) NULL,
	[City] [varchar](3) NULL,
	[Phone] [varchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C1', N'AHMED ALI', N'LHR', N'111111')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C2', N'ALI', N'LHR', N'222222')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C3', N'AYESHA', N'LHR', N'333333')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C4', N'BILAL', N'KHI', N'444444')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C5', N'SADAF', N'KHI', N'555555')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C6', N'FARAH', N'ISL', NULL)
/****** Object:  Table [dbo].[Order]    Script Date: 02/17/2017 13:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderNo] [int] NOT NULL,
	[CustomerNo] [varchar](2) NULL,
	[Date] [date] NULL,
	[Total_Items_Ordered] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (1, N'C1', CAST(0x7F360B00 AS Date), 30)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (2, N'C3', CAST(0x2A3C0B00 AS Date), 5)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (3, N'C3', CAST(0x493C0B00 AS Date), 20)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (4, N'C4', CAST(0x4A3C0B00 AS Date), 15)
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 02/17/2017 13:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC,
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (1, 200, 20)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (1, 400, 10)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (2, 200, 5)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (3, 200, 60)

GO
/****** Object:  ForeignKey [FK__OrderDeta__ItemN__4316F928]    Script Date: 02/03/2017 13:55:38 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ItemNo])
REFERENCES [dbo].[Items] ([ItemNo])
GO
/****** Object:  ForeignKey [FK__OrderDeta__Order__4222D4EF]    Script Date: 02/03/2017 13:55:38 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderNo])
REFERENCES [dbo].[Order] ([OrderNo])
GO


-- view


create view v1
as select OrderDetails.OrderNo,sum(items.price*orderDetails.quantity) as total_price
from OrderDetails join items on OrderDetails.ItemNo=items.ItemNo
group by OrderDetails.OrderNo

select *
from v1
select *
from v2
select *
from v3
select *
from v4

create view v2
as select OrderDetails.ItemNo
from items join OrderDetails on items.ItemNo=OrderDetails.ItemNo
group by OrderDetails.ItemNo
having sum(orderdetails.Quantity)>20



create view v3
as select [Order].CustomerNo
from OrderDetails join   [Order]  on OrderDetails.OrderNo=[order].OrderNo  join Items on OrderDetails.ItemNo=Items.ItemNo
group by [order].CustomerNo
having sum(items.price*orderDetails.quantity)>2000




create view v4 
as select customers.CustomerNo
from Customers
where Customers.Phone is not null



create view v5 
as select customers.CustomerNo
from Customers
where Customers.Phone is not null
with check option





-- PROCEDURES

create procedure p1

@Ono int,
@Ino int,
@Quan int
as 

begin 
Declare @Q int
  select @Q= Items.[Quantity in Store]   from Items where items.ItemNo=@Ino 
if @Q>@Quan
begin 
insert into OrderDetails values (@Ono,@Ino,@Quan) 

update items
set items.[Quantity in Store]=items.[Quantity in Store]- @Quan
where items.ItemNo=@Ino
end
else
begin
print 'only ' + cast(@Q as varchar(10))+' is present which is less then required quantity'
end
end

drop procedure p1



execute p1 @Ono=4,@Ino=200,@Quan=2
		    


			select *
			from items

			select *
			from OrderDetails


			
		create procedure p2
		@ID varchar(2),
		@name varchar(30),
		@city varchar(3),
		@phoneno varchar(11),
		@flag1 int OUTPUT,
		@flag2 int OUTPUT,
		@flag3 int OUTPUT,
		@flag4 int OUTPUT
			AS
			BEGIN
				  
			  If not exists( select C.CustomerNo from Customers as C where C.CustomerNo=@ID)
			  begin
				 
		          If ((@city is not NULL) and (LEN(@phoneno)=6))
						begin
						     
						 set @flag1=0	
						 insert into Customers values(@ID,@name,@city,@phoneno)	 
                       end
				   
				  end
				   else
				   begin
				        if exists(select C.CustomerNo from Customers as C where C.CustomerNo=@ID)
				        begin
					        set  @flag2=1
								 
				        end
                            If (@city is NULL)
				           begin
					          set  @flag3=2
							  	 
				           end

                        if ( LEN(@phoneno)!=6)
				        begin
					        set  @flag4=3
							
					    end
                     end
				END

			drop procedure p2


				declare @flagOut1 int 
				declare @flagOut2 int 
				declare @flagOut3 int 
				declare @flagOut4 int 


				execute p2
				
				@ID='C0',
				@name='Waleed',
				@city= 'Lahore',
				@phoneno='123456',
				
				@flag1=@flagOut1 output,
				
				@flag2=@flagOut2 output,
				@flag3=@flagOut3 output,
				@flag4=@flagOut4 output

				select @flagOut1 as flag0
				select @flagOut2 as flag1
				select @flagOut3 as flag2
				select @flagOut4 as flag3


				select *
				from Customers
create procedure p3
@Ono int,
@Cno varchar(5)
as

begin 
declare @name varchar(20)
if exists( select [order].OrderNo
           from [order]
		   where [order].CustomerNo= @Cno and [order].OrderNo=@Ono)
    begin

	
	delete from [order]
	where [order].CustomerNo= @Cno and [order].OrderNo=@Ono
	print' record has been deleted'
	end

else
begin 
print'order no'
print @Ono  
print 'is not of customer no '
print @Cno 
print 'with name'
(select @name= customers.Name
	from Customers
	where CustomerNo=@Cno)
print @name
end
end

drop procedure p3
execute p3 @Ono=3 ,@Cno='C0'



create procedure p4 
@name varchar(19),
@points float output
as 
begin 

declare @id varchar(3)
declare @ono int

if exists(select * from Customers as C where C.Name=@name)
begin
select @id= Customers.CustomerNo
from Customers
where Customers.Name=@name

select @ono= [order].OrderNo
from [order]
where @id=[order].CustomerNo
print 'order no'
print @ono

print'id of customer is'
print @id
set @points= (select sum(items.price*orderDetails.quantity)/100 as total
from  OrderDetails join items on OrderDetails.ItemNo=items.ItemNo
where OrderDetails.OrderNo=@Ono
group by OrderDetails.OrderNo
having (sum(items.price*orderDetails.quantity)>100)
)
print 'points'
print @points
end
end

drop procedure p4
declare @ppp float

execute p4 @name='AHMED ALI',
@points=@ppp output


select @ppp as total_points

select *
from [Customers]