CREATE TABLE [dbo].[CGCPWStampaSchedeRigheODP] (
    [NrTerminale]       DECIMAL (5)     NOT NULL,
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [NumeroRiga]        INT             NOT NULL,
    [CodiceStampa]      VARCHAR (80)    DEFAULT ('') NULL,
    [Descrizione]       VARCHAR (80)    DEFAULT ('') NULL,
    [OrdineStampa]      INT             DEFAULT (0) NULL,
    [Sottolinea]        SMALLINT        DEFAULT (0) NULL,
    [Colore]            SMALLINT        DEFAULT (0) NULL,
    [Grassetto]         SMALLINT        DEFAULT (0) NULL,
    [RigaDescrittiva]   SMALLINT        DEFAULT (0) NULL,
    [Dettaglio]         SMALLINT        DEFAULT (0) NULL,
    [Prezzo]            SMALLINT        DEFAULT (0) NULL,
    [UtileMargine]      SMALLINT        DEFAULT (0) NULL,
    [ValoreVariabilePI] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFissoPI]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreTotalePI]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualePI]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreVariabilePC] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFissoPC]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreTotalePC]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualePC]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Scostamento]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScostamentoPerc]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [DecimaliScheda]    SMALLINT        DEFAULT (0) NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Progressivo] ASC, [NumeroRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWStampaSchedeRigheODP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWStampaSchedeRigheODP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWStampaSchedeRigheODP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWStampaSchedeRigheODP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWStampaSchedeRigheODP] TO [Metodo98]
    AS [dbo];

