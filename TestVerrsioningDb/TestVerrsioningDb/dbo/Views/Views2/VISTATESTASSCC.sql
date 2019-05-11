﻿create view VISTATESTASSCC as
	select 
		RAGSOCCOGNOME as RAGIONESOCIALE,
		VIASEDEFISCALE + ',' + NUMSEDEFISCALE as INDIRIZZO,	
		COMUNESEDEFISCALE as LOCALITA,
		PROVSEDEFISCALE as PROVINCIA,
		(select TELEFONO from ANAGRAFICACF where CODCONTO=(select top 1 CODCLI from TABVINCOLIPRODUZIONE order by PROGRESSIVO desc)) as TELEFONO,
		(select FAX from ANAGRAFICACF where CODCONTO=(select top 1 CODCLI from TABVINCOLIPRODUZIONE order by PROGRESSIVO desc)) as FAX,
		(select TELEX from ANAGRAFICACF where CODCONTO=(select top 1 CODCLI from TABVINCOLIPRODUZIONE order by PROGRESSIVO desc)) as EMAIL
	from TABDITTE

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTATESTASSCC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTATESTASSCC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTATESTASSCC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATESTASSCC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTATESTASSCC] TO [Metodo98]
    AS [dbo];
