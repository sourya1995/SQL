CREATE FUNCTION FindSoldQuantity(product_id VARCHAR(10), YearInput INT) returns INT 
DETERMINISTIC
RETURN (SELECT SUM(Quantity) FROM Orders WHERE ProductID = product_id AND YEAR(Date) = YearInput);
SELECT FindSoldQuantity("P3", 2021);

CREATE FUNCTION FindAverageCost(YearInput INT)
RETURNS DECIMAL(10, 2) DETERMINISTIC
RETURN(SELECT AVG(Cost) FROM Orders WHERE YEAR(Date) = YearInput);