SELECT Activity.Properties ->> '$.ProductID'
AS ProductID, Products.ProductName, Products.BuyPrice, Products.SellPrice
FROM Products INNER JOIN Activity
ON Products.ProductID = Activity.Properties ->> '$.ProductID'
WHERE Activity.Properties ->> '$.Order' = "True";