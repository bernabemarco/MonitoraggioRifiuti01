



CREATE VIEW [dbo].[Aldb_righeivaAdigest]
AS
SELECT DISTINCT TOP 100 PERCENT NRREG, DATADOC, NUMDOC, NRRIGA
FROM         dbo.RIGHEIVA






GO
GRANT DELETE
    ON OBJECT::[dbo].[Aldb_righeivaAdigest] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Aldb_righeivaAdigest] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Aldb_righeivaAdigest] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Aldb_righeivaAdigest] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Aldb_righeivaAdigest] TO [Metodo98]
    AS [dbo];

