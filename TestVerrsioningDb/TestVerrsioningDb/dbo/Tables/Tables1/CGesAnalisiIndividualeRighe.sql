CREATE TABLE [dbo].[CGesAnalisiIndividualeRighe] (
    [RifProgressivo]    DECIMAL (10)    NOT NULL,
    [Numero]            INT             NOT NULL,
    [ContoVoce]         VARCHAR (20)    DEFAULT ('') NULL,
    [Descrizione]       VARCHAR (80)    DEFAULT ('') NULL,
    [ImportoVariabile]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFisso]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoTotale]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale]       DECIMAL (7, 2)  DEFAULT (0) NULL,
    [Indice]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [Grassetto]         SMALLINT        DEFAULT (0) NULL,
    [Colore]            SMALLINT        DEFAULT (0) NULL,
    [TabulazioneStampa] SMALLINT        DEFAULT (0) NULL,
    [StampaImporto]     SMALLINT        DEFAULT (0) NULL,
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
    ON OBJECT::[dbo].[CGesAnalisiIndividualeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesAnalisiIndividualeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesAnalisiIndividualeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesAnalisiIndividualeRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesAnalisiIndividualeRighe] TO [Metodo98]
    AS [dbo];

