﻿CREATE TABLE [dbo].[EURIS_PRO_FSC_ORA] (
    [COD_AZIENDA]       NVARCHAR (3)  NULL,
    [COD_PROFILO]       NVARCHAR (3)  NULL,
    [DES_PROFILO]       NVARCHAR (30) NULL,
    [ORA_INIZIO_1]      FLOAT (53)    NULL,
    [ORA_FINE_1]        FLOAT (53)    NULL,
    [ORA_INIZIO_2]      FLOAT (53)    NULL,
    [ORA_FINE_2]        FLOAT (53)    NULL,
    [ORA_INIZIO_3]      FLOAT (53)    NULL,
    [ORA_FINE_3]        FLOAT (53)    NULL,
    [ORA_INIZIO_4]      FLOAT (53)    NULL,
    [ORA_FINE_4]        FLOAT (53)    NULL,
    [FLG_FINE_TURNO_24] NVARCHAR (1)  NULL,
    [ULTIMA_MODIFICA]   DATETIME      NULL,
    [ULTIMO_UTENTE]     NVARCHAR (20) NULL,
    CONSTRAINT [FK_EURIS_PRO_FSC_ORA_COD_AZIENDA] FOREIGN KEY ([COD_AZIENDA]) REFERENCES [dbo].[EURIS_SCHEDULAZIONI] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EURIS_PRO_FSC_ORA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EURIS_PRO_FSC_ORA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EURIS_PRO_FSC_ORA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EURIS_PRO_FSC_ORA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EURIS_PRO_FSC_ORA] TO [Metodo98]
    AS [dbo];

