CREATE DATABASE Indian_Ecommerce_Analysis;

USE Indian_Ecommerce_Analysis;

-- order table name change --
EXEC sp_rename 'Order', 'Ordertable';

-- Quick Verification On tables ---

---------------------------------------------------
  --Ordertable TABLE - INITIAL VERIFICATION--
---------------------------------------------------

-- Q1. Preview the first 10 records from the OrderTable
SELECT TOP 10 *
FROM Ordertable;

-- Q2. How many records are available in the OrderTable? 
SELECT COUNT(*) AS Total_Rows
FROM Ordertable;

-----------------------------------------------------------
  --ORDERDETAILS TABLE - INITIAL VERIFICATION--
-----------------------------------------------------------

-- Q1. Preview the first 10 records from the OrderDetails table
SELECT TOP 10 *
FROM OrderDetails;

-- Q2. How many records are available in the OrderDetails table?
SELECT COUNT(*) AS Total_Rows
FROM OrderDetails;

---------------------------------------------------
  --SALES TARGET TABLE - INITIAL VERIFICATION--
---------------------------------------------------

-- Q1. Preview the first 10 records from the SalesTarget table
SELECT TOP 10 *
FROM SalesTarget;

-- Q2. How many records are available in the SalesTarget table?
SELECT COUNT(*) AS Total_Rows
FROM SalesTarget;

------------------ DATA UNDERSTANDING --------------------------------

-- Q1. Check the structure and data types of OrderTable
EXEC sp_help 'OrderTable';


-- Q2. Check the structure and data types of OrderDetails
exec sp_help 'OrderDetails'

-- Q3. Check the structure and data types of Salestarget
exec sp_help 'Salestarget'

-- Q4. Preview sample records from OrderTable
SELECT TOP 10 *
FROM OrderTable;

-- Q5. Preview sample records from OrderDetails
SELECT TOP 10 *
FROM OrderDetails;

-- Q6. Preview sample records from Salestarget
SELECT TOP 10 *
FROM Salestarget;

-- Q7. Identify the date range of orders
SELECT 
    MIN(Order_Date) AS First_Order_Date,
    MAX(Order_Date) AS Last_Order_Date
FROM OrderTable;

-- Q8. Identify unique product categories
SELECT DISTINCT Category
FROM OrderDetails
ORDER BY Category;

-- Q9. Identify unique product sub-categories
SELECT DISTINCT Sub_Category
FROM OrderDetails
ORDER BY Sub_Category;

-- Q10. Count unique customers
select count(distinct customername) as [Unique Customer]
from Ordertable;

-- Q9. Identify unique states in the dataset
select distinct State
from Ordertable
order by State;

-- Q10. Identify unique cities in the dataset
select City 
from Ordertable
group by City;

-- Q11. Check duplicate Order_IDs in OrderTable
select Order_ID,
count(*) as order_count
from Ordertable
group by Order_ID
having count(*) >1;

-- Q12. Check repeated Order_IDs in OrderDetails
select Order_ID,
count(*) as order_count 
from OrderDetails
group by Order_ID
having count(*) > 1;

-- Q13. Check for NULL values in OrderTable
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Order_ID) AS Order_ID_Count,
    COUNT(Order_Date) AS Order_Date_Count,
    COUNT(CustomerName) AS Customer_Count,
    COUNT(State) AS State_Count,
    COUNT(City) AS City_Count
FROM OrderTable;

-- Q14. Check for NULL values in OrderTable
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Order_ID) AS Order_ID_Count,
    COUNT(Amount) AS Amount_Count,
    COUNT(Profit) AS Profit_Count,
    COUNT(Quantity) AS Quantity_Count,
    COUNT(Category) AS Category_Count,
    COUNT(Sub_Category) AS Sub_Category_Count
FROM OrderDetails;

-- Q15. Check for NULL values in SalesTarget
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Month_of_Order_Date) AS Month_Count,
    COUNT(Category) AS Category_Count,
    COUNT(Target) AS Target_Count
FROM SalesTarget;

-- Q16. Check duplicate Month and Category combinations
SELECT
    Month_of_Order_Date,
    Category,
    COUNT(*) AS Record_Count
FROM SalesTarget
GROUP BY
    Month_of_Order_Date,
    Category
HAVING COUNT(*) > 1;

-- Q17. Check the range of numeric sales fields
SELECT
    MIN(Amount) AS Min_Amount,
    MAX(Amount) AS Max_Amount,
    MIN(Profit) AS Min_Profit,
    MAX(Profit) AS Max_Profit,
    MIN(Quantity) AS Min_Quantity,
    MAX(Quantity) AS Max_Quantity
FROM OrderDetails;

-- Q18. Count records with negative profit
SELECT COUNT(*) AS Negative_Profit_Records
FROM OrderDetails
WHERE Profit < 0;

-- Q19. Check for records with zero or negative quantity
select count(*) as Invalid_Quantity_Records
from OrderDetails
where quantity <=0;

-- Q20. Check for NULL values in OrderDetails
select count(*) as Total_Rows,
       count([Order_ID]) as Order_Id,
       count(Amount) as Amount,
       count(profit) as Profit,
       count(Quantity) as Qantity,
       count(Category) as Category,
       count([Sub_Category]) as sub_category
from OrderDetails;

-- Q21. Check for duplicate Order IDs in OrderDetails
select Order_ID,
       count(*) as order_count
       from OrderDetails
       group by Order_ID
       having count(*) >1
       order by order_count desc;

-- Q21. Count unique Order IDs in OrderDetails
select count(distinct(order_id)) as Distinct_Count
from OrderDetails;

-- Q22. Check for Order IDs in OrderDetails that are missing from OrderTable
select distinct od.Order_ID 
from OrderDetails as od
left join Ordertable as ot
on od.Order_ID = ot.Order_ID
where ot.Order_ID is null;

-- Q23. Check for Order IDs in OrderTable that are missing from OrderDetails
select ot.Order_ID
from Ordertable as ot
left join OrderDetails as od 
on ot.Order_ID = od.Order_ID
where od.Order_ID is null;

-- Q24. Check unique months and categories in SalesTarget
select 
      count(distinct(month_of_order_date)) as unique_months,
      count(distinct(category)) as Unique_category
from Salestarget;

-- Q25. Check for duplicate Month and Category combinations in SalesTarget
SELECT
    (month_of_order_date),
    Category,
    COUNT(*) AS Record_Count
FROM SalesTarget
GROUP BY
    [Month_of_Order_Date],
    Category
HAVING COUNT(*) > 1;

-- Q26. Check the number of records in each category
select 
      category,
      count(*) as records_count
from OrderDetails
group by category
order by records_count;

-- Q27. Check the number of records in each sub-category
select Sub_Category,
       count(*) as records_count
from OrderDetails
group by Sub_Category
order by records_count desc;

-- Q28. Check the relationship between Category and Sub-Category
select Category,
       sub_category,
       count(*) as Record_count 
from OrderDetails
group by Category,
         sub_category
order by Category,
         sub_category desc;

-- Q29. Check the range of sales targets
select 
    min(Target) as [Minimum Target],
    max(Target) as [Maximum Target],
    avg(target) as [Average Target]
from Salestarget;

-- Q30. Check average sales target by category
SELECT
    Category,
    AVG(Target) AS Average_Target
FROM SalesTarget
GROUP BY Category
ORDER BY Average_Target DESC;

-- Q31. Check the number of target records for each month
SELECT
    [Month_of_Order_Date],
    COUNT(*) AS Record_Count
FROM SalesTarget
GROUP BY [Month_of_Order_Date]
ORDER BY [Month_of_Order_Date];

-- Q32. Check total records in SalesTarget
SELECT
    COUNT(*) AS Total_Records
FROM SalesTarget;

-- Q33. Check whether all SalesTarget months exist in OrderTable
SELECT DISTINCT
    [Month_of_Order_Date]
FROM SalesTarget
WHERE [Month_of_Order_Date] NOT IN
(
    SELECT DISTINCT
        FORMAT(Order_Date, 'MMM-yy')
    FROM OrderTable
);

-- Q34. Check final record counts of all project tables
SELECT 'OrderTable' AS Table_Name, COUNT(*) AS Total_Records
FROM OrderTable

UNION ALL

SELECT 'OrderDetails', COUNT(*)
FROM OrderDetails

UNION ALL

SELECT 'SalesTarget', COUNT(*)
FROM SalesTarget;

------------------- DATA CLEANING ------------------

-- Q1. Check for leading and trailing spaces in text columns
-- Purpose: Identify unwanted spaces that may cause inconsistent text values.

SELECT *
FROM OrderTable
WHERE [CustomerName] <> LTRIM(RTRIM([CustomerName]))
   OR [State] <> LTRIM(RTRIM([State]))
   OR [City] <> LTRIM(RTRIM([City]));

-- Q2. Check for leading and trailing spaces in OrderDetails
-- Purpose: Identify unwanted spaces in Category and Sub-Category values.

select * 
from OrderDetails
where Category <> LTRIM(RTRIM(Category))
      or Sub_Category <> LTRIM(RTRIM(Sub_Category));

-- Q3. Validate the Category–Sub-Category relationship
-- Purpose: Identify Sub-Categories mapped to multiple Categories.

select Sub_Category,
       count(distinct category) as category_count
       from OrderDetails
       group by Sub_Category
       having count(distinct category) > 1;

-- Q4. Check for leading and trailing spaces in SalesTarget
-- Purpose: Identify unwanted spaces in Category and Month values.

select * 
from Salestarget
     where Month_of_Order_Date <> LTRIM(RTRIM(Month_of_Order_Date))
     or Category <> LTRIM(RTRIM(Category));


-- Q5. Validate Order_Date values
-- Purpose: Identify any invalid or future order dates.

select *
from Ordertable
where Order_Date is null
or Order_Date > GETDATE();  

-- Q6. Check decimal precision in Amount and Profit
-- Purpose: Identify whether sales and profit values contain decimal amounts.

select 
      count(*) as decimal_records
from OrderDetails
where Amount <> FLOOR(Amount)
or profit <> FLOOR(Profit);

-- Q7. Check for non-positive sales amounts
-- Purpose: Identify zero or negative Amount values before analysis.

select *
from OrderDetails
where Amount <= 0;

-- Q8. Validate categories in SalesTarget
-- Purpose: Identify categories in SalesTarget that do not exist in OrderDetails.

select ST.Category
from Salestarget as ST
left join OrderDetails as OD
on ST.Category = OD.Category
where od.Category is null;

-- Q9. Check for invalid or inconsistent Month values in SalesTarget
-- Purpose: Ensure Month_of_Order_Date follows the expected MMM-yy format.

SELECT *
FROM SalesTarget
WHERE TRY_CONVERT(date, '01-' + [Month_of_Order_Date], 106) IS NULL;


-- Q10. Check for duplicate CustomerName and Order_Date combinations
-- Purpose: Identify potentially repeated customer-order-date records.

SELECT
    CustomerName,
    Order_Date,
    COUNT(*) AS Record_Count
FROM OrderTable
GROUP BY
    CustomerName,
    Order_Date
HAVING COUNT(*) > 1
ORDER BY Record_Count DESC;


-- Q11. Check whether each Order ID has a valid Order Date
-- Purpose: Identify OrderDetails records whose Order ID does not
-- have a corresponding order date in OrderTable.

SELECT DISTINCT
    od.Order_ID
FROM OrderDetails AS od
INNER JOIN OrderTable AS ot
    ON od.Order_ID = ot.Order_ID
WHERE ot.Order_Date IS NULL;


-- Q12. Check for inconsistent Category values between SalesTarget and OrderDetails
-- Purpose: Compare category names across both tables.

SELECT DISTINCT
    st.Category
FROM SalesTarget AS st
WHERE st.Category NOT IN
(
    SELECT DISTINCT Category
    FROM OrderDetails
);


-- Q13. Final data cleaning summary
-- Purpose: Confirm the final row counts after cleaning checks.

SELECT 'OrderTable' AS Table_Name, COUNT(*) AS Total_Records
FROM OrderTable

UNION ALL

SELECT 'OrderDetails', COUNT(*)
FROM OrderDetails

UNION ALL

SELECT 'SalesTarget', COUNT(*)
FROM SalesTarget;


--------------- DATA VALIDATION & RELATIONSHIPS / JOINS -----------

-- Q1. Data Validation: Calculate total sales amount from OrderDetails

SELECT
    SUM(Amount) AS Total_Sales
FROM OrderDetails;


-- Q2. Data Validation: Calculate total profit from OrderDetails

SELECT
    SUM(Profit) AS Total_Profit
FROM OrderDetails;


-- Q3. Data Validation: Calculate total quantity sold

SELECT
    SUM(Quantity) AS Total_Quantity
FROM OrderDetails;


-- Q4. Data Validation: Calculate sales amount by category

select Category,
       sum(Amount) as [category sales]
       from OrderDetails
       group by Category
       order by [category sales] desc;

-- Q5. Data Validation: Calculate monthly sales

select year(OT.order_date) as year,
    month(OT.Order_Date) as months,
    sum(Amount) as total_sales
from Ordertable as OT
inner join OrderDetails as OD
    on OT.Order_ID = OT.Order_ID
group by year(OT.order_date),
         month(OT.Order_Date)
order by year,
         months;


-- Q6. Relationships & Joins: Combine order information with sales details

SELECT TOP 20
    ot.Order_ID,
    ot.Order_Date,
    ot.CustomerName,
    ot.State,
    ot.City,
    od.Amount,
    od.Profit,
    od.Quantity,
    od.Category,
    od.Sub_Category
FROM Ordertable AS ot
INNER JOIN OrderDetails AS od
    ON ot.Order_ID = od.Order_ID;


-- Q7. Relationships & Joins: Calculate total sales by state

select State,
       sum(amount) as total_sales
from Ordertable as OT
inner join OrderDetails as OD
on OT.Order_ID = OD.Order_ID
group by State
order by total_sales desc;


-- Q8. Relationships & Joins: Calculate total sales by city

SELECT
    ot.City,
    SUM(od.Amount) AS Total_Sales
FROM Ordertable AS ot
INNER JOIN OrderDetails AS od
    ON ot.Order_ID = od.Order_ID
GROUP BY ot.City
ORDER BY Total_Sales DESC;


-- Q9. Relationships & Joins: Compare actual sales with target by category

Select OD.Category,
       sum(Amount) as Actual_sales,
       sum(ST.Target) as Target_sales 
from OrderDetails as OD
inner join Salestarget as ST
on OD.Category = ST.Category
group by OD.Category
order by Actual_sales,
         Target_sales;

-- Q10. Relationships & Joins: Combine all three tables

SELECT *
FROM Ordertable AS ot
INNER JOIN OrderDetails AS od
    ON ot.Order_ID = od.Order_ID
INNER JOIN SalesTarget AS st
    ON od.Category = st.Category;


   
--------- BUSINESS SQL ANALYSIS ---------------


 -------------  CATEGORY 1: SALES PERFORMANCE ----------------------

-- Q1. Calculate total sales revenue.
SELECT SUM(Amount) AS Total_Sales
FROM OrderDetails;

-- Q2. Calculate total profit.
SELECT SUM(Profit) AS Total_Profit
FROM OrderDetails;

-- Q3. Calculate total quantity sold.
SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM OrderDetails;

-- Q4. Calculate average selling amount per order detail.
SELECT AVG(Amount) AS Average_Sale_Amount
FROM OrderDetails;

-- Q5. Find the top 10 sales transactions based on sales amount.
SELECT TOP 10
       [Order_ID],
       Amount,
       Profit,
       Quantity,
       Category,
       [Sub_Category]
FROM OrderDetails
ORDER BY Amount DESC;

-- Q6. Find the top 10 sales transactions based on profit.
SELECT TOP 10
       [Order_ID],
       Amount,
       Profit,
       Quantity,
       Category,
       [Sub_Category]
FROM OrderDetails
ORDER BY Profit DESC;


---------- CATEGORY 2: CATEGORY & SUB-CATEGORY ANALYSIS ------------

-- Q7. Find total sales by category.
SELECT
       Category,
       SUM(Amount) AS Total_Sales
FROM OrderDetails
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Q8. Find total profit by category.
SELECT
       Category,
       SUM(Profit) AS Total_Profit
FROM OrderDetails
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Q9. Find total quantity sold by category.
SELECT
       Category,
       SUM(Quantity) AS Total_Quantity
FROM OrderDetails
GROUP BY Category
ORDER BY Total_Quantity DESC;

-- Q10. Find the highest-selling category.
SELECT TOP 1
       Category,
       SUM(Amount) AS Total_Sales
FROM OrderDetails
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Q11. Find the most profitable category.
SELECT TOP 1
       Category,
       SUM(Profit) AS Total_Profit
FROM OrderDetails
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Q12. Find total sales and profit by sub-category.
SELECT
       [Sub_Category],
       SUM(Amount) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM OrderDetails
GROUP BY [Sub_Category]
ORDER BY Total_Sales DESC;


---------------- CATEGORY 3: CUSTOMER ANALYSIS ------------------

-- Q13. Find total sales generated by each customer.
SELECT
       o.CustomerName,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.CustomerName
ORDER BY Total_Sales DESC;


-- Q14. Find the top 10 customers based on total sales.
SELECT TOP 10
       o.CustomerName,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.CustomerName
ORDER BY Total_Sales DESC;


-- Q15. Find total profit generated by each customer.
SELECT
       o.CustomerName,
       SUM(d.Profit) AS Total_Profit
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.CustomerName
ORDER BY Total_Profit DESC;

-- Q16. Find the top 10 customers based on profit.
SELECT TOP 10
       o.CustomerName,
       SUM(d.Profit) AS Total_Profit
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.CustomerName
ORDER BY Total_Profit DESC;

-- Q17. Find the average sales amount per customer.
SELECT AVG(Customer_Sales) AS Average_Customer_Sales
FROM
(
    SELECT
           o.CustomerName,
           SUM(d.Amount) AS Customer_Sales
    FROM Ordertable o
    JOIN OrderDetails d
        ON o.[Order_ID] = d.[Order_ID]
    GROUP BY o.CustomerName
) AS CustomerData;


-- Q18. Find customers whose total sales are greater than
--      the average customer sales.
SELECT
       o.CustomerName,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.CustomerName
HAVING SUM(d.Amount) >
(
    SELECT AVG(Customer_Sales)
    FROM
    (
        SELECT
               o2.CustomerName,
               SUM(d2.Amount) AS Customer_Sales
        FROM Ordertable o2
        JOIN OrderDetails d2
            ON o2.[Order_ID] = d2.[Order_ID]
        GROUP BY o2.CustomerName
    ) AS CustomerData
)
ORDER BY Total_Sales DESC;



/* ============================================================
   CATEGORY 4: GEOGRAPHICAL ANALYSIS
   ============================================================ */

-- Q19. Find total sales by state.
SELECT
       o.State,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.State
ORDER BY Total_Sales DESC;


-- Q20. Find the top 5 states based on sales.
SELECT TOP 5
       o.State,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.State
ORDER BY Total_Sales DESC;


-- Q21. Find total profit by state.
SELECT
       o.State,
       SUM(d.Profit) AS Total_Profit
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.State
ORDER BY Total_Profit DESC;


-- Q22. Find the top 5 cities based on total sales.
SELECT TOP 5
       o.City,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.City
ORDER BY Total_Sales DESC;


-- Q23. Find states where total profit is negative.
SELECT
       o.State,
       SUM(d.Profit) AS Total_Profit
FROM Ordertable o
JOIN OrderDetails d
    ON o.[Order_ID] = d.[Order_ID]
GROUP BY o.State
HAVING SUM(d.Profit) < 0
ORDER BY Total_Profit;



/* ============================================================
   CATEGORY 5: TIME-BASED ANALYSIS
   ============================================================ */

-- Q24. Calculate total sales by year.
SELECT
       YEAR(o.[Order_Date]) AS Order_Year,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.Order_ID = d.Order_ID
GROUP BY YEAR(o.[Order_Date])
ORDER BY Order_Year;


-- Q25. Calculate total sales by month.
SELECT
       MONTH(o.Order_Date) AS Order_Month,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.Order_ID = d.Order_ID
GROUP BY MONTH(o.Order_Date)
ORDER BY Order_Month;


-- Q26. Find the highest-sales month.
SELECT TOP 1
       MONTH(o.[Order_Date]) AS Order_Month,
       SUM(d.Amount) AS Total_Sales
FROM Ordertable o
JOIN OrderDetails d
    ON o.Order_ID = d.Order_ID
GROUP BY MONTH(o.[Order_Date])
ORDER BY Total_Sales DESC;


-- Q27. Calculate monthly profit.
SELECT
       YEAR(o.[Order_Date]) AS Order_Year,
       MONTH(o.[Order_Date]) AS Order_Month,
       SUM(d.Profit) AS Monthly_Profit
FROM Ordertable o
JOIN OrderDetails d
    ON o.Order_ID = d.Order_ID
GROUP BY
       YEAR(o.[Order_Date]),
       MONTH(o.[Order_Date])
ORDER BY
       Order_Year,
       Order_Month;


-- Q28. Calculate monthly sales and profit together.
SELECT
       YEAR(o.[Order_Date]) AS Order_Year,
       MONTH(o.[Order_Date]) AS Order_Month,
       SUM(d.Amount) AS Monthly_Sales,
       SUM(d.Profit) AS Monthly_Profit
FROM Ordertable o
JOIN OrderDetails d
    ON o.Order_ID = d.Order_ID
GROUP BY
       YEAR(o.[Order_Date]),
       MONTH(o.[Order_Date])
ORDER BY
       Order_Year,
       Order_Month;

-- Q29. Calculate month-over-month sales change.
-- Advanced SQL: LAG()
WITH MonthlySales AS
(
    SELECT
           YEAR(o.[Order_Date]) AS Order_Year,
           MONTH(o.[Order_Date]) AS Order_Month,
           SUM(d.Amount) AS Monthly_Sales
    FROM Ordertable o
    JOIN OrderDetails d
        ON o.Order_ID = d.Order_ID
    GROUP BY
           YEAR(o.Order_Date),
           MONTH(o.Order_Date)
)
SELECT
       Order_Year,
       Order_Month,
       Monthly_Sales,
       LAG(Monthly_Sales) OVER
       (
           ORDER BY Order_Year, Order_Month
       ) AS Previous_Month_Sales,
       Monthly_Sales -
       LAG(Monthly_Sales) OVER
       (
           ORDER BY Order_Year, Order_Month
       ) AS Sales_Change
FROM MonthlySales
ORDER BY Order_Year, Order_Month;



/* ============================================================
   CATEGORY 6: PROFITABILITY ANALYSIS
   ============================================================ */

-- Q30. Find all transactions where profit is negative.
SELECT
      Order_ID,
       Amount,
       Profit,
       Quantity,
       Category,
       [Sub_Category]
FROM OrderDetails
WHERE Profit < 0
ORDER BY Profit;

-- Q31. Find the sub-category generating the highest total profit.
SELECT TOP 1
       [Sub_Category],
       SUM(Profit) AS Total_Profit
FROM OrderDetails
GROUP BY [Sub_Category]
ORDER BY Total_Profit DESC;


-- Q32. Find the sub-category generating the highest total loss.
SELECT TOP 1
       [Sub_Category],
       SUM(Profit) AS Total_Profit
FROM OrderDetails
GROUP BY [Sub_Category]
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- Q33. Calculate profit margin by category.
SELECT
       Category,
       SUM(Profit) AS Total_Profit,
       SUM(Amount) AS Total_Sales,
       (SUM(Profit) * 100.0 / SUM(Amount)) AS Profit_Margin_Percent
FROM OrderDetails
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;


-- Q34. Find categories with profit margin greater than
--      the overall profit margin.
SELECT
       Category,
       SUM(Profit) AS Total_Profit,
       SUM(Amount) AS Total_Sales,
       (SUM(Profit) * 100.0 / SUM(Amount)) AS Profit_Margin_Percent
FROM OrderDetails
GROUP BY Category
HAVING
       (SUM(Profit) * 100.0 / SUM(Amount))
       >
       (
           SELECT
               SUM(Profit) * 100.0 / SUM(Amount)
           FROM OrderDetails
       )
ORDER BY Profit_Margin_Percent DESC;



/* ============================================================
   CATEGORY 7: SALES TARGET ANALYSIS
   ============================================================ */

-- Q35. Compare actual sales with target sales by month and category.
-- SalesTarget contains one target for each Month + Category.
WITH ActualSales AS
(
    SELECT
        FORMAT(o.[Order_Date], 'yyyy-MM') AS Sales_Month,
        d.Category,
        SUM(d.Amount) AS Actual_Sales
    FROM Ordertable o
    JOIN OrderDetails d
        ON o.[Order_ID] = d.[Order_ID]
    GROUP BY
        FORMAT(o.[Order_Date], 'yyyy-MM'),
        d.Category
)
SELECT
    a.Sales_Month,
    a.Category,
    a.Actual_Sales,
    s.Target,
    a.Actual_Sales - s.Target AS Target_Variance
FROM ActualSales a
JOIN SalesTarget s
    ON a.Sales_Month = s.[Month_of_Order_Date]
   AND a.Category = s.Category
ORDER BY
    a.Sales_Month,
    a.Category;


-- Q36. Calculate target achievement percentage
--      by month and category.
WITH ActualSales AS
(
    SELECT
        FORMAT(o.[Order_Date], 'yyyy-MM') AS Sales_Month,
        d.Category,
        SUM(d.Amount) AS Actual_Sales
    FROM Ordertable o
    JOIN OrderDetails d
        ON o.[Order_ID] = d.[Order_ID]
    GROUP BY
        FORMAT(o.[Order_Date], 'yyyy-MM'),
        d.Category
)
SELECT
    a.Sales_Month,
    a.Category,
    a.Actual_Sales,
    s.Target,
    (a.Actual_Sales * 100.0 / s.Target)
        AS Target_Achievement_Percent
FROM ActualSales a
JOIN SalesTarget s
    ON a.Sales_Month = s.[Month_of_Order_Date] 
   AND a.Category = s.Category
ORDER BY
    a.Sales_Month,
    a.Category;


-- Q37. Find the category with the highest overall
--      target achievement percentage.
WITH ActualSales AS
(
    SELECT
        FORMAT(o.[Order_Date], 'yyyy-MM') AS Sales_Month,
        d.Category,
        SUM(d.Amount) AS Actual_Sales
    FROM Ordertable o
    JOIN OrderDetails d
        ON o.[Order_ID] = d.[Order_ID]
    GROUP BY
        FORMAT(o.[Order_Date], 'yyyy-MM'),
        d.Category
),
CategoryPerformance AS
(
    SELECT
        a.Category,
        SUM(a.Actual_Sales) AS Actual_Sales,
        SUM(s.Target) AS Total_Target
    FROM ActualSales a
    JOIN SalesTarget s
        ON a.Sales_Month = s.[Month_of_Order_Date] 
       AND a.Category = s.Category
    GROUP BY a.Category
)
SELECT TOP 1
       Category,
       Actual_Sales,
       Total_Target,
       Actual_Sales * 100.0 / Total_Target
           AS Target_Achievement_Percent
FROM CategoryPerformance
ORDER BY Target_Achievement_Percent DESC;



/* ============================================================
   CATEGORY 8: ADVANCED SQL ANALYSIS
   ============================================================ */

-- Q38. Rank customers based on total sales.
-- Advanced SQL: RANK()
WITH CustomerSales AS
(
    SELECT
        o.CustomerName,
        SUM(d.Amount) AS Total_Sales
    FROM Ordertable o
    JOIN OrderDetails d
        ON o.[Order_ID] = d.[Order_ID]
    GROUP BY o.CustomerName
)
SELECT
    CustomerName,
    Total_Sales,
    RANK() OVER
    (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank
FROM CustomerSales
ORDER BY Sales_Rank;


-- Q39. Find the top 3 customers from each category
--      based on sales.
-- Advanced SQL: ROW_NUMBER()
WITH CustomerCategorySales AS
(
    SELECT
        o.CustomerName,
        d.Category,
        SUM(d.Amount) AS Total_Sales
    FROM Ordertable o
    JOIN OrderDetails d
        ON o.[Order_ID] = d.[Order_ID]
    GROUP BY
        o.CustomerName,
        d.Category
),
RankedCustomers AS
(
    SELECT
        CustomerName,
        Category,
        Total_Sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Category_Rank
    FROM CustomerCategorySales
)
SELECT
    CustomerName,
    Category,
    Total_Sales,
    Category_Rank
FROM RankedCustomers
WHERE Category_Rank <= 3
ORDER BY
    Category,
    Category_Rank;


-- Q40. Calculate a 3-month moving average of sales.
-- Advanced SQL: Window Function
WITH MonthlySales AS
(
    SELECT
        YEAR(o.[Order_Date]) AS Order_Year,
        MONTH(o.[Order_Date]) AS Order_Month,
        SUM(d.Amount) AS Monthly_Sales
    FROM Ordertable o
    JOIN OrderDetails d
        ON o.[Order_ID] = d.[Order_ID]
    GROUP BY
        YEAR(o.[Order_Date]),
        MONTH(o.[Order_Date])
)
SELECT
    Order_Year,
    Order_Month,
    Monthly_Sales,
    AVG(Monthly_Sales) OVER
    (
        ORDER BY Order_Year, Order_Month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Moving_Average_3_Month
FROM MonthlySales
ORDER BY
    Order_Year,
    Order_Month;