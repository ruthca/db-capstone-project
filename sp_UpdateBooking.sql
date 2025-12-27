DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN p_bookingID INT,
    IN p_bookingDate DATETIME
)
BEGIN
    UPDATE DecBookings
    SET dateBooking = p_bookingDate
    WHERE bookingID = p_bookingID;

    SELECT 'Booking updated successfully' AS Confirmation;
END //

DELIMITER ;

