﻿CREATE VIEW VISTALOOPDBA AS
SELECT LDBA.NRTERMINALE,LDBA.PROGRESSIVO,LDBA.RIFCOMPOSTO,LDBA.NRRIGA,LDBA.TIPOLOOP,
    LDBA.CODARTICOLO,(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=LDBA.CODARTICOLO) AS DSCARTICOLO,
    CDBA.ARTCOMPOSTO AS DISTINTA,
    (CASE WHEN RIGHT(CDBA.ARTCOMPOSTO,1)='#' THEN(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=SUBSTRING(CDBA.ARTCOMPOSTO,1,CHARINDEX('#',CDBA.ARTCOMPOSTO)-1)) ELSE(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=CDBA.ARTCOMPOSTO) END)  AS DSCDISTINTA,
    CDBA.VERSIONEDBA AS VERSIONEDISTINTA,
    CDBA.DSCVERSIONE AS DSCVERSIONEDISTINTA,
    CDBA.STATOVERSIONE AS STATOVERSIONEDISTINTA,
    CDBA.VALIDITADBA AS VALIDITADISTINTA,
    CDBA.DBASTANDARD AS DISTINTASTANDARD,
    CDBA.NOTEDBA AS NOTEDISTINTA,
    TDBA.ARTCOMPOSTO AS COMPOSTO,
    (CASE WHEN RIGHT(TDBA.ARTCOMPOSTO,1)='#' THEN(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=SUBSTRING(TDBA.ARTCOMPOSTO,1,CHARINDEX('#',TDBA.ARTCOMPOSTO)-1)) ELSE(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=TDBA.ARTCOMPOSTO) END)  AS DSCCOMPOSTO,
    TDBA.VERSIONEDBA AS VERSIONECOMPOSTO,
    TDBA.DSCVERSIONE AS DSCVERSIONECOMPOSTO,
    TDBA.STATOVERSIONE AS STATOVERSIONECOMPOSTO,
    TDBA.VALIDITADBA AS VALIDITACOMPOSTO,
    TDBA.DBASTANDARD AS COMPOSTOSTANDARD,
    TDBA.NOTEDBA AS NOTECOMPOSTO,
    RDBA.CODARTCOMPONENTE,RDBA.DESCRIZIONE,RDBA.SOLOSE,RDBA.QTA1,RDBA.OPERATORE,
    RDBA.QTA2,RDBA.CALCOLO,RDBA.QTACOSTO,RDBA.VERSIONECOMPONENTE,RDBA.SVILUPPACOMPONENTE,
    RDBA.DISEGNOALLEGATO,RDBA.NUMCOMPONENTE,RDBA.SEQASSEMBLAGGIO,RDBA.NOTECOMPONENTE,RDBA.LEADTIMEADJ
    FROM TEMPLOOPDBA LDBA,
    DISTINTAARTCOMPOSTI CDBA,
    DISTINTAARTCOMPOSTI TDBA,
    DISTINTABASE RDBA
    WHERE(CDBA.PROGRESSIVO=LDBA.RIFDISTINTA)
    AND(TDBA.PROGRESSIVO=LDBA.RIFCOMPOSTO)
    AND(RDBA.RIFPROGRESSIVO=LDBA.RIFCOMPOSTO AND RDBA.NRRIGA=LDBA.NRRIGA)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTALOOPDBA] TO [Metodo98]
    AS [dbo];

