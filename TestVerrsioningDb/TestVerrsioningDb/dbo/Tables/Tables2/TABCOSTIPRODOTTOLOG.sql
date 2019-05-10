﻿CREATE TABLE [dbo].[TABCOSTIPRODOTTOLOG] (
    [PROGRESSIVO]    INT           NOT NULL,
    [IDCOSTO]        VARCHAR (10)  NOT NULL,
    [CODICEMSG]      SMALLINT      NULL,
    [DESCRIZIONE]    VARCHAR (255) NULL,
    [ARTICOLO]       VARCHAR (50)  NULL,
    [TIPOMSG]        SMALLINT      NULL,
    [IDSESSIONE]     INT           NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK__TABCOSTIPRODOTTO__LOG] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC, [IDCOSTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABCOSTIPRODOTTOLOG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABCOSTIPRODOTTOLOG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABCOSTIPRODOTTOLOG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABCOSTIPRODOTTOLOG] TO [Metodo98]
    AS [dbo];

