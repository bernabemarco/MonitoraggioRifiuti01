CREATE TABLE [dbo].[TabStatiAppuntamenti] (
    [Codice]         VARCHAR (10) NOT NULL,
    [Descrizione]    VARCHAR (50) NOT NULL,
    [OrdineEmesso]   SMALLINT     DEFAULT ((0)) NOT NULL,
    [utentemodifica] VARCHAR (25) NOT NULL,
    [datamodifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabStatiAppuntamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabStatiAppuntamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabStatiAppuntamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabStatiAppuntamenti] TO [Metodo98]
    AS [dbo];

