
CREATE VIEW dbo.VISTAPLQTAPRELEVATE
AS
SELECT     SUM(CASE WHEN dbo.PackingRighe.Qta IS NULL THEN 0 ELSE dbo.PackingRighe.Qta END + CASE WHEN dbo.PackingRigheRagg.Qta IS NULL 
                      THEN 0 ELSE dbo.PackingRigheRagg.Qta END) AS QtaPrelevata, dbo.PackingRighe.IDTESTA, dbo.PackingRighe.IDRIGA, 
                      dbo.PackingRighe.RifProgressivo
FROM         dbo.PackingRighe LEFT OUTER JOIN
                      dbo.PackingRigheRagg ON dbo.PackingRighe.RifProgressivo = dbo.PackingRigheRagg.RifProgressivo AND 
                      dbo.PackingRighe.IDTESTA = dbo.PackingRigheRagg.IDTESTA AND dbo.PackingRighe.IDRIGA = dbo.PackingRigheRagg.IDRIGA
WHERE     (dbo.PackingRighe.IDTESTA > 0) AND (dbo.PackingRighe.IDRIGA > 0)
GROUP BY dbo.PackingRighe.IDTESTA, dbo.PackingRighe.IDRIGA, dbo.PackingRighe.RifProgressivo


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTAPLQTAPRELEVATE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTAPLQTAPRELEVATE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTAPLQTAPRELEVATE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAPLQTAPRELEVATE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTAPLQTAPRELEVATE] TO [Metodo98]
    AS [dbo];

