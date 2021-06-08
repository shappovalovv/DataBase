SELECT * FROM Production.ProductModel;

SELECT IllustrationID, Diagram FROM Production.Illustration;

SELECT ProductID, LocationID, Shelf, Quantity FROM Production.ProductInventory WHERE Quantity > 400;

SELECT AddressID, AddressLine1, City FROM Person.[Address] WHERE AddressLine2 IS NOT NULL

SELECT CreditCardID, CardType, CardNumber FROM Sales.CreditCard WHERE CardType LIKE '%Card%';

SELECT * FROM Production.ProductReview WHERE ProductID IN (798, 937);

SELECT FirstName, ISNULL (MiddleName, '---'),  LastName, ISNULL (Suffix, 'NO') FROM Person.Person;

SELECT ProductID, [Name], COALESCE(Color, CAST([Weight] AS VARCHAR(30)), 'UNKNOWN') AS Meauserement FROM Production.Product;

SELECT TerritoryID, [Name], CountryRegionCode FROM Sales.SalesTerritory ORDER BY name;

SELECT NULLIF (TaxType, 2) AS TaxType, TaxRate, [Name] FROM Sales.SalesTaxRate;