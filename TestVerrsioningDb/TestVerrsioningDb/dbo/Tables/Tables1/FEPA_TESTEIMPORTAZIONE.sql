﻿CREATE TABLE [dbo].[FEPA_TESTEIMPORTAZIONE] (
    [PROGRESSIVO]      DECIMAL (10)    NOT NULL,
    [IDTRASMITTENTE]   VARCHAR (50)    NOT NULL,
    [PROGRESSIVOINVIO] VARCHAR (50)    NOT NULL,
    [IDPRESTATORE]     VARCHAR (50)    NOT NULL,
    [NOMEFILE]         VARCHAR (200)   NOT NULL,
    [TIPODOC]          VARCHAR (10)    NULL,
    [NUMERODOC]        VARCHAR (10)    NULL,
    [DATA]             DATETIME        NULL,
    [DIVISA]           VARCHAR (4)     NULL,
    [TIPOSCMAGG]       VARCHAR (100)   DEFAULT ('') NULL,
    [PERCSCMAGG]       VARCHAR (100)   DEFAULT ('') NULL,
    [IMPSCMAGG]        DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [METPROGRESSDOC]   DECIMAL (10)    DEFAULT ((0)) NULL,
    [STATO]            SMALLINT        DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    [CODPAG]           VARCHAR (4)     DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC),
    CONSTRAINT [FK_FEPA_TESTEIMPORTAZIONE_METPROGRESSDOC] FOREIGN KEY ([METPROGRESSDOC]) REFERENCES [dbo].[TESTEDOCUMENTI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FEPA_TESTEIMPORTAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FEPA_TESTEIMPORTAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FEPA_TESTEIMPORTAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FEPA_TESTEIMPORTAZIONE] TO [Metodo98]
    AS [dbo];
