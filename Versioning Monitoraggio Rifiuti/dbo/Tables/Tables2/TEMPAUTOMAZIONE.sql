﻿CREATE TABLE [dbo].[TEMPAUTOMAZIONE] (
    [IDSESSIONE]     NUMERIC (10)    NOT NULL,
    [IDTESTA]        DECIMAL (10)    NOT NULL,
    [IDRIGA]         INT             NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [DATADOC]        DATETIME        NOT NULL,
    [OPERAZIONE]     INT             NOT NULL,
    [QTAGEST]        DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTAMAXDOC]      DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTARESIDUA]     DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UM]             VARCHAR (3)     NOT NULL,
    [NRRIFPARTITA]   VARCHAR (15)    NOT NULL,
    [UBICAZIONE]     VARCHAR (10)    NOT NULL,
    [TIPODOC]        VARCHAR (3)     NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATADOCUMENTO]  DATETIME        NULL,
    CONSTRAINT [PK_TEMPAUTOMAZIONE] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [IDTESTA] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPAUTOMAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPAUTOMAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPAUTOMAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPAUTOMAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPAUTOMAZIONE] TO [Metodo98]
    AS [dbo];

