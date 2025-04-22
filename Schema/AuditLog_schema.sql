

create table AuditLog (
LogID INT PRIMARY KEY IDENTITY,
BookId int NOT NULL foreign key references Books(BookId),
StatusChange varchar (30),
ChangeDate date
) 