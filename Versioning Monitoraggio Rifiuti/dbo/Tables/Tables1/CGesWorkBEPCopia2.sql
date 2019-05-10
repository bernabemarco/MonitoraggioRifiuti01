CREATE TABLE [dbo].[CGesWorkBEPCopia2] (
    [NrTerminale]    DECIMAL (5)     NOT NULL,
    [Progressivo]    DECIMAL (10)    NOT NULL,
    [Giorni]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Mese]           INT             DEFAULT (0) NULL,
    [Quantita]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [Ricavi]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostiFissi]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostiVariabili] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostiTotali]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [Risultato]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [GiorniP]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC, [NrTerminale] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWorkBEPCopia2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWorkBEPCopia2] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWorkBEPCopia2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWorkBEPCopia2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWorkBEPCopia2] TO [Metodo98]
    AS [dbo];

