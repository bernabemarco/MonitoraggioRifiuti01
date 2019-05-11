﻿CREATE TABLE [dbo].[ANAGRAFICABANCHE] (
    [CODBANCA]         VARCHAR (7)   NOT NULL,
    [DSCBANCA]         VARCHAR (80)  NULL,
    [INTFINANZA]       VARCHAR (80)  NULL,
    [INDIRIZZO]        VARCHAR (80)  NULL,
    [CAP]              VARCHAR (8)   NULL,
    [LOCALITA]         VARCHAR (80)  NULL,
    [PROVINCIA]        VARCHAR (4)   NULL,
    [CODFISCALE]       VARCHAR (16)  NULL,
    [NAUTORIZZAZIONE]  VARCHAR (10)  NULL,
    [DATAAUTORIZZ]     DATETIME      NULL,
    [CAB]              VARCHAR (6)   NULL,
    [ABI]              VARCHAR (6)   NULL,
    [CODCONTORIF]      VARCHAR (7)   NOT NULL,
    [TELEFONO]         VARCHAR (25)  NULL,
    [FAX]              VARCHAR (25)  NULL,
    [TELEX]            VARCHAR (50)  NULL,
    [PARTITAIVA]       VARCHAR (12)  NULL,
    [NOTE]             VARCHAR (255) NULL,
    [CODICESIA]        VARCHAR (5)   NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]     DATETIME      NOT NULL,
    [CONTOCORRENTE]    VARCHAR (15)  NULL,
    [CODNAZIONE]       DECIMAL (5)   DEFAULT (0) NULL,
    [CODICEIBAN]       VARCHAR (34)  NULL,
    [CODICEBIC]        VARCHAR (11)  NULL,
    [CIN]              VARCHAR (1)   NULL,
    [CREDITIDENTIFIER] VARCHAR (35)  NULL,
    [CODUNIVOCOCBI]    VARCHAR (35)  NULL,
    [GOLD_BAIN_BIDPCD] VARCHAR (5)   NULL,
    [GOLD_LINE_TFK9CD] VARCHAR (5)   NULL,
    [CODBANCARAGGR]    VARCHAR (7)   DEFAULT ('') NULL,
    CONSTRAINT [PK_ANAGRAFICABANCHE] PRIMARY KEY CLUSTERED ([CODBANCA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_ANAGRAFICABANCHE_CODCONTORIF] FOREIGN KEY ([CODCONTORIF]) REFERENCES [dbo].[ANAGRAFICAGENERICI] ([CODCONTO])
);


GO
CREATE NONCLUSTERED INDEX [DESCBANCA]
    ON [dbo].[ANAGRAFICABANCHE]([DSCBANCA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODRIFERIMENTO]
    ON [dbo].[ANAGRAFICABANCHE]([CODCONTORIF] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ANAB_CAB]
    ON [dbo].[ANAGRAFICABANCHE]([CAB] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ANAB_ABI]
    ON [dbo].[ANAGRAFICABANCHE]([ABI] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ANAGRAFICABANCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANAGRAFICABANCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANAGRAFICABANCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANAGRAFICABANCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANAGRAFICABANCHE] TO [Metodo98]
    AS [dbo];
