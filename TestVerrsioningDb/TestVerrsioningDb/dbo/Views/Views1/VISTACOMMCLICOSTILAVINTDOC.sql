﻿CREATE VIEW VISTACOMMCLICOSTILAVINTDOC AS
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
    QUANTITA,
    UMBASE,
    COSTOUNILAV,
    COSTOTOTLAV,
    COSTOUNILAVEURO,
    COSTOTOTLAVEURO,
    CODFOR,
    TIPOCLP,
    NATURARILEVAZIONE,
    TIPOREC,
    (CASE WHEN NATURARILEVAZIONE=1 THEN COSTOTOTLAV ELSE 0 END) AS COSTOVALCONSUMATO,
    (CASE WHEN NATURARILEVAZIONE=4 THEN COSTOTOTLAV ELSE 0 END) AS COSTOVALPREVISTO,
    (CASE WHEN NATURARILEVAZIONE=1 THEN COSTOTOTLAVEURO ELSE 0 END) AS COSTOVALCONSUMATOEURO,
    (CASE WHEN NATURARILEVAZIONE=4 THEN COSTOTOTLAVEURO ELSE 0 END) AS COSTOVALPREVISTOEURO,
    VOCEBASE,
    IDVOCE,
    0 AS NUMEROMOV
FROM 
    CCBILANCIOCONSLAVINTDOC CC INNER JOIN ANAGRAFICACOMMESSE AC ON CC.IDCOMMCLI=AC.PROGRESSIVO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACOMMCLICOSTILAVINTDOC] TO [Metodo98]
    AS [dbo];
