-- "Which suppliers are providing the most products, thus are the most productive?"
SELECT northwind.suppliers.SupplierName, COUNT(northwind.products.ProductID) AS ProductCount
FROM northwind.suppliers 
JOIN northwind.products ON northwind.suppliers.SupplierID = northwind.products.SupplierID
GROUP BY northwind.suppliers.SupplierName
ORDER BY ProductCount DESC;

-- "What categories are we strongest in?"
SELECT northwind.categories.CategoryName, COUNT(DISTINCT northwind.products.ProductID) AS TotalProducts
FROM northwind.categories
JOIN northwind.products ON northwind.categories.CategoryID = northwind.products.CategoryID
GROUP BY northwind.categories.CategoryName
ORDER BY TotalProducts DESC;

SELECT *
FROM northwind.PRODUCTS

SELECT *
FROM northwind.categories

SELECT AVG(northwind.products.Price)
FROM northwind.products
WHERE northwind.products.CategoryID = '1'

SELECT *
FROM northwind.suppliers
WHERE northwind.suppliers.suppliername LIKE 'Plutzer%'

-- Are there inefficiencies in our product categories? and what categories bring the most money?
SELECT northwind.categories.CategoryName, AVG(northwind.products.Price) AS AvgPrice, SUM(northwind.products.Price) AS SumOfPrice, 
COUNT(DISTINCT northwind.products.ProductID) AS TotalProducts, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.categories
LEFT JOIN northwind.products ON northwind.categories.CategoryID = northwind.products.CategoryID
LEFT JOIN northwind.order_details ON northwind.products.ProductID = northwind.order_details.ProductID 
GROUP BY northwind.categories.CategoryName
ORDER BY AvgPrice ASC;



SELECT 
  c.CategoryName,
  SUM(od.Quantity * od.UnitPrice) AS total_revenue,
  SUM(od.Quantity * (od.UnitPrice * 0.7)) AS estimated_total_cost,
  SUM(od.Quantity * (od.UnitPrice - (od.UnitPrice * 0.7))) AS estimated_profit,
  ROUND(
    (SUM(od.Quantity * (od.UnitPrice - (od.UnitPrice * 0.7))) / 
     SUM(od.Quantity * od.UnitPrice)) * 100, 
    2
  ) AS profit_margin_percent
FROM northwind.categories c
JOIN northwind.products p ON c.CategoryID = p.CategoryID
JOIN northwind.order_details od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY profit_margin_percent DESC;


-- "What categories bring the most money?"
SELECT northwind.categories.CategoryName, SUM(northwind.products.Price) AS SumOfPrice, COUNT(northwind.products.ProductID) AS ProductCount
FROM northwind.categories
JOIN northwind.products ON northwind.categories.CategoryID = northwind.products.CategoryID
GROUP BY northwind.categories.CategoryName
ORDER BY SumOfPrice ASC;

SELECT *
FROM northwind.order_details
JOIN northwind.orders ON northwind.orders.orderID = northwind.order_details.orderID
JOIN northwind.products ON northwind.order_details.productID = northwind.products.productID 
JOIN northwind.categories ON northwind.products.categoryID = northwind.categories.categoryID

-- Who are our most active customers?
SELECT northwind.customers.CustomerName, COUNT(northwind.orders.OrderID) AS OrdersCount
FROM northwind.customers
JOIN northwind.orders ON northwind.customers.CustomerID = northwind.orders.CustomerID
GROUP BY northwind.customers.CustomerName
ORDER BY OrdersCount DESC
LIMIT 6;

-- Most Sold Product by Each Customer and Their Location
SELECT northwind.customers.CustomerName, northwind.customers.City, northwind.products.ProductName, SUM(northwind.order_details.Quantity) AS QuantitySold
FROM northwind.customers
JOIN northwind.orders ON northwind.customers.CustomerID = northwind.orders.CustomerID
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID
GROUP BY northwind.customers.CustomerID, northwind.products.ProductID
ORDER BY northwind.customers.CustomerName, QuantitySold DESC;


SELECT northwind.customers.CustomerName, northwind.customers.City, SUM(northwind.order_details.Quantity) AS TotalQuantitySold
FROM northwind.customers
JOIN northwind.orders ON northwind.customers.CustomerID = northwind.orders.CustomerID
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
GROUP BY northwind.customers.CustomerName, northwind.customers.City
ORDER BY TotalQuantitySold DESC;


-- Which customers generate the most revenue?
SELECT northwind.customers.CustomerName, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.customers
JOIN northwind.orders ON northwind.customers.CustomerID = northwind.orders.CustomerID
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID 
GROUP BY northwind.customers.CustomerName
ORDER BY Revenue DESC
LIMIT 6;


-- Which city generates  the most revenue?
SELECT northwind.customers.City, northwind.customers.Country, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.customers
JOIN northwind.orders ON northwind.customers.CustomerID = northwind.orders.CustomerID
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID 
WHERE northwind.customers.Country = 'USA'
GROUP BY northwind.customers.City
ORDER BY Revenue DESC
LIMIT 5;

-- Which country generates the most revenue?
SELECT northwind.customers.Country, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.customers
JOIN northwind.orders ON northwind.customers.CustomerID = northwind.orders.CustomerID
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID 
GROUP BY northwind.customers.Country
ORDER BY Revenue ASC;

-- Most popular products by country
SELECT northwind.customers.Country, northwind.products.ProductName, northwind.categories.CategoryName, SUM(northwind.order_details.Quantity) AS TotalSold
FROM northwind.customers
JOIN northwind.orders ON northwind.customers.CustomerID = northwind.orders.CustomerID
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.order_details.ProductID = northwind.products.ProductID
JOIN northwind.categories ON northwind.categories.CategoryID = northwind.products.CategoryID
GROUP BY northwind.customers.Country, northwind.products.ProductID
ORDER BY northwind.customers.Country, TotalSold DESC;

--  Query Option 1: High Avg Price + Low Revenue
SELECT 
  northwind.categories.CategoryName,
  AVG(northwind.products.Price) AS AvgPrice,
  SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue,
  COUNT(DISTINCT northwind.products.ProductID) AS TotalProducts
FROM northwind.products
JOIN northwind.categories 
  ON northwind.products.CategoryID = northwind.categories.CategoryID
JOIN northwind.order_details 
  ON northwind.order_details.ProductID = northwind.products.ProductID
GROUP BY northwind.categories.CategoryName
HAVING 
  AVG(northwind.products.Price) > 30 AND 
  SUM(northwind.order_details.Quantity * northwind.products.Price) < 50000
ORDER BY AvgPrice DESC;

-- Query Option 2: High Avg Price + Low Quantity Sold

SELECT 
  northwind.categories.CategoryName,
  AVG(northwind.products.Price) AS AvgPrice,
  SUM(northwind.order_details.Quantity) AS TotalQuantitySold,
  SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.products
JOIN northwind.categories 
  ON northwind.products.CategoryID = northwind.categories.CategoryID
JOIN northwind.order_details 
  ON northwind.order_details.ProductID = northwind.products.ProductID
GROUP BY northwind.categories.CategoryName
HAVING 
  AVG(northwind.products.Price) > 30 AND 
  SUM(northwind.order_details.Quantity) < 100
ORDER BY AvgPrice DESC;


ORDER BY AvgPrice DESC;




-- Best & Worst Performing Categories in Argentina
SELECT northwind.categories.CategoryName, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.customers
JOIN northwind.orders ON northwind.customers.CustomerID = northwind.orders.CustomerID
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.order_details.ProductID = northwind.products.ProductID
JOIN northwind.categories ON northwind.products.CategoryID = northwind.categories.CategoryID
WHERE northwind.customers.Country = 'France'
GROUP BY northwind.categories.CategoryName
ORDER BY Revenue DESC;

-- Worst Categories (same query with ASC)



-- What are our monthly sales patterns for 1996?
SELECT MONTH(northwind.orders.OrderDate) AS Month, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.orders
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID 
WHERE YEAR(OrderDate) = 1996
GROUP BY MONTH(OrderDate)
ORDER BY Month;


Revenue
-- What are our monthly sales patterns for 1996 in Argentina?
SELECT MONTH(northwind.orders.OrderDate) AS Month, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.orders
JOIN northwind.customers ON northwind.customers.CustomerID = northwind.orders.CustomerID
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID 
WHERE YEAR(OrderDate) = 1996 AND northwind.customers.Country= 'USA'
GROUP BY MONTH(OrderDate)
ORDER BY Month;

-- Best and worst performing categories in Argentina?


-- What is our best-performing month overall?
SELECT MONTH(northwind.orders.OrderDate) AS Month, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.orders
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID 
WHERE YEAR(OrderDate) = 1996
GROUP BY MONTH(OrderDate)
ORDER BY Revenue DESC
LIMIT 1;

-- Which year saw the highest total sales?
SELECT YEAR(northwind.orders.OrderDate) AS Year, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue
FROM northwind.orders
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID 
GROUP BY YEAR(OrderDate)
ORDER BY Revenue DESC


-- How has revenue changed over time (Year-over-Year & Month-over-Month Trends)? By Year:
SELECT YEAR(northwind.orders.OrderDate) AS Year, SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue,
       AVG(northwind.products.Price) AS AveragePrice
FROM northwind.orders
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID
GROUP BY YEAR(OrderDate)
ORDER BY Year;

-- By Month (All Years):
SELECT YEAR(northwind.orders.OrderDate) AS Year, MONTH(northwind.orders.OrderDate) AS Month,
       SUM(northwind.order_details.Quantity * northwind.products.Price) AS Revenue,
       AVG(northwind.products.Price) AS AveragePrice
FROM northwind.orders
JOIN northwind.order_details ON northwind.orders.OrderID = northwind.order_details.OrderID
JOIN northwind.products ON northwind.products.ProductID = northwind.order_details.ProductID
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- Which products sell the most?
SELECT northwind.products.ProductName, SUM(northwind.order_details.Quantity) AS TotalSold
FROM northwind.products
JOIN northwind.order_details ON northwind.products.ProductID = northwind.order_details.ProductID
GROUP BY northwind.products.ProductName
ORDER BY TotalSold ASC;

-- Which products never sell?
SELECT northwind.products.ProductName
FROM northwind.products
JOIN northwind.order_details ON northwind.products.ProductID = northwind.order_details.ProductID
WHERE od.ProductID IS NULL;




