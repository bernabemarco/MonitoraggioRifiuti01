﻿CREATE VIEW VISTACOMMCLICOSTIDIRDOC AS
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
    DESCRIZIONE,
    IDTESTADOC AS RIFTESTA,
    IDRIGADOC AS RIFRIGA,
    ORIGINEEVENTO,
    IDTESTADOC AS RIFTESTA_DEST,
    IDRIGADOC AS RIFRIGA_DEST,
    ORIGINEEVENTO AS ORIGINEEVENTO_DEST,
    CODCLIFOR,
    NATURARILEVAZIONE,
    TIPOREC,
    (CASE WHEN TIPOREC='S3' THEN IMPORTO ELSE 0 END) AS IMPCONSUMATO,
    (CASE WHEN TIPOREC='S2' THEN IMPORTO ELSE 0 END) AS IMPPREVISTO,
    (CASE WHEN TIPOREC='S3' THEN IMPORTOEURO ELSE 0 END) AS IMPCONSUMATOEURO,
    (CASE WHEN TIPOREC='S2' THEN IMPORTOEURO ELSE 0 END) AS IMPPREVISTOEURO,
    IMPORTO,
    VOCEBASE,
    IDVOCE,
    0 AS NUMEROMOV
FROM 
    CCBILANCIOCONSCOSTIDIRDOC CC INNER JOIN ANAGRAFICACOMMESSE AC ON CC.IDCOMMCLI=AC.PROGRESSIVO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACOMMCLICOSTIDIRDOC] TO [Metodo98]
    AS [dbo];
