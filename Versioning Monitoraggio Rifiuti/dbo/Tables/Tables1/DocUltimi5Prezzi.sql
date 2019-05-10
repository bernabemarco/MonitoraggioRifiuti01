CREATE TABLE [dbo].[DocUltimi5Prezzi] (
    [DOCUMENTO]      VARCHAR (3)  NOT NULL,
    [CODICE]         VARCHAR (3)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([DOCUMENTO] ASC, [CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[DocUltimi5Prezzi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[DocUltimi5Prezzi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DocUltimi5Prezzi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[DocUltimi5Prezzi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[DocUltimi5Prezzi] TO [Metodo98]
    AS [dbo];

