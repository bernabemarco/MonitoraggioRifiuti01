CREATE view ADIUTO_Fattureelettroniche
as
select td.Progressivo as IDTESTA, log.idtrasmittente, ex.PROGRESSIVOINVIO, 
td.tipodoc, td.numerodoc, td.esercizio, td.codclifor, dscconto1, partitaiva
from dbo.EXTRATESTEDOC ex
inner join dbo.TESTEDOCUMENTI td on td.PROGRESSIVO = ex.idtesta
inner join dbo.ANAGRAFICACF cf on cf.CODCONTO = td.codclifor
inner join dbo.ALD_B2B_LOG_FATTURE log on log.ProgressivoInvio = ex.PROGRESSIVOINVIO
where InvioSDI is not null
