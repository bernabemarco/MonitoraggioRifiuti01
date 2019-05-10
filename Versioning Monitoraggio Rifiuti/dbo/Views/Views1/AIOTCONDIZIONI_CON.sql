
CREATE VIEW AIOTCONDIZIONI_CON
AS
SELECT     dbo.CONTRATTI_CON.RIFCONTRATTO, dbo.ContrattiRange_CON.NRRIGA, dbo.ContrattiRange_CON.POSIZIONE, dbo.ContrattiRange_CON.VALORE, 
                      dbo.ContrattiRange_CON.QTA, dbo.ContrattiRange_CON.UM, dbo.ContrattiRange_CON.QTA2, dbo.ContrattiRange_CON.UM2, 
                      dbo.ContrattiRange_CON.PREMIOVALORE, dbo.ContrattiRange_CON.PREMIOPERCENT, dbo.ContrattiRange_CON.UMVALORE, 
                      dbo.CONTRATTI_CON.PROGRESSIVO
FROM         dbo.CONTRATTI_CON INNER JOIN
                      dbo.ContrattiRange_CON ON dbo.CONTRATTI_CON.PROGRESSIVO = dbo.ContrattiRange_CON.RIFPROGRESSIVO


GO
GRANT DELETE
    ON OBJECT::[dbo].[AIOTCONDIZIONI_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AIOTCONDIZIONI_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AIOTCONDIZIONI_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOTCONDIZIONI_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AIOTCONDIZIONI_CON] TO [Metodo98]
    AS [dbo];

