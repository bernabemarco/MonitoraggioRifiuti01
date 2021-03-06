﻿CREATE TABLE [dbo].[CGesWTESTECONTABILITA] (
    [PROGRESSIVO]    DECIMAL (10)    NOT NULL,
    [ESERCIZIO]      DECIMAL (5)     NOT NULL,
    [DATAREG]        DATETIME        NULL,
    [DATARIF]        DATETIME        NULL,
    [NRRIFER]        VARCHAR (15)    NULL,
    [MOVIVA]         SMALLINT        CONSTRAINT [DF__CGesWTESTECONT__MOVIV__0F824689] DEFAULT (0) NULL,
    [PROVVISORIO]    SMALLINT        CONSTRAINT [DF__CGesWTESTECONT__PROVV__10766AC2] DEFAULT (0) NULL,
    [CAUSALE]        DECIMAL (5)     NULL,
    [ANNOPLAFOND]    SMALLINT        NULL,
    [MESEPLAFOND]    SMALLINT        NULL,
    [DESCRIZIONE]    VARCHAR (80)    NULL,
    [APPUNTI]        VARCHAR (255)   NULL,
    [TOTDOCLIRE]     DECIMAL (19, 4) CONSTRAINT [DF__CGesWTESTECONT__TOTDO__125EB334] DEFAULT (0) NOT NULL,
    [TOTDOCVALUTA]   DECIMAL (19, 4) CONSTRAINT [DF__CGesWTESTECONT__TOTDO__1352D76D] DEFAULT (0) NOT NULL,
    [TOTDOCEURO]     DECIMAL (19, 4) CONSTRAINT [DF__CGesWTESTECONT__TOTDO__1446FBA6] DEFAULT (0) NOT NULL,
    [NRGIORNALE]     DECIMAL (5)     NULL,
    [IDTESTADOC]     DECIMAL (10)    NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [flgImpExp]      SMALLINT        NULL,
    CONSTRAINT [PK_CGesWTESTECONTABILITA] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_CGesWTC_flgImpExp] CHECK ([flgImpExp] is null or [flgImpExp] = 2 or [flgImpExp] = 1 or [flgImpExp] = 0),
    CONSTRAINT [CKC_PROVVISORIO_CGesWTESTECON] CHECK ([PROVVISORIO] = 2 or [PROVVISORIO] = 1 or [PROVVISORIO] = 0)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesWTSTC_1]
    ON [dbo].[CGesWTESTECONTABILITA]([DATAREG] ASC, [PROGRESSIVO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWTSTC_CAUSALE]
    ON [dbo].[CGesWTESTECONTABILITA]([CAUSALE] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWTSTC_DATAREG]
    ON [dbo].[CGesWTESTECONTABILITA]([DATAREG] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWTSTC_MESEPLAFOND]
    ON [dbo].[CGesWTESTECONTABILITA]([MESEPLAFOND] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWTSTC_NRRIFER]
    ON [dbo].[CGesWTESTECONTABILITA]([NRRIFER] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWTESTECONTABILITA1]
    ON [dbo].[CGesWTESTECONTABILITA]([PROGRESSIVO] ASC, [ESERCIZIO] ASC, [PROVVISORIO] ASC, [CAUSALE] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesWTESTECONTABILITA111]
    ON [dbo].[CGesWTESTECONTABILITA]([PROGRESSIVO] ASC, [ESERCIZIO] ASC, [DATAREG] ASC, [PROVVISORIO] ASC, [CAUSALE] ASC, [NRGIORNALE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWTESTECONTABILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWTESTECONTABILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWTESTECONTABILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWTESTECONTABILITA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWTESTECONTABILITA] TO [Metodo98]
    AS [dbo];

