CREATE TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
    SELECT
        i.BookID,
        i.Current_Status,
        GETDATE()
    FROM inserted i
    JOIN deleted d ON i.BookID = d.BookID
    WHERE 
        (d.Current_Status = 'Available' AND i.Current_Status = 'Borrowed')
        OR (d.Current_Status = 'Borrowed' AND i.Current_Status = 'Available');
END;