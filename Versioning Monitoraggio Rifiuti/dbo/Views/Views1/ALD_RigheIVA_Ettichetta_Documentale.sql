CREATE VIEW dbo.ALD_RigheIVA_Ettichetta_Documentale
AS
SELECT DISTINCT 
                      dbo.RIGHEIVA.TIPOREGISTRO, dbo.RIGHEIVA.NRREG, dbo.RIGHEIVA.DATADOC, dbo.RIGHEIVA.NUMDOC, dbo.TIPOREGISTROIVA.DESCRIZIONE
FROM         dbo.RIGHEIVA INNER JOIN
                      dbo.TIPOREGISTROIVA ON dbo.RIGHEIVA.TIPOREGISTRO = dbo.TIPOREGISTROIVA.CODICE



GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_RigheIVA_Ettichetta_Documentale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_RigheIVA_Ettichetta_Documentale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_RigheIVA_Ettichetta_Documentale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_RigheIVA_Ettichetta_Documentale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_RigheIVA_Ettichetta_Documentale] TO [Metodo98]
    AS [dbo];

