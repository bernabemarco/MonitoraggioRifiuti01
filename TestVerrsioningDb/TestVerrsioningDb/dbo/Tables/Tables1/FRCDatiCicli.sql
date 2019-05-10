CREATE TABLE [dbo].[FRCDatiCicli] (
    [ID]                    INT              IDENTITY (1, 1) NOT NULL,
    [AMBIENTE]              VARCHAR (3)      NULL,
    [ANNO]                  DECIMAL (5)      NULL,
    [MESEDOC]               INT              NULL,
    [ANNOMESEDOC]           VARCHAR (21)     NULL,
    [COMPOSTO]              VARCHAR (50)     NULL,
    [DSCCOMPOSTO]           VARCHAR (500)    NULL,
    [UMGEST]                VARCHAR (3)      NULL,
    [QTAGEST]               DECIMAL (19, 6)  NULL,
    [UMPREZZO]              VARCHAR (3)      NULL,
    [QTAPREZZO]             DECIMAL (19, 6)  NULL,
    [FATTORE]               DECIMAL (20, 10) NULL,
    [QUANTITA]              DECIMAL (19, 6)  NULL,
    [CDRMercato]            VARCHAR (10)     NULL,
    [CDRProdotto]           VARCHAR (10)     NULL,
    [COMPONENTE]            VARCHAR (50)     NULL,
    [DSCCOMPONENTE]         VARCHAR (500)    NULL,
    [RIFCICLO]              DECIMAL (10)     NULL,
    [RIFFASE]               INT              NOT NULL,
    [POSIZIONE]             INT              NULL,
    [TIPOFASE]              SMALLINT         NULL,
    [OPERAZIONE]            VARCHAR (5)      NULL,
    [CDLAVORO]              VARCHAR (5)      NULL,
    [MACCHINA]              VARCHAR (5)      NULL,
    [TEMPOSETUP]            DECIMAL (19, 6)  NULL,
    [UMTEMPOSETUP]          VARCHAR (1)      NULL,
    [TEMPORISORSA]          DECIMAL (19, 6)  NULL,
    [UMTEMPORISORSA]        VARCHAR (1)      NULL,
    [TEMPOUOMO]             DECIMAL (19, 6)  NULL,
    [UMTEMPOUOMO]           VARCHAR (1)      NULL,
    [DURATA]                VARCHAR (15)     NULL,
    [UMDURATA]              VARCHAR (1)      NULL,
    [TEMPOMOVIMENTAZIONE]   VARCHAR (15)     NULL,
    [TEMPOCODA]             VARCHAR (15)     NULL,
    [TEMPOATTRAV]           VARCHAR (15)     NULL,
    [COSTOSETUPEURO]        DECIMAL (19, 6)  NULL,
    [COSTORISORSAEURO]      DECIMAL (19, 6)  NULL,
    [COSTOUOMOEURO]         DECIMAL (19, 6)  NULL,
    [COSTOESTERNOEURO]      DECIMAL (19, 6)  NULL,
    [COSTOINDVAREURO]       DECIMAL (19, 6)  NULL,
    [COSTOINDFISSOEURO]     DECIMAL (19, 6)  NULL,
    [FORNITOREPREF]         VARCHAR (7)      NULL,
    [UMFASE]                VARCHAR (3)      NOT NULL,
    [DSCOPERAZIONE]         VARCHAR (80)     NULL,
    [CDCProd]               VARCHAR (10)     NULL,
    [RendimentoProd]        DECIMAL (19, 6)  NULL,
    [CDCMop]                VARCHAR (10)     NULL,
    [RendimentoMop]         DECIMAL (19, 6)  NULL,
    [CDCSetup]              VARCHAR (10)     NULL,
    [RendimentoSetup]       DECIMAL (19, 6)  NULL,
    [TEMPOSETUPTOT]         DECIMAL (19, 6)  NULL,
    [TEMPORISORSATOT]       DECIMAL (19, 6)  NULL,
    [TEMPOUOMOTOT]          DECIMAL (19, 6)  NULL,
    [COSTOLAVESTERNETOT]    DECIMAL (19, 6)  NULL,
    [UTENTEMODIFICA]        VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]          DATETIME         NOT NULL,
    [AmbienteIndici]        VARCHAR (3)      NULL,
    [AnnoInizioIndici]      INT              NULL,
    [MeseInizioIndici]      INT              NULL,
    [AnnoFineIndici]        INT              NULL,
    [MeseFineIndici]        INT              NULL,
    [IndiceUnitVarSetup]    DECIMAL (19, 6)  NULL,
    [IndiceUnitFisSetup]    DECIMAL (19, 6)  NULL,
    [CostoTrasfVarSetup]    DECIMAL (19, 6)  NULL,
    [CostoTrasfFisSetup]    DECIMAL (19, 6)  NULL,
    [IndiceUnitVarUomo]     DECIMAL (19, 6)  NULL,
    [IndiceUnitFisUomo]     DECIMAL (19, 6)  NULL,
    [CostoTrasfVarUomo]     DECIMAL (19, 6)  NULL,
    [CostoTrasfFisUomo]     DECIMAL (19, 6)  NULL,
    [IndiceUnitVarMacchina] DECIMAL (19, 6)  NULL,
    [IndiceUnitFisMacchina] DECIMAL (19, 6)  NULL,
    [CostoTrasfVarMacchina] DECIMAL (19, 6)  NULL,
    [CostoTrasfFisMacchina] DECIMAL (19, 6)  NULL,
    [IDBudgetOrig]          INT              NULL,
    CONSTRAINT [KEY_FRCDatiCicli] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FRCDatiCicli_AAMC]
    ON [dbo].[FRCDatiCicli]([AMBIENTE] ASC, [ANNO] ASC, [MESEDOC] ASC, [COMPOSTO] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDatiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDatiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDatiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDatiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDatiCicli] TO [Metodo98]
    AS [dbo];

