

create view [dbo].[GEM_Vista_LogProcesso5]
as
select Progressivo, Descrizione
,CAST(CONVERT(CHAR(10), isnull(Datalancio,getdate()), 112) AS DATETIME)  as DataLancio
,CONVERT(CHAR(5), Datalancio, 114) as OraLancio,
DataModifica, 
UtenteModifica
from GEM_LogProcesso5



GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_LogProcesso5] TO [Metodo98]
    AS [dbo];

