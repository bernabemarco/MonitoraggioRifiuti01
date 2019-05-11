﻿CREATE TABLE [dbo].[TEMPSTPCOMPONENTIDOC] (
    [NRTERMINALE]    SMALLINT        NOT NULL,
    [IDTESTADOC]     DECIMAL (10)    NOT NULL,
    [IDRIGADOC]      INT             NOT NULL,
    [IDDISTINTA]     DECIMAL (10)    NOT NULL,
    [IDCOMPONENTE]   INT             NOT NULL,
    [POSIZIONE]      INT             NOT NULL,
    [CODARTCOMPOSTO] VARCHAR (50)    NULL,
    [CODCOMPONENTE]  VARCHAR (50)    NULL,
    [DSCCOMPONENTE]  VARCHAR (255)   NULL,
    [QTAIMPIEGO]     DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UMIMPIEGO]      VARCHAR (3)     NOT NULL,
    [QTA1MAG]        DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UM1MAG]         VARCHAR (3)     NOT NULL,
    [QTA2MAG]        DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UM2MAG]         VARCHAR (3)     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPCOMPONENTIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPCOMPONENTIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPCOMPONENTIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPCOMPONENTIDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPCOMPONENTIDOC] TO [Metodo98]
    AS [dbo];
