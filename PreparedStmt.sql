PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, Cost, Date FROM Orders WHERE ClientID = ? AND YEAR(Date) = ?';