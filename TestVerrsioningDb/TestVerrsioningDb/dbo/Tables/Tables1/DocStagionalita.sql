CREATE TABLE [dbo].[DocStagionalita] (
    [CODICE]         VARCHAR (3)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[DocStagionalita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[DocStagionalita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DocStagionalita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[DocStagionalita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[DocStagionalita] TO [Metodo98]
    AS [dbo];

