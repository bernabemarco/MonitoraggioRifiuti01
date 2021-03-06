﻿CREATE TABLE [dbo].[TABCOMMCLICLASSLAVEST] (
    [OPERAZIONE]     VARCHAR (5)  DEFAULT ('') NOT NULL,
    [VOCEBASE]       VARCHAR (3)  DEFAULT ('') NOT NULL,
    [IDVOCE]         VARCHAR (3)  DEFAULT ('') NOT NULL,
    [DESCRIZIONE]    VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABCOMMCLICLASSLAVEST] PRIMARY KEY CLUSTERED ([OPERAZIONE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABCOMMCLICLASSLAVEST] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABCOMMCLICLASSLAVEST] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABCOMMCLICLASSLAVEST] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABCOMMCLICLASSLAVEST] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABCOMMCLICLASSLAVEST] TO [Metodo98]
    AS [dbo];

