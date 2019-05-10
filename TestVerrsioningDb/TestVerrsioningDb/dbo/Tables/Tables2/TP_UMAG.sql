CREATE TABLE [dbo].[TP_UMAG] (
    [CodAgente]      VARCHAR (7)  NOT NULL,
    [UM]             VARCHAR (3)  NOT NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([CodAgente] ASC, [UM] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_UMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_UMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_UMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_UMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_UMAG] TO [Metodo98]
    AS [dbo];

