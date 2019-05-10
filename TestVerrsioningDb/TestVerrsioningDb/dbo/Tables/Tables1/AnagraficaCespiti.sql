CREATE TABLE [dbo].[AnagraficaCespiti] (
    [Codice]              VARCHAR (10)    NOT NULL,
    [Descrizione]         VARCHAR (80)    NULL,
    [CodiceRaggr]         DECIMAL (5)     DEFAULT (0) NULL,
    [CodCatFis]           DECIMAL (5)     NOT NULL,
    [CodRegistro]         SMALLINT        DEFAULT (0) NULL,
    [Matricola]           VARCHAR (20)    NULL,
    [Ubicazione]          VARCHAR (80)    NULL,
    [PrcAmmMin]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PrcAmmOrd]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PrcAmmAnt]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PrcDetrai]           DECIMAL (8, 5)  DEFAULT (0) NULL,
    [AnniAmmAnt]          SMALLINT        DEFAULT (0) NULL,
    [FlgPubReg]           SMALLINT        DEFAULT (0) NULL,
    [FlgAmmDir]           SMALLINT        DEFAULT (0) NULL,
    [FlgManStr]           SMALLINT        DEFAULT (0) NULL,
    [FlgMinUti]           SMALLINT        DEFAULT (0) NULL,
    [FlgAmmBIM]           SMALLINT        DEFAULT (0) NULL,
    [FlgAblStp]           SMALLINT        DEFAULT (0) NULL,
    [GenImmobi]           VARCHAR (7)     NULL,
    [GenAmmOrd]           VARCHAR (7)     NULL,
    [GenAmmAnt]           VARCHAR (7)     NULL,
    [GenFdoOrd]           VARCHAR (7)     NULL,
    [GenFdoAnt]           VARCHAR (7)     NULL,
    [GenQteNon]           VARCHAR (7)     NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [NOTE]                VARCHAR (255)   NULL,
    [DtaInizioAmm]        DATETIME        NULL,
    [DtaFineAmm]          DATETIME        NULL,
    [PrcAmmMinPrec]       DECIMAL (8, 5)  NULL,
    [PrcAmmOrdPrec]       DECIMAL (8, 5)  NULL,
    [PrcAmmAntPrec]       DECIMAL (8, 5)  NULL,
    [AGT_TIPO1]           VARCHAR (255)   NULL,
    [AGT_TIPO2]           VARCHAR (255)   NULL,
    [AGT_TIPO3]           VARCHAR (255)   NULL,
    [CODCAT_ATI]          DECIMAL (5)     CONSTRAINT [DF_ANAGCESPITI_CODCAT_ATI] DEFAULT (0) NULL,
    [DATAENTRATA_ATI]     DATETIME        NULL,
    [DATATERMINE_ATI]     DATETIME        NULL,
    [CODGEN_ATI]          VARCHAR (7)     NULL,
    [VALORERIACQ_ATI]     DECIMAL (19, 4) CONSTRAINT [DF_ANAGCESPITI_VALORERIACQ_ATI] DEFAULT (0) NULL,
    [VALORERIACQEURO_ATI] DECIMAL (19, 4) CONSTRAINT [DF_ANACESPITI_VALRIACQEURO_ATI] DEFAULT (0) NULL,
    [UMASS_ATI]           VARCHAR (5)     NULL,
    [PERAMM_TIPO1]        DECIMAL (8, 5)  CONSTRAINT [DF_ANAGCESPITI_PERAMM_TIPO1] DEFAULT (0) NULL,
    [PERAMM_TIPO2]        DECIMAL (8, 5)  CONSTRAINT [DF_ANAGCESPITI_PERAMM_TIPO2] DEFAULT (0) NULL,
    [PERAMM_TIPO3]        DECIMAL (8, 5)  CONSTRAINT [DF_ANAGCESPITI_PERAMM_TIPO3] DEFAULT (0) NULL,
    [DURATAAMM_TIPO1]     SMALLINT        CONSTRAINT [DF_ANAGCESPITI_DURATAAMM_TIPO1] DEFAULT (0) NULL,
    [DURATAAMM_TIPO2]     SMALLINT        CONSTRAINT [DF_ANAGCESPITI_DURATAAMM_TIPO2] DEFAULT (0) NULL,
    [DURATAAMM_TIPO3]     SMALLINT        CONSTRAINT [DF_ANAGCESPITI_DURATAAMM_TIPO3] DEFAULT (0) NULL,
    [QTATOT_TIPO1]        DECIMAL (16, 6) CONSTRAINT [DF_ANAGCESPITI_QTATOT_TIPO1] DEFAULT (0) NULL,
    [QTATOT_TIPO2]        DECIMAL (16, 6) CONSTRAINT [DF_ANAGCESPITI_QTATOT_TIPO2] DEFAULT (0) NULL,
    [QTATOT_TIPO3]        DECIMAL (16, 6) CONSTRAINT [DF_ANAGCESPITI_QTATOT_TIPO3] DEFAULT (0) NULL,
    [QTAMIS_TIPO1]        DECIMAL (16, 6) CONSTRAINT [DF_ANAGCESPITI_QTAMIS_TIPO1] DEFAULT (0) NULL,
    [QTAMIS_TIPO2]        DECIMAL (16, 6) CONSTRAINT [DF_ANAGCESPITI_QTAMIS_TIPO2] DEFAULT (0) NULL,
    [QTAMIS_TIPO3]        DECIMAL (16, 6) CONSTRAINT [DF_ANAGCESPITI_QTAMIS_TIPO3] DEFAULT (0) NULL,
    [UM_TIPO1]            VARCHAR (5)     NULL,
    [UM_TIPO2]            VARCHAR (5)     NULL,
    [UM_TIPO3]            VARCHAR (5)     NULL,
    [DATAENTRATAEFF]      DATETIME        NULL,
    [GenAmm_ATI]          VARCHAR (7)     NULL,
    [GenFdo_ATI]          VARCHAR (7)     NULL,
    [CodUbicazione]       DECIMAL (5)     CONSTRAINT [DF_AnagraficaCespiti_CodUbicazione] DEFAULT (0) NULL,
    [FLGUSAVALRIACQUISTO] SMALLINT        CONSTRAINT [DF_ANAGRAFICACESPITI_FLGUSAVALRIACQUISTO] DEFAULT ((0)) NULL,
    [FLGSTUDISETTORE]     SMALLINT        CONSTRAINT [DF_ANAGRAFICACESPITI_FLGSTUDISETTORE] DEFAULT ((0)) NULL,
    [PRCSUPERAMM]         DECIMAL (8, 5)  NULL,
    [DATAINIRIACQUISTO]   DATETIME        NULL,
    [PRCIPERAMM]          DECIMAL (8, 5)  NULL,
    CONSTRAINT [AnagraficaCespiti_PK] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FlgAblStp_Check] CHECK ([FlgAblStp] = 1 or [FlgAblStp] = 0),
    CONSTRAINT [FlgAmmBIM_Check] CHECK ([FlgAmmBIM] = 1 or [FlgAmmBIM] = 0),
    CONSTRAINT [FlgAmmDir_Check] CHECK ([FlgAmmDir] = 1 or [FlgAmmDir] = 0),
    CONSTRAINT [FlgManStr_Check] CHECK ([FlgManStr] = 1 or [FlgManStr] = 0),
    CONSTRAINT [FlgMinUtiAnaCes_Check] CHECK ([FlgMinUti] = 1 or [FlgMinUti] = 0),
    CONSTRAINT [FlgPubReg_Check] CHECK ([FlgPubReg] = 1 or [FlgPubReg] = 0),
    CONSTRAINT [FK_ANAGRAFICACESPITI_CODCATFIS] FOREIGN KEY ([CodCatFis]) REFERENCES [dbo].[CategorieFiscali] ([Codice])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AnagraficaCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AnagraficaCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AnagraficaCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AnagraficaCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AnagraficaCespiti] TO [Metodo98]
    AS [dbo];

