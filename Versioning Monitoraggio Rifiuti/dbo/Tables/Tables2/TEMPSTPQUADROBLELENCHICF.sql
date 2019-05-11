﻿CREATE TABLE [dbo].[TEMPSTPQUADROBLELENCHICF] (
    [IDSESSIONE]         DECIMAL (5)  NOT NULL,
    [NRPAGINA]           SMALLINT     NOT NULL,
    [CODFISCDITTA]       VARCHAR (16) NULL,
    [NRMODELLO]          VARCHAR (8)  NULL,
    [COGNOME]            VARCHAR (24) NULL,
    [NOME]               VARCHAR (20) NULL,
    [DATANASCITA]        DATETIME     NULL,
    [COMUNENASCITA]      VARCHAR (40) NULL,
    [PROVNASCITA]        VARCHAR (2)  NULL,
    [CODSTATOESTPF]      SMALLINT     NULL,
    [RAGSOC]             VARCHAR (60) NULL,
    [CITTAEST]           VARCHAR (40) NULL,
    [CODSTATOESTPG]      SMALLINT     NULL,
    [INDIRIZZO]          VARCHAR (80) NULL,
    [CODIDIVA]           VARCHAR (11) NULL,
    [FLGBLACKLIST]       VARCHAR (1)  NULL,
    [FLGOPNONRES]        VARCHAR (1)  NULL,
    [FLGACQNONRES]       VARCHAR (1)  NULL,
    [IMPONIBATT]         DECIMAL (10) NULL,
    [IMPOSTAATT]         DECIMAL (10) NULL,
    [IMPBENINOIVAATT]    DECIMAL (10) NULL,
    [IMPSERVNOIVAATT]    DECIMAL (10) NULL,
    [IMPONIBNOTEVARATT]  DECIMAL (10) NULL,
    [IMPOSTANOTEVARATT]  DECIMAL (10) NULL,
    [IMPONIBPASS]        DECIMAL (10) NULL,
    [IMPOSTAPASS]        DECIMAL (10) NULL,
    [IMPBENINOIVAPASS]   DECIMAL (10) NULL,
    [IMPONIBNOTEVARPASS] DECIMAL (10) NULL,
    [IMPOSTANOTEVARPASS] DECIMAL (10) NULL,
    [UTENTEMODIFICA]     VARCHAR (25) NOT NULL,
    [DATAMODIFICA]       DATETIME     NOT NULL,
    CONSTRAINT [PK_TEMPSTPQUADROBLELENCHICF] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [NRPAGINA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPQUADROBLELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPQUADROBLELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPQUADROBLELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPQUADROBLELENCHICF] TO [Metodo98]
    AS [dbo];
