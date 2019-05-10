create view [dbo].[VISTAELABORAZIONEPROGPRODUZIONE] as
	select 		
		PP.*,
		right('000000' + cast(isnull(CCLI.PRIORITAELABORAZIONEMRP,999999) as varchar(6)),6) + PP.RIFCOMMCLI as PRIORITACOMMCLI,
		(case PP.TIPO
			when 0 then -1
			when 1 then 1
			when 2 then 1
			when 3 then -1
			when 4 then 1
			when 5 then 1
			when 6 then 1
			when 7 then -1
			when 8 then 0
			when 9 then 0
			when 10 then -1
			when 11 then 0
		end) as SEGNO
	from 
		PROGPRODUZIONE PP
		left outer  join ANAGRAFICACOMMESSE CCLI on CCLI.RIFCOMM=PP.RIFCOMMCLI

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAELABORAZIONEPROGPRODUZIONE] TO [Metodo98]
    AS [dbo];

