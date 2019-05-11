﻿create view [VISTASITUAZIONEPROGPRODRAGG] as
select 
	NOMEPIANIF,
	TIPORECORDRAGG2 as TIPORECORDRAGG,
	CODART,
	CODCLIFOR,
	sum(QTABASE) as QUANTITA
from VISTASITUAZIONEPROGPROD 
group by NOMEPIANIF, TIPORECORDRAGG2,CODART,CODCLIFOR with rollup

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASITUAZIONEPROGPRODRAGG] TO [Metodo98]
    AS [dbo];
