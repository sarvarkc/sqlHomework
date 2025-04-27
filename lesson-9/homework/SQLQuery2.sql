;with cte
as (
	select 1 as num, 1 as Factorial
	union all
	select num + 1 as num, Factorial*(num+1) as Factorial
	from cte
	where num < 10
)
select * from cte