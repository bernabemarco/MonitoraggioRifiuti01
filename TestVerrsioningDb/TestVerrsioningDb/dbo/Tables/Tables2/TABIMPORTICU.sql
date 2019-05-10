﻿CREATE TABLE [dbo].[TABIMPORTICU] (
    [ANNO]                  DECIMAL (5)     NOT NULL,
    [CODFORNITORE]          VARCHAR (7)     NOT NULL,
    [CODCAUSALE]            VARCHAR (2)     NOT NULL,
    [FLGANTICIPAZIONE]      SMALLINT        NULL,
    [COMPENSO]              DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [SOMMENONRITREGCONV]    DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [CODICETIPOREDDITO]     SMALLINT        DEFAULT ((0)) NULL,
    [ALTRESOMMENONRIT]      DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [IMPONIBILE]            DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [IMPORTORITENUTA]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [IMPOSTA]               DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [RITENUTESOSPESE]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [ADDREGACCONTO]         DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [ADDREGIMPOSTA]         DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [ADDREGSOSPESA]         DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [ADDCOMACCONTO]         DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [ADDCOMIMPOSTA]         DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [ADDCOMSOSPESA]         DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [IMPONIBANNIPREC]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [RITENUTEANNIPREC]      DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [CONTRIBPREVSOGG]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [CONTRIBPREVPERC]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [SPESERIMBORSATE]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [RITENUTERIMBORSATE]    DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [CODCOMUNE]             VARCHAR (4)     NULL,
    [NRPROTOCOLLO1]         VARCHAR (17)    NULL,
    [NRPROTOCOLLO2]         DECIMAL (6)     NULL,
    [CATEGORIEPARTICOLARI]  VARCHAR (2)     NULL,
    [EVENTIECCEZIONALI]     SMALLINT        NULL,
    [ESCLPRECOMPILATA]      SMALLINT        NULL,
    [CODFISCENTEPREV]       VARCHAR (16)    NULL,
    [DOMFISCALE]            VARCHAR (80)    NULL,
    [DOMFISCALEANNOPREC]    VARCHAR (80)    NULL,
    [PROVFISCALE]           VARCHAR (4)     NULL,
    [PROVFISCALEANNOPREC]   VARCHAR (4)     NULL,
    [CODCOMUNEANNOPREC]     VARCHAR (4)     NULL,
    [FUSIONECOMUNE]         VARCHAR (4)     NULL,
    [FUSIONECOMUNEANNOPREC] VARCHAR (4)     NULL,
    [ANNOPERC]              SMALLINT        NULL,
    CONSTRAINT [PK_TABIMPORTICU] PRIMARY KEY CLUSTERED ([ANNO] ASC, [CODFORNITORE] ASC, [CODCAUSALE] ASC),
    CONSTRAINT [CHK_TABIMPORTICU_FLGANTICIPAZIONE] CHECK ([FLGANTICIPAZIONE]=(1) OR [FLGANTICIPAZIONE]=(0))
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABIMPORTICU] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABIMPORTICU] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABIMPORTICU] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABIMPORTICU] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABIMPORTICU] TO [Metodo98]
    AS [dbo];

