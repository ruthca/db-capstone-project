DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN bookingDate DATETIME,
    IN tableNo INT,
    IN customerID INT
)
BEGIN
    DECLARE bookingCount INT;

    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) 
    INTO bookingCount
    FROM DecBookings
    WHERE DATE(dateBooking) = DATE(bookingDate)
      AND tableNumber = tableNo;

    IF bookingCount > 0 THEN
        ROLLBACK;
        SELECT 'Table is already booked - booking declined' AS BookingStatus;
    ELSE
        INSERT INTO DecBookings (dateBooking, tableNumber, idCustomer)
        VALUES (bookingDate, tableNo, customerID);

        COMMIT;
        SELECT 'Booking successful' AS BookingStatus;
    END IF;

END //

DELIMITER ;
