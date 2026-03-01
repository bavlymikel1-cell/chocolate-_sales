create database chocalte
select * from Chocolate_Sales

--1.what the total sales and total boxes shipped
SELECT 
    SUM(Amount) AS Total_Sales, 
    SUM([Boxes_Shipped]) AS Total_Boxes_Shipped
FROM Chocolate_Sales;



--2.what are total sales groubed by country
SELECT 
    Country, 
    SUM(Amount) AS Total_Sales
FROM Chocolate_Sales
GROUP BY Country
ORDER BY Total_Sales DESC;


--3.what are total sales by person sales

SELECT 
    Sales_Person, 
    SUM(Amount) AS Total_Sales
FROM Chocolate_Sales
GROUP BY Sales_Person
ORDER BY Total_Sales DESC;


--4.what are salaes by product
SELECT 
    Product, 
    SUM(Amount) AS Total_Sales
FROM Chocolate_Sales
GROUP BY  Product
ORDER BY Total_Sales DESC;


--5.what are monthly sales
SELECT 
    YEAR(date) AS Year, 
    MONTH(date) AS Month, 
    SUM(Amount) AS Total_Sales
FROM Chocolate_Sales
GROUP BY Year(date), Month(date)
ORDER BY Year, Month;


--6. average revnue
SELECT 
    SUM(Amount) / SUM([Boxes_Shipped])AS Avg_Revenue_Per_Box
FROM Chocolate_Sales;


--7.top product
SELECT 
    Product, 
    SUM(Amount) AS Total_Sales
FROM Chocolate_Sales
GROUP BY Product
ORDER BY Total_Sales DESC

--8.what is the yearly total sales and year_over_year
select
Year(date) as year,
sum(Amount) as total_sales
from [chocolate_sales]
group by Year(date)








--9. what percentage of total revnue
SELECT 
    Country, 
    SUM(Amount) AS Country_Sales,
    (SUM(Amount) * 100.0 / (select SUM(Amount) FROM Chocolate_Sales)) AS Percentage_Contribution
FROM Chocolate_Sales
GROUP BY Country
ORDER BY Percentage_Contribution DESC;





--10.What is the quarterly sales performance by year?
SELECT 
    YEAR(Date) AS Sales_Year,
    CASE 
        When DATEPART(QUARTER, Date) = 1 THEN 'Q1'
        when DATEPART(QUARTER, Date) = 2 THEN 'Q2'
        when DATEPART(QUARTER, Date) = 3 THEN 'Q3'
        ELSE 'Q4'
    END AS Quarter,
    SUM(Amount) AS Total_Sales,
    SUM([Boxes_Shipped]) AS Total_Boxes
FROM Chocolate_Sales
GROUP BY YEAR(Date), DATEPART(QUARTER, Date)
ORDER BY Sales_Year, Quarter;