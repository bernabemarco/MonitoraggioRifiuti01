﻿create VIEW [dbo].[ald_Movcon_Scad] AS

SELECT 
	DATAREG,
	NUMRIFPARTCONT,
	TS.NUMRIF as Scad_Numrif,
	NUMEROPROT,
	CODCLIFOR,
	PROGRESSIVO as Scad_Progressivo,
	TS.ESERCIZIO,
	TIPODOC,
	TS.NUMDOC as Scad_Numdoc,
	RI.NRREG as RIgheCont_progressivo 
 FROM TABSCADENZE TS LEFT OUTER JOIN RIGHECONTABILITA RI  ON NUMRIFPARTCONT= NRPARTITA AND TS.NUMRIF=RI.NRRIF AND CODCLIFOR=RI.CONTO
 INNER JOIN RIGHEIVA RIVA ON RI.NRREG=RIVA.NRREG AND RI.NRRIGA=RIVA.NRRIGA
 WHERE NUMRIFPARTCONT<>''  AND  NRRIF<>'' AND RI.NRRIGA=1

GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_Movcon_Scad] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_Movcon_Scad] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_Movcon_Scad] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_Movcon_Scad] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_Movcon_Scad] TO [Metodo98]
    AS [dbo];

