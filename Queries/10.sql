--Genre Preference by Age using Group By and Having: Determine the preferred genre of different age groups of borrowers. 
--(Groups are (0,10), (11,20), (21,30)…)


with Borrower_Ages as (
    select 
        b.Genre,
        FLOOR(DATEDIFF(YEAR, br.Date_of_Birth, GETDATE()) / 10) * 10 as AgeGroupStart
    from loans l
    join Borrowers br on br.BorrowerID = l.BorrowerID
    join Books b on b.BookId = l.BookID
),

Genre_Preference as (
select Genre ,
AgeGroupStart,
count(*) as frequancy
from Borrower_Ages
group by AgeGroupStart , Genre
)
select gp.*
from Genre_Preference gp
join (
    select AgeGroupStart, max(frequancy) as MaxFreq
    from Genre_Preference
    group by AgeGroupStart
) as maxed
on gp.AgeGroupStart = maxed.AgeGroupStart
and gp.frequancy = maxed.MaxFreq
order by gp.AgeGroupStart asc

