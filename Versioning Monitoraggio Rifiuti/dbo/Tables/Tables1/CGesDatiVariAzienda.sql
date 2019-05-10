CREATE TABLE [dbo].[CGesDatiVariAzienda] (
    [Codice]          DECIMAL (5)   NOT NULL,
    [Metodo]          SMALLINT      DEFAULT (0) NULL,
    [AllAmbienti]     VARCHAR (3)   DEFAULT ('') NULL,
    [NCarMastro]      SMALLINT      DEFAULT (0) NULL,
    [NCarConto]       SMALLINT      DEFAULT (0) NULL,
    [Patrimoniali]    SMALLINT      DEFAULT (0) NULL,
    [CodDistrDefault] VARCHAR (3)   DEFAULT ('') NULL,
    [IndiceAssoluto]  SMALLINT      DEFAULT (0) NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesDatiVariAzienda] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesDatiVariAzienda] TO [Metodo98]
    AS [dbo];

