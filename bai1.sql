DELIMITER //
CREATE PROCEDURE cancelAppointment (IN p_appoinmentId INT) 
BEGIN 
    UPDATE Appointments
    SET status = 'Cancelled'
    WHERE Appointment_id = p_appointmentId;
END //
DELIMITER ;

CALL cancelAppoinment (5);

-- lỗi xảy ra vì procedure chỉ chọn cái giống với id truyền vào chứ không kiểm tra trạng thái dẫn đến việc thay đổi bất kể trạng thái

DROP PROCEDURE cancelAppointment;

DELIMITER //
CREATE PROCEDURE cancelAppointment (IN p_appoinmentId INT) 
BEGIN 
    UPDATE Appointments
    SET status = 'Cancelled'
    WHERE Appointment_id = p_appointmentId AND status = 'Pending';
END //
DELIMITER ;