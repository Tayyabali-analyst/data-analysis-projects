select * from [retail_sales_cleaned.xlsx]
/*
Total revenue generated overall.
Total revenue by Product Category (highest to lowest).
Average order value (Total Amount) per transaction.
Top 10 customers by total spend.
Monthly sales trend — total sales grouped by month.
Which age group spends the most on average?
Male vs Female — total revenue comparison.
Which product category is most popular among customers under 30?*/

select sum(Total_Amount) As Total_Revenue
from [retail_sales_cleaned.xlsx]

select Product_Category , SUM(Total_Amount) As Total_Revenue
from [retail_sales_cleaned.xlsx]
group by Product_Category 
Order By Total_Revenue DESC

select AVG(Total_Amount) AS Average_Order_Value
from [retail_sales_cleaned.xlsx]

select TOP 10 Customer_ID , Age_Group ,SUM(Total_Amount) Total_Spending 
From [retail_sales_cleaned.xlsx] 
Group By Customer_ID , Age_Group 
Order By  Total_Spending  desc 

SELECT  Month , sum(Total_Amount) As Total_Spending 
from [retail_sales_cleaned.xlsx]
group by Month

select Age_Group , AVG(Total_Amount) AS Average_Sales
from [retail_sales_cleaned.xlsx] 
group by Age_Group
order by Average_Sales DESC

select [Male] AS Male_Revenue , [Female] AS Female_Revenue 
From(
select Total_Amount , Gender 
from [retail_sales_cleaned.xlsx]
) AS Referance
PIVOT (
SUM(Total_Amount) 
FOR Gender IN ([Male] , [Female])
) AS PivotTable

SELECT TOP 1
    Product_Category, COUNT(Transaction_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Items_Sold
FROM [retail_sales_cleaned.xlsx]
WHERE Age < 30
GROUP BY Product_Category
ORDER BY Total_Orders DESC;
