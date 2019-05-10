﻿CREATE TABLE [dbo].[TEMPTESTEMOVINTRABLACKLIST] (
    [IDSESSIONE]            SMALLINT      NOT NULL,
    [MESE]                  SMALLINT      NULL,
    [TRIM]                  SMALLINT      NULL,
    [ANNO]                  SMALLINT      NULL,
    [VARPERIODO]            SMALLINT      NULL,
    [FLGCORRETTTERM]        SMALLINT      NULL,
    [FLGCOMUNICINT]         SMALLINT      NULL,
    [PARTITAIVA]            VARCHAR (12)  NULL,
    [CODFISCALE]            VARCHAR (16)  NULL,
    [EMAIL]                 VARCHAR (40)  NULL,
    [PREFTEL]               VARCHAR (4)   NULL,
    [NUMTEL]                VARCHAR (8)   NULL,
    [PREFFAX]               VARCHAR (4)   NULL,
    [NUMFAX]                VARCHAR (8)   NULL,
    [PERSONAFG]             VARCHAR (1)   NULL,
    [COGNOME]               VARCHAR (80)  NULL,
    [NOME]                  VARCHAR (80)  NULL,
    [SESSO]                 VARCHAR (1)   NULL,
    [DATANASCITA]           DATETIME      NULL,
    [COMUNENASCITA]         VARCHAR (80)  NULL,
    [PROVNASCITA]           VARCHAR (2)   NULL,
    [RAGSOCPG]              VARCHAR (160) NULL,
    [NATURAGIUR]            SMALLINT      NULL,
    [STATOESTERO]           VARCHAR (80)  NULL,
    [CODSTATOESTERO]        SMALLINT      NULL,
    [IDIVASTATOESTERO]      VARCHAR (40)  NULL,
    [CODFISCDICHDIV]        VARCHAR (16)  NULL,
    [CODCARICA]             SMALLINT      NULL,
    [CODFISCSOCDICH]        VARCHAR (16)  NULL,
    [COGNOMEDICH]           VARCHAR (80)  NULL,
    [NOMEDICH]              VARCHAR (80)  NULL,
    [SESSODICH]             VARCHAR (1)   NULL,
    [DATANASCITADICH]       DATETIME      NULL,
    [COMUNENASCITADICH]     VARCHAR (80)  NULL,
    [PROVNASCITADICH]       VARCHAR (2)   NULL,
    [RESIDENZADICH]         VARCHAR (80)  NULL,
    [PROVRESDICH]           VARCHAR (2)   NULL,
    [CAPRESDICH]            VARCHAR (8)   NULL,
    [VIARESDICH]            VARCHAR (80)  NULL,
    [PREFTELDICH]           VARCHAR (4)   NULL,
    [NUMTELDICH]            VARCHAR (8)   NULL,
    [NUMEROMODULI]          SMALLINT      NULL,
    [CODFISCINTERM]         VARCHAR (16)  NULL,
    [NISCRIZALBO]           DECIMAL (5)   NULL,
    [DATAIMPEGNO]           DATETIME      NULL,
    [IMPEGNOPRESTELEMATICA] SMALLINT      NULL,
    CONSTRAINT [PK_TEMPTESTEMOVINTRABLACKLIST] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPTESTEMOVINTRABLACKLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPTESTEMOVINTRABLACKLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPTESTEMOVINTRABLACKLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPTESTEMOVINTRABLACKLIST] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPTESTEMOVINTRABLACKLIST] TO [Metodo98]
    AS [dbo];

