DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN p_bookingID INT
)
BEGIN
    DELETE FROM DecBookings
    WHERE bookingID = p_bookingID;

    SELECT 'Booking cancelled successfully' AS Confirmation;
END //

DELIMITER ;
