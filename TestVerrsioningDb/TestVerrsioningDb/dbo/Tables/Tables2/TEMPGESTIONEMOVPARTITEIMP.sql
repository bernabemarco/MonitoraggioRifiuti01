﻿CREATE TABLE [dbo].[TEMPGESTIONEMOVPARTITEIMP] (
    [IDSESSIONE]     NUMERIC (5)     NOT NULL,
    [RIFPROGRESSIVO] DECIMAL (10)    NOT NULL,
    [RIFRIGAMOVORD]  INT             NOT NULL,
    [RIFRIGAMOVIMP]  INT             NOT NULL,
    [RIFTESTA]       DECIMAL (10)    NULL,
    [RIFRIGA]        INT             NULL,
    [RIFIMPEGNO]     INT             NULL,
    [PRIORITA]       INT             NOT NULL,
    [POSIZIONE]      INT             NULL,
    [PARTITA]        VARCHAR (15)    NULL,
    [QTAGESTIONE]    DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTAMOVGESTIONE] DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTAGESTIONERES] DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTAMOV1MAG]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTA1MAGRES]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTAMOV2MAG]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTA2MAGRES]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [TIPORIGA]       SMALLINT        DEFAULT (0) NULL,
    [FLAGRIGA]       SMALLINT        NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [QTAMOVSCARTO]   DECIMAL (16, 6) NULL,
    PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [RIFPROGRESSIVO] ASC, [RIFRIGAMOVORD] ASC, [RIFRIGAMOVIMP] ASC, [PRIORITA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPGESTIONEMOVPARTITEIMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPGESTIONEMOVPARTITEIMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPGESTIONEMOVPARTITEIMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPGESTIONEMOVPARTITEIMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPGESTIONEMOVPARTITEIMP] TO [Metodo98]
    AS [dbo];

