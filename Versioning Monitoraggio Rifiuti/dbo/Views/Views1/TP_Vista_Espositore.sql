CREATE VIEW TP_Vista_Espositore
AS
SELECT ANAGRAFICAARTICOLI.*
FROM ANAGRAFICAARTICOLI INNER JOIN
    TP_ExtraMag ON 
    ANAGRAFICAARTICOLI.CODICE = TP_ExtraMag.CodArt
WHERE (TP_ExtraMag.TP_Espositore = 'x')


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_Vista_Espositore] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_Vista_Espositore] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_Vista_Espositore] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_Vista_Espositore] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_Vista_Espositore] TO [Metodo98]
    AS [dbo];

