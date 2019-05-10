CREATE TABLE [dbo].[CGCPWStampaFoglioSchedeRigheODP] (
    [NrTerminale]    DECIMAL (5)     NOT NULL,
    [NumeroRiga]     INT             NOT NULL,
    [IDTesta]        DECIMAL (10)    DEFAULT (0) NULL,
    [IDRiga]         INT             DEFAULT (0) NULL,
    [Tipo]           SMALLINT        DEFAULT (0) NULL,
    [Articolo]       VARCHAR (50)    DEFAULT ('') NULL,
    [QtaGestione]    DECIMAL (16, 6) DEFAULT (0) NULL,
    [QtaVersata]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [Aggregato]      VARCHAR (10)    DEFAULT ('') NULL,
    [TipoCosto]      DECIMAL (5)     DEFAULT (0) NULL,
    [Anno]           DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]           INT             DEFAULT (0) NULL,
    [DataCalcolo]    DATETIME        NULL,
    [Minuti]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [TipoScheda]     VARCHAR (5)     DEFAULT ('') NULL,
    [DecimaliScheda] SMALLINT        DEFAULT (0) NULL,
    [Importo01]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo02]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo03]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo04]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo05]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo06]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo07]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo08]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo09]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo10]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo11]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo12]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [NumeroRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeRigheODP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeRigheODP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeRigheODP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeRigheODP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWStampaFoglioSchedeRigheODP] TO [Metodo98]
    AS [dbo];

