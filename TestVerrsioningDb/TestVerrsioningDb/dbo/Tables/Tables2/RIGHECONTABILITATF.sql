﻿CREATE TABLE [dbo].[RIGHECONTABILITATF] (
    [NRREG]          DECIMAL (10)    NOT NULL,
    [NRRIGA]         SMALLINT        NOT NULL,
    [DATAREG]        DATETIME        NULL,
    [DATARIF]        DATETIME        NULL,
    [NRRIF]          VARCHAR (15)    NULL,
    [NRPARTITA]      VARCHAR (19)    NULL,
    [CONTO]          VARCHAR (7)     NULL,
    [SEGNO]          SMALLINT        DEFAULT (0) NULL,
    [IMPORTO]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPORTOVALUTA]  DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [IMPORTOEURO]    DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [VALORECAMBIO]   DECIMAL (13, 6) DEFAULT (1) NOT NULL,
    [DESCRIZIONE]    VARCHAR (80)    NULL,
    [DATAVALUTA]     DATETIME        NULL,
    [CPARTITA]       VARCHAR (7)     NULL,
    [RIGACAUSALE]    SMALLINT        NULL,
    [CODCOMMESSA]    VARCHAR (30)    NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [CODCAMBIO]      SMALLINT        DEFAULT (0) NULL,
    [ESERCIZIO]      DECIMAL (5)     NOT NULL,
    [POSIZIONE]      SMALLINT        NOT NULL,
    CONSTRAINT [PK_RIGHECONTABILITATF] PRIMARY KEY CLUSTERED ([NRREG] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_SEGNO_RIGHECONTF] CHECK ([SEGNO] = 0 or [SEGNO] = 1),
    CONSTRAINT [FK_RIGHECONTABILITATF_NRREG] FOREIGN KEY ([NRREG]) REFERENCES [dbo].[TESTECONTABILITATF] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [RIGC_CONTO]
    ON [dbo].[RIGHECONTABILITATF]([CONTO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RIGC_PARTITA]
    ON [dbo].[RIGHECONTABILITATF]([NRPARTITA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RIGC_ESERCIZIO]
    ON [dbo].[RIGHECONTABILITATF]([ESERCIZIO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RIGC_CPART]
    ON [dbo].[RIGHECONTABILITATF]([CPARTITA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RIGC_COMMESSA]
    ON [dbo].[RIGHECONTABILITATF]([CODCOMMESSA] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHECONTABILITATF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RIGHECONTABILITATF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RIGHECONTABILITATF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHECONTABILITATF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RIGHECONTABILITATF] TO [Metodo98]
    AS [dbo];

