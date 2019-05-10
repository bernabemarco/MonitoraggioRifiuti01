CREATE TABLE [dbo].[TesteFlussiInsoluti] (
    [Esercizio]           DECIMAL (4)     NOT NULL,
    [NomeFlusso]          VARCHAR (20)    NOT NULL,
    [TotRighe]            NUMERIC (6)     DEFAULT (0) NULL,
    [TotImportoRIBA]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [NumeroRIBA]          NUMERIC (6)     DEFAULT (0) NULL,
    [DataScadenza]        DATETIME        NULL,
    [CodConto]            VARCHAR (7)     NULL,
    [DscConto1]           VARCHAR (80)    NULL,
    [ABI]                 VARCHAR (6)     NULL,
    [CAB]                 VARCHAR (6)     NULL,
    [CodBanca]            VARCHAR (7)     NULL,
    [DscBanca]            VARCHAR (80)    NULL,
    [TotImportoScLit]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotImportoScEuro]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotImportoSpeseLit]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotImportoSpeseEuro] DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotImportoMoraLit]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotImportoMoraEuro]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [FlussoElaborato]     INT             DEFAULT (0) NULL,
    [DataElaborazione]    DATETIME        NULL,
    [DataModifica]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([Esercizio] ASC, [NomeFlusso] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TesteFlussiInsoluti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TesteFlussiInsoluti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TesteFlussiInsoluti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TesteFlussiInsoluti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TesteFlussiInsoluti] TO [Metodo98]
    AS [dbo];

