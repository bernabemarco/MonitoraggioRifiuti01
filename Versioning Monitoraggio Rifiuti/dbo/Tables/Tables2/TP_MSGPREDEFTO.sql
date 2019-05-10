CREATE TABLE [dbo].[TP_MSGPREDEFTO] (
    [Progressivo]    NUMERIC (18)  IDENTITY (1, 1) NOT NULL,
    [Oggetto]        VARCHAR (80)  NULL,
    [CorpoMsg]       VARCHAR (500) NULL,
    [PiedeMsg]       VARCHAR (500) NULL,
    [UtenteModifica] VARCHAR (25)  NULL,
    [DataModifica]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_MSGPREDEFTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_MSGPREDEFTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_MSGPREDEFTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_MSGPREDEFTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_MSGPREDEFTO] TO [Metodo98]
    AS [dbo];

