CREATE VIEW [dbo].[Ald_VistaClasseArtNodoPrev]
AS
SELECT     ALD_TabClasseArtNodoPrev.NodoID, AC.RifComm, ALD_TabClasseArtNodoPrev.TipoPrev, AA.CODICE
FROM         ALD_TabClasseArtNodoPrev INNER JOIN
                      TABCATEGORIE ON ALD_TabClasseArtNodoPrev.ClasseArticoloId = TABCATEGORIE.ClasseArticoloID INNER JOIN
                      ANAGRAFICAARTICOLI AS AA ON TABCATEGORIE.CODICE = AA.CATEGORIA INNER JOIN
                      AnagraficaCommesse AS AC ON ALD_TabClasseArtNodoPrev.TipoPrev = AC.TipoCom

GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaClasseArtNodoPrev] TO [Metodo98]
    AS [dbo];

