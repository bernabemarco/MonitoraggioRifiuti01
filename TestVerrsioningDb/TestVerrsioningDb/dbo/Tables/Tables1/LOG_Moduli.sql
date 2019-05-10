CREATE TABLE [dbo].[LOG_Moduli] (
    [CodModulo]        NVARCHAR (16) NULL,
    [Progressivo]      NVARCHAR (13) NULL,
    [Data]             DATETIME      NULL,
    [Ora]              DATETIME      NULL,
    [TipoOperaz]       NVARCHAR (5)  NULL,
    [Operatore]        NVARCHAR (25) NULL,
    [ValorePrecedente] NTEXT         NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[LOG_Moduli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[LOG_Moduli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[LOG_Moduli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[LOG_Moduli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[LOG_Moduli] TO [Metodo98]
    AS [dbo];

