﻿



-- INIZIO A#11090
CREATE VIEW [dbo].[VISTAFASILAVORAZIONE]
AS 
    SELECT     
        TCP.PROGRESSIVO
        ,TCP.CODCICLO
        , (CASE WHEN RIGHT(CODCICLO, 1) = '#' 
            THEN (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = substring(TCP.CODCICLO, 1, charindex('#', TCP.CODCICLO) - 1)) 
            ELSE (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = TCP.CODCICLO) 
        END) AS DSCCICLO
        ,TCP.VERSIONECICLO
        ,TCP.DSCVERSIONE
        ,TCP.STATOVERSIONE
        ,TCP.VALIDITACICLO
        ,STSV.DESCRIZIONE AS DSCSTATOVERSIONE
        ,STSV.USAVERSIONE
        ,TCP.VERSIONEDBA
        ,DAC.DSCVERSIONE AS DSCVERSIONEDBA
        ,DAC.VALIDITADBA
        ,DAC.DBASTANDARD
        ,TCP.CICLOSTANDARD
        ,TCP.NOTECICLO
        ,TCP.UM
        ,TCP.QUANTITARIF
        ,RCP.NUMEROFASE
        ,RCP.POSIZIONE AS SEQUENZAFASE
        ,RCP.SOLOSE
        ,RCP.OPERAZIONE
        ,RCP.DSCOPERAZIONE
        ,RCP.CDLAVORO
        ,TCL.DESCRIZIONE AS DSCCDLAVORO
        ,TCL.REPARTO
        ,(SELECT DESCRIZIONE 
        FROM dbo.TABELLAREPARTI 
        WHERE (CODICE = TCL.REPARTO)) AS DSCREPARTO
        ,TCL.CONTOCDC
        ,(SELECT DESCRIZIONE
        FROM dbo.TABCENTRICOSTO
        WHERE (CODICE = TCL.CONTOCDC)) AS DSCCONTOCDC
        ,RCP.MACCHINA
        ,TMC.DESCRIZIONE AS DSCMACCHINA
    FROM         
        dbo.TESTACICLOPROD AS TCP 
        LEFT OUTER JOIN dbo.TABSTATOVERSIONECICLO AS STSV ON TCP.STATOVERSIONE = STSV.CODICE 
        LEFT OUTER JOIN dbo.DISTINTAARTCOMPOSTI AS DAC ON TCP.CODCICLO = DAC.ARTCOMPOSTO AND TCP.VERSIONEDBA = DAC.VERSIONEDBA 
        INNER JOIN dbo.RIGHECICLOPROD AS RCP ON RCP.PROGRESSIVO = TCP.PROGRESSIVO 
        LEFT OUTER JOIN dbo.TABELLACDLAVORO AS TCL ON TCL.CODICE = RCP.CDLAVORO 
        LEFT OUTER JOIN dbo.TABELLAMACCHINE AS TMC ON TMC.CODICE = RCP.MACCHINA              

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTAFASILAVORAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTAFASILAVORAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAFASILAVORAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTAFASILAVORAZIONE] TO [Metodo98]
    AS [dbo];
