﻿CREATE TABLE [dbo].[IMPOSTAZIONIPRODDEP] (
    [NOMEPIANIF]       VARCHAR (30) NOT NULL,
    [EMETTIDOC]        SMALLINT     NULL,
    [LANCIAPIANIFGEN]  SMALLINT     NULL,
    [NOMEPIANIFGEN]    VARCHAR (30) NOT NULL,
    [NOMEIMPOSTAZIONE] VARCHAR (50) NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    CONSTRAINT [PK_IMPOSTAZIONIPRODDEP] PRIMARY KEY CLUSTERED ([NOMEPIANIF] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IMPOSTAZIONIPRODDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IMPOSTAZIONIPRODDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IMPOSTAZIONIPRODDEP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IMPOSTAZIONIPRODDEP] TO [Metodo98]
    AS [dbo];

