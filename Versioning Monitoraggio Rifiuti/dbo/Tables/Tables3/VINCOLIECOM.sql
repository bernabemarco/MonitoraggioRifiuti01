CREATE TABLE [dbo].[VINCOLIECOM] (
    [Esercizio]      NUMERIC (5)  NOT NULL,
    [MastroIT]       NUMERIC (5)  NULL,
    [MastroES]       NUMERIC (5)  NULL,
    [TipoDocCli]     VARCHAR (3)  NULL,
    [TipoDocCliCorr] VARCHAR (3)  NULL,
    [UPDCatalogo]    DATETIME     NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Esercizio] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[VINCOLIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VINCOLIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VINCOLIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VINCOLIECOM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VINCOLIECOM] TO [Metodo98]
    AS [dbo];

