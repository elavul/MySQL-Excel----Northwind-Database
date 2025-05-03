-- selecting schema
use northwind;

-- or ## return customer info
SELECT * FROM customers;

-- return columns CustomerName, City, and Country
SELECT CustomerName, City, Country FROM customers;

-- product table
SELECT ProductName, ProductID 
FROM products;


-- Write SQL query to return employee FirstName, LastName and BirthDate.
SELECT FirstName, LastName, BirthDate
FROM employees;

-- Write SQL query to return CustomerName, Address and City.
SELECT CUSTOMERNAME, ADDRESS, CITY 
FROM customers;

-- country info
SELECT Country FROM Customers;

-- different country
SELECT DISTINCT Country 
FROM Customers;

-- number of countries (count rows)
SELECT COUNT(Distinct Country) 
FROM Customers;

-- Write SQL query to return different cities from suppliers table. 
SELECT DISTINCT City FROM Suppliers;

-- Write SQL query to return number of cities from customers table.
SELECT COUNT(DISTINCT City) FROM Customers;


-- Where Clause
select *
from Customers
where Country = "Mexico";

-- productid = 1
select *
from products
where productid = 1;

-- Write SQL query to return Customers from London.
select *
from Customers
where City = "London";


-- Write SQL query to return number of Customers from USA.
SELECT COUNT(*) 
FROM customers
WHERE country = 'USA';

SELECT COUNT(*) FROM Customers
where Country = "USA";

select *
from Customers
where city = 'london';

SELECT * FROM Customers
WHERE CustomerID = 1;

SELECT * FROM Products
WHERE Price > 100;

SELECT * FROM Orders
WHERE OrderDate > '1996-07-30';

-- customers not from uk
select *
from customers
where Country != 'UK';

-- customers not from uk
select *
from customers
where Country <> 'UK';

select *
from employees
where employeeid <> 1;


-- Customers with their customerid is equal to and greater than 15.
select * from customers 
where customerID >= 15;

-- return order details where order quantity is less than 3.
SELECT * FROM order_details 
WHERE Quantity < 3;

-- find details of employees who were born after 196
SELECT * FROM employees 
WHERE birthdate > '1960-01-01';

-- customers from country is "Germany" AND city is "Berlin"
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';

SELECT * FROM Suppliers
WHERE Country = 'Japan' AND City = 'Tokyo';

SELECT * FROM Customers
WHERE City = 'Berlin' OR City = 'Stuttgart';

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';

select * from customers
where not country = 'Germany';

-- so far we learned
-- how to select column
-- how to write basic query
-- how to filter results
-- sort results

-- sort by customer country
SELECT * FROM Customers
ORDER BY Country;

-- sort by customer city
SELECT * FROM Customers
ORDER BY City;

-- Write SQL query to return product names and order by Price.
select * from products 
order by Price;

-- country in reverse alphabetical order
SELECT * FROM Customers
ORDER BY Country DESC;

-- if numeric field is used. largest to smallest
SELECT ProductName, Price FROM Products
ORDER BY Price DESC;

-- sort by several fields
SELECT * FROM Customers
ORDER BY Country, CustomerName;

SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;


-- limit
SELECT * FROM Customers
LIMIT 3;

-- 5 cheapeast product
SELECT * FROM Products
ORDER BY PRICE 
LIMIT 5;

SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

SELECT * FROM Products
WHERE CategoryID=1
LIMIT 3;


SELECT MIN(Price) AS SmallestPrice
FROM Products;

SELECT MAX(Price) AS LargestPrice
FROM Products;

SELECT avg(Price) AS LargestPrice
FROM Products;

select SUM(price) 
from products;

select min(productname)
from products;

select max(productname)
from products;

select count(productname)
from products;


-- Like operator
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

-- Like operator
SELECT * FROM Customers
WHERE CustomerName LIKE 'q%';

-- ending with a
SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

SELECT * FROM Customers
WHERE CustomerName LIKE '%food%';

SELECT * FROM Customers
WHERE CustomerName LIKE '%dollar%';

SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

-- find customers whose CustomerName does not start with 'a'.
SELECT * FROM Customers 
WHERE  NOT CustomerName  LIKE 'a%';

-- find all suppliers from countries that contain the substring 'land' (e.g., 'Finland', 'Poland') in the Country field.
SELECT SupplierName, Country
FROM Suppliers
WHERE Country LIKE '%land%';

-- find all employees whose FirstName contains the letter 'n ' as the second character.
SELECT * FROM employees
WHERE FirstName LIKE '_n%';

-- find all shippers whose ShipperName contains the word 'Express'
SELECT * FROM shippers
WHERE ShipperName LIKE '%Express%';

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE NOT Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);


SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

select * from products
order by ProductName;


SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;


SELECT CustomerName AS Customer, ContactName AS "Contact Person"
FROM Customers;
