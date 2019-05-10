
CREATE VIEW VISTADOLEGAMEREPFAM
AS
SELECT     dbo.TabRepartiFamigliaPOS.CodFamiglia, dbo.TabRepartiFamigliaPOS.CodReparto, dbo.TabRepartiPOS.Descrizione
FROM         dbo.TabRepartiFamigliaPOS INNER JOIN
                      dbo.TabRepartiPOS ON dbo.TabRepartiFamigliaPOS.CodReparto = dbo.TabRepartiPOS.Codice


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTADOLEGAMEREPFAM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTADOLEGAMEREPFAM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTADOLEGAMEREPFAM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADOLEGAMEREPFAM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTADOLEGAMEREPFAM] TO [Metodo98]
    AS [dbo];

