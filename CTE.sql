WITH 
CL1_Orders AS (SELECT CONCAT("Cl1:", COUNT(OrderID), "orders") AS "Total Number of Orders"
FROM Orders
WHERE YEAR(Date) = 2022 AND ClientID = "Cl1"),
CL2_Orders AS (SELECT CONCAT("Cl2:", COUNT(OrderID), "orders") 
FROM Orders
WHERE YEAR(Date) = 2022 AND ClientID = "Cl2"),
CL3_Orders AS (SELECT CONCAT("Cl3:", COUNT(OrderID), "orders")
FROM Orders
WHERE YEAR(Date) = 2022 AND ClientID = "Cl3")
SELECT * FROM CL1_Orders
UNION
SELECT * FROM CL2_Orders
UNION
SELECT * FROM CL3_Orders;