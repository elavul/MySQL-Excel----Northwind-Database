# Northwind Database Analysis
---
![MySQL](https://img.shields.io/badge/-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Excel](https://img.shields.io/badge/-Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)

> *“Data by itself is silent. Ask it the right questions, and it tells a story.”*
---

---
## 🧠 About the Project: Northwind SQL EDA

The Northwind database is a fictional dataset provided by Microsoft. It simulates the operations of a small company and includes rich data about products, orders, customers, and more.
We perform Exploratory Data Analysis (EDA) using SQL queries to extract insights that inform product performance, customer behavior, sales patterns, and potential areas of growth.

---

### 📚 Table of Contents

 [🎯 Aims of the Project](#-aims-of-the-project) <br>
 [🗂️ Introducing the Dataset](#️-introducing-the-dataset)   <br>
 [🎯 Analysis Techniques Used](#-analysis-techniques-used) <br>
 [🧹 Pre-Analysis: Data Quality Checks](#-pre-analysis-data-quality-checks)   <br>
 [🔗 Understand Relationships](#-understand-relationships)   <br>
 [🧼 Data Modeling & Cleaning](#-data-modeling--cleaning)   <br>
 [🎯 Key Insights](#-key-insights) <br>
 [💼 Final thoughts & business initiatives](#-final-thoughts--business-initiatives) <br>
 [⚠️ Challenges & Limitations](#-challenges--limitations) <br>
 [🚀 What is Next](#-what-is-next)
 
<details>
<summary><strong>📌 Technical Details & Business Questions Explored</strong></summary>

##### *Product strategy* 
- [1) Which suppliers are providing the most products, and what does it tell us?](#1-which-suppliers-are-providing-the-most-products-and-what-does-it-tell-us)
- [2) What categories are we strongest in?](#2-what-categories-are-we-strongest-in)
- [3) Now let's see if there are any inefficiencies in our product categories and what categories bring the most money:](#3-now-lets-see-if-there-are-any-inefficiencies-in-our-product-categories-and-what-categories-bring-the-most-money)

##### *Customer insights*
- [4) Who are our most active customers?](#4-who-are-our-most-active-customers)
- [5) If we want to find out the location of each customer and how much they sold (total quantity sold) we can use this query:](#5-if-we-want-to-find-out-the-location-of-each-customer-and-how-much-they-sold-total-quantity-sold-we-can-use-this-query)
- [6) We can also find out the most sold product by each customer:](#6-we-can-also-find-out-the-most-sold-product-by-each-customer)
- [7) Which customers generate the most revenue?](#7-which-customers-generate-the-most-revenue)

##### *Country-based insights*
- [8) Which country generates the most and least revenue?](#8-which-country-generates-the-most-and-least-revenue)
- [9) Let's find out the best & worst performing categories in Argentina:](#9-lets-find-out-the-best--worst-performing-categories-in-argentina)
- [10) Most popular products and their categories by country:](#10-most-popular-products-and-their-categories-by-country)
- [11) If we want to find out the most popular product in 'Argentina' then we can add this to our existent query:](#11-if-we-want-to-find-out-the-most-popular-product-in-argentina-then-we-can-add-this-to-our-existent-query)

 ##### *Time-based trends* 
- [12) What were our sales patterns in 1996?](#12-what-were-our-sales-patterns-in-1996)
- [13) What is our best-performing month overall?](#13-what-is-our-best-performing-month-overall)
- [14) Which year saw the highest total sales?](#14-which-year-saw-the-highest-total-sales)
- [15) How has revenue changed over time (Year-over-Year & Month-over-Month Trends)?](#15-how-has-revenue-changed-over-time-year-over-year--month-over-month-trends)
- [16) Which products sell the most?](#16-which-products-sell-the-most)

</details>


---
### 🎯 Aims of the Project:

In this project I acted as the data analyst for the Northwind company. I asked 16 questions. My goal was to identify:
- Top-performing products, categories, regions and customers
- Detect market inefficiencies and underperformers
- Analyze sales performance over time (monthly, yearly)
- Country-level opportunities for expansion - an opportunity for expansion

---
### 🗂️ Introducing the Dataset:
The Northwind database consists of several tables that represent different parts of the business. These include:

* Products and Categories: Details about the items sold and their classifications.
* Suppliers and Customers: Information about the vendors and clients.
* Orders and Order Details: Data on customer purchases and their quantities.
* Employees and Shippers: Information on the sales team and shipping providers.

I primarily focused on the Orders, Order Details, and Products tables to understand sales patterns, customer behaviors, and the impact of product categories on overall revenue. Here is a quick look at the schema diagram, which shows how these tables relate to each other:

📥 *SQL File:*  [Uploading Northwind Database create.sql…]()   <br>
🧭 Schema Diagram:

<img src="https://github.com/user-attachments/assets/590ec6bc-4bc9-41b2-932f-c54372787004" alt="Northwind_Database_create_schema_design" width="400"/>

---

### 🎯 Methods I Used for Analysis:

- Exploratory Data Analysis (EDA): Investigated data structure, table relationships, and overall schema.

- Data Modeling: Joining tables (e.g., Customers ↔ Orders ↔ Products), relationship mapping via primary/foreign keys

- Filtering: Custom SQL filters to answer niche business questions (e.g., top products by country, 1996 orders only)

- Aggregation: Grouping by categories, regions, months to calculate revenue, quantity sold, order frequency

- Visualization: Exporting query results to Excel for charts and dashboards

---

#### Additional Analysis Steps:

* Performing EDA, Exploratory Data Analysis, to understand the structure and contents of the database
* Explore relationships between products, suppliers, customers, and orders
* Writing SQL queries to understand data relationships and patterns
* **Joining tables** to get more context (e.g., supplier with product, customer with order)
* Filtering data to answer specific business questions (e.g., identifying meat/poultry products, or orders from 1996)
* Grouping and aggregating (e.g., number of products per category, total quantity ordered)

---
### 🧹 Pre-Analysis: Data Quality Checks

Before diving into the analysis, it's important to ensure the data is **clean, reliable, and ready**. A few simple checks go a long way in ensuring the accuracy of your insights.
**Run SQL queries to check:**
* Missing values: SELECT COUNT(*) FROM users WHERE email IS NULL
* Duplicates: GROUP BY and HAVING COUNT(*) > 1
* Data ranges: MIN, MAX, AVG
* Outliers: e.g., extremely high sales amounts
SELECT * FROM products WHERE price > 100000;

---

### 🔗 Understand Relationships

* Understand primary/foreign keys
* Write efficient **JOINs** between:
   * Products ↔ Categories: Understand which product categories are performing best.
   * Suppliers ↔ Products: Analyzed supplier performance and product availability.
   * Orders ↔ Customers: Linked customer behavior and order history to detect high-value customers.
   * Orders ↔ Employees: Explored sales performance by employee to gauge team effectiveness.
   * Order Details ↔ Products: Analyzed which products are consistently ordered together to optimize product placement.

---

### 🧼 Data Modeling & Cleaning 

* Normalize data where needed

* Rename ambiguous column names

* Standardize date/time formats

* Remove or impute missing data
  
----

### 🎯 Key Insights:
- 80% of revenue comes from 20% of customers, indicating a strong Pareto pattern. This suggests a need for a targeted retention strategy for high-value customers, that could drive more revenue. 
- Argentina generates the lowest revenue despite selling high-margin items, which points to a missed opportunity. The market has potential but lacks the right product mix
- Meat/Poultry is high-margin but understocked.This could be a strategic area to focus on to boost profitability.
- Beverages dominate both in volume and revenue, but some high-volume categories (e.g., Confections, Condiments) underperform in profitability

-----
-----
## Technical Details: SQL and Excel
### 📈 Business Questions Explored
Imagine this dataset came from a real-world client: a small business owner asking for insights into how the company is operating. Their questions might include:

---- 

#### *Product strategy* 
  <details><summary><strong>1) Which suppliers are providing the most products, and what does it tell us? </strong></summary>


#### 1) Which suppliers are providing the most products, and what does it tell us?
 

  
 ![image](https://github.com/user-attachments/assets/f34c4946-e689-43ed-9480-c0fc4b234c0f)
 
![image](https://github.com/user-attachments/assets/5c0b18d4-ac3b-469d-a477-5ebff4130b09)

Using a JOIN between the `suppliers` and `products` tables, we identified which suppliers offer the highest number of products. The results are grouped by the supplier’s name and sorted in descending order.

A high volume of products from a single supplier can indicate a strong partnership. However, it also highlights a potential risk: over-reliance on individual suppliers. Those with broad product lines are critical partners, but they also represent a vulnerability if they experience supply chain disruptions.

This finding is essential for supplier relationship management and negotiation strategy.

**Business Initiative:**  
Establish diversified supplier contracts and introduce contingency planning for high-volume suppliers.
</details>

---
  <details><summary><strong>2) What categories are we strongest in? </strong></summary>
    
#### 2) What categories are we strongest in?
  
![image](https://github.com/user-attachments/assets/9d69dafe-d069-4853-8610-846a10e9a879)

![image](https://github.com/user-attachments/assets/a4c00b99-e7e9-4738-88a8-d811b4cae8fc)

We ranked product categories by the number of products available in each. The top-performing categories dominating the inventory are **Confections**, **Beverages**, **Condiments**, and **Seafood**.

One insight is that marketing campaigns should be focused on these categories to leverage their strength.

For instance, a high number of products in **Beverages** may suggest either specialization or market saturation—both of which can guide product strategy.

**Business Initiative:**  
Invest marketing and inventory resources in top-performing categories.  
Explore expanding product offerings in underrepresented but high-margin categories.
</details>

---
  <details><summary><strong>3) Now let's see if there are any inefficiencies in our product categories and what categories bring the most money: </strong></summary>

#### 3) Now let's see if there are any inefficiencies in our product categories and what categories bring the most money:
* Query:
![image](https://github.com/user-attachments/assets/08f578a0-1bbc-403f-b563-1daf129bfd0e)
* Query results exported into Excel: <br>
![image](https://github.com/user-attachments/assets/df86c17f-05c8-4039-8068-e948a0e06809)
* Chart: <br>
![image](https://github.com/user-attachments/assets/136d78d6-6232-4850-909b-46786c5ccf92)

By calculating the **SUM** and **AVG** of the `Price` column, we gain insight into how well each category performs — or underperforms.

- **Beverages** is the most successful category, generating the highest revenue (~99,600). It combines strong product availability with the second-highest average price, suggesting a focus on premium or luxury items.
  
- **Meat/Poultry** reveals an anomaly: it has high profitability despite low inventory. This is likely due to very high individual product prices, making it a high-margin, low-volume category.

- **Grains/Cereals** is the least performing category across all metrics — lowest revenue, profit margin, and product volume.

- Some categories like **Seafood**, **Condiments**, and **Confections** show **high inventory but low profitability**. They offer many products but generate less revenue, with unit prices often 5–8% below the average.

**What does this tell us?**  
A **low price + high product count** can signal inefficiency or low profitability. However, it may also reflect market dynamics — for example, some items are positioned as luxury products with higher margins, while others (e.g., staple foods) are price-regulated and have lower price points.

**Business Initiative:**  
Audit and optimize underperforming product lines.  
Reassess pricing strategies for low-margin categories, and consider expanding offerings in high-margin segments.<br>

![image](https://github.com/user-attachments/assets/c4140a52-1f74-49c1-9d67-243ab6a2bafa) <br>

We already calculated the average in excel, but if we can do it in MySQL too applying this formula:
SELECT AVG(northwind.products.Price)
FROM northwind.products

-----

📊 Product Price & Revenue Performance by Category

| Metric                        | Value / Category                                      |
|------------------------------|--------------------------------------------------------|
| **Product Price Average**     | 28.92                                                  |
| **Max (Price)**               | Meat/Poultry                                           |
| **Over Average (Price)**      | Beverages, Produce, Dairy products                    |
| **Underperforming (Price)**   | Confections, Condiments, Seafood                      |
| **Min (Price)**               | Grains/Cereals                                         |
| **Revenue Product Avg**       | 1895.125                                              |
| **Max (Revenue)**             | Beverages                                              |
| **Over Average (Revenue)**    | Dairy products, Meat/Poultry, Confections          |
| **Underperforming (Revenue)** | Seafood, Condiments, Produce                          |
| **Min (Revenue)**             | Grains/Cereals                                         |

Other questions whose results might be interesting:
What categories could potentially bring more money if there would be more demand?
</details>

---

#### *Customer insights*

  <details><summary><strong>4) Who are our most active customers? </strong></summary>
    
#### 4) Who are our most active customers?
![image](https://github.com/user-attachments/assets/51816fcf-19e8-4643-9270-c3073731d88c)

![image](https://github.com/user-attachments/assets/4c4f23d0-5ff3-4bf6-b95d-62114e61c2cf)

Understanding who our most loyal customers are helps uncover buying behaviors and identify opportunities to strengthen relationships.

**Why it matters:**  
Loyal customers are key to sustained revenue. By analyzing their behavior, we can create effective **retention strategies**, implement **loyalty programs**, and **bundle frequently purchased products** to drive repeat purchases.

**Business Initiative:**  
- Introduce loyalty programs for high-value customers  
- Bundle products that loyal customers frequently buy together  
- Nurture long-term customer relationships

**Process:**  
Using a `JOIN` between the `orders` and `customers` tables, we identified customers with the **highest number of orders**. The query:
- Uses `GROUP BY` to aggregate orders by customer name  
- Applies `COUNT()` to calculate order frequency  
- Orders results by count in descending order  
- Applies a `LIMIT` of 6 to focus on top performers

**Further Questions to Explore:**
- What are these customers’ purchasing priorities?
- What decisions can the business make based on this insight?
</details>

----
  <details><summary><strong>5) If we want to find out the location of each customer and how much they sold (total quantity sold) we can use this query: </strong></summary>
    
#### 5) If we want to find out the location of each customer and how much they sold (total quantity sold) we can use this query:
![image](https://github.com/user-attachments/assets/b50ed6e5-989f-4cb3-bacb-fafe7e4a3ff4)
![image](https://github.com/user-attachments/assets/8d63468c-dbf1-4f39-82dc-0b162066c607)
</details>

---
  <details><summary><strong>6) We can also find out the most sold product by each customer: </strong></summary>
    
#### 6) We can also find out the most sold product by each customer:
![image](https://github.com/user-attachments/assets/354184a5-d938-49ba-a1be-140cbe454d04)
![image](https://github.com/user-attachments/assets/d007aad6-6f65-479e-8b42-ab856438f265)
</details>

---
  <details><summary><strong>7) Which customers generate the most revenue? </strong></summary>
    
#### 7) Which customers generate the most revenue?
![image](https://github.com/user-attachments/assets/2b765b65-fa3f-4aa1-aea9-77da04b6b252)
![image](https://github.com/user-attachments/assets/03489dc1-2a74-460a-b37d-f9061ca0eb01)

This analysis calculates the **total revenue per customer** using multiple `JOIN`s across the following tables:
- `customers`
- `orders`
- `order_details`
- `products`

**How it works:**
- Revenue is calculated as `Price × Quantity`
- Data is grouped by customer name
- Results are sorted by revenue in
</details>

----

#### *Country-based insights*

  <details><summary><strong>8) Which country generates the most and least revenue? </strong></summary>
    
#### 8) Which country generates the most and least revenue?
![image](https://github.com/user-attachments/assets/70b6bf47-89d4-4d08-a6c9-14b140dfb72a)
![image](https://github.com/user-attachments/assets/2b51a1b1-5f82-4179-ae61-95617689652d)

If we order the Countries in ascending order then we get: <br>
![image](https://github.com/user-attachments/assets/7371ee77-c92f-44d3-ab4e-6a5a7568bbf6)

Here, **Argentina** shows the **lowest revenue** among all countries analyzed.  
This could be due to **low product demand**, **limited customer base**, or the market being concentrated in **a single city**.
</details>

---
  <details><summary><strong>9) Let's find out the best & worst performing categories in Argentina: </strong></summary>
    
#### 9) Let's find out the best & worst performing categories in Argentina:
![image](https://github.com/user-attachments/assets/9d50101a-6ca1-46c5-98fa-4623a7effdc2)

![image](https://github.com/user-attachments/assets/d8eed3be-1396-431b-a0f0-07b4440928a2)

It’s also important to note that currently, **only two product categories** are available in Argentina.

**Business insight:**
From our broader analysis, categories such as **Meat/Poultry** and **Beverages** have consistently performed well across other regions.  
This suggests an opportunity for Argentina to **expand its product offerings** by introducing these high-performing categories into the market.

➡️ Business Insight: Expanding into successful categories could boost demand and revenue in Argentina’s underdeveloped market.
</details>

---
  <details><summary><strong>10) Most popular products and their categories by country: </strong></summary>
    
#### 10) Most popular products and their categories by country:
![image](https://github.com/user-attachments/assets/a05f4c5b-7fb9-4681-9bb7-155ef9d28e8b)
![image](https://github.com/user-attachments/assets/35749e33-591c-4b37-bbe5-ed0145901a1c)
</details>

---
  <details><summary><strong>11) If we want to find out the most popular product in 'Argentina' then we can add this to our existent query: </strong></summary>
  
#### 11) If we want to find out the most popular product in 'Argentina' then we can add this to our existent query:
![image](https://github.com/user-attachments/assets/b466f814-147e-4f2a-9fa2-eab7d8916c21)

The output for Argentina will be: <br>
![image](https://github.com/user-attachments/assets/3fa3265d-5765-4af8-a643-8c9de4cfdf70)

We can choose other countries as well, such as USA:<br>
![image](https://github.com/user-attachments/assets/41c3a4a2-e5bf-4782-b9cd-94c88cd3e68a)
</details>

----

#### *Time-based trends*  

  <details><summary><strong>12) What were our sales patterns in 1996? </strong></summary>
    
#### 12) What were our sales patterns in 1996?
![image](https://github.com/user-attachments/assets/1717a71d-d341-4ba3-a978-ebb0e38e9cc1)
![image](https://github.com/user-attachments/assets/3dce4de2-c2d6-4877-abdb-113db4d31f6b)

This SQL query calculates the **total monthly sales revenue** for the year **1996**.

The query joins relevant tables and groups results by **month**, ordering them chronologically to reveal sales trends over time. We calculate the total sales using Quantity * Price The results are grouped by month and sorted in calendar order.
You can further customize the analysis to focus on a specific country.  
For example, to view sales trends in the **USA** during 1996, simply add the following condition to the query:

![image](https://github.com/user-attachments/assets/33a68c0f-0574-46df-b2d9-67493223e948)
![image](https://github.com/user-attachments/assets/dd059a5a-7aa6-467a-b201-c091424fa343)
</details>

---
  <details><summary><strong>13) What is our best-performing month overall? </strong></summary>
    
#### 13) What is our best-performing month overall?
![image](https://github.com/user-attachments/assets/858f4ad8-62df-4116-b29f-963cd43808e6)
![image](https://github.com/user-attachments/assets/c55274ab-465c-4302-9cf0-e1156477b6a7)

This SQL query identifies the **month with the highest total sales revenue** in the year **1996**.  
It calculates revenue by multiplying **Quantity** from the `order_details` table with **Price** from the `products` table.  
The query joins three core tables: `orders`, `order_details`, and `products`.

**Why it matters:**
Focusing on the peak-performing month helps guide **marketing**, **inventory**, and **sales planning**.  
It reveals when demand is highest, allowing you to **replicate the strategies and campaigns** that worked well.

**Business initiative:**
- Focus operational and marketing resources around peak sales periods  
- Analyze what contributed to success during this time and build on it
</details>

---
  <details><summary><strong>14) Which year saw the highest total sales? </strong></summary>
    
#### 14) Which year saw the highest total sales?
![image](https://github.com/user-attachments/assets/c6337be5-a4c8-48dc-8310-2fd68be8359a)
![image](https://github.com/user-attachments/assets/5668ff09-4f3a-4a4f-97df-e4cc8e2f6a71)

This SQL query helps determine **how much revenue the business generated each year**, based on sales data from the database.
**What the Query Does:**
1. Retrieves the **year** of each order using the `YEAR()` function from the `orders` table.
2. Joins the `order_details` and `products` tables to access `Quantity` and `Price`.
3. Calculates **revenue** per order by multiplying `Quantity * Price`.
4. Aggregates the total revenue per year using `SUM()`.
5. Groups results by year and orders them from **highest to lowest revenue**.

**Why it matters:**
- Provides a **benchmark** for evaluating **growth** and **performance** year-over-year.
- Identifies revenue trends, allowing stakeholders to make **strategic decisions**.
- Helps isolate strong or weak years, enabling further **investigation** and **replication of success**.
For example, the analysis may reveal a decline in 1997. Understanding what worked in 1996 could help the company redress its financial performance.

**Business insight:**
If one year underperforms, it’s an opportunity to:
- Analyze what changed
- Replicate previous successful strategies
- Investigate possible market or operational shifts
</details>

---
  <details><summary><strong>15) How has revenue changed over time (Year-over-Year & Month-over-Month Trends) </strong></summary>

#### 15) How has revenue changed over time (Year-over-Year & Month-over-Month Trends)? <br>
By Year: <br>
![image](https://github.com/user-attachments/assets/7a94edd7-f1cc-4f31-acbd-fbfc28bf814f)
![image](https://github.com/user-attachments/assets/9242ca6b-bfb7-4beb-9235-7535cad543b9)

By month: <br>
![image](https://github.com/user-attachments/assets/d6b12658-95c7-4b53-96b0-2d3829fc279b)
![image](https://github.com/user-attachments/assets/60dafb63-f9f5-4bf9-b5dd-07af190b2234)

Using Excel, and creating a column clustered graph we are able to get the inasights we need faster: <br>
![image](https://github.com/user-attachments/assets/636eef1b-8acd-46ac-9ef8-44b9b904417a)

**Why it matters:**
Tracks business performance trends and helps detect sales spikes, declines, and pricing fluctuations.
Business Initiative: Adjust pricing, volume strategies, and promotions according to historical growth/decline trends.
</details>

---
  <details><summary><strong>16) Which products sell the most? </strong></summary>

#### 16)  Which products sell the most?
![image](https://github.com/user-attachments/assets/682661a8-3935-44e9-a0ef-e4c1a0b5549b)
![image](https://github.com/user-attachments/assets/7475139d-12fb-4069-9905-9e749db29516)
![image](https://github.com/user-attachments/assets/985defbc-cde9-4025-b23a-e2f5ecc350fc)

Also, by changing the ORDER BY to ASC we can see the products who performed the worst:
![image](https://github.com/user-attachments/assets/336b7b90-edfd-4bb3-8cc0-ffbdbc7d7c42)

**Why it matters:**
Reveals customer preferences and drives demand forecasting and marketing focus.
Business Initiative: Push bestsellers with bundles or discounts.

You can view all SQL queries: <br>
</details>

---
---

### 💼 Final thoughts & business initiatives
* Key takeaways:
   * Focus on high-performing suppliers & categories
   * Regional product strategy is essential
   * Use customer data to drive loyalty & personalisation
 
* Action plan:
   * Expand product lines in low-performing regions (e.g. Argentina), starting with high-performing categories from other regions (e.g. Beverages, Meat).
   * Reduce SKU (Stock Keeping Unit) count in low-margin categories like Condiments and Confections.
   * Launch loyalty programs and  bundle popular items for top 10% of customers who drive majority revenue.
   * Reevaluate pricing for low-margin products


### ⚠️ Challenges & Limitations
* Handling joins across multiple tables and ensuring no duplicates in revenue calculation. 
* Since this was a fictional dataset, I didn’t have profit or cost columns, which limits margin analysis. Also, no real-time data or external benchmarks to validate assumptions. If I had access to customer demographics or order frequency data, I’d build a churn or segmentation model.

### 🚀 What is Next 
* I would love to expand this by building a Tableau dashboard with Top 5 customers, Bottom 5 products by margin, revenue by country, time, and category
Include KPIs: YoY growth, Top 5 customers, Bottom 5 products by margin.
* Argentina is underperforming. I should compare it with a peer country maybe (Chile? Brazil?)


---

### Tools used:
SQL – Core language for data querying <br>
Excel - for graphs<br>
MySQL Workbench – Writing, testing, and visualizing SQL <br>

Structyre:
Additional screenshots:
Exporting the query from MySql Workbench into Excel for the creation of charts:
![Screenshot 2025-04-20 162200](https://github.com/user-attachments/assets/4bcf71a8-4db1-4c4d-942d-f6db1157dbea)
