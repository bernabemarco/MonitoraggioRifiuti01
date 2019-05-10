create function [dbo].[MaxDate](@date1 as datetime, @date2 as datetime) returns datetime
begin
	
	declare @d1 datetime
	declare @d2 datetime
	declare @rd datetime

	--tolgo la parte frazionale delle date
	set @d1 = Convert(DateTime, Floor(Convert(Float, @date1)))
	set @d2 = Convert(DateTime, Floor(Convert(Float, @date2)))

	if (DateDiff(day, @d1, @d2) > 0)
		set @rd = @d2
	else
		set @rd = @d1
	
	return @rd 
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MaxDate] TO [Metodo98]
    AS [dbo];

