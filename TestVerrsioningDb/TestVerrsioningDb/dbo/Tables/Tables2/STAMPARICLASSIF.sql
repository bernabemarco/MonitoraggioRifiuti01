﻿CREATE TABLE [dbo].[STAMPARICLASSIF] (
    [NRTERMINALE]    DECIMAL (5)     NOT NULL,
    [TIPO]           SMALLINT        NOT NULL,
    [RIGA]           SMALLINT        NOT NULL,
    [TIPORIC]        SMALLINT        NOT NULL,
    [COLCOD]         NUMERIC (1)     NULL,
    [COLSALDO]       NUMERIC (1)     NULL,
    [CODICE]         VARCHAR (20)    NULL,
    [DESCRIZIONE]    VARCHAR (80)    NULL,
    [SALDO]          DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [SALDOPREC]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [UTILEPERDITA]   SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [GENERICOCDC]    VARCHAR (7)     NULL,
    CONSTRAINT [PK_STAMPARICLASSIF] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [TIPO] ASC, [RIGA] ASC, [TIPORIC] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_UTILEPERDITA_STAMPARI] CHECK ([UTILEPERDITA] = 0 or [UTILEPERDITA] = 1)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[STAMPARICLASSIF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STAMPARICLASSIF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STAMPARICLASSIF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STAMPARICLASSIF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STAMPARICLASSIF] TO [Metodo98]
    AS [dbo];

