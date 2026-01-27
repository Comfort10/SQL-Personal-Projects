/* 
EXERCISE ONE
We need a detailed list of invoices and invoice line numbers, but we're only interested in currency key 100.
1. Write a query to return InvoiceNumber, Invoice
LineNumber and SalesAmount from the FactInternetSales table.
2. Return only lines WHERE the currency key is 100.
Hint: Since line number is the lowest level of detail in the FactInternetSales table, you won't need to use GROUP
BY. 
*/

/*
EXERCISE TWO
Create a list of product costs, grouped by invoice numbers.
1. Write a query to return Invoice Number and TotalProductCost from the FactInternetSales table.
2. Return only invoices that HAVE a total product cost per Invoice Number > 2000.
Hint: You first need to group by the invoice to get the total and then filter.
*/


















/*
EXERCISE ONE
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
EXERCISE TWO

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

