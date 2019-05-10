CREATE TABLE [dbo].[contratti_dupcc] (
    [codice]         VARCHAR (50) NOT NULL,
    [dadata]         DATETIME     NOT NULL,
    [adata]          DATETIME     NOT NULL,
    [utentemodifica] VARCHAR (20) NOT NULL,
    [datamodifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[contratti_dupcc] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[contratti_dupcc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[contratti_dupcc] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[contratti_dupcc] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[contratti_dupcc] TO [Metodo98]
    AS [dbo];

