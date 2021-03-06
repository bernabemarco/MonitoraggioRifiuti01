﻿CREATE TABLE [dbo].[GEM_TESTACONTRATTO_Documentazione] (
    [IDCONTRATTO]     VARCHAR (13)  NOT NULL,
    [IDRIGA]          DECIMAL (5)   NOT NULL,
    [DATAINSERIMENTO] DATETIME      NULL,
    [REFERENTE]       VARCHAR (100) NULL,
    [OGGETTO]         VARCHAR (500) NULL,
    [ALLEGATO]        VARCHAR (500) NULL,
    [PublicaGOnLine]  SMALLINT      DEFAULT ((0)) NULL,
    [DocValido]       SMALLINT      DEFAULT ((1)) NULL,
    [DATAMODIFICA]    DATETIME      NULL,
    [UTENTEMODIFICA]  VARCHAR (25)  NULL,
    CONSTRAINT [GEM_TESTACONTRATTO_Documentazione_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [IDRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TESTACONTRATTO_Documentazione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TESTACONTRATTO_Documentazione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TESTACONTRATTO_Documentazione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TESTACONTRATTO_Documentazione] TO [Metodo98]
    AS [dbo];

