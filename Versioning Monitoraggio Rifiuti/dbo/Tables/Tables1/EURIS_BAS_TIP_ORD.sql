﻿CREATE TABLE [dbo].[EURIS_BAS_TIP_ORD] (
    [COD_AZIENDA]     NVARCHAR (3)  NULL,
    [TIPO_ORDINE]     NVARCHAR (3)  NULL,
    [DES_ORDINE]      NVARCHAR (30) NULL,
    [TIPO_CATEGORIA]  NVARCHAR (1)  NULL,
    [ULTIMA_MODIFICA] DATETIME      NULL,
    [ULTIMO_UTENTE]   NVARCHAR (20) NULL,
    CONSTRAINT [FK_EURIS_BAS_TIP_ORD_COD_AZIENDA] FOREIGN KEY ([COD_AZIENDA]) REFERENCES [dbo].[EURIS_SCHEDULAZIONI] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EURIS_BAS_TIP_ORD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EURIS_BAS_TIP_ORD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EURIS_BAS_TIP_ORD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EURIS_BAS_TIP_ORD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EURIS_BAS_TIP_ORD] TO [Metodo98]
    AS [dbo];

