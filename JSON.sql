SELECT Activity.Properties ->> '$.ProductID'
AS ProductID, Products.ProductName, Products.BuyPrice, Products.SellPrice
FROM Products INNER JOIN Activity
ON Products.ProductID = Activity.Properties ->> '$.ProductID'
WHERE Activity.Properties ->> '$.Order' = "True";


----------------------
SELECT Activity.Properties ->> '$.ClientID'
AS ClientID, Activity.Properties ->> '$.ProductID'
AS ProductID, Clients.FullName, Clients.ContactNumber
FROM Clients RIGHT JOIN Activity
ON Clients.ClientID = Activity.Properties ->> '$.ClientID';
