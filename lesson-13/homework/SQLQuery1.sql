


declare @date date = getdate();

declare @down_limit date = cast(concat(year(@date), '-', month(@date), '-', '1') as date);

declare @starting date = dateadd(day, -7, @down_limit)

declare @limit date = EOMONTH(@date)

declare @newtable table(
	Sunday int,
	Monday int,
	Tuesday int,
	Wednesday int,
	Thursday int,
	Friday int,
	Saturday int
);


while @starting < @limit
begin
	insert into @newtable
	select day(iif(@starting between @down_limit and @limit,@starting,NULL)),
	day(iif(dateadd(day, 1, @starting) between @down_limit and @limit,dateadd(day, 1, @starting), NULL)),
	day(iif(dateadd(day, 2, @starting) between @down_limit and @limit,dateadd(day, 2, @starting), NULL)),
	day(iif(dateadd(day, 3, @starting) between @down_limit and @limit,dateadd(day, 3, @starting), NULL)),
	day(iif(dateadd(day, 4, @starting) between @down_limit and @limit,dateadd(day, 4, @starting), NULL)),
	day(iif(dateadd(day, 5, @starting) between @down_limit and @limit,dateadd(day, 5, @starting), NULL)),
	day(iif(dateadd(day, 6, @starting) between @down_limit and @limit,dateadd(day, 6, @starting), NULL))
	where datename(weekday, @starting) = 'Sunday'
	set @starting = dateadd(day, 1, @starting)
end;

select * from @newtable;