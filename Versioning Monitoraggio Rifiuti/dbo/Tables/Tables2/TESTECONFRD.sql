﻿CREATE TABLE [dbo].[TESTECONFRD] (
    [PROGRESSIVO]      DECIMAL (10)   NOT NULL,
    [NOMEIMPOSTAZIONE] VARCHAR (50)   NULL,
    [TIPORIGA]         SMALLINT       NULL,
    [ESEGUITAB]        SMALLINT       NULL,
    [VAITAB]           SMALLINT       NULL,
    [CONVERTI]         SMALLINT       NULL,
    [NOTE]             VARCHAR (1000) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]     DATETIME       NOT NULL,
    CONSTRAINT [PK_TESTECONFRD] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTECONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTECONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTECONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTECONFRD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTECONFRD] TO [Metodo98]
    AS [dbo];

