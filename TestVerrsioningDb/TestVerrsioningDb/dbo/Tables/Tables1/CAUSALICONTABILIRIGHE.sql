﻿CREATE TABLE [dbo].[CAUSALICONTABILIRIGHE] (
    [CODICECAUSALE]     DECIMAL (5)  NOT NULL,
    [PROGRIGHE]         SMALLINT     NOT NULL,
    [MASTRO]            DECIMAL (5)  NULL,
    [CONTO]             VARCHAR (7)  NULL,
    [SEGNO]             SMALLINT     DEFAULT (0) NULL,
    [TIPODESCRIZIONE]   SMALLINT     NULL,
    [RIPETIZIONE]       SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA]    VARCHAR (25) NOT NULL,
    [DATAMODIFICA]      DATETIME     NOT NULL,
    [PRELEVASCADENZA]   SMALLINT     CONSTRAINT [DF_CAUSALICONTABILIRIGHE_PRELEVASCADENZA] DEFAULT (0) NULL,
    [CONSENTICAMBIOSEZ] SMALLINT     CONSTRAINT [DF_CAUSALICONTABILIRIGHE_CONSENTICAMBIOSEZ] DEFAULT (0) NULL,
    CONSTRAINT [PK_CAUSALICONTABILIRIGHE] PRIMARY KEY CLUSTERED ([CODICECAUSALE] ASC, [PROGRIGHE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_CAUSALICONTABILIRIGHE_CONSENTICAMBIOSEZ] CHECK ([CONSENTICAMBIOSEZ] = 1 or [CONSENTICAMBIOSEZ] = 0),
    CONSTRAINT [CHK_CAUSALICONTABILIRIGHE_PRELEVASCADENZA] CHECK ([PRELEVASCADENZA] = 1 or [PRELEVASCADENZA] = 0),
    CONSTRAINT [CKC_RIPETIZIONE_CAUSALIC] CHECK ([RIPETIZIONE] = 0 or [RIPETIZIONE] = 1),
    CONSTRAINT [CKC_SEGNO_CAUSALICR] CHECK ([SEGNO] = 0 or [SEGNO] = 1),
    CONSTRAINT [FK_CAUSALICONTABILIRIGHE_CODICECAUSALE] FOREIGN KEY ([CODICECAUSALE]) REFERENCES [dbo].[CAUSALICONTABILI] ([CODICECAUSALE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [CODCONTO]
    ON [dbo].[CAUSALICONTABILIRIGHE]([CONTO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [MASTRO]
    ON [dbo].[CAUSALICONTABILIRIGHE]([MASTRO] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CAUSALICONTABILIRIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CAUSALICONTABILIRIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CAUSALICONTABILIRIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CAUSALICONTABILIRIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CAUSALICONTABILIRIGHE] TO [Metodo98]
    AS [dbo];

