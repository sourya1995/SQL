CREATE VIEW DataSummary AS 
SELECT Clients.FullName, Clients.ContactNumber, Addresses.County, Products.ProductName, Orders.ProductID, Orders.Cost,
Orders.Date 
FROM Clients INNER JOIN Addresses ON Clients.AddressID = Addresses.AddressID
INNER JOIN Orders ON Clients.ClientID = Orders.ClientID
INNER JOIN Products ON Orders.ProductID = Products.ProductID
WHERE YEAR(Orders.Date) = 2022 
ORDER BY Orders.Cost DESC;