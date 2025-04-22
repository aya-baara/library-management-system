
--Database Function - Calculate Overdue Fees:

create function fn_CalculateOverdueFees(
		@LoanId int
)
Returns int 
as 
begin 
	DECLARE @DaysLate INT = 0;
    DECLARE @Fee INT = 0;

	select @DaysLate = DATEDIFF(DAY, l.Due_Date, CAST(GETDATE() AS DATE))
	from Loans l  
	where l.LoanID= @LoanId
	IF @DaysLate IS NULL OR @DaysLate <= 0
		SET @Fee = 0;
	Else
		begin
			if(@DaysLate>30)
				 set @Fee=@DaysLate*2;
			else 
				set @Fee=@DaysLate;
		
		end;
	return @Fee;
end;
