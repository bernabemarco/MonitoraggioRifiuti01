CREATE TABLE [dbo].[MB_PFA_Acquisti] (
    [TipoInsert] INT              NOT NULL,
    [CODART]     VARCHAR (50)     NULL,
    [datadoc]    DATETIME         NULL,
    [QTAGEST]    DECIMAL (38, 16) NULL,
    [ValorePFA]  DECIMAL (38, 6)  NULL
);


GO
CREATE NONCLUSTERED INDEX [IDX_MB_PFA_Acquisti_TipoInsert]
    ON [dbo].[MB_PFA_Acquisti]([TipoInsert] ASC)
    INCLUDE([CODART], [datadoc], [QTAGEST], [ValorePFA]);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_PFA_Acquisti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_PFA_Acquisti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_PFA_Acquisti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_PFA_Acquisti] TO [Metodo98]
    AS [dbo];

