CREATE TABLE [dbo].[CGesConfrontoBilancioRighe] (
    [RifProgressivo]    DECIMAL (10)    NOT NULL,
    [Numero]            INT             NOT NULL,
    [ContoVoce]         VARCHAR (20)    DEFAULT ('') NULL,
    [Descrizione]       VARCHAR (80)    DEFAULT ('') NULL,
    [ImportoRif]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeRif]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoC1]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeC1]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoDiffC1]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeDiffC1] DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeDifPC1] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoC2]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeC2]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoDiffC2]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeDiffC2] DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeDifPC2] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoC3]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeC3]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoDiffC3]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeDiffC3] DECIMAL (19, 6) DEFAULT (0) NULL,
    [PercentualeDifPC3] DECIMAL (19, 6) DEFAULT (0) NULL,
    [Grassetto]         SMALLINT        DEFAULT (0) NULL,
    [Colore]            SMALLINT        DEFAULT (0) NULL,
    [TabulazioneStampa] SMALLINT        DEFAULT (0) NULL,
    [StampaImporto]     SMALLINT        DEFAULT (0) NULL,
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
    ON OBJECT::[dbo].[CGesConfrontoBilancioRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesConfrontoBilancioRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesConfrontoBilancioRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesConfrontoBilancioRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesConfrontoBilancioRighe] TO [Metodo98]
    AS [dbo];

