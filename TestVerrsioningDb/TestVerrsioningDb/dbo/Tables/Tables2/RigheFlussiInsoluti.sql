CREATE TABLE [dbo].[RigheFlussiInsoluti] (
    [Esercizio]        DECIMAL (4)     NOT NULL,
    [NomeFlusso]       VARCHAR (20)    NOT NULL,
    [ProgressivoRIBA]  NUMERIC (6)     DEFAULT (0) NOT NULL,
    [ImportoRIBA]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [DivisaRIBA]       VARCHAR (1)     NULL,
    [NumeroRIBA]       INT             DEFAULT (0) NULL,
    [RifFattura]       VARCHAR (80)    NULL,
    [DataScadenza]     DATETIME        NULL,
    [ClienteRIBA]      VARCHAR (7)     NULL,
    [CodConto]         VARCHAR (7)     NULL,
    [DscConto1]        VARCHAR (80)    NULL,
    [ABI]              VARCHAR (6)     NULL,
    [CAB]              VARCHAR (6)     NULL,
    [CodBanca]         VARCHAR (7)     NULL,
    [DscBanca]         VARCHAR (80)    NULL,
    [CodAge1]          VARCHAR (7)     NULL,
    [DscAgente1]       VARCHAR (80)    NULL,
    [CodAge2]          VARCHAR (7)     NULL,
    [DscAgente2]       VARCHAR (80)    NULL,
    [Esito]            NUMERIC (1)     DEFAULT (0) NULL,
    [DscEsito]         VARCHAR (20)    NULL,
    [TipoEffetto]      NUMERIC (5)     DEFAULT (0) NULL,
    [DscTipoEffetto]   VARCHAR (20)    NULL,
    [CodDivisa]        DECIMAL (5)     DEFAULT (0) NULL,
    [ImportoScLit]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImportoScEuro]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImportoSpeseLit]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImportoSpeseEuro] DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImportoMoraLit]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImportoMoraEuro]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [DataFattura]      DATETIME        NULL,
    [NumRif]           VARCHAR (15)    NULL,
    [NumRifPartCont]   VARCHAR (19)    NULL,
    [TSProgressivo]    DECIMAL (10)    NULL,
    [Stato]            VARCHAR (50)    DEFAULT ('CARICATO') NULL,
    [Conforme]         VARCHAR (50)    DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Esercizio] ASC, [NomeFlusso] ASC, [ProgressivoRIBA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RigheFlussiInsoluti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RigheFlussiInsoluti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RigheFlussiInsoluti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RigheFlussiInsoluti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RigheFlussiInsoluti] TO [Metodo98]
    AS [dbo];

