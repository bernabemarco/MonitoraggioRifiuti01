CREATE TABLE [dbo].[TabGruppiMxNPOS] (
    [Codice]         DECIMAL (5)  NOT NULL,
    [Descrizione]    VARCHAR (25) NULL,
    [ValoreM]        SMALLINT     DEFAULT (0) NULL,
    [ValoreN]        SMALLINT     DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabGruppiMxNPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabGruppiMxNPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabGruppiMxNPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabGruppiMxNPOS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabGruppiMxNPOS] TO [Metodo98]
    AS [dbo];

