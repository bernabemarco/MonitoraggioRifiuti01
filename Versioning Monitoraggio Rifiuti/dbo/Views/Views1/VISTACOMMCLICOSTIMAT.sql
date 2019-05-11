﻿CREATE VIEW VISTACOMMCLICOSTIMAT AS
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
    IDTESTADOC AS RIFTESTA,
    IDRIGADOC AS RIFRIGA,
    ORIGINEEVENTO,
    IDTESTAFATT,
    IDRIGAFATT,
    IDTESTA_DEST AS RIFTESTA_DEST,
    IDRIGA_DEST AS RIFRIGA_DEST,
    ORIGINEEVENTO_DEST,
    NUMEROMOV,
    CC.CODART,
    (CASE WHEN TIPORECDETT IN ('RE','RP','XE') THEN RD.DESCRIZIONEART ELSE AA.DESCRIZIONE END) AS DESCRIZIONE,
    UMBASE,
    QUANTITA,
    UMVAL,
    QTAVAL,
    COSTOUNITARIO,
    COSTOUNITARIOEURO,
    NATURARILEVAZIONE,
    TIPOREC,
    (CASE WHEN (NATURARILEVAZIONE=1 AND (TIPOREC='H' OR TIPOREC='L' OR TIPOREC='C')) THEN COSTOUNITARIO*QTAVAL ELSE 0 END) AS COSTOVALCONSUMATO,
    (CASE WHEN (NATURARILEVAZIONE=2 AND (TIPOREC='H' OR TIPOREC='L' OR TIPOREC='C')) THEN COSTOUNITARIO*QTAVAL ELSE 0 END) AS COSTOVALGIACRIS,
    (CASE WHEN (NATURARILEVAZIONE=3 AND TIPOREC='I') THEN COSTOUNITARIO*QTAVAL ELSE 0 END) AS COSTOVALORDINATO,
    (CASE WHEN (NATURARILEVAZIONE=4 AND TIPOREC='M' OR TIPOREC='D') THEN COSTOUNITARIO*QTAVAL ELSE 0 END) AS COSTOVALPREVISTO,
    (CASE WHEN TIPOREC='A' THEN COSTOUNITARIO*QTAVAL ELSE 0 END) AS COSTORICAVIEVASO,
    (CASE WHEN TIPOREC='B' THEN COSTOUNITARIO*QTAVAL ELSE 0 END) AS COSTORICAVIPREVISTO,
    (CASE WHEN (NATURARILEVAZIONE=1 AND (TIPOREC='H' OR TIPOREC='L' OR TIPOREC='C')) THEN COSTOUNITARIOEURO*QTAVAL ELSE 0 END) AS COSTOVALCONSUMATOEURO,
    (CASE WHEN (NATURARILEVAZIONE=2 AND (TIPOREC='H' OR TIPOREC='L' OR TIPOREC='C')) THEN COSTOUNITARIOEURO*QTAVAL ELSE 0 END) AS COSTOVALGIACRISEURO,
    (CASE WHEN (NATURARILEVAZIONE=3 AND TIPOREC='I') THEN COSTOUNITARIOEURO*QTAVAL ELSE 0 END) AS COSTOVALORDINATOEURO,
    (CASE WHEN (NATURARILEVAZIONE=4 AND TIPOREC='M' OR TIPOREC='D') THEN COSTOUNITARIOEURO*QTAVAL ELSE 0 END) AS COSTOVALPREVISTOEURO,
    (CASE WHEN TIPOREC='A' THEN COSTOUNITARIOEURO*QTAVAL ELSE 0 END) AS COSTORICAVIEVASOEURO,
    (CASE WHEN TIPOREC='B' THEN COSTOUNITARIOEURO*QTAVAL ELSE 0 END) AS COSTORICAVIPREVISTOEURO,
    (CASE WHEN (TIPOREC='K' AND NATURARILEVAZIONE=1) THEN QUANTITA ELSE 0 END) AS QTAPRODOTTA,
    (CASE WHEN (TIPOREC='K' AND NATURARILEVAZIONE=2) THEN QUANTITA ELSE 0 END) AS QTARISERVATA,
    (CASE WHEN TIPOREC='N' THEN QUANTITA ELSE 0 END) AS QTAPREVISTA,
    VOCEBASE,
    IDVOCE
FROM 
    ((CCBILANCIOCONSCOSTIMATERIALE CC INNER JOIN ANAGRAFICACOMMESSE AC ON CC.IDCOMMCLI=AC.PROGRESSIVO)
    LEFT OUTER JOIN ANAGRAFICAARTICOLI AA ON AA.CODICE=CC.CODART)
    LEFT OUTER JOIN RIGHEDOCUMENTI RD ON CC.IDTESTADOC=RD.IDTESTA AND CC.IDRIGADOC=RD.IDRIGA

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACOMMCLICOSTIMAT] TO [Metodo98]
    AS [dbo];
