CALL CancelAppointment(105);

USE RikkeiClinicDB;

DROP PROCEDURE IF EXISTS CancelAppointment;

DELIMITER //
CREATE PROCEDURE CancelAppointment(IN p_appointment_id INT)
BEGIN
    UPDATE Appointments
    SET status = 'Cancelled'
    WHERE appointment_id = p_appointment_id 
      AND status = 'Pending';
END //
DELIMITER ;


-- Test Case 1: Cố gắng hủy lịch khám 105 (đã Completed) -> Sẽ KHÔNG bị đổi thành Cancelled
CALL CancelAppointment(105);
SELECT * FROM Appointments WHERE appointment_id = 105; -- Kì vọng: status vẫn là 'Completed'

-- Test Case 2: Hủy lịch khám 104 (đang Pending) -> Sẽ thành công đổi thành Cancelled
CALL CancelAppointment(104);
SELECT * FROM Appointments WHERE appointment_id = 104; -- Kì vọng: status chuyển thành 'Cancelled'