﻿CREATE TABLE [dbo].[TEMPLISTEABCARTICOLI] (
    [IDSESSIONE]       INT             NOT NULL,
    [CodConto]         VARCHAR (50)    NOT NULL,
    [TotNettoRiga]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotNettoRigaEuro] DECIMAL (19, 4) DEFAULT (0) NULL,
    [PercRiga]         DECIMAL (8, 5)  DEFAULT (0) NULL,
    [PercProg]         DECIMAL (8, 5)  DEFAULT (0) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [PK_TEMPLISTEABCARTICOLI] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPLISTEABCARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPLISTEABCARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPLISTEABCARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPLISTEABCARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPLISTEABCARTICOLI] TO [Metodo98]
    AS [dbo];

