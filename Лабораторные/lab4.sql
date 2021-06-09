SELECT [Name], ListPrice FROM Production.Product 
WHERE ListPrice = (SELECT MAX(ListPrice) FROM Production.Product);

SELECT COUNT(TerritoryName) AS MaxSellerCount, TerritoryName
FROM Sales.vSalesPerson
GROUP BY TerritoryName
HAVING COUNT(TerritoryName)>=ALL
(SELECT COUNT(TerritoryName)
FROM Sales.vSalesPerson
GROUP BY TerritoryName);

SELECT p1.[Name], p1.ProductSubcategoryID
FROM Production.Product AS p1
WHERE p1.Size IS NOT NULL
AND
(SELECT COUNT(DISTINCT p2.Size)
FROM Production.Product AS p2
WHERE p1.ProductSubcategoryID = p2.ProductSubcategoryID
AND p2.Size IS NOT NULL
GROUP BY p2.ProductSubcategoryID) < 3
ORDER BY ProductSubcategoryID;

SELECT p1.[Name]
      ,p1.ListPrice
      ,p1.ProductSubcategoryID      
FROM Production.Product AS p1
WHERE p1.ProductSubcategoryID IS NOT NULL AND
p1.ListPrice = 
    (SELECT MIN(ListPrice)
        FROM Production.Product AS p2
        WHERE p2.ProductSubcategoryID IS NOT NULL AND
        p1.ProductSubcategoryID = p2.ProductSubcategoryID);

SELECT [Name], ListPrice, Style
FROM Production.Product
WHERE ListPrice <
  (SELECT MIN(AvgListPrice)
  FROM
    (
      SELECT AVG(ListPrice) AS AvgListPrice
      FROM Production.Product
      WHERE ListPrice > 0
    ) AS T
  )
EXCEPT
SELECT [Name], ListPrice, Style
FROM Production.Product AS p
WHERE p.ListPrice > ANY
    (
        SELECT AVG(ListPrice)
        FROM Production.Product
        WHERE ListPrice > 0 AND Style IS NOT NULL
        GROUP BY Style)