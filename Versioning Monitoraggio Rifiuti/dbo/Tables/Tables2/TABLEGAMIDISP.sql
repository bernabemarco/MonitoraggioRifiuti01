﻿CREATE TABLE [dbo].[TABLEGAMIDISP] (
    [TIPOLEGAME]       SMALLINT        NULL,
    [CODART]           VARCHAR (50)    NULL,
    [TIPOSERVENTE]     SMALLINT        NULL,
    [IDTESTASERVENTE]  NUMERIC (10)    NULL,
    [IDRIGASERVENTE]   INT             NULL,
    [TIPOSERVITO]      SMALLINT        NULL,
    [IDTESTASERVITO]   NUMERIC (10)    NULL,
    [IDRIGASERVITO]    INT             NULL,
    [IDPROGRSERVITO]   INT             NULL,
    [RIFCOMMCLI]       VARCHAR (30)    NULL,
    [QTAUMBASE]        DECIMAL (16, 6) NULL,
    [PARTITA]          VARCHAR (15)    NULL,
    [DEPOSITOSERVENTE] VARCHAR (10)    NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLEGAMIDISP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLEGAMIDISP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLEGAMIDISP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLEGAMIDISP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLEGAMIDISP] TO [Metodo98]
    AS [dbo];
