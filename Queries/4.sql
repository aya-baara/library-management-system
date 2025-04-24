--Popular Genre Analysis using Joins and Window Functions: Identify the most popular genre for a given month.
declare @month int=3;

select top(1) b.Genre ,count(b.Genre ) as GenreFreq
from Loans l
join Books b on b.BookId=l.BookID
WHERE MONTH(l.Date_Returned) = @month
group by b.Genre
order by GenreFreq desc 