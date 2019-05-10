﻿CREATE TABLE [dbo].[EURIS_PRO_FAS_PRI] (
    [COD_AZIENDA]      NVARCHAR (3)     NULL,
    [COD_STABILIMENTO] NVARCHAR (3)     NULL,
    [TIPO_ORDINE]      NVARCHAR (3)     NULL,
    [NUM_ORDINE]       NVARCHAR (15)    NULL,
    [COD_COMMESSA]     NVARCHAR (12)    NULL,
    [COD_FASE]         DECIMAL (5)      NULL,
    [COD_SOTTO_FASE]   DECIMAL (3)      NULL,
    [COD_ALTERNATIVA]  NVARCHAR (2)     NULL,
    [COD_RISORSA]      NVARCHAR (12)    NULL,
    [DES_OPERAZIONE]   NVARCHAR (40)    NULL,
    [COD_FASE_SUCC]    DECIMAL (5)      NULL,
    [COD_FASE_PREC]    DECIMAL (5)      NULL,
    [T_FISSO]          DECIMAL (15, 10) NULL,
    [TIPO_T_FISSO]     NVARCHAR (1)     NULL,
    [T_VARIABILE]      DECIMAL (15, 10) NULL,
    [TIPO_T_VARIAB]    NVARCHAR (1)     NULL,
    [T_TOT_VARIAB]     DECIMAL (15, 10) NULL,
    [TIPO_T_TOT_VAR]   NVARCHAR (1)     NULL,
    [T_FISSO_CONSUNT]  DECIMAL (15, 10) NULL,
    [TIPO_T_CONSU]     NVARCHAR (1)     NULL,
    [T_VAR_CONSUNT]    DECIMAL (15, 10) NULL,
    [TIPO_T_VAR_CONS]  NVARCHAR (1)     NULL,
    [QTA_CONSUNTIVATA] DECIMAL (11)     NULL,
    [QTA_PARALLELO]    DECIMAL (11)     NULL,
    [QTA_ORDINATA]     DECIMAL (11)     NULL,
    [QTA_ENTRATA]      DECIMAL (11)     NULL,
    [QTA_PRODOTTO]     DECIMAL (11)     NULL,
    [QTA_USCITA]       DECIMAL (11)     NULL,
    [QTA_SCARTO]       DECIMAL (11)     NULL,
    [T_SPOSTA_F_SUC]   DECIMAL (15, 10) NULL,
    [TIPO_T_SPO_SUC]   NVARCHAR (1)     NULL,
    [FLG_ATTREZZAGGI]  NVARCHAR (1)     NULL,
    [FLG_NON_INTERR]   NVARCHAR (1)     NULL,
    [FLG_DT_BLOCCATA]  NVARCHAR (1)     NULL,
    [PER_SOVRACCARICO] DECIMAL (3)      NULL,
    [QTA_SOVRACCARICO] DECIMAL (11)     NULL,
    [STA_AVANZAMENTO]  NVARCHAR (2)     NULL,
    [DT_INIZIO_INF]    DECIMAL (8)      NULL,
    [ORA_INIZIO_INF]   DECIMAL (4, 2)   NULL,
    [DT_FINE_INF]      DECIMAL (8)      NULL,
    [ORA_FINE_INF]     DECIMAL (4, 2)   NULL,
    [DT_INIZIO_FIN]    DECIMAL (8)      NULL,
    [ORA_INIZIO_FIN]   DECIMAL (4, 2)   NULL,
    [DT_FINE_FIN]      DECIMAL (8)      NULL,
    [ORA_FINE_FIN]     DECIMAL (4, 2)   NULL,
    [PRIORITA]         DECIMAL (6)      NULL,
    [PRIORITA_ALT]     DECIMAL (6)      NULL,
    [PRIORITA_INT]     DECIMAL (6)      NULL,
    [COD_SEQUENZA]     DECIMAL (3)      NULL,
    [T_LAV_SUCCC]      DECIMAL (15, 10) NULL,
    [TIPO_T_LAV_SUC]   NVARCHAR (1)     NULL,
    [T_ATTREZZA_SUCC]  DECIMAL (15, 10) NULL,
    [TIPO_T_ATTRE_SUC] NVARCHAR (1)     NULL,
    [DT_ARRIVO]        DECIMAL (8)      NULL,
    [ORA_ARRIVO]       DECIMAL (4, 2)   NULL,
    [TIPO_VINCOLO]     NVARCHAR (1)     NULL,
    [DATA_VINCOLO]     DECIMAL (8)      NULL,
    [COD_FASE_VINCOLO] DECIMAL (5)      NULL,
    [FLG_FINE_FASCIA]  NVARCHAR (1)     NULL,
    [VAL_CHIAVE_DES]   NVARCHAR (5)     NULL,
    [FLG_DUPLICA_DOC]  NVARCHAR (1)     NULL,
    [ULTIMA_MODIFICA]  DECIMAL (8)      NULL,
    [ULTIMO_UTENTE]    NVARCHAR (10)    NULL,
    [SPEC_LAVORAZIONE] NVARCHAR (255)   NULL,
    [SPEC_CONTROLLO]   NVARCHAR (255)   NULL,
    [DT_PARTENZA]      DECIMAL (8)      NULL,
    [ORA_PARTENZA]     DECIMAL (4, 2)   NULL,
    [QTA_SPLIT]        DECIMAL (11)     NULL,
    [FLG_SPLIT]        NVARCHAR (1)     NULL,
    [TIPO_VINCOLO_DT]  NVARCHAR (1)     NULL,
    [QTA_PROD_SIMULT]  DECIMAL (11)     NULL,
    [COD_GRUPPO01]     NVARCHAR (50)    NULL,
    [COD_GRUPPO02]     NVARCHAR (50)    NULL,
    CONSTRAINT [FK_EURIS_PRO_FAS_PRI_COD_AZIENDA] FOREIGN KEY ([COD_AZIENDA]) REFERENCES [dbo].[EURIS_SCHEDULAZIONI] ([CODICE]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EURIS_PRO_FAS_PRI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EURIS_PRO_FAS_PRI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EURIS_PRO_FAS_PRI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EURIS_PRO_FAS_PRI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EURIS_PRO_FAS_PRI] TO [Metodo98]
    AS [dbo];

