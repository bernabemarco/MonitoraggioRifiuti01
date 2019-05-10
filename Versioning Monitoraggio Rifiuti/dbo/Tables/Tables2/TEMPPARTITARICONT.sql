﻿CREATE TABLE [dbo].[TEMPPARTITARICONT] (
    [CONTO]                VARCHAR (7)     NOT NULL,
    [PROGRESSIVO]          DECIMAL (10)    NOT NULL,
    [NRRIGA]               INT             NOT NULL,
    [TIPOSALDO]            SMALLINT        NOT NULL,
    [DARESALDOINIZ]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [DARESALDOINIZEURO]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [DARESALDOINIZVALUTA]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVERESALDOINIZ]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVERESALDOINIZEURO]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVERESALDOINIZVALUTA] DECIMAL (19, 4) DEFAULT (0) NULL,
    [DAREPREC]             DECIMAL (19, 4) DEFAULT (0) NULL,
    [DAREPRECEURO]         DECIMAL (19, 4) DEFAULT (0) NULL,
    [DAREPRECVALUTA]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVEREPREC]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVEREPRECEURO]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVEREPRECVALUTA]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [DARE]                 DECIMAL (19, 4) DEFAULT (0) NULL,
    [DAREEURO]             DECIMAL (19, 4) DEFAULT (0) NULL,
    [DAREVALUTA]           DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVERE]                DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVEREEURO]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [AVEREVALUTA]          DECIMAL (19, 4) DEFAULT (0) NULL,
    [DATAREG]              DATETIME        NULL,
    [DATARIF]              DATETIME        NULL,
    [NRRIFER]              VARCHAR (15)    NULL,
    [DESCRIZIONE]          VARCHAR (80)    NULL,
    [DSCRIGA]              VARCHAR (80)    NULL,
    [NUMDOC]               VARCHAR (12)    NULL,
    [DATADOC]              DATETIME        NULL,
    [DSCCONTO1]            VARCHAR (80)    NULL,
    [CODMASTRO]            DECIMAL (5)     NULL,
    [CAUSALE]              DECIMAL (5)     NULL,
    [NRGIORNALE]           DECIMAL (5)     NULL,
    [CODCOMMESSA]          VARCHAR (30)    NULL,
    [NRTERMINALE]          SMALLINT        NOT NULL,
    [POSIZIONE]            SMALLINT        CONSTRAINT [DF_TEMPPARTITARICONT_POSIZIONE] DEFAULT (0) NULL,
    CONSTRAINT [PK_TEMPPARTITARICONT] PRIMARY KEY CLUSTERED ([CONTO] ASC, [TIPOSALDO] ASC, [PROGRESSIVO] ASC, [NRRIGA] ASC, [NRTERMINALE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPPARTITARICONT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPPARTITARICONT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPPARTITARICONT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPPARTITARICONT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPPARTITARICONT] TO [Metodo98]
    AS [dbo];

