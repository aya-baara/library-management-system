--Database Function - Book Borrowing Frequency:

create function fn_BookBorrowingFrequency(@bookId int)
returns int
as
begin
	declare @BookBorrowingFrequency int =0;
	select @BookBorrowingFrequency= count(*) from loans l
	where l.BookID=@bookId

	return @BookBorrowingFrequency;
end

SELECT dbo.fn_BookBorrowingFrequency(5) AS TimesBorrowed;