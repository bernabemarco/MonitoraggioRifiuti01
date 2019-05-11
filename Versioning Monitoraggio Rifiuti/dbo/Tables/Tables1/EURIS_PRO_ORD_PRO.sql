﻿CREATE TABLE [dbo].[EURIS_PRO_ORD_PRO] (
    [COD_AZIENDA]      NVARCHAR (3)  NULL,
    [TIPO_ORDINE]      NVARCHAR (3)  NULL,
    [NUM_ORDINE]       NVARCHAR (15) NULL,
    [STA_ORDINE]       NVARCHAR (2)  NULL,
    [TIPO_RIFORNIMENT] NVARCHAR (1)  NULL,
    [COD_ARTICOLO]     NVARCHAR (20) NULL,
    [COD_FASE]         DECIMAL (5)   NULL,
    [COD_ENTE]         NVARCHAR (8)  NULL,
    [COD_STABILIMENTO] NVARCHAR (3)  NULL,
    [COD_COMMESSA]     NVARCHAR (12) NULL,
    [COD_CIC_ALT]      NVARCHAR (3)  NULL,
    [COD_CICLO_RIF]    NVARCHAR (20) NULL,
    [DT_CONSEGNA]      DECIMAL (8)   NULL,
    [DT_INIZIO_PROD]   DECIMAL (8)   NULL,
    [DT_INIZIO_MIN]    DECIMAL (8)   NULL,
    [DT_FINE_CALC]     DECIMAL (8)   NULL,
    [DT_CREA_ORD]      DECIMAL (8)   NULL,
    [QTA_ORDINE]       DECIMAL (11)  NULL,
    [QTA_VERSATA]      DECIMAL (11)  NULL,
    [QTA_SCARTATA]     DECIMAL (11)  NULL,
    [TIPO_ORDINE_CL]   NVARCHAR (3)  NULL,
    [NUM_ORDINE_CL]    NVARCHAR (15) NULL,
    [NUM_RIG_ORD_CL]   NVARCHAR (3)  NULL,
    [FLG_DUPLICA]      NVARCHAR (1)  NULL,
    [PRIORITA]         DECIMAL (6)   NULL,
    [ULTIMA_MODIFICA]  DECIMAL (8)   NULL,
    [ULTIMO_UTENTE]    NVARCHAR (10) NULL,
    CONSTRAINT [FK_EURIS_PRO_ORD_PRO_COD_AZIENDA] FOREIGN KEY ([COD_AZIENDA]) REFERENCES [dbo].[EURIS_SCHEDULAZIONI] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EURIS_PRO_ORD_PRO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EURIS_PRO_ORD_PRO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EURIS_PRO_ORD_PRO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EURIS_PRO_ORD_PRO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EURIS_PRO_ORD_PRO] TO [Metodo98]
    AS [dbo];
