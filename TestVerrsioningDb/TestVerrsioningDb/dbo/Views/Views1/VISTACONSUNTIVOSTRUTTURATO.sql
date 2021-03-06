﻿CREATE VIEW VISTACONSUNTIVOSTRUTTURATO AS
SELECT 
	IDCOMMCLI,
	RIFCOMM,
	RIFCOMMRIEP,
	(CASE WHEN TIPONODO=0 THEN LIVPADRE ELSE CODNODO END) AS CODNODO,
	(CASE WHEN TIPONODO=0 THEN CODNODO ELSE '' END) AS CODFOGLIA,
	DESCRIZIONE,
	DESCRIZIONECC,
	TIPOCOSTO,
	VOCEBASE,
	IDVOCE,
	CODICE,
	QTABASE,
	UMBASE,
	UMVAL,
	PRC,
	ORIGINEEVENTO,
	STATOCOMMESSA,
	RIFTESTA,
	RIFRIGA,
	COSTOUNIEURO,
	CONSUNTIVATORIPEURO,
	RISERVATORIPEURO,
	ORDINATORIPEURO,
	PREVISTORIPEURO,
	COSTOTOTRIPEURO,
	COSTOUNILIRE,
	CONSUNTIVATORIP,
	RISERVATORIP,
	ORDINATORIP,
	PREVISTORIP,
	COSTOTOTRIP,
	TIPOREC,
	IDRECORDV
FROM 
	VISTARIEPILOGOCCSTRUTT

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACONSUNTIVOSTRUTTURATO] TO [Metodo98]
    AS [dbo];

