/* 
EXERCISE ONE
We need a detailed list of invoices and invoice line numbers, but we're only interested in currency key 100.
1. Write a query to return InvoiceNumber, Invoice
LineNumber and SalesAmount from the FactInternetSales table.
2. Return only lines WHERE the currency key is 100.
Hint: Since line number is the lowest level of detail in the FactInternetSales table, you won't need to use GROUP
BY. 
*/

SELECT 
    SalesOrderNumber AS InvoiceNumber,
    SalesOrderLineNumber AS InvoiceLineNumber,
    SalesAmount 


FROM FactInternetSales

WHERE CurrencyKey = 100


/*
EXERCISE TWO
Create a list of product costs, grouped by invoice numbers.
1. Write a query to return Invoice Number and TotalProductCost from the FactInternetSales table.
2. Return only invoices that HAVE a total product cost per Invoice Number > 2000.
Hint: You first need to group by the invoice to get the total and then filter.
*/


SELECT 
    SalesOrderNumber AS InvoiceNumber,
    TotalProductCost AS TotalProductCost

FROM FactInternetSales

GROUP BY SalesOrderNumber, TotalProductCost

HAVING TotalProductCost > 2000


/*
EXERCISE THREE
Sales territory 1 need a summary of their sales for the lead up period to Christmas.
1. Write a query against the FactInternet
Sales table that returns orders placed in December for the Sales Territory 1
2. The query should include
SalesOrderNumber,
SalesOrderLineNumber, SalesAmount and TaxAmount.
*/ 

SELECT 

    SalesOrderNumber,
    SalesOrderLineNumber,
    SalesAmount,
    TaxAmt


FROM FactInternetSales

WHERE SalesTerritoryKey = 1 AND OrderDateKey LIKE '____12__'


-- CORRECTIONS

SELECT 

    SalesOrderNumber,
    SalesOrderLineNumber,
    SalesAmount,
    TaxAmt


FROM FactInternetSales

WHERE SalesTerritoryKey = 1 AND DATENAME(month, OrderDate) = N'December'



/*
EXERCISE FOUR

Marketing need a list of homeowner customers, along with the number of cars owned.
1. Write a query against the dimCustomer table that returns all customers that are homeowners and have more than 1 car.
2. The query should include full customer names,
number of cars owned, and email.
3. The numbers of cars owned should categorize customers into groups:
-2-3
- 4+
*/ 

SELECT
    CONCAT(FirstName,' ', ISNULL(MiddleName,''),' ', LastName) AS CustomerName,
    CASE 
        WHEN NumberCarsOwned BETWEEN 2 AND 3 THEN '2-3'
        WHEN NumberCarsOwned >= 4 THEN '4+'
        ELSE 'UKNWN'
    END AS NumberOfCarsOwned,
    EmailAddress AS EmailAddress


FROM DimCustomer

WHERE HouseOwnerFlag >= 1 AND NumberCarsOwned > 1 

-- CORRECTIONS

SELECT
    CONCAT(FirstName,' ', LastName) AS CustomerName,
    CASE 
        WHEN NumberCarsOwned IN(2,3) THEN '2-3'
        WHEN NumberCarsOwned >= 4 THEN '4+'
        ELSE 'UKNWN'
    END AS NumberOfCarsOwned,
    EmailAddress AS EmailAddress


FROM DimCustomer

WHERE HouseOwnerFlag >= 1 AND NumberCarsOwned > 1 


/*
EXERCISE FIVE
Summarize the Internet Sales by Subcategory and return the top 5 subcategories.
1. Write a query that returns the top 5 best-selling subcategories by SalesAmount.
2. We're only interested in sales from our website (internet sales).
3. Finally, the data should only include sales where the country is United States and the currency is US Dollar
4. You are avoid using the view we created.
*/


/*
EXERCISE SIX
It's performance review time. HR Europe need to see sales by sales representative, and by currency.
1. Write a query that will return
a list of all current Sales Representatives or Sales Managers in the European territory.
2. For each person, HR need to see sales amounts grouped by currency.
3. Please include the following fields: Full employee name, Employee Title, Currency Name and total sales amount
4. The query should be sorted by Employee Name and Sales Amount.
*/


/*
EXERCISE SEVEN
Create a summary of expenditure accounts.
1. Write a query that will return the sum of actuals from the FactFinance table.
2. Filter the data to meet the following conditions: -January, 2011 only
- Southwest Division only - expenditure accounts only
3. For each row, list the Organization, Account Type and Account Name.
4. Group the rows by organization and account.
*/


/*
EXERCISE EIGHT
Create a summary of expenditure account totals, and then calculate a Pct of Total.
1. First, write a query that will return AccountDescription, and amounts corresponding to actuals.
2. Filter the results to meet the following conditions: Actuals only
- Canadian division only - Calendar year 2013 only - Expenditure accounts only
3. Create a subquery to calculate the total sales that meet the same conditions.
HINT: Sometimes it's easier to create the subquery separately and then add it to your main
query.
*/




































