SELECT MAX(ListPrice) AS MaxPrice
FROM Production.Product;

SELECT MIN(Weight) AS MinWeight
FROM Production.Product
WHERE Weight IS NOT NULL;

SELECT Gender, AVG(DATEDIFF(YEAR, BirthDate, GETDATE())) as AvgOld
FROM HumanResources.Employee
WHERE Gender IS NOT NULL AND BirthDate IS NOT NULL
GROUP BY Gender

SELECT CountryRegionCode, COUNT(Name) as Count
FROM Person.StateProvince
WHERE CountryRegionCode IS NOT NULL
GROUP BY CountryRegionCode
HAVING COUNT(Name) = 1

SELECT BusinessEntityID, LastReceiptDate, AVG(StandardPrice) as AvgPrice
FROM Purchasing.ProductVendor
GROUP BY ROLLUP(BusinessEntityID, LastReceiptDate);
