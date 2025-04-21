----List of Borrowed Books: Retrieve all books borrowed by a specific borrower, including those currently unreturned.
declare  @BorrowerID int = 1
SELECT 
    b.BookId, 
    b.Title, 
    b.Author, 
    b.ISBN, 
    b.Published_Date, 
    b.Genre, 
    b.Shelf_Location
FROM Books b
JOIN Loans l ON l.BookID = b.BookID
WHERE l.BorrowerID = @BorrowerID;
