﻿CREATE TABLE [dbo].[TABPATHSIMGS] (
    [CODICE]         VARCHAR (20)  NOT NULL,
    [PATHCONTAINER]  VARCHAR (500) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABPATHSIMGS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABPATHSIMGS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABPATHSIMGS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABPATHSIMGS] TO [Metodo98]
    AS [dbo];
