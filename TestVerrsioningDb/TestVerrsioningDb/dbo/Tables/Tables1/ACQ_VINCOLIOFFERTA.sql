﻿CREATE TABLE [dbo].[ACQ_VINCOLIOFFERTA] (
    [PROGRESSIVO]       DECIMAL (10)   NOT NULL,
    [CONTATORE]         DECIMAL (5)    NULL,
    [TIPODOCFATTRIEP]   VARCHAR (3)    NULL,
    [TIPODOCFATTPREN]   VARCHAR (3)    NULL,
    [TIPODOCNFATTRIEP]  VARCHAR (3)    NULL,
    [TIPODOCNFATTPROVV] VARCHAR (3)    NULL,
    [DESCRIZIONERIGA]   VARCHAR (255)  NULL,
    [SCGENERICO]        VARCHAR (7)    NULL,
    [CODIVA]            DECIMAL (5)    NULL,
    [DFLTPROVVIGIONE]   DECIMAL (8, 5) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]      DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ACQ_VINCOLIOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ACQ_VINCOLIOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ACQ_VINCOLIOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ACQ_VINCOLIOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ACQ_VINCOLIOFFERTA] TO [Metodo98]
    AS [dbo];
