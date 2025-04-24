/*
Purpose: Generate a report of books borrowed within a specified date range.
Parameters: StartDate, EndDate
Implementation: Retrieve all books borrowed within the given range, with details like borrower name and borrowing date.
*/

create procedure sp_BorrowedBooksReport(@StartDate date ,@EndDate date)
as 
begin
	select b.BookId, b.Title,
	br.First_Name,br.Last_Name ,
	l.Date_Borrowed
	from loans l 
	join Books b on b.BookId=l.BookID
	join Borrowers br on br.BorrowerID=l.BorrowerID
	where l.Date_Borrowed between @StartDate and @EndDate
end;
