DELIMITER //

CREATE PROCEDURE GetDiscount(OrderIDInput INT)
    BEGIN
        DECLARE cost_after_discount DECIMAL(7, 2);
        DECLARE current_cost DECIMAL(7, 2);
        DECLARE order_quantity INT;
        SELECT Quantity INTO order_quantity FROM Orders WHERE OrderID = OrderIDInput; 
        --match quantity column from DB with quantity var, whenever orderID col equals input parameter value
        SELECT Cost INTO current_cost FROM Orders WHERE OrderID = OrderIDInput;
        IF order_quantity >= 20 THEN
            SET cost_after_discount = current_cost - (current_cost * 0.2);
        ELSEIF (order_quantity >= 10) THEN
            SET cost_after_discount = current_cost - (current_cost * 0.1);
        ELSE SET cost_after_discount = current_cost;
        END IF;
    SELECT cost_after_discount;
END//

DELIMITER ;

