# Pizza Sales Data Analysis Using PostgreSQL

## 1. Project Overview

This project focuses on analyzing pizza sales data using PostgreSQL and SQL. The objective is to transform raw sales data into meaningful business insights by answering business questions related to sales performance, product demand, order patterns, and revenue contribution.

The project contains four CSV datasets, SQL table creation scripts, data import instructions, and SQL queries organized into Basic, Intermediate, and Advanced analysis.

**Project Name:** Pizza Sales Data Analysis Using PostgreSQL  
**Domain:** Data Analytics and Business Intelligence  
**Database:** PostgreSQL  
**Tools:** PostgreSQL, pgAdmin, SQL, CSV, GitHub  
**Analysis Levels:** Basic, Intermediate, Advanced

## 2. Problem Statement

A pizza business generates data about customer orders, pizza types, sizes, prices, and quantities sold. However, raw data does not directly explain which products perform best, how sales vary by time, or which categories contribute the most revenue.

The goal of this project is to organize the available datasets into a relational database and use SQL queries to analyze sales performance, identify patterns, and answer business questions.

## 3. Project Objectives

- Calculate the total number of orders and total sales revenue.
- Identify the highest-priced pizza and the most common pizza size ordered.
- Find the most frequently ordered pizza types.
- Analyze pizza quantities by category.
- Understand the distribution of order activity by hour.
- Calculate daily pizza sales and average daily quantity.
- Identify the highest-revenue pizza types.
- Calculate revenue contribution percentages.
- Analyze cumulative revenue over time.
- Rank pizza types within each category based on revenue.

## 4. Dataset Description

The `Data/` folder contains four CSV files.

### 4.1 orders.csv

Contains order-level information.

Expected columns:
- `order_id`: Unique order identifier.
- `date`: Date when the order was placed.
- `time`: Time when the order was placed.

![link](../Pizza-Sales-SQL-Analysis/blob/main/Data/orders.csv)

### 4.2 order_details.csv

Contains individual order-line information.

Expected columns:
- `order_details_id`: Unique order-line identifier.
- `order_id`: Associated order identifier.
- `pizza_id`: Pizza variant identifier.
- `quantity`: Number of units ordered.

### 4.3 pizzas.csv

Contains pizza variant information.

Expected columns:
- `pizza_id`: Unique pizza variant identifier.
- `pizza_type_id`: Associated pizza type.
- `size`: Pizza size.
- `price`: Listed price for that variant.

### 4.4 pizza_types.csv

Contains pizza product information.

Expected columns:
- `pizza_type_id`: Unique pizza type identifier.
- `name`: Pizza name.
- `category`: Pizza category.
- `ingredients`: Ingredients used.

## 5. Repository Structure

```text
Pizza-Sales-SQL-Analysis/

├── Data/
│   ├── orders.csv
│   ├── order_details.csv
│   ├── pizza_types.csv
│   └── pizzas.csv
│
├── Questions/
│   ├── Pizza_Sales_Questions.txt
│   └── .gitkeep
│
└── SQL Queries/
│    ├── Create Table and Import Data
│    ├── Basic Questions
│    ├── Intermediate Questions
│   └── Advanced Questions
│
├── README.md
│
```

The names shown inside `SQL Queries/` are descriptive labels. Use the actual filenames already present in your repository.

## 6. Database Schema and Relationships

The project uses four relational tables.

- `orders`: Stores order dates and times.
- `order_details`: Stores the pizzas and quantities associated with orders.
- `pizzas`: Stores pizza sizes and prices.
- `pizza_types`: Stores pizza names, categories, and ingredients.

### Table Relationships

- `orders.order_id` connects to `order_details.order_id`.
- `pizzas.pizza_id` connects to `order_details.pizza_id`.
- `pizza_types.pizza_type_id` connects to `pizzas.pizza_type_id`.

These relationships allow the analysis to combine order information with product and pricing information using SQL joins.

## 7. Database Creation

### Step 1: Create the database

Open PostgreSQL using pgAdmin and connect to your PostgreSQL server.

Open the Query Tool on an existing database, such as `postgres`, and execute:

```sql
CREATE DATABASE pizza_sales;
```

After successful execution, refresh the Databases section.

Connect to the newly created `pizza_sales` database before creating tables. The database creation command creates the database itself, not the tables inside it.

## 8. Table Creation

### Step 2: Create the four tables

Open the table creation SQL file from the `SQL Queries/` folder.

Execute the table creation statements in the `pizza_sales` database.

The tables must have compatible data types and matching column names for the joins used in the analysis.

Verify the created tables:

```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
```

Expected table names:

- `orders`
- `order_details`
- `pizzas`
- `pizza_types`

## 9. Importing CSV Data

### Step 3: Import data into the tables

Use pgAdmin's Import/Export Data feature.

For each table:

1. Expand the `pizza_sales` database.
2. Expand Schemas and then `public`.
3. Expand Tables.
4. Right-click the target table.
5. Select Import/Export Data.
6. Select Import mode.
7. Browse to the corresponding CSV file in the `Data/` folder.
8. Select CSV as the format.
9. Enable Header if the CSV includes column names.
10. Verify the column mapping and encoding.
11. Click OK and check the process result.

### CSV-to-table mapping

| CSV file | Target table |
|---|---|
| `orders.csv` | `orders` |
| `order_details.csv` | `order_details` |
| `pizzas.csv` | `pizzas` |
| `pizza_types.csv` | `pizza_types` |

Import the data into tables with matching schemas. If a CSV import fails, check the column order, data types, encoding, primary keys, and foreign-key constraints.

## 10. Data Validation

### Step 4: Verify imported records

Run the following queries after importing all four datasets.

```sql
SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_details
FROM order_details;

SELECT COUNT(*) AS total_pizza_variants
FROM pizzas;

SELECT COUNT(*) AS total_pizza_types
FROM pizza_types;
```

Preview the data:

```sql
SELECT * FROM orders LIMIT 10;

SELECT * FROM order_details LIMIT 10;

SELECT * FROM pizzas LIMIT 10;

SELECT * FROM pizza_types LIMIT 10;
```

Check the returned counts against the number of data rows in the CSV files. These checks confirm whether the data has been imported successfully.

## 11. SQL Analysis Workflow

### Step 5: Execute Basic SQL Analysis

Open the Basic Questions SQL file.

The Basic section focuses on foundational SQL concepts such as aggregate functions, joins, grouping, sorting, and limiting results.

Questions covered:

1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.

### Step 6: Execute Intermediate SQL Analysis

Open the Intermediate Questions SQL file.

The Intermediate section focuses on multi-table joins, date and time analysis, category comparisons, and revenue ranking.

Questions covered:

6. Find the total quantity of each pizza category ordered.
7. Determine the distribution of orders by hour of the day.
8. Find the category-wise distribution of pizzas.
9. Group orders by date and calculate the average number of pizzas ordered per day.
10. Determine the top 3 pizza types based on revenue.

### Step 7: Execute Advanced SQL Analysis

Open the Advanced Questions SQL file.

The Advanced section focuses on window functions, cumulative calculations, revenue percentages, and category-level ranking.

Questions covered:

11. Calculate the percentage contribution of each pizza type to total revenue.
12. Analyze cumulative revenue generated over time.
13. Determine the top 3 pizza types based on revenue for each pizza category.

Execute and review each query separately. Confirm that the results match the intended business question.

## 12. Business Questions and Their Purpose

| Question | Business purpose |
|---|---|
| Total orders | Measure order volume. |
| Total revenue | Measure overall sales value. |
| Highest-priced pizza | Identify the highest-priced variant. |
| Most common size | Understand size preference by order-line frequency. |
| Top 5 pizza types | Identify leading products by quantity sold. |
| Category-wise quantity | Compare demand across categories. |
| Orders by hour | Identify busy order periods. |
| Category distribution | Understand the product sales mix. |
| Daily pizza quantity | Analyze daily demand and average quantity. |
| Top 3 by revenue | Identify products generating the most revenue. |
| Revenue contribution | Measure each group’s share of total revenue. |
| Cumulative revenue | Track the running total of sales over time. |
| Top 3 within each category | Identify the strongest revenue-generating products in each category. |

## 13. Important SQL Metrics

### Total Revenue

Revenue is calculated using the quantity sold and the listed price of each pizza variant.

```sql
SELECT ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details AS od
JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id;
```

### Total Pizza Units Sold

```sql
SELECT SUM(quantity) AS total_pizzas_sold
FROM order_details;
```

### Revenue Contribution Percentage

The revenue contribution percentage is calculated by dividing the revenue for a group by total revenue and multiplying by 100.

```text
Revenue Contribution (%) =
(Group Revenue / Total Revenue) * 100
```

### Cumulative Revenue

Cumulative revenue is the running total of revenue over time. It is useful for understanding how sales accumulate across dates.

### Quantity Versus Order Lines

`COUNT(*)` counts records, while `SUM(quantity)` calculates the total pizza units sold. These measures should not be treated as equivalent.

## 14. Key SQL Concepts Demonstrated

- Database and table creation
- Primary keys and foreign keys
- CSV data import
- INNER JOIN and LEFT JOIN
- Aggregate functions: SUM, COUNT, AVG, MAX
- GROUP BY and ORDER BY
- LIMIT
- Date and time extraction
- Revenue calculations
- Window functions
- RANK()
- Cumulative revenue
- Percentage calculations

## 15. Expected Business Value

After executing the queries, the analysis can help explain:

- Overall sales performance.
- Pizza types with high demand.
- Differences in demand across pizza categories and sizes.
- Hours with high order activity.
- Products contributing the most revenue.
- Revenue trends over time.
- Product rankings within each category.

The actual findings should be documented only after the SQL queries have been executed and their outputs reviewed.

## 16. Project Limitations

- The analysis depends on the accuracy and completeness of the supplied CSV data.
- Revenue is calculated from listed pizza prices multiplied by recorded quantities.
- The dataset does not necessarily include costs, discounts, taxes, delivery charges, or profit information.
- High revenue does not automatically mean high profit.
- Results depend on the definitions used in the individual SQL queries.

## 17. Learning Outcomes

Through this project, I practiced organizing relational data, creating PostgreSQL tables, importing CSV datasets, joining multiple tables, using aggregate functions, analyzing date and time patterns, and applying window functions to business problems.

This project demonstrates how SQL can be used to transform structured sales data into business-focused analysis.

## 18. Author

**Neeraj Kumar Sahu**

GitHub Profile: https://github.com/neerajkumar-git001

## 19. References and Documentation

- PostgreSQL Official Documentation: https://www.postgresql.org/docs/
- PostgreSQL CREATE DATABASE: https://www.postgresql.org/docs/current/sql-createdatabase.html
- PostgreSQL COPY and CSV Import: https://www.postgresql.org/docs/current/sql-copy.html
- pgAdmin Import/Export Data Guide: https://www.pgadmin.org/docs/pgadmin4/latest/import_export_data.html
- GitHub Documentation: https://docs.github.com/

## Conclusion

This project follows an end-to-end SQL analysis workflow: create the database, create the tables, import and validate the data, execute Basic, Intermediate, and Advanced SQL queries, and interpret the results in a business context.

The objective is not only to write SQL queries but also to understand the business questions each query answers and how the resulting information can support better decisions.
