CREATE TABLE [dbo].[CGesQuantitaDistribuite] (
    [Origine]             SMALLINT        NOT NULL,
    [RifProgressivo]      DECIMAL (10)    NOT NULL,
    [CodDestOrigine]      VARCHAR (10)    NOT NULL,
    [CodDestDestinazione] VARCHAR (10)    NOT NULL,
    [UnitaMisura]         VARCHAR (5)     NOT NULL,
    [Anno]                DECIMAL (5)     NOT NULL,
    [Mese]                INT             NOT NULL,
    [Calcolo]             SMALLINT        DEFAULT (0) NULL,
    [Quantita]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [Ambiente]            VARCHAR (3)     DEFAULT ('') NULL,
    [UtenteModifica]      VARCHAR (25)    NOT NULL,
    [DataModifica]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Origine] ASC, [RifProgressivo] ASC, [CodDestOrigine] ASC, [CodDestDestinazione] ASC, [UnitaMisura] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesQuantitaDistribuite] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesQuantitaDistribuite] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesQuantitaDistribuite] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesQuantitaDistribuite] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesQuantitaDistribuite] TO [Metodo98]
    AS [dbo];

