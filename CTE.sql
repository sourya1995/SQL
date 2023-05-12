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

----------------------------------------
WITH
P2_Sales_2020 AS (SELECT CONCAT(SUM(Cost), "(2020)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2020 AND ProductID = "P2"),
P2_Sales_2021 AS (SELECT CONCAT(SUM(Cost), "(2021)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2021 AND ProductID = "P2"),
P2_Sales_2022 AS (SELECT CONCAT(SUM(Cost), "(2022)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2022 AND ProductID = "P2")
SELECT * FROM P2_Sales_2020
UNION
SELECT * FROM P2_Sales_2021
UNION
SELECT * FROM P2_Sales_2022;