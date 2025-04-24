--Database Function - Book Borrowing Frequency:

create function fn_BookBorrowingFrequency(@bookId int)
returns int
as
begin
	
	return (select count(*) from loans l where l.BookID=@bookId)

end

SELECT dbo.fn_BookBorrowingFrequency(25) AS TimesBorrowed;