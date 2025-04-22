--Overdue Analysis: List all books overdue by more than 30 days with their associated borrowers.

select br.*, b.*,
DATEDIFF(DAY, l.Due_Date, CAST(GETDATE() AS DATE)) AS DaysOverdue
from loans l 
join Books b on b.BookId = l.BookID
join Borrowers br on br.BorrowerID = l.BorrowerID
WHERE DATEDIFF(DAY, l.Due_Date, CAST(GETDATE() AS DATE)) > 30;