﻿CREATE VIEW COMMCLI_CONSUNT_MATERIALI_STRUTTURATO_DEST AS
SELECT 
      AA.RIFCOMM AS RIFCOMMCLI,
      AA.TIPOASSEGNAZIONE,
(CASE WHEN VB.TIPONODO =0  THEN VB.LIVPADRE ELSE  ISNULL(VB.CODLIV,'TT') END ) AS CODNODO_DEST,     
      
      (CASE WHEN VB.TIPONODO =0  THEN VB.LIVPADRE ELSE  ISNULL(VB.CODLIVELLO,'TT') END ) AS CODLIVELLO_DEST,
      --ISNULL(VB.CODLIVELLO,'TT') AS CODLIVELLO_DEST,
      ISNULL(VB.TIPONODO,1) AS TIPONODO_DEST,
      VB.LIVPADRE AS LIVPADRE_DEST,
      ISNULL(VB.PERCRIPARTIZIONE,100) AS PRC_DEST,
      ISNULL(VB.NRRIGASTRUTT,1) AS NRRIGASTRUTT_DEST,
      ISNULL(VB.NRRIGASTRUTTPADRE,1) AS NRRIGASTRUTTPADRE_DEST,
      VB.DESCRIZIONE AS DESCRIZIONE_DEST,
      (VR.QTAVAL*COSTOUNITARIO*ISNULL(VB.PERCRIPARTIZIONE,100)/100) COSTOTOTRIP,
      (VR.QTAVAL*COSTOUNITARIOEURO*ISNULL(VB.PERCRIPARTIZIONE,100)/100) COSTOTOTRIPEURO,
      VR.*
FROM 
      (CCBILANCIOCONSCOSTIMATERIALE VR  LEFT OUTER JOIN ANAGRAFICACOMMESSE AA ON VR.IDCOMMCLI=AA.PROGRESSIVO)
      LEFT OUTER JOIN VISTAASSEGNAZIONICONSCOMM VB 
      ON (VR.IDTESTA_DEST = VB.IDTESTA) AND (VR.IDRIGA_DEST = VB.IDRIGA) AND 
      (VR.ORIGINEEVENTO_DEST = VB.ORIGINEEVENTO) AND ( VB.RIFCOMMCLI = AA.RIFCOMM )
--  WHERE  VR.TIPOREC NOT IN ('A','B','K','N')   -- PER MATERIALI
--  WHERE  VR.TIPOREC  IN ('A','B')   -- PER RICAVI
--  WHERE  VR.TIPOREC  IN ('K','N')   -- PER PRODOTTO DI COMMESSA


GO
GRANT SELECT
    ON OBJECT::[dbo].[COMMCLI_CONSUNT_MATERIALI_STRUTTURATO_DEST] TO [Metodo98]
    AS [dbo];

