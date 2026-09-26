# Indian E-Commerce Sales Analysis using SQL Server

## 📌 Project Overview

This project analyzes Indian e-commerce sales data using **Microsoft SQL Server** and **SQL Server Management Studio (SSMS)**.

The objective is to transform raw order, order-detail, and sales-target data into meaningful business insights related to **sales performance, profitability, customers, products, geography, monthly trends, and target achievement**.

The project follows a structured SQL data-analysis workflow, starting from data understanding and cleaning and progressing toward business-focused and advanced SQL analysis.

---

## 🎯 Project Objectives

* Understand the structure and quality of the sales data
* Identify and validate data quality issues
* Establish relationships between order and sales-detail tables
* Analyze overall sales, profit, and quantity
* Evaluate category and sub-category performance
* Analyze customer and geographical performance
* Study monthly sales and profit trends
* Compare actual sales with sales targets
* Apply advanced SQL techniques to solve business problems
* Generate actionable business insights from SQL analysis

---

## 🛠️ Tools & Technologies

* **Microsoft SQL Server 2025 Express**
* **SQL Server Management Studio (SSMS)**
* **SQL**

### SQL Concepts Used

* SELECT
* WHERE
* DISTINCT
* ORDER BY
* TOP
* GROUP BY
* HAVING
* Aggregate Functions
* CASE WHEN
* INNER JOIN
* LEFT JOIN
* Anti-Join Concepts
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* LAG()
* LEAD()
* PARTITION BY
* Date Functions
* Monthly Analysis
* Moving Averages
* Target Analysis

---

## 📂 Dataset

The project uses three CSV files:

### 1. List of Orders

Stored in SQL Server as:

`Ordertable`

Columns:

* Order ID
* Order Date
* CustomerName
* State
* City

Contains **500 order records**.

---

### 2. Order Details

Stored in SQL Server as:

`OrderDetails`

Columns:

* Order ID
* Amount
* Profit
* Quantity
* Category
* Sub-Category

Contains **1,500 order-detail records**.

---

### 3. Sales Target

Stored in SQL Server as:

`SalesTarget`

Columns:

* Month of Order Date
* Category
* Target

Contains **36 records**, representing monthly targets across categories.

---

## 🔄 Project Workflow

```text
Raw CSV Data
     ↓
SQL Server Import
     ↓
Data Understanding
     ↓
Data Cleaning
     ↓
Data Validation
     ↓
Relationships & Joins
     ↓
Business SQL Analysis
     ↓
Advanced SQL Analysis
     ↓
Business Insights
```

---

## 🔍 1. Data Understanding

The first stage focused on understanding the structure and characteristics of the datasets.

Key checks included:

* Number of rows and columns
* Date range
* Available categories
* States and cities
* Sub-categories
* Duplicate Order IDs
* NULL value checks
* Negative profit records
* Invalid quantity values
* Unique months and categories
* Sales-target structure
* Relationship between order and order-detail records

### Key Data Observations

* Order data covers the period from **April 2018 to March 2019**
* The dataset contains **3 product categories**
* `OrderDetails` contains multiple records for some Order IDs because a single order can contain multiple products/order-detail lines
* **503 out of 1,500 OrderDetails records** contain negative profit
* No records were found with `Quantity <= 0`
* `SalesTarget` contains **36 records** across 12 months and 3 categories

---

## 🧹 2. Data Cleaning

Data cleaning was performed before business analysis to improve data reliability.

The cleaning stage included:

* Checking NULL values
* Checking duplicate records
* Checking invalid quantities
* Checking invalid/negative values
* Validating date fields
* Reviewing category and sub-category values
* Checking consistency between related tables
* Validating final row counts after cleaning

The objective was to ensure that the data was suitable for further SQL analysis.

---

## 🔗 3. Data Validation & Relationships

The project validates relationships between:

```text
Ordertable
     │
     │ Order ID
     ↓
OrderDetails
```

and:

```text
Sales Analysis
     │
     ├── Ordertable
     ├── OrderDetails
     └── SalesTarget
```

Validation included:

* Checking Order IDs available in both tables
* Finding unmatched Order IDs
* Validating month/category combinations in `SalesTarget`
* Checking duplicate month-category target records
* Validating joins between order and order-detail data
* Combining multiple tables for business analysis

---

## 📊 4. Business SQL Analysis

The business-analysis stage focuses on answering practical e-commerce questions.

### Sales Performance

Examples include:

* Total sales revenue
* Total profit
* Total quantity sold
* Average sales amount
* Highest-value transactions
* Most profitable transactions

### Category & Sub-Category Analysis

Examples include:

* Sales by category
* Profit by category
* Quantity sold by category
* Highest-selling category
* Most profitable category
* Sales and profit by sub-category

### Customer Analysis

Examples include:

* Customer-wise sales
* Top customers by sales
* Customer-wise profit
* Top customers by profit
* Average customer sales
* Customers performing above average

### Geographical Analysis

Examples include:

* Sales by state
* Top-performing states
* Profit by state
* Top cities by sales
* Loss-making states

### Time-Based Analysis

Examples include:

* Yearly sales
* Monthly sales
* Highest-sales month
* Monthly profit
* Monthly sales vs. profit
* Month-over-month sales comparison

### Profitability Analysis

Examples include:

* Negative-profit transactions
* Most profitable sub-category
* Highest-loss sub-category
* Profit margin by category
* Categories performing above overall profit margin

### Sales Target Analysis

Examples include:

* Actual sales vs. target
* Target variance
* Target achievement percentage
* Category-level target performance

---

## 🧠 5. Advanced SQL Analysis

Advanced SQL techniques are used to solve more complex analytical problems.

### Window Functions

Examples:

```sql
RANK()
ROW_NUMBER()
LAG()
```

Used for:

* Customer ranking
* Top customers within each category
* Month-over-month comparisons
* Moving-average analysis

### CTEs

Common Table Expressions are used to:

* Break complex queries into logical steps
* Improve query readability
* Perform multi-stage analysis
* Prepare aggregated data before applying window functions

### Subqueries

Subqueries are used for comparisons such as:

* Customers above average sales
* Categories above overall profit margin
* Comparing aggregated results with overall metrics

### Moving Average

A rolling **3-month moving average** is used to analyze the underlying sales trend and reduce the effect of short-term monthly fluctuations.

---

## 📈 Business Insights

The final stage of the project converts SQL analysis results into business-oriented observations.

The analysis can be used to identify:

* High-performing categories
* Profitable and loss-making product segments
* High-value customers
* Strong and weak geographical markets
* Monthly sales trends
* Profitability patterns
* Target achievement gaps
* Areas requiring further business investigation

> Final numerical insights will be added after completing and validating the Business SQL Analysis queries.

---

## 📁 Project Structure

```text
Indian-Ecommerce-Sales-Analysis/
│
├── README.md
│
├── SQL/
│   └── Indian_Ecommerce_Sales_Analysis.sql
│
└── Data/
    ├── List of Orders.csv
    ├── Order Details.csv
    └── Sales Target.csv
```

---

## 💡 Key Skills Demonstrated

This project demonstrates practical experience in:

* SQL Server
* Data Cleaning
* Data Validation
* Relational Data Analysis
* SQL Joins
* Aggregations
* Subqueries
* CTEs
* Window Functions
* Ranking Analysis
* Time-Series Analysis
* Customer Analysis
* Sales & Profitability Analysis
* Target Analysis
* Business Problem Solving

---

## 🚀 Project Outcome

This project demonstrates how SQL can be used to move from **raw transactional data to structured business analysis**.

It covers the complete analytical workflow:

**Import → Understand → Clean → Validate → Join → Analyze → Apply Advanced SQL → Generate Business Insights**

---

## 👤 Author

**Praveen Rawat**

BCA Graduate | Junior SQL Developer / SQL Analyst

**Skills:** SQL Server, SSMS, Advanced SQL, Excel, Power BI, Python (Basics)

---

## 📌 Future Enhancements

Potential future improvements include:

* Adding a Power BI dashboard using the SQL-processed data
* Adding more advanced time-series analysis
* Adding additional customer segmentation analysis
* Adding performance KPIs
* Documenting final business recommendations

