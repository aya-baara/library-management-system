create index idx_Loans_BorrowerId on loans(borrowerId);
create index idx_Loans_BookId on loans(bookId);
create index idx_Loans_DueDate on loans(due_date);
CREATE INDEX idx_Loan_DateBorrowed ON loans (date_borrowed);

create index idx_Books_genre on Books(genre);
create index idx_Books_title on Books(title);

create index idx_Borrowers_genre on borrowers(date_of_birth);





