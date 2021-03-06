﻿CREATE TABLE [dbo].[EURIS_SCHEDULAZIONI] (
    [CODICE]         NVARCHAR (3)  NOT NULL,
    [DESCRIZIONE]    VARCHAR (30)  NOT NULL,
    [NOTE]           VARCHAR (100) NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EURIS_SCHEDULAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EURIS_SCHEDULAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EURIS_SCHEDULAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EURIS_SCHEDULAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EURIS_SCHEDULAZIONI] TO [Metodo98]
    AS [dbo];

