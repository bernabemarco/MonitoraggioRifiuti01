
CREATE VIEW TP_VISTASITUAZIONECASSE
AS
SELECT     TOP 100 PERCENT VBsituazionecassaT.Data,VBsituazionecassaT.Cassa, TP_VBCASSE.DESCRIZIONE AS DscCassa, VBsituazionecassaT.Turno, 
                      VBsituazionecassaT.NrScontrini, TABMODPAGVBANCO.DscPagamento, TABCAMBI.DESCRIZIONE AS Divisa, 
                      VBSituazioneCassaD.VenditeValuta, VBSituazioneCassaD.VenditeEuro,
                      VBSituazioneCassaD.FondoAperturaValuta, VBSituazioneCassaD.FondoAperturaEuro, VBSituazioneCassaD.IdTesta
FROM         VBsituazionecassaT LEFT OUTER JOIN
                      VBSituazioneCassaD ON VBsituazionecassaT.Progressivo = VBSituazioneCassaD.RIFProgressivo LEFT OUTER JOIN
                      TABMODPAGVBANCO ON VBSituazioneCassaD.CodicePagamento = TABMODPAGVBANCO.Codice LEFT OUTER JOIN
                      TP_VBCASSE ON VBsituazionecassaT.Cassa = TP_VBCASSE.CODICE LEFT OUTER JOIN
                      TABCAMBI ON VBSituazioneCassaD.Divisa = TABCAMBI.CODICE
ORDER BY VBsituazionecassaT.Turno, VBsituazionecassaT.Cassa, TABMODPAGVBANCO.DscPagamento



GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTASITUAZIONECASSE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTASITUAZIONECASSE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VISTASITUAZIONECASSE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTASITUAZIONECASSE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTASITUAZIONECASSE] TO [Metodo98]
    AS [dbo];

