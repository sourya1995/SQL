DELIMITER //

CREATE TRIGGER NotifyProductDelete
    AFTER DELETE
    ON Products FOR EACH ROW 
    INSERT INTO Notifications(Notification, DateTime)
    VALUES(CONCAT('The product with a ProductID', OLD.ProductID, 'was deleted'), NOW());

DELIMITER;

------------------------------------

CREATE TRIGGER UpdateAudit
    AFTER INSERT
    ON Orders FOR EACH ROW
    INSERT INTO Audit(OrderDateTime)
    VALUES(Current_timestamp);