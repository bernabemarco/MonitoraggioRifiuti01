CREATE TABLE [dbo].[TabIntegrazioni] (
    [NomeDitta]        VARCHAR (30)    NOT NULL,
    [NomeIntegrazione] VARCHAR (30)    NOT NULL,
    [NrRiga]           INT             NOT NULL,
    [InEuro]           SMALLINT        NULL,
    [Conto]            VARCHAR (30)    NOT NULL,
    [Descrizione]      VARCHAR (80)    NULL,
    [DataInizValidita] DATETIME        NULL,
    [DataFineValidita] DATETIME        NULL,
    [TipoVar]          SMALLINT        DEFAULT (0) NULL,
    [Valore]           DECIMAL (19, 4) NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    CONSTRAINT [PK_TabIntegrazioni] PRIMARY KEY CLUSTERED ([NomeDitta] ASC, [NomeIntegrazione] ASC, [NrRiga] ASC) WITH (FILLFACTOR = 90),
    CHECK ([InEuro] is null or [InEuro] = 0 or [InEuro] = 1)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabIntegrazioni] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabIntegrazioni] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabIntegrazioni] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabIntegrazioni] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabIntegrazioni] TO [AnaBilancio]
    AS [dbo];

