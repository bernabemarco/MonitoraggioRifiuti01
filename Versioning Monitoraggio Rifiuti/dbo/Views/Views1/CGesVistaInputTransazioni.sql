CREATE VIEW CGesVistaInputTransazioni AS 
   SELECT *, ValoreVariabile + ValoreFisso AS ValoreTotale FROM CGesInputTransazioni

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaInputTransazioni] TO [Metodo98]
    AS [dbo];

