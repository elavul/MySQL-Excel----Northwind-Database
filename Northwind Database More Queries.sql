-- Northwind Exercises


-- Find the total number of orders in the Orders table.
select count(orderid) as totalorders
from orders;


-- Count the number of customers who have placed orders.
select count(customerid) as totalcustomers
from customers;


-- Retrieve all orders where the order date is in July 1996.
select * 
from orders
where orderdate between '1996-07-01' and '1996-07-31';


select * 
from orders
where orderdate like '1996-07%';


-- Retrieve products with unit prices between 100 and 200.
select *
from products
where price between 10 and 20;


-- Retrieve all columns from the Orders table for orders made by customers whose name starts with "A".
select *
from orders 
where customerid in (select customerid from customers where customername like 'a%');


-- Calculate the average unit price of products.
select avg(price) as avgprice
from products;


-- Retrieve customers whose company names contain 'Food' anywhere in the name.
select customername, country, city
from customers
where customername like '%food%';


-- Get all employees whose last name starts with "S" and first name ends with "L
select *
from employees
where LastName like 's%' and FirstName like '%l';


-- Find all orders made by customers with IDs 1, 3, and 5
select *
from orders
where CustomerID in (1,3,5);


-- Find all products whose name contains "chocolate".
select *
from products
where ProductName like '%chocolate%';


-- Find the maximum unit price of products. 
select max(Price) as highestprice
from products;


-- Retrieve the top 5 most expensive products from the Products table.
select ProductID, ProductName, Price
from products
order by price desc 
limit 5;


-- Find all products whose names start with 'Ch'.
select *
from products 
where ProductName like 'ch%';



