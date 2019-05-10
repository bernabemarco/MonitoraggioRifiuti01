CREATE TABLE [dbo].[ALDB_Patch_stpControlloCodFiscale] (
    [NrTerminale] VARCHAR (25) NOT NULL,
    [IdSessione]  DECIMAL (18) NOT NULL,
    [Progressivo] NUMERIC (18) NOT NULL,
    [CodConto]    VARCHAR (7)  CONSTRAINT [DF_ALDB_Patch_StpControlloCodFiscale_CodConto] DEFAULT (0) NOT NULL,
    [CodFiscale]  VARCHAR (50) NULL,
    CONSTRAINT [PK_ALDB_Patch_stpControlloCodFiscale] PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [IdSessione] ASC, [Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDB_Patch_stpControlloCodFiscale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDB_Patch_stpControlloCodFiscale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDB_Patch_stpControlloCodFiscale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDB_Patch_stpControlloCodFiscale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDB_Patch_stpControlloCodFiscale] TO [Metodo98]
    AS [dbo];

