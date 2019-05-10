CREATE VIEW TP_VistaArtPadre
AS
SELECT CODICE, DESCRIZIONE
FROM ANAGRAFICAARTICOLI
WHERE arttipologia = 1


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VistaArtPadre] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VistaArtPadre] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VistaArtPadre] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VistaArtPadre] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VistaArtPadre] TO [Metodo98]
    AS [dbo];

