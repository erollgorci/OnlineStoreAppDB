USE OnlineStoreApp1
GO
--The maximum price of an order
select  max(TotalPayment)as[Maximum Price paid for an order]
from Orders

--Customers with more than one order
select FirstName,count(*) as[Order Number]
from Customers,Orders
where Customers.CustomersID=Orders.CustomersID
group by FirstName
having count(*)>1

--Number of products with shipcost lower than 3
select  count(*)as[Number of products with shipcost lower than 3]
from Shippers s,Products p
where s.ShippersID=p.ShippersID and s.ShippCost<3 

--Number of product transported by each shipper
select s.CompanyName,Sum(Quantity)as[Products transported]
from Shippers s,Products p,TN1 t
where p.ShippersID=s.ShippersID and t.ProductsID=p.ProductsID
group by s.CompanyName

--Group all the costumers who have more than a product per order
select o.OrdersID,FirstName,count(*) as[Product per order]
from Customers c,TN1 t,Orders o
where c.CustomersID=o.CustomersID and o.OrdersID=t.OrdersID
group by o.OrdersID,FirstName
having count(*)>1


--City where have been ordered products from category kitchen
select o.ShipCity,count(*) as[KitchenCategory orders]
from Orders o,TN1 t,Products p
where o.OrdersID=t.OrdersID and t.ProductsID=p.ProductsID and p.Category='kitchen'
group by o.ShipCity 


--All products with price greater than 50, and product name diferent from heater
Select FirstName,p.ProductName, p.UnitPrice
from Customers c,Orders o, TN1 t,Products p
where c.CustomersID=o.CustomersID and o.OrdersID=t.OrdersID and t.ProductsID=p.ProductsID and p.UnitPrice>50
and p.ProductName<>'heater'
group by FirstName,p.ProductName,p.UnitPrice


