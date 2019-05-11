﻿CREATE TABLE [dbo].[TABSETTORI] (
    [CODICE]         DECIMAL (5)    NOT NULL,
    [DESCRIZIONE]    VARCHAR (25)   NULL,
    [NOTE]           VARCHAR (100)  NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    [Budget]         DECIMAL (4, 2) CONSTRAINT [DF_TABSETTORI_BUDGET] DEFAULT (0) NULL,
    [exportCRM]      SMALLINT       DEFAULT ((0)) NULL,
    [Dismesso]       INT            DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TABSETTORI] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [TABSETTORI_DSC]
    ON [dbo].[TABSETTORI]([DESCRIZIONE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABSETTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABSETTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABSETTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABSETTORI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABSETTORI] TO [Metodo98]
    AS [dbo];
