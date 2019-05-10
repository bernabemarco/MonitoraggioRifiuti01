﻿CREATE TABLE [dbo].[TESTECONTABILITATF] (
    [PROGRESSIVO]          DECIMAL (10)    NOT NULL,
    [ESERCIZIO]            DECIMAL (5)     NOT NULL,
    [DATAREG]              DATETIME        NULL,
    [DATARIF]              DATETIME        NULL,
    [NRRIFER]              VARCHAR (15)    NULL,
    [PROVVISORIO]          SMALLINT        DEFAULT (0) NULL,
    [MOVIVA]               SMALLINT        DEFAULT (0) NULL,
    [CAUSALE]              DECIMAL (5)     NULL,
    [ANNOPLAFOND]          SMALLINT        NULL,
    [MESEPLAFOND]          SMALLINT        NULL,
    [DESCRIZIONE]          VARCHAR (80)    NULL,
    [APPUNTI]              VARCHAR (255)   NULL,
    [TOTDOCLIRE]           DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTDOCVALUTA]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [TOTDOCEURO]           DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [NRGIORNALE]           DECIMAL (5)     NULL,
    [IDTESTADOC]           DECIMAL (10)    NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [FLGELENCOCF]          SMALLINT        NULL,
    [CODICECIG]            VARCHAR (10)    CONSTRAINT [DF_TESTECONTABILITATF_CODICECIG] DEFAULT ('') NOT NULL,
    [CODICECUP]            VARCHAR (15)    CONSTRAINT [DF_TESTECONTABILITATF_CODICECUP] DEFAULT ('') NOT NULL,
    [FLGMOVRICONCILIATOEC] SMALLINT        NULL,
    [PROGDICHINTENTO]      DECIMAL (10)    CONSTRAINT [DF_TESTECONTABILITATF_PROGDICHINTENTO] DEFAULT ((0)) NULL,
    [SPLITPAYMENT]         SMALLINT        NULL,
    [CODFORNBOLLADOG]      VARCHAR (7)     NULL,
    [DATADOCBOLLADOG]      DATETIME        NULL,
    [NUMRIFBOLLADOG]       VARCHAR (15)    NULL,
    CONSTRAINT [PK_TESTECONTABILITATF] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_TESTECONTABILITATF_FLGELENCOCF] CHECK ([FLGELENCOCF]=(2) OR [FLGELENCOCF]=(1) OR [FLGELENCOCF]=(0)),
    CONSTRAINT [CHK_TESTECONTABILITATF_FLGMOVRICONCILIATOEC] CHECK ([FLGMOVRICONCILIATOEC]=(2) OR [FLGMOVRICONCILIATOEC]=(1) OR [FLGMOVRICONCILIATOEC]=(0)),
    CONSTRAINT [CHK_TESTECONTABILITATF_SPLITPAYMENT] CHECK ([SPLITPAYMENT]=(1) OR [SPLITPAYMENT]=(0)),
    CONSTRAINT [CKC_PROVVISORIO_TESTECONTF] CHECK ([PROVVISORIO] = 2 or [PROVVISORIO] = 1 or [PROVVISORIO] = 0),
    CONSTRAINT [FK_TESTECONTABILITATF_IDTESTADOC] FOREIGN KEY ([IDTESTADOC]) REFERENCES [dbo].[TESTEDOCUMENTI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTECONTABILITATF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTECONTABILITATF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTECONTABILITATF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTECONTABILITATF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTECONTABILITATF] TO [Metodo98]
    AS [dbo];

