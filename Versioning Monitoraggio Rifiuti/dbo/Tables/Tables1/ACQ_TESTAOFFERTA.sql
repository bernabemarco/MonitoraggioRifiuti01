﻿CREATE TABLE [dbo].[ACQ_TESTAOFFERTA] (
    [PROGRESSIVO]            DECIMAL (10)    NOT NULL,
    [ESERCIZIO]              SMALLINT        NOT NULL,
    [NUMEROOFFERTA]          DECIMAL (10)    NOT NULL,
    [DATAEMISSIONE]          DATETIME        NULL,
    [FORNITORE]              VARCHAR (7)     NOT NULL,
    [GRUPPOACQ]              VARCHAR (5)     NOT NULL,
    [FLAGSTATO]              SMALLINT        NULL,
    [DATAFINEOFFERTA]        DATETIME        NULL,
    [TIPORAPPAIOT]           SMALLINT        NULL,
    [FLAGDAFATTURARE]        SMALLINT        NULL,
    [MODPAGACQ]              VARCHAR (4)     NULL,
    [MODPAGVEN]              VARCHAR (4)     NULL,
    [NOTE]                   VARCHAR (255)   NULL,
    [PROVVIGIONE]            DECIMAL (8, 5)  NULL,
    [UTENTEMODIFICA]         VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]           DATETIME        NOT NULL,
    [VAL_PROVVIGIONE]        DECIMAL (19, 6) NULL,
    [CODMSG]                 NUMERIC (18)    NULL,
    [PROFILO]                VARCHAR (10)    NULL,
    [DOCUMENTAZIONEALLEGATA] VARCHAR (500)   NULL,
    [NUMLISTINO]             DECIMAL (5)     NULL,
    [CODTIPO]                DECIMAL (18)    DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_ACQ_TESTAOFFERTA_ACQ_TIPI] FOREIGN KEY ([CODTIPO]) REFERENCES [dbo].[ACQ_TIPI] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ACQ_TESTAOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ACQ_TESTAOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ACQ_TESTAOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ACQ_TESTAOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ACQ_TESTAOFFERTA] TO [Metodo98]
    AS [dbo];
