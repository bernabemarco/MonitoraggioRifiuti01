﻿CREATE TABLE [dbo].[EURIS_PRO_ANA_RIS] (
    [COD_STABILIMENTO]   NVARCHAR (3)  NULL,
    [COD_AZIENDA]        NVARCHAR (3)  NULL,
    [COD_RISORSA]        NVARCHAR (12) NULL,
    [TIPO_RISORSA]       NVARCHAR (1)  NULL,
    [DES_RISORSA]        NVARCHAR (30) NULL,
    [CATEGORIA_RIS]      NVARCHAR (3)  NULL,
    [COD_RIS_SUPERIOR]   NVARCHAR (12) NULL,
    [FLG_CONTROLLATA]    NVARCHAR (1)  NULL,
    [COD_CALENDARIO]     NVARCHAR (5)  NULL,
    [FLG_RIS_ESTERNA]    NVARCHAR (1)  NULL,
    [FLG_RIS_PRIMARIA]   NVARCHAR (1)  NULL,
    [FLG_CARICO_UNICO]   NVARCHAR (1)  NULL,
    [COD_ENTE]           NVARCHAR (8)  NULL,
    [TIPO_RIS_INFORNATA] DECIMAL (1)   NULL,
    [PER_SATURA_INF]     DECIMAL (3)   NULL,
    [PER_INFORNATA]      DECIMAL (3)   NULL,
    [VAL_CHIAVE_DES]     NVARCHAR (5)  NULL,
    [FLG_CONTROL_EFF]    NVARCHAR (1)  NULL,
    [ULTIMA_MODIFICA]    DECIMAL (8)   NULL,
    [ULTIMO_UTENTE]      NVARCHAR (10) NULL,
    [FLG_CRITICA]        NVARCHAR (1)  NULL,
    [COD_RIS_REPARTO]    NVARCHAR (12) NULL,
    CONSTRAINT [FK_EURIS_PRO_ANA_RIS_COD_AZIENDA] FOREIGN KEY ([COD_AZIENDA]) REFERENCES [dbo].[EURIS_SCHEDULAZIONI] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EURIS_PRO_ANA_RIS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EURIS_PRO_ANA_RIS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EURIS_PRO_ANA_RIS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EURIS_PRO_ANA_RIS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EURIS_PRO_ANA_RIS] TO [Metodo98]
    AS [dbo];

