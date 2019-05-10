﻿


/*
    rif.05/08/2015 - aggiunto campo FLGCICLOCTRASF
*/
CREATE VIEW [dbo].[VISTACICLOPROD] AS
SELECT 
    TCP.PROGRESSIVO
    ,TCP.CODCICLO
    ,TCP.VERSIONECICLO
    ,TCP.DSCVERSIONE
    ,TCP.STATOVERSIONE
    ,TCP.VALIDITACICLO
    ,TCP.VERSIONEDBA
    ,TCP.CICLOSTANDARD
    ,TCP.NOTECICLO
    ,TCP.UM
    ,TCP.QUANTITARIF
    ,TCP.FLGNOTRASFORMAZIONE
    ,STSV.DESCRIZIONE AS DSCSTATOVERSIONE
    ,(CASE WHEN RIGHT(CODCICLO, 1) = '#' THEN 
        (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = SUBSTRING(TCP.CODCICLO, 1, CHARINDEX('#', TCP.CODCICLO) - 1)) 
    ELSE
        (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = TCP.CODCICLO) END) AS DSCCODCICLO,
    STSV.USAVERSIONE
    ,DAC.VALIDITADBA
    ,DAC.DBASTANDARD
    ,TCP.FLGCICLOCTRASF
FROM 
    TESTACICLOPROD TCP 
    LEFT OUTER JOIN TABSTATOVERSIONECICLO STSV ON TCP.STATOVERSIONE = STSV.CODICE
    LEFT OUTER JOIN DISTINTAARTCOMPOSTI DAC ON TCP.CODCICLO=DAC.ARTCOMPOSTO AND TCP.VERSIONEDBA=DAC.VERSIONEDBA

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACICLOPROD] TO [Metodo98]
    AS [dbo];

