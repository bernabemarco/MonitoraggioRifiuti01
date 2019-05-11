﻿CREATE TABLE [dbo].[GESTIONEPREZZIRIGHE] (
    [IDRIGA]            DECIMAL (10)    NOT NULL,
    [RIFPROGRESSIVO]    DECIMAL (10)    NOT NULL,
    [NRLISTINO]         DECIMAL (5)     NOT NULL,
    [UM]                VARCHAR (3)     NOT NULL,
    [QTAMINIMA]         DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [PREZZO_MAGG]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [PREZZO_MAGGEURO]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [SCONTO_UNICO]      VARCHAR (20)    NULL,
    [SCONTO_AGGIUNTIVO] VARCHAR (20)    NULL,
    [TIPO]              DECIMAL (5)     DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [TP_QTASCONTO]      NUMERIC (16, 6) NULL,
    [TP_QTACOEFF]       NUMERIC (16, 6) NULL,
    CONSTRAINT [PK_GESTIONEPREZZIRIGHE] PRIMARY KEY CLUSTERED ([IDRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_TIPO_GESTIONE] CHECK ([TIPO] >= (-3) and [TIPO] <= 99999),
    CONSTRAINT [FK_GESTIONEPREZZIRIGHE_RIFPROGRESSIVO] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[GESTIONEPREZZI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GPRIGHE]
    ON [dbo].[GESTIONEPREZZIRIGHE]([RIFPROGRESSIVO] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GESTIONEPREZZIRIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GESTIONEPREZZIRIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GESTIONEPREZZIRIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GESTIONEPREZZIRIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GESTIONEPREZZIRIGHE] TO [Metodo98]
    AS [dbo];
