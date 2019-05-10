CREATE TABLE [dbo].[TP_ParVBanco] (
    [Codice]           VARCHAR (3)  NOT NULL,
    [Descrizione]      VARCHAR (80) NULL,
    [CodCliente]       VARCHAR (7)  NOT NULL,
    [TipoUM]           DECIMAL (5)  NULL,
    [ArrotPU]          DECIMAL (18) NOT NULL,
    [CodParametriDoc]  VARCHAR (3)  NULL,
    [CodCausaleVend]   DECIMAL (18) NOT NULL,
    [CodCausaleReso]   DECIMAL (18) NOT NULL,
    [CodDeposito]      VARCHAR (10) NULL,
    [ContoRicavo]      VARCHAR (7)  NULL,
    [CodIvaVent]       DECIMAL (5)  NULL,
    [UsaCliCorr]       VARCHAR (1)  NULL,
    [CausVendita]      DECIMAL (5)  NULL,
    [CausPagamento]    DECIMAL (5)  NULL,
    [CodGenAbbuoni]    VARCHAR (7)  NULL,
    [VisualizzaGiac]   BIT          NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    [ListinoConfronto] DECIMAL (18) NULL,
    [CodCRT]           DECIMAL (18) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ParVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ParVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ParVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ParVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ParVBanco] TO [Metodo98]
    AS [dbo];

