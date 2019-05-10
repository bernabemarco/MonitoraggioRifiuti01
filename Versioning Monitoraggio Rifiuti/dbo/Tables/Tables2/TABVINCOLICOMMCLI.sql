﻿CREATE TABLE [dbo].[TABVINCOLICOMMCLI] (
    [PROGRESSIVO]                 DECIMAL (9)    NOT NULL,
    [CARSPECRIGHEDOC]             VARCHAR (3)    NULL,
    [TIPOCOMMCLIDEF]              VARCHAR (3)    NULL,
    [FORMATODEFRIFCOMM]           VARCHAR (30)   NULL,
    [MAGAZZINI]                   VARCHAR (200)  NULL,
    [TIPODOCDEFEMISSDOCPREV]      VARCHAR (3)    NULL,
    [TIPOORDDEFEMISSORDPROD]      VARCHAR (3)    NULL,
    [DEFCLASSMATMP]               VARCHAR (3)    NULL,
    [DEFCLASSMATSL]               VARCHAR (3)    NULL,
    [DEFCLASSMATPF]               VARCHAR (3)    NULL,
    [DEFCLASSLAVINT]              VARCHAR (3)    NULL,
    [DEFCLASSLAVEST]              VARCHAR (3)    NULL,
    [FLGPRELDADOC]                SMALLINT       NULL,
    [FLGTRASFPROD]                SMALLINT       NULL,
    [FLGORDENTRDAFORN]            SMALLINT       NULL,
    [FLGORDSPEDACLI]              SMALLINT       NULL,
    [COSTOSTANDCORRPRELDADOC]     VARCHAR (10)   NULL,
    [COSTODAORDBOLLATRASFPROD]    VARCHAR (10)   NULL,
    [COSTOSTANDCORRORDENTRDAFORN] VARCHAR (10)   NULL,
    [COSTOSTANDCORRORDSPEDACLI]   VARCHAR (10)   NULL,
    [LISTINOPRELDADOC]            NUMERIC (5)    NULL,
    [LISTINOTRASFPROD]            NUMERIC (5)    NULL,
    [LISTINOORDENTRDAFORN]        NUMERIC (5)    NULL,
    [LISTINOORDSPEDACLI]          NUMERIC (5)    NULL,
    [FLGCONSUNDACICLIORD]         SMALLINT       NULL,
    [FLGCONSUNDADOC]              SMALLINT       NULL,
    [FLGRILEVDACICLILAVEMESSI]    SMALLINT       NULL,
    [TIPODOCPRELDADOC1]           VARCHAR (200)  NULL,
    [TIPODOCPRELDADOC2]           VARCHAR (200)  NULL,
    [TIPODOCPRELDADOC3]           VARCHAR (200)  NULL,
    [TIPODOCPRELDADOC4]           VARCHAR (200)  NULL,
    [TIPOORDTRASFPROD1]           VARCHAR (200)  NULL,
    [TIPODOCTRASFPROD1]           VARCHAR (200)  NULL,
    [TIPODOCTRASFPROD2]           VARCHAR (200)  NULL,
    [TIPODOCORDENTRDAFORN1]       VARCHAR (200)  NULL,
    [TIPODOCORDENTRDAFORN2]       VARCHAR (200)  NULL,
    [TIPODOCORDENTRDAFORN3]       VARCHAR (200)  NULL,
    [TIPODOCORDSPEDACLI1]         VARCHAR (200)  NULL,
    [TIPODOCORDSPEDACLI2]         VARCHAR (200)  NULL,
    [TIPODOCORDSPEDACLI3]         VARCHAR (200)  NULL,
    [TIPODOCCONSLAVINT1]          VARCHAR (200)  NULL,
    [TIPODOCCONSLAVINT2]          VARCHAR (200)  NULL,
    [TIPODOCCONTOLAVTRASF1]       VARCHAR (200)  NULL,
    [TIPODOCCONTOLAVTRASF2]       VARCHAR (200)  NULL,
    [TIPOORDCONTOLAVTRASF1]       VARCHAR (200)  NULL,
    [TIPODOCCONTOLAVDIFASE1]      VARCHAR (200)  NULL,
    [TIPODOCCONTOLAVDIFASE2]      VARCHAR (200)  NULL,
    [TIPODOCALTRICOSTIDADOC1]     VARCHAR (200)  NULL,
    [TIPODOCALTRICOSTIDADOC2]     VARCHAR (200)  NULL,
    [CAUSMAGPRELDADOC1]           VARCHAR (35)   NULL,
    [CAUSMAGPRELDADOC2]           VARCHAR (35)   NULL,
    [CAUSMAGPRELDADOC3]           VARCHAR (35)   NULL,
    [CAUSMAGPRELDADOC4]           VARCHAR (35)   NULL,
    [CAUSMAGTRASFPRODORD1]        VARCHAR (35)   NULL,
    [CAUSMAGTRASFPRODDOC1]        VARCHAR (35)   NULL,
    [CAUSMAGTRASFPRODDOC2]        VARCHAR (35)   NULL,
    [CAUSMAGORDENTRDAFORN1]       VARCHAR (35)   NULL,
    [CAUSMAGORDENTRDAFORN2]       VARCHAR (35)   NULL,
    [CAUSMAGORDENTRDAFORN3]       VARCHAR (35)   NULL,
    [CAUSMAGORDSPEDACLI1]         VARCHAR (35)   NULL,
    [CAUSMAGORDSPEDACLI2]         VARCHAR (35)   NULL,
    [CAUSMAGORDSPEDACLI3]         VARCHAR (35)   NULL,
    [UTENTEMODIFICA]              VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]                DATETIME       NOT NULL,
    [FORMATODEFRIFDEPOSITO]       VARCHAR (10)   NULL,
    [TIPODOCRICAVI1]              VARCHAR (200)  NULL,
    [TIPODOCRICAVI2]              VARCHAR (200)  NULL,
    [FLGORDSPEDRICAVO]            SMALLINT       CONSTRAINT [DF_TABVINCOLICOMMCLI_FLGORDSPEDRICAVO] DEFAULT (0) NULL,
    [FLGRILEVARTICOLI]            SMALLINT       NULL,
    [TOLLRIPPERC]                 DECIMAL (8, 5) CONSTRAINT [DF_TABVINCOLICOMMCLI_TOLLRIPPERC] DEFAULT (0.01) NOT NULL,
    [TOLLRIPQTA]                  DECIMAL (8, 5) CONSTRAINT [DF_TABVINCOLICOMMCLI_TOLLRIPQTA] DEFAULT (0.01) NOT NULL,
    [TOLLRIPVALORE]               DECIMAL (8, 5) CONSTRAINT [DF_TABVINCOLICOMMCLI_TOLLRIPVALORE] DEFAULT (0.01) NOT NULL,
    [DECRIPPERC]                  SMALLINT       CONSTRAINT [DF_TABVINCOLICOMMCLI_DECRIPPERC] DEFAULT (2) NOT NULL,
    [DECRIPQTA]                   SMALLINT       CONSTRAINT [DF_TABVINCOLICOMMCLI_DECRIPQTA] DEFAULT (2) NOT NULL,
    [DECRIPVALORE]                SMALLINT       CONSTRAINT [DF_TABVINCOLICOMMCLI_DECRIPVALORE] DEFAULT (2) NOT NULL,
    [FLGBLOCCARIP]                SMALLINT       CONSTRAINT [DF_TABVINCOLICOMMCLI_FLGBLOCCARIP] DEFAULT (0) NOT NULL,
    [FLGRILEVACODICILISTAPN]      SMALLINT       CONSTRAINT [DF_TABVINCOLICOMMCLI_FLGRILEVACODICILISTAPN] DEFAULT (0) NOT NULL,
    [FLGRILEVADOCNONCONTAB]       SMALLINT       CONSTRAINT [DF_TABVINCOLICOMMCLI_FLGRILEVADOCNONCONTAB] DEFAULT (0) NOT NULL,
    [DEFCLASSCOSTIDIR]            VARCHAR (3)    NULL,
    [FLGCONSUNDACICLIPREV]        DECIMAL (5)    NULL,
    [DEFCLASSRICAVI]              VARCHAR (3)    NULL,
    CONSTRAINT [PK_TABVINCOLICOMMCLI] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABVINCOLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABVINCOLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABVINCOLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABVINCOLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABVINCOLICOMMCLI] TO [Metodo98]
    AS [dbo];

