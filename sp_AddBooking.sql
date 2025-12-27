DELIMITER //

CREATE PROCEDURE AddBooking(
    IN bookingID INT,
    IN customerID INT,
    IN bookingDate DATETIME,
    IN tableNo INT
)
BEGIN
    INSERT INTO DecBookings (bookingID, idCustomer, dateBooking, tableNumber)
    VALUES (bookingID, customerID, bookingDate, tableNo);

    SELECT 'New booking added' AS Confirmation;
END //

DELIMITER ;

