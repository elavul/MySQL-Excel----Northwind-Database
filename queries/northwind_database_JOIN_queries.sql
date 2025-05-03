use northwind;
-- joins

select *
from orders
inner join customers
on orders.CustomerID = customers.CustomerID;

select orders.OrderID, customers.CustomerID, customers.CustomerName
from orders -- left table
inner join customers -- right table
on orders.CustomerID = customers.CustomerID;

/* joins are required to combine information 
from two or more tables. When combining tables
1) you need to write what type of join
2) what field to use to combine them
in this example we combine orders and customers 
table based on customerid. beacuse customerid is found in 
both these tables.

-- products and suppliers table*/

select products.ProductName, suppliers.SupplierName
from products
inner join suppliers
on products.SupplierID = suppliers.SupplierID;


SELECT SupplierName, ProductName
FROM Products
INNER JOIN Suppliers
on Products.SupplierID = Suppliers.SupplierID
where SupplierName = "G'day, Mate";

SELECT CategoryName, SupplierName, ProductName
FROM Products
INNER JOIN Suppliers
on Products.SupplierID = Suppliers.SupplierID
inner join categories 
on products.CategoryID = categories.CategoryID
where SupplierName = "G'day, Mate";

/* Query writing strategy 
1) decide which tables are needed
2) locate common fields
3) decide which fields to return
4) use below structure
5) where 
6) order by
select
from
inner join 
on
*/
-- list the employees who handled each order, along with the order date.
select FirstName, lastname, orderdate, EmployeeID
from employees
inner join orders
on employees.EmployeeID = orders.employeeid;

-- find all orders shipped by a specific shipper (e.g., ShipperName = 'Speedy Express').
select shippername, orderid
from shippers
inner join orders
on shippers.shipperid = orders.shipperid
where ShipperName = 'Speedy Express';

--  display all products along with their category names.
SELECT Products.ProductName, Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;
-- default join in sql is inner join

SELECT Products.ProductName, Categories.CategoryName
FROM categories
JOIN products ON Products.CategoryID = Categories.CategoryID;

-- list all products and their quantities for each order.
SELECT Order_Details.OrderID, Order_Details.Quantity, Products.ProductName 
FROM Products 
INNER JOIN Order_Details 
ON Order_Details.ProductID = Products.ProductID;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders -- left table 
RIGHT JOIN Employees  -- right table 
ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where orders.orderid is null
ORDER BY Customers.CustomerName;


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;
-- cross join = full outer 

-- number of customers per country
select count(CustomerID), country -- count=aggregate country=non-aggregate
from customers
group by country;


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

-- The following SQL statement lists the number of orders sent by each shipper:
select count(Orders.OrderID) as numberoforders, ShipperName
from orders
join shippers
on orders.shipperid = shippers.shipperid
group by ShipperName;

select count(Orders.OrderID) as numberoforders , ShipperName, orderdate
from orders
join shippers
on orders.shipperid = shippers.shipperid
group by ShipperName, orderdate;

-- The following SQL statement lists the total sales by product:
-- sales = quantity * price
select sum(quantity*price) as totalsales, ProductName
from products
join order_details
on products.ProductID = order_details.ProductID
group by ProductName
order by totalsales desc;


-- top 5 products with highest sales
select sum(quantity*price) as totalsales, ProductName
from products
join order_details
on products.ProductID = order_details.ProductID
group by ProductName
order by totalsales desc
limit 5;



-- list the number of customers in each country.
SELECT COUNT(CustomerID) AS total_customers, country
FROM customers
GROUP BY country;

-- list each product category and the total quantity of products sold in that category.
SELECT categories.CategoryName, SUM(Order_Details.Quantity) AS totalquantitysold
FROM Order_Details
JOIN Products ON Order_Details.ProductID = Products.ProductID
JOIN categories ON Products.CategoryID = Categories.CategoryID
GROUP BY categories.CategoryName;


-- list each employee and the number of orders they have handled.
SELECT count(orders.EmployeeID), Employees.EmployeeId, Employees.firstname, Employees.lastname
FROM Orders 
JOIN Employees  
ON Orders.EmployeeID = Employees.EmployeeID
group by employees.employeeId, Employees.firstname, Employees.lastname;

SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(o.OrderID) AS NumberOfOrders
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY NumberOfOrders DESC;

 
SELECT COUNT(orderID) as TotalOrders, CONCAT(FirstName, " ", LastName) AS FullName
FROM orders
INNER JOIN employees
ON orders.EmployeeID = employees.EmployeeID
GROUP BY FullName
ORDER BY TotalOrders DESC;


select count(orders.OrderID) as nooforders,FirstName,LastName
from orders
join employees
on orders.EmployeeID = employees.EmployeeID
group by employees.EmployeeID;
