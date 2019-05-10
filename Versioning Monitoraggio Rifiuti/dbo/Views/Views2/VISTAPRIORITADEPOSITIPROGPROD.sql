﻿create view [VISTAPRIORITADEPOSITIPROGPROD] as
	select
		'' as NOMEPIANIF,
		DEP.CODICE,
		10000 as PRIORITA
	from 
		ANAGRAFICADEPOSITI DEP		

	union all

	select
		PIAN.NOMEPIANIF,
		DEP.CODICE,
		ISNULL(PRI.PRIORITA,10000) as PRIORITA
	from 
		(IMPOSTAZIONIPROGPROD PIAN full outer join ANAGRAFICADEPOSITI DEP on 1=1)
		left outer join PRIORITADEPOSITIPROGPROD PRI on PRI.NOMEPIANIF=PIAN.NOMEPIANIF and PRI.CODDEPOSITO=DEP.CODICE

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAPRIORITADEPOSITIPROGPROD] TO [Metodo98]
    AS [dbo];

