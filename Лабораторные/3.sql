SELECT AccountNumber, SalesT.Name
FROM Sales.Customer AS Customer
INNER JOIN Sales.SalesTerritory AS SalesT
ON Customer.TerritoryID=SalesT.TerritoryID;

SELECT Name,BusinessEntityID
FROM 
Person.ContactType AS CT
LEFT JOIN
Person.BusinessEntityContact AS BEC
ON CT.ContactTypeID=BEC.ContactTypeID;

SELECT ProductID, SR.Name
FROM Production.ScrapReason AS SR RIGHT JOIN Production.WorkOrder AS WO
ON SR.ScrapReasonID=WO.ScrapReasonID;

SELECT DISTINCT P1.ProductSubcategoryID, P1.ListPrice
FROM Production.Product AS P1 JOIN Production.Product AS P2
ON P1.ProductSubcategoryID=P2.ProductSubcategoryID
AND P1.ListPrice<>P2.ListPrice
ORDER BY P1.ProductSubcategoryID;

SELECT DISTINCT P1.ProductSubcategoryID, P1.ListPrice
FROM Production.Product AS P1 JOIN Production.Product AS P2
ON P1.ListPrice=P2.ListPrice
AND P1.ProductSubcategoryID<>P2.ProductSubcategoryID
ORDER BY P1.ListPrice;

SELECT DISTINCT P1.ProductID, P1.UnitPrice
FROM Purchasing.PurchaseOrderDetail AS P1 JOIN Purchasing.PurchaseOrderDetail AS P2
ON P1.ProductID=P2.ProductID
AND P1.UnitPrice<>P2.UnitPrice
WHERE P1.UnitPrice<30 AND P2.UnitPrice<30
ORDER BY P1.ProductID;

SELECT CreditCardID, ModifiedDate
FROM Sales.CreditCard
UNION
SELECT CreditCardID, ModifiedDate
FROM Sales.PersonCreditCard;

SELECT ProductID
FROM Production.Product
INTERSECT
SELECT ProductID
FROM Production.TransactionHistory