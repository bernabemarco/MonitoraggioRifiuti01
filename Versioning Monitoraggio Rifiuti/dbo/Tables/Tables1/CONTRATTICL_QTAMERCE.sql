﻿CREATE TABLE [dbo].[CONTRATTICL_QTAMERCE] (
    [RIFPROGRESSIVOCL]    DECIMAL (10)    NOT NULL,
    [RIFPROGRESSIVO]      DECIMAL (10)    NOT NULL,
    [NRRIGA]              INT             NOT NULL,
    [FLAGRIGA]            SMALLINT        NULL,
    [POSIZIONE]           INT             NULL,
    [TIPORIGA]            VARCHAR (1)     NULL,
    [ARTICOLO]            VARCHAR (50)    NULL,
    [NRLISTINO]           DECIMAL (5)     NULL,
    [UM]                  VARCHAR (3)     NULL,
    [QTA]                 DECIMAL (19, 6) DEFAULT (0) NULL,
    [PREZZOUNIT]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [SCONTO]              VARCHAR (50)    DEFAULT (0) NULL,
    [PREZZOUNITNETTO]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [TOTALENETTO]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [IVA]                 VARCHAR (3)     NULL,
    [SOTTOCONTOCONTABILE] VARCHAR (7)     NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVOCL] ASC, [RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTICL_QTAMERCE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTICL_QTAMERCE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTICL_QTAMERCE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTICL_QTAMERCE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTICL_QTAMERCE] TO [Metodo98]
    AS [dbo];
