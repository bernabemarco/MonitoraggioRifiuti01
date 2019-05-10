﻿CREATE TABLE [dbo].[TEMPSTPFSCERTUNICA] (
    [IDSESSIONE]      DECIMAL (5)   NOT NULL,
    [ANNO]            SMALLINT      NOT NULL,
    [CODFORNITORE]    VARCHAR (7)   NOT NULL,
    [CODFISCFORN]     VARCHAR (16)  NULL,
    [RAGSOCCOGNOME]   VARCHAR (170) NULL,
    [RAGSOCNOME]      VARCHAR (80)  NULL,
    [CODFISCALE]      VARCHAR (16)  NULL,
    [PARTITAIVA]      VARCHAR (16)  NULL,
    [PREFTEL]         VARCHAR (8)   NULL,
    [TELEFONO]        VARCHAR (25)  NULL,
    [EMAIL]           VARCHAR (50)  NULL,
    [COMUNESEDEFISC]  VARCHAR (80)  NULL,
    [PROVSEDEFISC]    VARCHAR (4)   NULL,
    [VIASEDEFISCALE]  VARCHAR (80)  NULL,
    [NUMSEDEFISCALE]  VARCHAR (8)   NULL,
    [CAPSEDEFISCALE]  VARCHAR (8)   NULL,
    [CODATTIVITA]     VARCHAR (6)   NULL,
    [CODSEDE]         VARCHAR (6)   NULL,
    [CODFISCRAPP]     VARCHAR (16)  NULL,
    [CODCARICA]       SMALLINT      NULL,
    [CODFISCSOCRAPP]  VARCHAR (16)  NULL,
    [COGNOMERAPP]     VARCHAR (80)  NULL,
    [NOMERAPP]        VARCHAR (80)  NULL,
    [FLGANNULLAMENTO] VARCHAR (1)   NULL,
    [FLGSOSTITUZIONE] VARCHAR (1)   NULL,
    [NUMDICHDIP]      SMALLINT      NULL,
    [NUMDICHAUT]      SMALLINT      NULL,
    [FLGQUADROCT]     VARCHAR (1)   NULL,
    [CODFISCINTERM]   VARCHAR (16)  NULL,
    [FLGIMPEGNOTRASM] VARCHAR (1)   NULL,
    [DATAIMPEGNO]     DATETIME      NULL,
    [DATAINVIO]       DATETIME      NULL,
    [CODCAUSALE]      VARCHAR (2)   NOT NULL,
    [EVENTIECCEZ]     SMALLINT      NULL,
    [ANNOPERC]        SMALLINT      NULL,
    CONSTRAINT [PK_TEMPSTPFSCERTUNICA] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [ANNO] ASC, [CODFORNITORE] ASC, [CODCAUSALE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPFSCERTUNICA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPFSCERTUNICA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPFSCERTUNICA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPFSCERTUNICA] TO [Metodo98]
    AS [dbo];

