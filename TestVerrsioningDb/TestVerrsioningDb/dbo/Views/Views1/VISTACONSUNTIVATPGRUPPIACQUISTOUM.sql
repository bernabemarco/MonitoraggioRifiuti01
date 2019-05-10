﻿

/****** Oggetto: vista dbo.VISTACONSUNTIVATPGRUPPOACQUISTOUM    Data dello script: 17/03/2005 11.13.56 ******/
CREATE VIEW VISTACONSUNTIVATPGRUPPIACQUISTOUM
AS
SELECT     dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.PROGRESSIVO, dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ESERCIZIO, 
                      dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.CODCLIFOR, dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.GRUPPOACQ, 
                      dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.MESE, dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ANNO, 
                      dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ARTICOLO, dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ.IDSOCIO AS ASSOCIATO, 
                      dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ.UM, dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ.QTA, 
                      dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ.VALORE, dbo.ARTICOLIFATTORICONVERSIONE.UM1, dbo.ARTICOLIFATTORICONVERSIONE.UM2, 
                      dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ.QTA * dbo.ARTICOLIFATTORICONVERSIONE.FATTORE AS QTAGESTCONVERTITA
FROM         dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ INNER JOIN
                      dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ ON 
                      dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.PROGRESSIVO = dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ.RIFPROGRESSIVO INNER JOIN
                      dbo.ARTICOLIFATTORICONVERSIONE ON 
                      dbo.CONTRATTI_TESTECONSUNTIVGRUPPIACQ.ARTICOLO = dbo.ARTICOLIFATTORICONVERSIONE.CODART AND 
                      dbo.CONTRATTI_DETTCONSUNTIVGRUPPIACQ.UM = dbo.ARTICOLIFATTORICONVERSIONE.UM1


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTACONSUNTIVATPGRUPPIACQUISTOUM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTACONSUNTIVATPGRUPPIACQUISTOUM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTACONSUNTIVATPGRUPPIACQUISTOUM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACONSUNTIVATPGRUPPIACQUISTOUM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTACONSUNTIVATPGRUPPIACQUISTOUM] TO [Metodo98]
    AS [dbo];

