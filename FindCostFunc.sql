CREATE FUNCTION FindCost(order_id INT)
RETURNS DECIMAL(5, 2) DETERMINISTIC
RETURN (SELECT Cost FROM Orders WHERE OrderID = order_id);