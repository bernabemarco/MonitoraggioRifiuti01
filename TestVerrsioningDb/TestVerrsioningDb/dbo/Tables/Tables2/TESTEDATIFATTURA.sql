﻿CREATE TABLE [dbo].[TESTEDATIFATTURA] (
    [PROGRESSIVO]    DECIMAL (10) NOT NULL,
    [ANNO]           SMALLINT     NOT NULL,
    [TRIMESTRE]      SMALLINT     DEFAULT ((0)) NULL,
    [SEMESTRE]       SMALLINT     DEFAULT ((0)) NULL,
    [NRREGCONT]      DECIMAL (10) DEFAULT ((0)) NULL,
    [DATAREG]        DATETIME     NULL,
    [DATADOC]        DATETIME     NULL,
    [NUMERODOC]      VARCHAR (15) NULL,
    [CODCLIFOR]      VARCHAR (7)  NULL,
    [TIPODOCDF]      VARCHAR (4)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [MESE]           SMALLINT     CONSTRAINT [DF_TESTEDATIFATTURA_MESE] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TESTEDATIFATTURA] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TESTEDATIFATTURA_ANNOTRIMESTRE]
    ON [dbo].[TESTEDATIFATTURA]([ANNO] ASC, [TRIMESTRE] ASC);


GO
CREATE NONCLUSTERED INDEX [TESTEDATIFATTURA_CODCLIFOR]
    ON [dbo].[TESTEDATIFATTURA]([CODCLIFOR] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTEDATIFATTURA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTEDATIFATTURA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTEDATIFATTURA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTEDATIFATTURA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTEDATIFATTURA] TO [Metodo98]
    AS [dbo];
