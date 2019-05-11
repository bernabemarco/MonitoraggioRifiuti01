﻿CREATE TABLE [dbo].[CONTRATTI_IMPORTIPARZIALISTORNO] (
    [CONTRATTO]      DECIMAL (10) NOT NULL,
    [MESE]           INT          NOT NULL,
    [REGCONTAB]      DECIMAL (10) NOT NULL,
    [DOCUMENTO]      DECIMAL (10) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CONTRATTO] ASC, [MESE] ASC, [REGCONTAB] ASC, [DOCUMENTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_IMPORTIPARZIALISTORNO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_IMPORTIPARZIALISTORNO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_IMPORTIPARZIALISTORNO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_IMPORTIPARZIALISTORNO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_IMPORTIPARZIALISTORNO] TO [Metodo98]
    AS [dbo];
