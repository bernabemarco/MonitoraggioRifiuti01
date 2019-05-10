﻿

CREATE VIEW VISTATOTALIAVANZGRPACQ
AS

SELECT     TOP 100 PERCENT CONTRATTI_TESTECONSUNTIVGRUPPIACQ.CODCLIFOR, CONTRATTI_TESTECONSUNTIVGRUPPIACQ.GRUPPOACQ, 
                      ACQ_GRUPPOACQUISTO.DESCRIZIONE, CONTRATTI_DETTCONSUNTIVGRUPPIACQ.IDSOCIO, 
                      ACQ_COMPONENTIGRUPPOACQUISTO.SOCIO, SUM(CONTRATTI_DETTCONSUNTIVGRUPPIACQ.QTA) AS QTA, 
                      SUM(CONTRATTI_DETTCONSUNTIVGRUPPIACQ.VALORE) AS VALORE, CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ANNO, 
                      ACQ_COMPONENTIGRUPPOACQUISTO.TIPOSOCIO, ANAGRAFICACF.DSCCONTO1
FROM         CONTRATTI_TESTECONSUNTIVGRUPPIACQ INNER JOIN
                      CONTRATTI_DETTCONSUNTIVGRUPPIACQ ON 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.PROGRESSIVO = CONTRATTI_DETTCONSUNTIVGRUPPIACQ.RIFPROGRESSIVO INNER JOIN
                      ACQ_GRUPPOACQUISTO ON CONTRATTI_TESTECONSUNTIVGRUPPIACQ.GRUPPOACQ = ACQ_GRUPPOACQUISTO.CODICE INNER JOIN
                      ACQ_COMPONENTIGRUPPOACQUISTO ON 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.GRUPPOACQ = ACQ_COMPONENTIGRUPPOACQUISTO.RIFCODICE AND 
                      CONTRATTI_DETTCONSUNTIVGRUPPIACQ.IDSOCIO = ACQ_COMPONENTIGRUPPOACQUISTO.IDSOCIO INNER JOIN
                      ANAGRAFICACF ON ACQ_COMPONENTIGRUPPOACQUISTO.SOCIO = ANAGRAFICACF.CODCONTO INNER JOIN
                      VISTAMAXMESECONSGRPACQ ON 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.CODCLIFOR = VISTAMAXMESECONSGRPACQ.CODCLIFOR AND 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ANNO = VISTAMAXMESECONSGRPACQ.anno AND 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.MESE = VISTAMAXMESECONSGRPACQ.MESE AND 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ARTICOLO = VISTAMAXMESECONSGRPACQ.ARTICOLO AND 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.GRUPPOACQ = VISTAMAXMESECONSGRPACQ.GRUPPOACQ AND 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ESERCIZIO = VISTAMAXMESECONSGRPACQ.ESERCIZIO
GROUP BY CONTRATTI_TESTECONSUNTIVGRUPPIACQ.GRUPPOACQ, CONTRATTI_DETTCONSUNTIVGRUPPIACQ.IDSOCIO, 
                      CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ANNO, CONTRATTI_TESTECONSUNTIVGRUPPIACQ.CODCLIFOR, 
                      ACQ_GRUPPOACQUISTO.DESCRIZIONE, ACQ_COMPONENTIGRUPPOACQUISTO.SOCIO, 
                      ACQ_COMPONENTIGRUPPOACQUISTO.TIPOSOCIO, ANAGRAFICACF.DSCCONTO1
HAVING      (ACQ_COMPONENTIGRUPPOACQUISTO.TIPOSOCIO <> 2)
ORDER BY CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ANNO DESC


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTATOTALIAVANZGRPACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTATOTALIAVANZGRPACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTATOTALIAVANZGRPACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATOTALIAVANZGRPACQ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTATOTALIAVANZGRPACQ] TO [Metodo98]
    AS [dbo];

