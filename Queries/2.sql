-- Active Borrowers: Identify borrowers who've borrowed 2 or more books and haven't returned any, using CTEs

WITH ActiveBorrowersWithoutReturns (BorrowerID, BorrowedBooksCount) AS (
    SELECT l.BorrowerID,
           COUNT(*) AS BorrowedBooksCount
    FROM Loans l
    WHERE l.Date_Returned IS NULL
    GROUP BY l.BorrowerID
)
SELECT br.*
FROM ActiveBorrowersWithoutReturns ab
JOIN Borrowers br ON br.BorrowerID = ab.BorrowerID
WHERE ab.BorrowedBooksCount >= 2;