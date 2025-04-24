--3 Borrowing Frequency using Window Functions: Rank borrowers based on borrowing frequency.

WITH NumOFBooks (borrowerId,booksCount) AS (
    SELECT l.borrowerId, COUNT(*) AS booksCount
    FROM loans l
    GROUP BY l.borrowerId
) 

SELECT b.* , 
nb.booksCount,
DENSE_RANK()over(order by nb.booksCount desc) as frenq
FROM NumOFBooks nb
join borrowers b on b.borrowerId =nb.borrowerId;
