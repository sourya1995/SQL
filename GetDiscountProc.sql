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
----------------------------------------------------
DELIMITER //

CREATE PROCEDURE EvaluateProduct(IN product_id VARCHAR(10), OUT SoldItemsIn2020 INT, OUT SoldItemsIn2021 INT, OUT SoldItemsIn2022 INT)
BEGIN
SELECT SUM(Quantity) INTO SoldItemsIn2020 FROM Orders WHERE ProductID=product_id AND YEAR(Date)=2020;
SELECT SUM(Quantity) INTO SoldItemsIn2021 FROM Orders WHERE ProductID=product_id AND YEAR(Date)=2021;
SELECT SUM(Quantity) INTO SoldItemsIn2022 FROM Orders WHERE ProductID=product_id AND YEAR(Date)=2022;
END //

DELIMITER ;
CALL EvaluateProduct('P1', @sold_items_2020, @sold_items_2021, @sold_items_2022);

SELECT @sold_items_2020, @sold_items_2021, @sold_items_2022;

------------------------------------------

DELIMITER //
CREATE PROCEDURE GetProfit(IN product_id VARCHAR(10), IN YearInput INT)
BEGIN
DECLARE profit DEC(7, 2) DEFAULT 0.0;
DECLARE sold_quantity, buy_price, sell_price INT DEFAULT 0;
SELECT SUM(Quantity) INTO sold_quantity FROM Orders WHERE ProductID = product_id AND YEAR(Date) = YearInput;
SELECT BuyPrice INTO buy_price FROM Products WHERE ProductID = product_id;
SELECT SellPrice INTO sell_price FROM Products WHERE ProductID = product_id;
SET profit = (sell_price * sold_quantity) - (buy_price * sold_quantity);
SELECT profit;
END //

DELIMITER ;
CALL GetProfit('P1', 2020);
