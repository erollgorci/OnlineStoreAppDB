CREATE DATABASE OnlineStoreApp1
GO
USE OnlineStoreApp1
GO


Create table Customers(
CustomersID smallint ,
FirstName Char(20),
LastName Char(20),
Email Char(50),
City Char(20),
PostalCode Char(20),
Country Char(20),
CONSTRAINT PK_Customers PRIMARY KEY  CLUSTERED ("CustomersID")
)

Create Table CreditCard
(
CardID smallint PRIMARY KEY foreign key references Customers,
CardNumber char(20),
ExpireDate Char(20),
SecurityCode int,
FirstName Char(20),
LastName Char(20)
)


create table Shippers
(
ShippersID smallint,
CompanyName Char(20),
Phone Char(20),
Country Char(20),
City Char(20),
ShippCost money,
CONSTRAINT "PK_Shippers" PRIMARY KEY  CLUSTERED ("ShippersID")
)

Create table Products(
ProductsID smallint,
ShippersID smallint,
ProductName Char(50),
Category Char(50),
size char(20),
color char(50),
UnitPrice money,
UnitsInStock int,

CONSTRAINT "PK_Products" PRIMARY KEY  CLUSTERED	("ProductsID"),
CONSTRAINT FK_Shippers FOREIGN KEY (ShippersID) REFERENCES Shippers
)

Create table Orders(
OrdersID smallint,
CustomersID smallint,
OrderDate date,
ShipAdress Char(20),
ShipCity Char(20),
ShipPostalCode Char(20),
ShipCountry Char(20),
TotalPayment money,
CONSTRAINT "PK_Orders" PRIMARY KEY  CLUSTERED ("OrdersID"),
CONSTRAINT FK_Customers FOREIGN KEY (CustomersID) REFERENCES Customers
)

create table TN1
(
OrdersID smallint,
ProductsID smallint,
Quantity int,
TotalPrice money,
ArrivalDate date,
CONSTRAINT PK_Orders_Products PRIMARY KEY  CLUSTERED ("OrdersID","productsID"),
CONSTRAINT FK_Orders FOREIGN KEY (OrdersID) REFERENCES Orders,
CONSTRAINT FK_Products FOREIGN KEY (ProductsID) REFERENCES Products
)

insert into Shippers values(1,'FedEx','+1 901 818 7500','United States','Memphis',2.73)
insert into Shippers values(2,'UPS','+1 800 742 5757','Georgia','Atlanta',2.5)
insert into Shippers values(3,'DHL','+1 449 565 1900','USA','Florida',2.75)
insert into Shippers values(4,'Russian Airlines','+500 139 3994','Russia','Moscow',3)
insert into Shippers values(5,'XPO','1 778 834 9777','Connecticut','Greenwhich',3.1)
insert into Shippers values(6,'CEVA','800 888 4949','Switzerland','Baar',2.6)
insert into Shippers values(7,'TIMOCOM','49 211 8826 0','Germany','Dusseldorf',2.45)
insert into Shippers values(8,'CPLP','30 210 4584 950','Greece','Piraeus',4)
insert into Shippers values(9,'EMIRATES','971 4 2672833','United Arab Emirates','Dubai',3.5)
insert into Shippers values(10,'Delta Airlines','1 988 344 3258','Georgia','Atlanta',3.7)

insert into Products values(1,1,'necklace','jewelery','25 cm','silver',0.99,1500)
insert into Products values(2,5,'knives','kitchen','35 cm','silver',20,900)
insert into Products values(3,6,'nutribullet','kitchen','44 cm','black',110,300)
insert into Products values(4,9,'dress','clothes','small','green',50,246)
insert into Products values(5,7,'drone','electronics','67 cm','black',1500,456)
insert into Products values(6,10,'televizion','electronics','55 inch','black',1600,305)
insert into Products values(7,8,'backpack','clothes','45 cm','brown',45,1200)
insert into Products values(8,9,'Fundamentals of Database Systems','books','30 cm','brown',67,489)
insert into Products values(9,7,'refrigetator','kitchen','67 inch','white',600,290)
insert into Products values(10,2,'heater','electronics','70 cm','white',100,345)

Insert into Customers values(1,'Jane','Doe','j.doe@gmail.com','Cardiff','CF144XW','Wales')
Insert into Customers values(2,'Narender','Singh','narender_singh@hotmail.com','Delhi','110020','India')
Insert into Customers values(3,'Marry','Callaban','m-merry@outlook.com','Bihor','417005','Romania')
Insert into Customers values(4,'Gary','Raymond','raymond@gmail.com','Budapest','23001','Hungary')
Insert into Customers values(5,'Andy','Millner','m99@hotmail.com','Berlin','201123','Germany')
Insert into Customers values(6,'Alex','Martin','alex@outlook.com','Los Angelos','50001','USA')
Insert into Customers values(7,'Pelin','Rubia','pelin_0@hotmail.com','Madrid','28080','Spain')
Insert into Customers values(8,'Adnan','Bosturk','adnan_bosturk@yahoo.com','Ankara','06690','Turkey')
Insert into Customers values(9,'Silvia','Mon','smon@gmail.com','Azilal','22000','Morocoo')
Insert into Customers values(10,'Isac','Armstrong','i_armstrong@live.com','New York','10001','USA')

insert into CreditCard values(1,0123563248569652,'01/20',853,'Jane','Doe')
insert into CreditCard values(2,4563256974563250,'01/19',236,'Narender','Singh')
insert into CreditCard values(3,1289696678541559,'12/20',300,'Marry','Callaban')
insert into CreditCard values(4,0987896359645691,'04/23',562,'Gary','Raymond')
insert into CreditCard values(5,1255669874566985,'12/19',102,'Andy','Millner')
insert into CreditCard values(6,4598569852365896,'07/23',895,'Alex','Martin')
insert into CreditCard values(7,7899874569874563,'05/21',452,'Pelin','Rubia')
insert into CreditCard values(8,0123056901578963,'09/21',012,'Adnan','Bosturk')
insert into CreditCard values(9,9654123698547856,'02/22',500,'Silvia','Mon')
insert into CreditCard values(10,0402368954125984,'06/22',369,'Isac','Armstrong')

insert into Orders values(1,5,'2018-12-1','Schulstrasse 4','Berlin','201123','Germany',59.2)
insert into Orders values(2,4,'2018-4-5','Nagymező utca 32','Budapest','23001','Hungary',2359.65)
insert into Orders values(3,7,'2018-12-4','Calle Aduana 29 ','Madrid','28080','Spain',1502.45)
insert into Orders values(4,9,'2018-11-28','Rue Du Sebou 23','Azilal','22000','Morocoo',43.1)
insert into Orders values(5,10,'2018-10-29','636 Greenwich St','New York','10001','USA',94)
insert into Orders values(6,2,'2019-1-1','Pitam Pura 100','Delhi','110020','India',112.6)
insert into Orders values(7,6,'2019-1-1','111 Grand Avenue','Los Angelos','50001','USA',63.1)
insert into Orders values(8,1,'2018-12-12','Oxford Road 11','Cardiff','CF144XW','Wales',57.22)
insert into Orders values(9,3,'2018-12-15','Str. Florilor 8','Bihor','417005','Romania',1502.45)
insert into Orders values(10,8,'2019-1-5','Ulus Mahalle 1463','Ankara','06690','Turkey',70.5)
insert into Orders values(11,5,'2019-1-9','Schulstrasse 4','Berlin','201123','Germany',102.5)
insert into Orders values(12,9,'2018-12-30','Rue Du Sebou 23','Azilal','22000','Morocoo',112.6)

insert into TN1 values(1,1,3,2.97,'2018-12-20')
insert into TN1 values(1,4,1,50,'2018-12-25')
insert into TN1 values(2,4,3,150,'2018-5-1')
insert into TN1 values(2,6,1,1600,'2018-5-6')
insert into TN1 values(2,9,1,600,'2018-5-6')
insert into TN1 values(3,5,1,1500,'2018-12-20')
insert into TN1 values(4,2,2,40,'2018-12-15')
insert into TN1 values(5,7,2,90,'2018-11-29')
insert into TN1 values(6,3,1,110,'2019-1-20')
insert into TN1 values(7,2,3,60,'2019-1-23')
insert into TN1 values(8,1,1,0.99,'2018-12-29')
insert into TN1 values(8,4,1,50,'2018-12-20')
insert into TN1 values(9,5,1,1500,'2018-12-30')
insert into TN1 values(10,8,1,67,'2019-1-25')
insert into TN1 values(11,10,1,100,'2019-1-28')
insert into TN1 values(12,3,1,110,'2019-1-30')

