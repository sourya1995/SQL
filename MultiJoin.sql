SELECT Clients.ClientID, Clients.ContactNumber, Addresses.Street, Addresses.County, Orders.OrderID,
Orders.ProductID, Products.ProductName, Orders.Cost, Orders.Date
FROM Clients
INNER JOIN Addresses ON Clients.AddressID = Addresses.AddressID
INNER JOIN Orders ON Clients.ClientID = Orders.ClientID
INNER JOIN Products ON Orders.ProductID = Products.ProductID
WHERE YEAR(Orders.Date) = 2021 OR YEAR(Orders.Date) = 2022
ORDER BY Orders.Date;

--------------

SELECT Employees.FullName, Addresses.Street, Addresses.County
FROM Employees INNER JOIN Addresses
ON Employees.AddressID = Addresses.AddressID
UNION
SELECT Clients.FullName, Addresses.Street, Addresses.County
FROM Clients INNER JOIN Addresses ON Clients.AddressID = Addresses.AddressID
ORDER BY Street;