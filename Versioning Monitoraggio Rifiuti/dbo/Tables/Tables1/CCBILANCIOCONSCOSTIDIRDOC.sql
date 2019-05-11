﻿CREATE TABLE [dbo].[CCBILANCIOCONSCOSTIDIRDOC] (
    [IDCOMMCLI]         DECIMAL (10)    NOT NULL,
    [NRRIGA]            INT             NOT NULL,
    [DESCRIZIONE]       VARCHAR (255)   NULL,
    [IDTESTADOC]        NUMERIC (10)    NULL,
    [IDRIGADOC]         INT             NULL,
    [CODCLIFOR]         VARCHAR (7)     NULL,
    [IMPORTO]           DECIMAL (19, 4) DEFAULT (0) NULL,
    [NATURARILEVAZIONE] SMALLINT        NULL,
    [TIPOREC]           VARCHAR (2)     NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [VOCEBASE]          VARCHAR (3)     DEFAULT ('') NULL,
    [IDVOCE]            VARCHAR (3)     DEFAULT ('') NULL,
    [IMPORTOEURO]       DECIMAL (19, 4) CONSTRAINT [DF_CCBILANCIOCONSCOSTIDIRDOC_IMPORTOEURO] DEFAULT (0) NULL,
    [TIPOCOSTO]         VARCHAR (4)     CONSTRAINT [DF_CCBILANCIOCONSCOSTIDIRDOC_TIPOCOSTO] DEFAULT ('CDIR') NULL,
    [IDTABELLA]         VARCHAR (10)    CONSTRAINT [DF_CCBILANCIOCONSCOSTIDIRDOC_IDTABELLA] DEFAULT ('CDIRDOC') NULL,
    [ORIGINEEVENTO]     SMALLINT        NULL,
    [TIPOINSERIMENTO]   SMALLINT        NULL,
    [DATAELAB_CONS]     DATETIME        NULL,
    [DATAELAB_VAL]      DATETIME        NULL,
    [DATAMOVIMENTO]     DATETIME        NULL,
    [DATADISPONIBILITA] DATETIME        NULL,
    [DATACOMPETENZA]    DATETIME        NULL,
    [DATARIFVALORIZ]    DATETIME        NULL,
    [TIPORECDETT]       VARCHAR (2)     NULL,
    [CONTOCDC]          VARCHAR (10)    NULL,
    [QTABASE]           DECIMAL (16, 6) NULL,
    [QTAVAL]            DECIMAL (16, 6) NULL,
    [UMBASE]            VARCHAR (3)     NULL,
    [UMVAL]             VARCHAR (3)     NULL,
    [QTABUDGET]         DECIMAL (16, 6) NULL,
    [PESO]              DECIMAL (8, 5)  NULL,
    [NOTE]              VARCHAR (500)   NULL,
    [TIPORECVAL]        VARCHAR (2)     NULL,
    CONSTRAINT [PK_CCBILANCIOCONSCOSTIDIRDOC] PRIMARY KEY CLUSTERED ([IDCOMMCLI] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CCBILANCIOCONSCOSTIDIRDOC_IDCOMMCLI] FOREIGN KEY ([IDCOMMCLI]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CCBILANCIOCONSCOSTIDIRDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CCBILANCIOCONSCOSTIDIRDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CCBILANCIOCONSCOSTIDIRDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CCBILANCIOCONSCOSTIDIRDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CCBILANCIOCONSCOSTIDIRDOC] TO [Metodo98]
    AS [dbo];
