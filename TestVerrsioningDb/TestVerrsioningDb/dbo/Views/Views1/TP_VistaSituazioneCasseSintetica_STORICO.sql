
CREATE VIEW TP_VistaSituazioneCasseSintetica_STORICO
AS
SELECT     TOP 100 PERCENT SUM(VBSituazioneCassaD.VenditeEuro) AS ImportoEuro, SUM(DISTINCT VBsituazionecassaT.NrScontrini) AS Scontrini, 
                           VBsituazionecassaT.Data,VBsituazionecassaT.Turno,VBsituazionecassaT.Cassa,TP_VBCASSE.DESCRIZIONE AS DscCassa
FROM         VBsituazionecassaT LEFT OUTER JOIN
                      VBSituazioneCassaD ON VBsituazionecassaT.Progressivo = VBSituazioneCassaD.RiFProgressivo 
                      LEFT OUTER JOIN
                      TP_VBCASSE ON VBsituazionecassaT.Cassa = TP_VBCASSE.CODICE
GROUP BY VBsituazionecassaT.Data,VBsituazionecassaT.Turno, VBsituazionecassaT.Cassa, TP_VBCASSE.DESCRIZIONE
ORDER BY VBsituazionecassaT.Turno, TP_VBCASSE.DESCRIZIONE, VBsituazionecassaT.Cassa


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VistaSituazioneCasseSintetica_STORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VistaSituazioneCasseSintetica_STORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VistaSituazioneCasseSintetica_STORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VistaSituazioneCasseSintetica_STORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VistaSituazioneCasseSintetica_STORICO] TO [Metodo98]
    AS [dbo];

