CREATE TABLE [dbo].[CGCPWStampaSchedeODP] (
    [NrTerminale]          DECIMAL (5)     NOT NULL,
    [Progressivo]          DECIMAL (10)    NOT NULL,
    [IDTesta]              DECIMAL (10)    DEFAULT (0) NULL,
    [IDRiga]               INT             DEFAULT (0) NULL,
    [Tipo]                 SMALLINT        DEFAULT (0) NULL,
    [Articolo]             VARCHAR (50)    DEFAULT ('') NULL,
    [UM]                   VARCHAR (3)     DEFAULT ('') NULL,
    [QtaGestione]          DECIMAL (16, 6) DEFAULT (0) NULL,
    [QtaVersata]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [Listino]              DECIMAL (5)     DEFAULT (0) NULL,
    [OggettoCalcolo]       VARCHAR (10)    DEFAULT ('') NULL,
    [Anno]                 DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]                 INT             DEFAULT (0) NULL,
    [Minuti]               DECIMAL (19, 6) DEFAULT (0) NULL,
    [ProduzioneOraria]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [RedditivitaOraria1]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [RedditivitaOraria2]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [Scostamento]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScostamentoPerc]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [RedditivitaOraria1PC] DECIMAL (19, 6) DEFAULT (0) NULL,
    [RedditivitaOraria2PC] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScostamentoPC]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [ScostamentoPercPC]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [TipoCosto]            DECIMAL (5)     DEFAULT (0) NULL,
    [TipoScheda]           VARCHAR (5)     DEFAULT ('') NULL,
    [DataCalcolo]          DATETIME        NULL,
    [ProgressivoSK]        DECIMAL (10)    DEFAULT (0) NULL,
    [UtenteModifica]       VARCHAR (25)    NOT NULL,
    [DataModifica]         DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWStampaSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWStampaSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWStampaSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWStampaSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWStampaSchedeODP] TO [Metodo98]
    AS [dbo];

