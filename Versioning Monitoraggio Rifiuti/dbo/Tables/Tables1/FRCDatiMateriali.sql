CREATE TABLE [dbo].[FRCDatiMateriali] (
    [ID]                      INT              IDENTITY (1, 1) NOT NULL,
    [AMBIENTE]                VARCHAR (3)      NULL,
    [ANNO]                    INT              NULL,
    [MESEDOC]                 INT              NULL,
    [ANNOMESEDOC]             VARCHAR (21)     NULL,
    [COMPOSTO]                VARCHAR (50)     NULL,
    [DSCCOMPOSTO]             VARCHAR (500)    NULL,
    [UMGEST]                  VARCHAR (3)      NULL,
    [QTAGEST]                 DECIMAL (19, 6)  NULL,
    [UMPREZZO]                VARCHAR (3)      NULL,
    [QTAPREZZO]               DECIMAL (19, 6)  NULL,
    [FATTORE]                 DECIMAL (20, 10) NULL,
    [QUANTITA]                DECIMAL (19, 6)  NULL,
    [CDRMercato]              VARCHAR (10)     NULL,
    [CDRProdotto]             VARCHAR (10)     NULL,
    [CONTOACQITA]             VARCHAR (7)      NULL,
    [CDCACQITA]               VARCHAR (10)     NULL,
    [COSTOTOTEURODIBAITA]     DECIMAL (19, 6)  NULL,
    [CONTOACQEST]             VARCHAR (7)      NULL,
    [CDCACQEST]               VARCHAR (10)     NULL,
    [COSTOTOTEURODIBAEST]     DECIMAL (19, 6)  NULL,
    [COSTOTOTEURODIBA]        DECIMAL (19, 6)  NULL,
    [COSTOUNIEURODIBAITA]     DECIMAL (19, 6)  NULL,
    [COSTOUNIEURODIBAEST]     DECIMAL (19, 6)  NULL,
    [COSTOUNIEURODIBA]        DECIMAL (19, 6)  NULL,
    [UTENTEMODIFICA]          VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]            DATETIME         NOT NULL,
    [NomeEsplosione]          VARCHAR (50)     NULL,
    [COSTOTOTEURODIBAITARESA] DECIMAL (19, 6)  NULL,
    [COSTOTOTEURODIBAESTRESA] DECIMAL (19, 6)  NULL,
    [COSTOTOTEURODIBARESA]    DECIMAL (19, 6)  NULL,
    [COSTOUNIEURODIBAITARESA] DECIMAL (19, 6)  NULL,
    [COSTOUNIEURODIBAESTRESA] DECIMAL (19, 6)  NULL,
    [COSTOUNIEURODIBARESA]    DECIMAL (19, 6)  NULL,
    [IDBudgetOrig]            INT              NULL,
    CONSTRAINT [KEY_FRCDatiMateriali] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDatiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDatiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDatiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDatiMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDatiMateriali] TO [Metodo98]
    AS [dbo];

