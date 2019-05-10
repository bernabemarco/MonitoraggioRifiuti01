﻿CREATE TABLE [dbo].[ALDEBRA_DATIIMPORT] (
    [CODAZIENDA]        VARCHAR (10)    COLLATE Latin1_General_CI_AS NOT NULL,
    [NUMERATORE]        VARCHAR (4)     COLLATE Latin1_General_CI_AS NULL,
    [ANNO]              DECIMAL (4)     NULL,
    [MOVIMENTO]         VARCHAR (10)    COLLATE Latin1_General_CI_AS NOT NULL,
    [ROTTURA]           VARCHAR (6)     COLLATE Latin1_General_CI_AS NOT NULL,
    [NRIGA]             DECIMAL (9)     NOT NULL,
    [DATAOPERAZIONE]    DATETIME        NULL,
    [BANCA]             VARCHAR (8)     COLLATE Latin1_General_CI_AS NULL,
    [RBN]               VARCHAR (4)     COLLATE Latin1_General_CI_AS NULL,
    [DATAREGISTRAZIONE] DATETIME        NULL,
    [CAUSALECOGE]       VARCHAR (4)     COLLATE Latin1_General_CI_AS NULL,
    [DIVISA]            VARCHAR (5)     COLLATE Latin1_General_CI_AS NULL,
    [IMPORTODIVISA]     DECIMAL (19, 4) NULL,
    [DIVISAAZIENDA]     VARCHAR (5)     COLLATE Latin1_General_CI_AS NULL,
    [CONTROVALORE]      DECIMAL (19, 4) NULL,
    [DATAVALUTA]        DATETIME        NULL,
    [NOTE]              VARCHAR (50)    COLLATE Latin1_General_CI_AS NULL,
    [TIPODOC]           VARCHAR (3)     COLLATE Latin1_General_CI_AS NULL,
    [NUMEROPARTITA]     VARCHAR (10)    COLLATE Latin1_General_CI_AS NULL,
    [PIANOCONTI]        VARCHAR (16)    COLLATE Latin1_General_CI_AS NULL,
    [SEZIONE]           VARCHAR (6)     COLLATE Latin1_General_CI_AS NULL,
    [VOCE]              VARCHAR (6)     COLLATE Latin1_General_CI_AS NULL,
    [CHIAVECOGE]        VARCHAR (26)    COLLATE Latin1_General_CI_AS NULL,
    [DATASCADENZA]      DATETIME        NULL,
    [ACCONTOSALDO]      VARCHAR (1)     COLLATE Latin1_General_CI_AS NULL,
    [ANNOCOGE]          DECIMAL (4)     NULL,
    [NUMERORITCOGE]     VARCHAR (4)     COLLATE Latin1_General_CI_AS NULL,
    [DSCOPERAZIONE]     VARCHAR (50)    COLLATE Latin1_General_CI_AS NULL,
    [DISTINTA]          VARCHAR (1)     COLLATE Latin1_General_CI_AS NULL,
    [NUMERODOC]         DECIMAL (12)    NULL,
    [IMPORTOORI]        DECIMAL (19, 4) NULL,
    [AZIENDANOMECONTO]  VARCHAR (10)    COLLATE Latin1_General_CI_AS NULL,
    [PDCNOMECONTO]      VARCHAR (16)    COLLATE Latin1_General_CI_AS NULL,
    [PDCDESTINATARIO]   VARCHAR (16)    COLLATE Latin1_General_CI_AS NULL,
    [PROGRMETODO]       DECIMAL (18)    NULL,
    [UTENTEMODIFICA]    VARCHAR (50)    COLLATE Latin1_General_CI_AS NULL,
    [DATAMODIFICA]      DATETIME        NULL,
    CONSTRAINT [PK_ALDEBRA_DATIIMPORT] PRIMARY KEY CLUSTERED ([CODAZIENDA] ASC, [MOVIMENTO] ASC, [ROTTURA] ASC, [NRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDEBRA_DATIIMPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDEBRA_DATIIMPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDEBRA_DATIIMPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDEBRA_DATIIMPORT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDEBRA_DATIIMPORT] TO [Metodo98]
    AS [dbo];

