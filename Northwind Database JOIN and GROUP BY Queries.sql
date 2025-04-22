-- Nortwind Joins and Group by Exercises
-- Write SQL query to find supplier of each product
select productname, productid, suppliername
from products as p
join suppliers as s
on p.supplierid = s.supplierid;


-- Write sql query to  find category of each product.
select productname, categoryname
from products as p
join categories as c
on p.categoryid = c.categoryid;

-- Retrieve all products belonging to the meat/poultry category
select productname, categoryname
from products as p
join categories as c
on p.categoryid = c.categoryid
where categoryname = 'meat/poultry';

-- Retrieve the order ID, order date, customer name, and employee name for all orders.
select o.orderid, o.orderdate, c.customername, e.firstname, e.lastname
from orders as o
join employees as e
on o.employeeid = e.employeeid
join customers as c
on c.customerid = o.customerid;

-- Retrieve the product name, category name, and supplier name for all products.
select productname, categoryname, suppliername
from products as p
join suppliers as s
on p.supplierid = s.supplierid
join categories as c
on c.categoryid = p.categoryid;

-- Create a report for all the orders of 1996 and their Customers.
select year(orderdate), customername
from orders as o
join customers as c
on o.customerid = c.customerid
where year(orderdate) = 1996;


select orderdate, customername
from orders as o
join customers as c
on o.customerid = c.customerid
where orderdate between '1996-01-01' and '1996-12-31';


-- Retrieve all categories along with the number of products in each category.
select count(productname) as totalproducts, categoryname
from products as p
join categories as c
on p.categoryid = c.categoryid
group by categoryname
order by totalproducts desc;

-- Retrieve all products with their prices and the quantity ordered for each product.
select price, sum(quantity) as totalquantity, p.productid
from products as p
join order_details as od 
on p.productid = od.productid
group by productid;

