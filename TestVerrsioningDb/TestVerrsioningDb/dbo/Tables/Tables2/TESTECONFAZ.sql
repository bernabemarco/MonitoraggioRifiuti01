﻿CREATE TABLE [dbo].[TESTECONFAZ] (
    [PROGRESSIVO]      DECIMAL (10)   NOT NULL,
    [NOMEIMPOSTAZIONE] VARCHAR (50)   NULL,
    [HELPCONTEXTID]    INT            NULL,
    [ESEGUITAB]        SMALLINT       NULL,
    [VAITAB]           SMALLINT       NULL,
    [NOTE]             VARCHAR (1000) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]     DATETIME       NOT NULL,
    CONSTRAINT [PK_TESTECONFAZ] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTECONFAZ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTECONFAZ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTECONFAZ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTECONFAZ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTECONFAZ] TO [Metodo98]
    AS [dbo];

