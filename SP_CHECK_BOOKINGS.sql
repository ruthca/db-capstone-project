DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN bookingDate DATETIME,
    IN tableNo INT
)
BEGIN
    DECLARE tableStatus INT;

    SELECT COUNT(*) 
    INTO tableStatus
    FROM DecBookings
    WHERE dateBooking = bookingDate
      AND tableNumber = tableNo;

    IF tableStatus > 0 THEN
        SELECT 'Table is already booked' AS BookingStatus;
    ELSE
        SELECT 'Table is available' AS BookingStatus;
    END IF;
END //

DELIMITER ;
