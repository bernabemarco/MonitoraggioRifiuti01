CREATE TABLE [dbo].[FRCDatiMaterialiCLav] (
    [ID]             INT              IDENTITY (1, 1) NOT NULL,
    [AMBIENTE]       VARCHAR (3)      NULL,
    [ANNO]           INT              NULL,
    [MESEDOC]        INT              NULL,
    [ANNOMESEDOC]    VARCHAR (21)     NULL,
    [COMPOSTO]       VARCHAR (50)     NULL,
    [DSCCOMPOSTO]    VARCHAR (500)    NULL,
    [UMGEST]         VARCHAR (3)      NULL,
    [QTAGEST]        DECIMAL (19, 6)  NULL,
    [UMPREZZO]       VARCHAR (3)      NULL,
    [QTAPREZZO]      DECIMAL (19, 6)  NULL,
    [FATTORE]        DECIMAL (20, 10) NULL,
    [QUANTITA]       DECIMAL (19, 6)  NULL,
    [CDRMercato]     VARCHAR (10)     NULL,
    [CDRProdotto]    VARCHAR (10)     NULL,
    [COMPONENTE]     VARCHAR (50)     NULL,
    [DSCCOMPONENTE]  VARCHAR (500)    NULL,
    [UMCOMPONENTE]   VARCHAR (3)      NULL,
    [QUANTITAUNI]    DECIMAL (16, 6)  NULL,
    [COSTOUNIEURO]   DECIMAL (19, 6)  NULL,
    [QUANTITATOT]    DECIMAL (16, 6)  NULL,
    [COSTOTOTEURO]   DECIMAL (19, 6)  NULL,
    [IDBudgetOrig]   INT              NULL,
    [UTENTEMODIFICA] VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]   DATETIME         NOT NULL,
    CONSTRAINT [KEY_FRCDatiMaterialiCLav] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FRCDatiMaterialiCLav_AAMC]
    ON [dbo].[FRCDatiMaterialiCLav]([AMBIENTE] ASC, [ANNO] ASC, [MESEDOC] ASC, [COMPOSTO] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDatiMaterialiCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDatiMaterialiCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDatiMaterialiCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDatiMaterialiCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDatiMaterialiCLav] TO [Metodo98]
    AS [dbo];

