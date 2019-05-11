﻿CREATE TABLE [dbo].[TEMPSELEZIONEDOCUMENTI] (
    [IDSESSIONE]     DECIMAL (5)  NOT NULL,
    [IDPROCEDURA]    DECIMAL (5)  NOT NULL,
    [IDTESTA]        DECIMAL (10) NOT NULL,
    [IDRIGA]         INT          NOT NULL,
    [IDIMPEGNO]      INT          NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [IDPROCEDURA] ASC, [IDTESTA] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSELEZIONEDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSELEZIONEDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSELEZIONEDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSELEZIONEDOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSELEZIONEDOCUMENTI] TO [Metodo98]
    AS [dbo];
