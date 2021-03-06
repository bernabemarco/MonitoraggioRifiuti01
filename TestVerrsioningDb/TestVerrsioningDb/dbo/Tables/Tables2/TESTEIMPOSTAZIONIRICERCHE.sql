﻿CREATE TABLE [dbo].[TESTEIMPOSTAZIONIRICERCHE] (
    [PROGRESSIVO]      DECIMAL (10)  NOT NULL,
    [RIFHELPCONTEXTID] INT           NOT NULL,
    [NOMEIMPOSTAZIONE] VARCHAR (300) NULL,
    [NOMEUTENTE]       VARCHAR (25)  NULL,
    [UTENTEMODIFICA]   VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]     DATETIME      NOT NULL,
    [IDVISIONE]        SMALLINT      DEFAULT ((0)) NULL,
    [NOMEVISIONE]      VARCHAR (200) DEFAULT ('') NULL,
    CONSTRAINT [PK_TESTEIMPOSTAZIONIRICERCHE] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIRICERCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIRICERCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIRICERCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIRICERCHE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTEIMPOSTAZIONIRICERCHE] TO [Metodo98]
    AS [dbo];

