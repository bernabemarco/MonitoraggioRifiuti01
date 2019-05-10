CREATE TABLE [dbo].[EC_TabScadenze_Tmp] (
    [IDSessione]       DECIMAL (5)     NOT NULL,
    [RifProgressivoEC] DECIMAL (10)    NOT NULL,
    [RifProgressivoSC] DECIMAL (10)    NOT NULL,
    [Importo]          DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [ImportoEuro]      DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    CONSTRAINT [PK_EC_TabScadenze_Tmp] PRIMARY KEY CLUSTERED ([IDSessione] ASC, [RifProgressivoEC] ASC, [RifProgressivoSC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TabScadenze_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TabScadenze_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TabScadenze_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TabScadenze_Tmp] TO [Metodo98]
    AS [dbo];

