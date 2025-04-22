/*
SQL Stored Procedure with Temp Table:
Design a stored procedure that retrieves all borrowers who have overdue books. Store these borrowers 
in a temporary table, then join this temp table with the Loans table to list out the specific
overdue books for each borrower
*/

create procedure sp_Overdue_books
as
begin 
 CREATE TABLE #OverdueBorrowers (
        BorrowerID int
    );
	
	insert into #OverdueBorrowers
	select distinct l.BorrowerID
	from Loans l
	where l.Due_Date < GETDATE() and l.Date_Returned is null

	select 
	br.BorrowerID,
    br.First_Name,
    br.Last_Name,
    b.Title,
    b.BookId,
    l.Due_Date,
    l.Date_Borrowed
	from #OverdueBorrowers ob
	join Borrowers br on br.BorrowerID = ob.BorrowerID
	join Loans l on l.BorrowerID = ob.BorrowerID
	join Books b on b.BookId = l.BookID
	where l.Due_Date < GETDATE() and l.Date_Returned is null

end;

