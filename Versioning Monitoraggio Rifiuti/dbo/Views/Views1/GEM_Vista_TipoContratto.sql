create VIEW [dbo].[GEM_Vista_TipoContratto]
AS
SELECT     *
FROM         GEMMADBG.dbo.GEM_T_TipoContratto


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_TipoContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_TipoContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_TipoContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_TipoContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_TipoContratto] TO [Metodo98]
    AS [dbo];

