﻿CREATE TABLE [dbo].[DICHIARAZIONEINTENTO] (
    [PROGRESSIVO]        DECIMAL (10)    NOT NULL,
    [ESERCIZIO]          DECIMAL (5)     NOT NULL,
    [CODCLIFOR]          VARCHAR (7)     NOT NULL,
    [NRDICHIARAZIONE]    VARCHAR (16)    NULL,
    [NRDICHRICEVUTA]     VARCHAR (16)    NULL,
    [DATAEMISSIONE]      DATETIME        NULL,
    [DATAREVOCA]         DATETIME        NULL,
    [OPERAZIONE]         VARCHAR (80)    NULL,
    [ART]                DECIMAL (5)     DEFAULT (0) NULL,
    [DESCRIZIONE]        VARCHAR (255)   NULL,
    [TIPODICHIARAZIONE]  SMALLINT        DEFAULT (3) NOT NULL,
    [PERIODODA]          DATETIME        NULL,
    [PERIODOA]           DATETIME        NULL,
    [IMPORTOPERIODO]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [IMPORTOPERIODOEURO] DECIMAL (19, 4) DEFAULT (0) NULL,
    [DEFINITIVO]         SMALLINT        DEFAULT (0) NOT NULL,
    [REVOCA]             SMALLINT        DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    [DATAREGISTRAZIONE]  DATETIME        NULL,
    [NRPROTOCOLLO1]      VARCHAR (17)    NULL,
    [NRPROTOCOLLO2]      VARCHAR (6)     NULL,
    [TIPOACQIMP]         VARCHAR (1)     NULL,
    CONSTRAINT [PK_DICHIARAZIONEINTENTO] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CK_DICHIARAZIONEINTENTO_DEFINITIVO] CHECK ([DEFINITIVO] = 0 or [DEFINITIVO] = 1),
    CONSTRAINT [CK_DICHIARAZIONEINTENTO_REVOCA] CHECK ([REVOCA] = 0 or [REVOCA] = 1),
    CONSTRAINT [CK_DICHIARAZIONEINTENTO_TIPODICHIARAZIONE] CHECK ([TIPODICHIARAZIONE] = 1 or [TIPODICHIARAZIONE] = 2 or [TIPODICHIARAZIONE] = 3)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[DICHIARAZIONEINTENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[DICHIARAZIONEINTENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DICHIARAZIONEINTENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[DICHIARAZIONEINTENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[DICHIARAZIONEINTENTO] TO [Metodo98]
    AS [dbo];

