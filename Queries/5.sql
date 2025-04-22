--Stored Procedure - Add New Borrowers:



create procedure sp_AddNewBorrower (
@FirstName varchar (50),
@LastName varchar (50),
@Email varchar(100),
@DateOfBirth Date,
@MembershipDate Date
)
as begin
if NOT EXISTS(select  1 from Borrowers b where  b.Email=@Email) 
	begin
		insert Borrowers(First_Name , Last_Name , Email , Date_of_Birth , Membership_Date)
		values(@FirstName,@LastName,@Email,@DateOfBirth,@MembershipDate);

		SELECT BorrowerID FROM Borrowers WHERE Email = @Email;

	end
else 
	SELECT 'Email already exists' AS Message;
end;
