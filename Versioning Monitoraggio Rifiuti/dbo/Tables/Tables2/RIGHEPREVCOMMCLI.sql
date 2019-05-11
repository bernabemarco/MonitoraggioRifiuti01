﻿CREATE TABLE [dbo].[RIGHEPREVCOMMCLI] (
    [RIFPROGRESSIVO]       DECIMAL (10)     NOT NULL,
    [FLAGRIGA]             SMALLINT         NULL,
    [NRRIGA]               DECIMAL (5)      NOT NULL,
    [POSIZIONE]            DECIMAL (5)      NOT NULL,
    [NRFIGLI]              INT              NULL,
    [CODLIVS1]             VARCHAR (24)     NULL,
    [LIVS1]                SMALLINT         NULL,
    [LIVPADRES1]           VARCHAR (24)     NULL,
    [LIV5]                 VARCHAR (50)     NULL,
    [FLGTIPOLIV5]          SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_FLGTIPOLIV5] DEFAULT (0) NOT NULL,
    [FLGARTICOLOVALIDO]    SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_FLGARTICOLOVALIDO] DEFAULT (0) NOT NULL,
    [TIPONODO]             SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_TIPONODO] DEFAULT (0) NULL,
    [DESCRIZIONE]          VARCHAR (100)    NULL,
    [VOCECOSTO]            VARCHAR (3)      NULL,
    [UMGEST]               VARCHAR (3)      NULL,
    [QTAGESTIONE]          DECIMAL (16, 6)  NULL,
    [COSTOUNITARIO]        DECIMAL (19, 6)  NULL,
    [UMCOSTO]              VARCHAR (3)      NULL,
    [FATTCONV]             DECIMAL (20, 10) NULL,
    [QTACOSTO]             DECIMAL (16, 6)  NULL,
    [COSTOTOTALEPREV]      DECIMAL (19, 6)  NULL,
    [DATAINIPREV]          DATETIME         NULL,
    [DATAFINEPREV]         DATETIME         NULL,
    [COSTOUNITARIOEURO]    DECIMAL (19, 6)  NULL,
    [COSTOTOTALEPREVEURO]  DECIMAL (19, 6)  NULL,
    [VERSDBA]              VARCHAR (10)     NULL,
    [QTARILASCIATA]        DECIMAL (16, 6)  NULL,
    [NOTE]                 VARCHAR (255)    NULL,
    [UTENTEMODIFICA]       VARCHAR (25)     NULL,
    [DATAMODIFICA]         DATETIME         NOT NULL,
    [DOC_COLLEGATO]        VARCHAR (255)    NULL,
    [FORMULA]              VARCHAR (255)    NULL,
    [FILECOLLEGATO]        VARCHAR (255)    NULL,
    [DATIFILECOLLEGATO]    VARCHAR (100)    NULL,
    [TIPOFILECOLLEGATO]    SMALLINT         NULL,
    [DESCRESTESA]          VARCHAR (3000)   NULL,
    [FORMULAOFFERTA]       VARCHAR (255)    NULL,
    [PREZZOFFERTAUNI]      DECIMAL (19, 6)  NULL,
    [PREZZOFFERTAUNIEURO]  DECIMAL (19, 6)  NULL,
    [PREZZOFFERTATOT]      DECIMAL (19, 6)  NULL,
    [PREZZOFFERTATOTEURO]  DECIMAL (19, 6)  NULL,
    [FLGDAPRODIGIO]        SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_FLGDAPRODIGIO] DEFAULT (0) NOT NULL,
    [POSIZIONENODO]        DECIMAL (5)      NULL,
    [DATACOSTOPREV]        DATETIME         NULL,
    [FORMULAPR]            VARCHAR (255)    NULL,
    [TIPOVALCOSTO]         SMALLINT         NULL,
    [LISTINO]              DECIMAL (5)      NULL,
    [LISTINOFOR]           DECIMAL (5)      NULL,
    [FORNITORE]            VARCHAR (7)      NULL,
    [COSTOSTD]             VARCHAR (10)     NULL,
    [FLGUSAPZP]            SMALLINT         NULL,
    [FLGUSASCONTIFOR]      SMALLINT         NULL,
    [AGENTECOSTO]          VARCHAR (100)    NULL,
    [FLGBLOCCACOSTO]       SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_FLGBLOCCACOSTO] DEFAULT (0) NULL,
    [FLGBLOCCAPREZZO]      SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_FLGBLOCCAPREZZO] DEFAULT (0) NULL,
    [QTAPREZZO]            DECIMAL (16, 6)  NULL,
    [UMPREZZO]             VARCHAR (3)      NULL,
    [FATTCONVPR]           DECIMAL (20, 10) NULL,
    [QTAPREZZOMAN]         SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_QTAPREZZOMAN] DEFAULT (0) NULL,
    [POSIZIONECALCOLATA]   DECIMAL (5)      NULL,
    [CODLIVELLO]           VARCHAR (20)     NULL,
    [FLGOPZIONE]           SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_FLGOPZIONE] DEFAULT (0) NULL,
    [FLGBLOCCAFORMULAPR]   SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_FLGBLOCCAFORMULAPR] DEFAULT (0) NULL,
    [QTACOSTOMAN]          SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_QTACOSTOMAN] DEFAULT (0) NULL,
    [ALDFattoreK]          DECIMAL (19, 4)  DEFAULT (0) NOT NULL,
    [PESO]                 DECIMAL (8, 5)   CONSTRAINT [DF_RIGHEPREVCOMMCLI_PESO] DEFAULT ((0)) NOT NULL,
    [POSIZIONESTP]         DECIMAL (5)      NULL,
    [FLGUSAPARAMCALCCOSTO] SMALLINT         CONSTRAINT [DF_RIGHEPREVCOMMCLI_FLGUSAPARAMCALCCOSTO] DEFAULT ((0)) NULL,
    [QTAFATTURATA]         DECIMAL (16, 6)  NULL,
    [IMPORTOFATTEURO]      DECIMAL (16, 6)  NULL,
    CONSTRAINT [PK_RIGHEPREVCOMMCLI] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_RIGHEPREVCOMMCLI_RIFPROGRESSIVO] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[TESTEFOGLICOMMCLI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHEPREVCOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RIGHEPREVCOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RIGHEPREVCOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHEPREVCOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RIGHEPREVCOMMCLI] TO [Metodo98]
    AS [dbo];
