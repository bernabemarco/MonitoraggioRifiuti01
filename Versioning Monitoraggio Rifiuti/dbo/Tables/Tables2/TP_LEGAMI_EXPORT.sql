CREATE TABLE [dbo].[TP_LEGAMI_EXPORT] (
    [RifProgressivo] DECIMAL (18) NOT NULL,
    [Posizione]      INT          NOT NULL,
    [NomeFunzione]   VARCHAR (30) NOT NULL,
    [NomeCampoFz]    VARCHAR (50) NULL,
    [NomeCampoDb]    VARCHAR (50) NULL,
    [DaOss]          CHAR (1)     NULL,
    [Alias]          VARCHAR (50) NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    CONSTRAINT [PK_TP_LEGAMI_EXPORT] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Posizione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_LEGAMI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_LEGAMI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_LEGAMI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_LEGAMI_EXPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_LEGAMI_EXPORT] TO [Metodo98]
    AS [dbo];

