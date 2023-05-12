SELECT CONCAT(SUM(Quantity), "(2020)") AS "P4 Product: Quantity Sold"
FROM Orders WHERE YEAR(Date) = 2020 AND ProductID = "P4"
UNION
SELECT CONCAT(SUM(Quantity), "(2021)") 
FROM Orders WHERE YEAR(Date) = 2021 AND ProductID = "P4"
UNION
SELECT CONCAT(SUM(Quantity), "(2022)") 
FROM Orders WHERE YEAR(Date) = 2022 AND ProductID = "P4";

---------------
SELECT CONCAT(SUM(Cost), "(2020)") AS "P2 Product: Total Cost"
FROM Orders WHERE YEAR(Date) = 2020 AND ProductID = "P2"
UNION
SELECT CONCAT(SUM(Cost), "(2021)") AS 
FROM Orders WHERE YEAR(Date) = 2021 AND ProductID = "P2"
UNION
SELECT CONCAT(SUM(Cost), "(2022)") AS 
FROM Orders WHERE YEAR(Date) = 2022 AND ProductID = "P2"
