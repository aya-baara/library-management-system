
--determine the most 3 days in the week that have the most share of the loans and display the result of each day as a percentage of all loans. 
--Sort the results from the highest percentage to the lowest percentage.
declare @Total float = (select count(*) from Loans);
select top 3 FORMAT(Date_Borrowed, 'ddddd') as Day_Name, 
  ROUND((count(*) * 100.0 / @Total), 3) as LoanPercentage 
from Loans
group by  FORMAT(Date_Borrowed, 'ddddd')
order by LoanPercentage desc;
