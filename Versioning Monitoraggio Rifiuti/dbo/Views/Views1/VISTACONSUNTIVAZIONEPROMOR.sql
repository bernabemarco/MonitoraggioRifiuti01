﻿
CREATE VIEW dbo.VISTACONSUNTIVAZIONEPROMOR
AS
SELECT     TOP 100 PERCENT RIGHEDOCUMENTI.TIPODOC, RIGHEDOCUMENTI.CODART, RIGHEDOCUMENTI.UMGEST, 
                      SUM(RIGHEDOCUMENTI.QTAGEST) AS qtagest, SUM(RIGHEDOCUMENTI.TOTNETTORIGA) AS totnettoriga, 
                      TP_EXTRARIGHEDOC.NPromozione, TP_PROMOZIONI_TESTE.RifContratto
FROM         RIGHEDOCUMENTI INNER JOIN
                      TESTEDOCUMENTI ON RIGHEDOCUMENTI.IDTESTA = TESTEDOCUMENTI.PROGRESSIVO INNER JOIN
                      TP_EXTRARIGHEDOC ON RIGHEDOCUMENTI.IDTESTA = TP_EXTRARIGHEDOC.IDTESTA AND 
                      RIGHEDOCUMENTI.IDRIGA = TP_EXTRARIGHEDOC.IDRIGA INNER JOIN
                      TP_PROMOZIONI_TESTE ON TP_EXTRARIGHEDOC.NPromozione = CAST(TP_PROMOZIONI_TESTE.Progressivo AS varchar(4)) 
                      INNER JOIN
                      CONTRATTI_CONSDOC ON TESTEDOCUMENTI.TIPODOC = CONTRATTI_CONSDOC.TIPODOC AND 
                      TESTEDOCUMENTI.DATADOC BETWEEN CONTRATTI_CONSDOC.DADATA AND CONTRATTI_CONSDOC.ADATA AND 
                      TP_PROMOZIONI_TESTE.RifContratto = CONTRATTI_CONSDOC.RIFPROGRESSIVO
WHERE     (TP_PROMOZIONI_TESTE.Tipo = 1) AND (TP_PROMOZIONI_TESTE.RifContratto > 0) AND 
                      (TP_PROMOZIONI_TESTE.BolValidaPerContratti = 1)
GROUP BY RIGHEDOCUMENTI.TIPODOC, RIGHEDOCUMENTI.CODART, RIGHEDOCUMENTI.UMGEST, TP_EXTRARIGHEDOC.NPromozione, 
                      TP_PROMOZIONI_TESTE.RifContratto


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTACONSUNTIVAZIONEPROMOR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTACONSUNTIVAZIONEPROMOR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTACONSUNTIVAZIONEPROMOR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACONSUNTIVAZIONEPROMOR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTACONSUNTIVAZIONEPROMOR] TO [Metodo98]
    AS [dbo];

