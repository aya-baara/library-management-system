create table Books(
BookId int Primary Key Identity (1,1),
Title varchar(30) NOT NULL,
Author  varchar(30) NOT NULL ,
ISBN varchar(20) NOT NULL UNIQUE ,
Published_Date Date NOT NULL,
Genre  varchar(30) NOT NULL,
Shelf_Location varchar(30) NOT NULL,
Current_Status varchar(10) Check (Current_Status in ('Available','Borrowed')) NOT NULL
);

GO

Create table Borrowers(
BorrowerID int primary key Identity (1,1),
First_Name varchar(50) NOT NULL ,
Last_Name varchar(50) NOT NULL ,
Email varchar(100) NOT NULL UNIQUE  ,
Date_of_Birth Date Not NULL ,
Membership_Date Date Not NULL 
); 

GO

create table Loans(
LoanID int primary key Identity (1,1),
BookID int NOT NULL foreign key references Books(BookId),
BorrowerID int NOT NULL foreign key references Borrowers(BorrowerID),
Date_Borrowed Date NOT NULL,
Due_Date Date NOT NULL ,
Date_Returned Date NULL
);