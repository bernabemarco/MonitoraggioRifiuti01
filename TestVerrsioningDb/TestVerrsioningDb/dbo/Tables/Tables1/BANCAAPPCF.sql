﻿CREATE TABLE [dbo].[BANCAAPPCF] (
    [CODCONTO]            VARCHAR (7)  NOT NULL,
    [CODICE]              DECIMAL (5)  NOT NULL,
    [ABI]                 VARCHAR (6)  NULL,
    [CAB]                 VARCHAR (6)  NULL,
    [BANCAAPPOGGIO]       VARCHAR (80) NULL,
    [CONTOCORRENTE]       VARCHAR (15) NULL,
    [UTENTEMODIFICA]      VARCHAR (25) NOT NULL,
    [DATAMODIFICA]        DATETIME     NOT NULL,
    [CODICEIBAN]          VARCHAR (34) NULL,
    [CODICEBIC]           VARCHAR (11) NULL,
    [CIN]                 VARCHAR (1)  NULL,
    [CODUNIVOCOCBI]       VARCHAR (35) NULL,
    [IDMANDATODEBITORE]   VARCHAR (35) NULL,
    [DATAMANDATODEBITORE] DATETIME     NULL,
    [TIPOSEQINCASSORID]   VARCHAR (4)  NULL,
    [CODISO]              VARCHAR (3)  DEFAULT ('IT') NULL,
    CONSTRAINT [PK_BANCAAPPCF] PRIMARY KEY CLUSTERED ([CODCONTO] ASC, [CODICE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_BANCAAPPCF_CODCONTO] FOREIGN KEY ([CODCONTO]) REFERENCES [dbo].[ANAGRAFICACF] ([CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [DSCBANCA]
    ON [dbo].[BANCAAPPCF]([BANCAAPPOGGIO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [BANCAAPPCF_ABI]
    ON [dbo].[BANCAAPPCF]([ABI] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [BANCAAPPCF_CAB]
    ON [dbo].[BANCAAPPCF]([CAB] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODICEB]
    ON [dbo].[BANCAAPPCF]([CODICE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BANCAAPPCF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BANCAAPPCF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BANCAAPPCF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BANCAAPPCF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BANCAAPPCF] TO [Metodo98]
    AS [dbo];
