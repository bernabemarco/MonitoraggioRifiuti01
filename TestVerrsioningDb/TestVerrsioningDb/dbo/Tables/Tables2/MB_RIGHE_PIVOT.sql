CREATE TABLE [dbo].[MB_RIGHE_PIVOT] (
    [IDTESTADOC]            DECIMAL (10)     NOT NULL,
    [IDRIGADOC]             INT              NOT NULL,
    [CodAgente1]            VARCHAR (7)      NULL,
    [CodAgente2]            VARCHAR (7)      NULL,
    [CodAgente3]            VARCHAR (7)      NULL,
    [ValoreProvv1]          DECIMAL (38, 4)  NULL,
    [ValoreProvv2]          DECIMAL (38, 4)  NULL,
    [ValoreProvv3]          DECIMAL (38, 4)  NULL,
    [ValoreVend]            DECIMAL (38, 4)  NULL,
    [ValoreVendLordo]       DECIMAL (38, 4)  NULL,
    [QtaVenduto]            DECIMAL (38, 6)  NULL,
    [QtaVenduto1]           DECIMAL (38, 6)  NULL,
    [ValoreReso]            DECIMAL (38, 4)  NULL,
    [ValoreReso1]           DECIMAL (38, 4)  NULL,
    [ValoreResoStd]         DECIMAL (38, 4)  NULL,
    [VALOREPFA]             DECIMAL (38, 6)  NULL,
    [QTAPFA]                DECIMAL (38, 16) NULL,
    [QtaTot]                DECIMAL (38, 6)  NULL,
    [PrezzoUnitarioLordo]   DECIMAL (38, 6)  NULL,
    [QtaReso]               DECIMAL (38, 6)  NULL,
    [QtaReso1]              DECIMAL (38, 6)  NULL,
    [QtaResoStd]            DECIMAL (38, 6)  NULL,
    [ValoreMedioAcquistato] DECIMAL (38, 6)  NULL,
    [QtaTraspTax]           DECIMAL (38, 6)  NULL,
    [ValoreTraspAcq]        DECIMAL (38, 6)  NULL,
    [ValoreTraspAcq1]       DECIMAL (38, 6)  NULL,
    [QtaOma]                DECIMAL (38, 6)  NULL,
    [QtaOmaAcq]             DECIMAL (38, 6)  NULL,
    [QtaTrasp]              DECIMAL (38, 6)  NULL,
    [ScontoVendita]         DECIMAL (38, 5)  NULL,
    [UMConv1]               VARCHAR (3)      NOT NULL,
    [UMConv2]               VARCHAR (3)      NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_RIGHE_PIVOT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_RIGHE_PIVOT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_RIGHE_PIVOT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_RIGHE_PIVOT] TO [Metodo98]
    AS [dbo];

