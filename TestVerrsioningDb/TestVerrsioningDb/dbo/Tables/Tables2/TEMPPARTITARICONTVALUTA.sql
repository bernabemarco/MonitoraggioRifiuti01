﻿CREATE TABLE [dbo].[TEMPPARTITARICONTVALUTA] (
    [CONTO]       VARCHAR (7)     NOT NULL,
    [PROGRESSIVO] DECIMAL (10)    NOT NULL,
    [NRRIGA]      INT             NOT NULL,
    [TIPOSALDO]   SMALLINT        NOT NULL,
    [DARE]        DECIMAL (19, 4) CONSTRAINT [DF_TEMPPARTITARICONTVALUTA_DARE] DEFAULT (0) NULL,
    [AVERE]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPPARTITARICONTVALUTA_AVERE] DEFAULT (0) NULL,
    [DATAREG]     DATETIME        NULL,
    [DATARIF]     DATETIME        NULL,
    [NRRIFER]     VARCHAR (15)    NULL,
    [DESCRIZIONE] VARCHAR (80)    NULL,
    [DSCRIGA]     VARCHAR (80)    NULL,
    [NUMDOC]      VARCHAR (12)    NULL,
    [DATADOC]     DATETIME        NULL,
    [DSCCONTO1]   VARCHAR (80)    NULL,
    [CODMASTRO]   DECIMAL (5)     NULL,
    [CAUSALE]     DECIMAL (5)     NULL,
    [NRGIORNALE]  DECIMAL (5)     NULL,
    [CODCOMMESSA] VARCHAR (30)    NULL,
    [DIVISA]      VARCHAR (3)     NULL,
    [CODCAMBIO]   DECIMAL (5)     NOT NULL,
    [VALCAMBIO]   DECIMAL (13, 6) NULL,
    [VALOREEURO]  DECIMAL (19, 4) CONSTRAINT [DF_TEMPPARTITARICONTVALUTA_VALOREEURO] DEFAULT (0) NULL,
    [NRTERMINALE] SMALLINT        NOT NULL,
    [DataCambio]  DATETIME        NULL,
    CONSTRAINT [PK_TEMPPARTITARICONTVALUTA] PRIMARY KEY CLUSTERED ([CONTO] ASC, [TIPOSALDO] ASC, [PROGRESSIVO] ASC, [NRRIGA] ASC, [CODCAMBIO] ASC, [NRTERMINALE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPPARTITARICONTVALUTA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPPARTITARICONTVALUTA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPPARTITARICONTVALUTA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPPARTITARICONTVALUTA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPPARTITARICONTVALUTA] TO [Metodo98]
    AS [dbo];

