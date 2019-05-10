﻿CREATE VIEW VISTACOMMCLICOSTILAVEST AS
SELECT 
    IDCOMMCLI,
    RIFCOMM,
    RIFCOMMRIEP,
    CLICOMMITT,
    TIPOCOM,
    ANNOCOM,
    NUMCOM,
    DATAEMISSIONE,
    STATOCOMMESSA,
    FLGTIPOCOMM,    
    NRRIGA,
    CODART,
    DSCARTICOLO,
    IDTESTADOC AS RIFTESTA,
    IDRIGADOC AS RIFRIGA,
    ORIGINEEVENTO,
    IDTESTADOC AS RIFTESTA_DEST,
    IDRIGADOC AS RIFRIGA_DEST,
    ORIGINEEVENTO AS ORIGINEEVENTO_DEST,
    IDTESTAFATT,
    IDRIGAFATT,
    QUANTITA,
    UMBASE,
    QTAVAL,
    UMVAL,
    COSTOUNILAV,
    COSTOTOTLAV,
    COSTOUNILAVEURO,
    COSTOTOTLAVEURO,
    CODFOR,
    TIPOCLP,
    NATURARILEVAZIONE,
    TIPOREC,
    (CASE WHEN NATURARILEVAZIONE=1 THEN COSTOTOTLAV ELSE 0 END) AS COSTOVALCONSUMATO,
    (CASE WHEN NATURARILEVAZIONE=3 THEN COSTOTOTLAV ELSE 0 END) AS COSTOVALORDINATO,
    (CASE WHEN NATURARILEVAZIONE=4 THEN COSTOTOTLAV ELSE 0 END) AS COSTOVALPREVISTO,
    (CASE WHEN NATURARILEVAZIONE=1 THEN COSTOTOTLAVEURO ELSE 0 END) AS COSTOVALCONSUMATOEURO,
    (CASE WHEN NATURARILEVAZIONE=3 THEN COSTOTOTLAVEURO ELSE 0 END) AS COSTOVALORDINATOEURO,
    (CASE WHEN NATURARILEVAZIONE=4 THEN COSTOTOTLAVEURO ELSE 0 END) AS COSTOVALPREVISTOEURO,
    VOCEBASE,
    IDVOCE,
    0 AS NUMEROMOV
FROM 
    CCBILANCIOCONSLAVEST CC INNER JOIN ANAGRAFICACOMMESSE AC ON CC.IDCOMMCLI=AC.PROGRESSIVO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACOMMCLICOSTILAVEST] TO [Metodo98]
    AS [dbo];

