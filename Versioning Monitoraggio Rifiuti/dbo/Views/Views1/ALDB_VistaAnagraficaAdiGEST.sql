
CREATE VIEW [dbo].[ALDB_VistaAnagraficaAdiGEST]
AS
SELECT     left(codconto,1) as tipo,CODCONTO, RTRIM(ISNULL(DSCCONTO1,'')) + ' ' + RTRIM(ISNULL(DSCCONTO2,'')) AS RagSoc, INDIRIZZO, CAP, LOCALITA, PROVINCIA, PARTITAIVA, CodFiscale
FROM         dbo.ANAGRAFICACF





GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDB_VistaAnagraficaAdiGEST] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDB_VistaAnagraficaAdiGEST] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDB_VistaAnagraficaAdiGEST] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDB_VistaAnagraficaAdiGEST] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDB_VistaAnagraficaAdiGEST] TO [Metodo98]
    AS [dbo];

