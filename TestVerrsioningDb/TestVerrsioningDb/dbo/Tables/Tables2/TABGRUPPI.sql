﻿CREATE TABLE [dbo].[TABGRUPPI] (
    [CODICE]         DECIMAL (5)   NOT NULL,
    [DESCRIZIONE]    VARCHAR (80)  NULL,
    [MAGFISCALE]     SMALLINT      DEFAULT (0) NULL,
    [NOTE]           VARCHAR (100) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [FamigliaId]     SMALLINT      CONSTRAINT [DF_TABGRUPPI_FamigliaId] DEFAULT (0) NULL,
    [IdASA]          VARCHAR (2)   NULL,
    CONSTRAINT [PK_TABGRUPPI] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_MAGFISCALE_TABGRUPP] CHECK ([MAGFISCALE] = 0 or [MAGFISCALE] = 1)
);


GO
CREATE NONCLUSTERED INDEX [TABGRUPPI_DSC]
    ON [dbo].[TABGRUPPI]([DESCRIZIONE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABGRUPPI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABGRUPPI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABGRUPPI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABGRUPPI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABGRUPPI] TO [Metodo98]
    AS [dbo];
