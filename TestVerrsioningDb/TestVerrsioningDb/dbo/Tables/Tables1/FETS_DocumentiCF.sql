CREATE TABLE [dbo].[FETS_DocumentiCF] (
    [CODICEFISCALEPARTITAIVA] VARCHAR (16)  NOT NULL,
    [CODCF]                   VARCHAR (7)   NOT NULL,
    [TIPODOC]                 VARCHAR (3)   NOT NULL,
    [NOMEFILE]                VARCHAR (255) NOT NULL,
    [FILEPATH]                VARCHAR (255) NOT NULL,
    [Utentemodifica]          VARCHAR (25)  NOT NULL,
    [Datamodifica]            DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICEFISCALEPARTITAIVA] ASC, [CODCF] ASC, [TIPODOC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_DocumentiCF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_DocumentiCF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_DocumentiCF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_DocumentiCF] TO [Metodo98]
    AS [dbo];

