CREATE TABLE [dbo].[CGesMastri] (
    [Codice]         VARCHAR (5)   NOT NULL,
    [Descrizione]    VARCHAR (80)  DEFAULT ('') NULL,
    [Segno]          SMALLINT      DEFAULT (0) NULL,
    [Tipologia]      SMALLINT      DEFAULT (0) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesMastri] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesMastri] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesMastri] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesMastri] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesMastri] TO [Metodo98]
    AS [dbo];

