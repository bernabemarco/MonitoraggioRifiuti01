CREATE TABLE [dbo].[CGesReportFogliRiepilogoRighe] (
    [RifProgressivo]    DECIMAL (10)    NOT NULL,
    [Numero]            INT             NOT NULL,
    [ContoVoce]         VARCHAR (20)    DEFAULT ('') NULL,
    [Descrizione]       VARCHAR (80)    DEFAULT ('') NULL,
    [Importo01]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo02]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo03]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo04]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo05]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo06]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo07]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo08]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo09]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo10]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo11]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo12]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoTotale]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoTotalePerc] DECIMAL (19, 6) DEFAULT (0) NULL,
    [Sottolinea]        SMALLINT        DEFAULT (0) NULL,
    [Sovralinea]        SMALLINT        DEFAULT (0) NULL,
    [Grassetto]         SMALLINT        DEFAULT (0) NULL,
    [Colore]            SMALLINT        DEFAULT (0) NULL,
    [StampaImporto]     SMALLINT        DEFAULT (0) NULL,
    [Totale]            SMALLINT        DEFAULT (0) NULL,
    [Voce]              VARCHAR (10)    DEFAULT ('') NULL,
    [ImportoVar01]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar02]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar03]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar04]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar05]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar06]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar07]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar08]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar09]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar10]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar11]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVar12]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoVarTotale]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis01]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis02]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis03]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis04]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis05]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis06]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis07]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis08]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis09]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis10]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis11]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFis12]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFisTotale]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    [ColoreSeNegativo]  SMALLINT        DEFAULT (0) NULL,
    [Gruppo]            VARCHAR (80)    DEFAULT ('') NULL,
    [OrdineGruppo]      INT             DEFAULT ((0)) NULL,
    [VoceGruppo]        VARCHAR (10)    DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Numero] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesReportFogliRiepilogoRighe] TO [Metodo98]
    AS [dbo];

