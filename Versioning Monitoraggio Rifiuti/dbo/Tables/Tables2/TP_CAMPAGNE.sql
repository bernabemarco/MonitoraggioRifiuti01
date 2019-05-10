CREATE TABLE [dbo].[TP_CAMPAGNE] (
    [NumeroCampagna] VARCHAR (3)  NOT NULL,
    [Descrizione]    VARCHAR (50) NOT NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([NumeroCampagna] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_CAMPAGNE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_CAMPAGNE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_CAMPAGNE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_CAMPAGNE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_CAMPAGNE] TO [Metodo98]
    AS [dbo];

