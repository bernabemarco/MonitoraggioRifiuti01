CREATE TABLE [dbo].[CGCPWStampaRedditivitaArticoli] (
    [NrTerminale]         DECIMAL (5)     NOT NULL,
    [NumeroRiga]          INT             NOT NULL,
    [Articolo]            VARCHAR (50)    DEFAULT ('') NULL,
    [Aggregato]           VARCHAR (10)    DEFAULT ('') NULL,
    [TipoCosto]           DECIMAL (5)     DEFAULT (0) NULL,
    [Anno]                DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]                INT             DEFAULT (0) NULL,
    [DataCalcolo]         DATETIME        NULL,
    [Minuti]              DECIMAL (19, 6) DEFAULT (0) NULL,
    [TipoScheda]          VARCHAR (5)     DEFAULT ('') NULL,
    [DecimaliScheda]      SMALLINT        DEFAULT (0) NULL,
    [RedditivitaOraria]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [ProduttivitaOraria]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [RedditivitaUnitaria] DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]      VARCHAR (25)    NOT NULL,
    [DataModifica]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [NumeroRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWStampaRedditivitaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWStampaRedditivitaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWStampaRedditivitaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWStampaRedditivitaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWStampaRedditivitaArticoli] TO [Metodo98]
    AS [dbo];

