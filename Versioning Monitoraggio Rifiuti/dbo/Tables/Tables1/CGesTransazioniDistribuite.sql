CREATE TABLE [dbo].[CGesTransazioniDistribuite] (
    [Origine]          SMALLINT        NOT NULL,
    [RifProgressivo]   DECIMAL (10)    NOT NULL,
    [CodConto]         VARCHAR (20)    NOT NULL,
    [CodDestinazione]  VARCHAR (10)    NOT NULL,
    [Anno]             DECIMAL (5)     NOT NULL,
    [Mese]             INT             NOT NULL,
    [CodContoRaccordo] VARCHAR (30)    DEFAULT ('') NULL,
    [TipoTransazione]  SMALLINT        DEFAULT (0) NULL,
    [Usa]              SMALLINT        DEFAULT (0) NULL,
    [ValoreVariabile]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Ambiente]         VARCHAR (3)     DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Origine] ASC, [RifProgressivo] ASC, [CodConto] ASC, [CodDestinazione] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesTransazioniDistribuite] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesTransazioniDistribuite] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesTransazioniDistribuite] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesTransazioniDistribuite] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesTransazioniDistribuite] TO [Metodo98]
    AS [dbo];

