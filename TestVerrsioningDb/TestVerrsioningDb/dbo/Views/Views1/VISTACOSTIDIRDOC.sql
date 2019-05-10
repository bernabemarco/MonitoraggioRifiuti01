﻿CREATE VIEW VISTACOSTIDIRDOC AS
SELECT
	IDCOMMCLI,
	NRRIGA,
	DESCRIZIONE,
	IDTESTADOC,
	IDRIGADOC,
	(SELECT POSIZIONE FROM RIGHEDOCUMENTI WHERE IDTESTA=CC.IDTESTADOC AND IDRIGA=CC.IDRIGADOC) AS POSDOC,	
	CODCLIFOR,
	IMPORTO,
	NATURARILEVAZIONE,
	TIPOREC,
	VOCEBASE,
	IDVOCE,
	IMPORTOEURO,
	TIPOCOSTO,
	IDTABELLA,
	ORIGINEEVENTO,
	TIPOINSERIMENTO,
	DATAELAB_CONS,
	DATAELAB_VAL,
	DATAMOVIMENTO,
	DATADISPONIBILITA,
	DATACOMPETENZA,
	DATARIFVALORIZ,
	TIPORECDETT,
	CONTOCDC,
	QTABASE,
	QTAVAL,
	UMBASE,
	UMVAL,
	QTABUDGET,
	PESO,
	NOTE,
	UTENTEMODIFICA,
	DATAMODIFICA
FROM
	CCBILANCIOCONSCOSTIDIRDOC CC

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACOSTIDIRDOC] TO [Metodo98]
    AS [dbo];

