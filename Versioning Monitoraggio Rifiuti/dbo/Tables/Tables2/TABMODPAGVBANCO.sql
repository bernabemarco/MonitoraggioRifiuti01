﻿CREATE TABLE [dbo].[TABMODPAGVBANCO] (
    [Codice]         DECIMAL (5)  NOT NULL,
    [DscPagamento]   VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [CodContoRif]    VARCHAR (7)  NULL,
    [KeyIncPOS]      SMALLINT     NULL,
    [TipoPag]        SMALLINT     CONSTRAINT [DF_TABMODPAGVBANCO_TipoPag] DEFAULT (0) NULL,
    [CODCONTO]       VARCHAR (7)  DEFAULT ('') NULL,
    CONSTRAINT [PK_TABMODPAGVBANCO] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABMODPAGVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABMODPAGVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABMODPAGVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABMODPAGVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABMODPAGVBANCO] TO [Metodo98]
    AS [dbo];

