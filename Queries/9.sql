--Author Popularity using Aggregation: Rank authors by the borrowing frequency of their books.

with author_frequancy (Author_name , borrowing_freq) as
(
select b.Author as Author_name ,count(*) as borrowing_freq
from loans l
join books b on b.BookId = l.BookID
group by (b.Author)
) 
select * , DENSE_RANK() over(order by Af.borrowing_freq desc) as author_rank
from author_frequancy Af
