﻿CREATE TABLE [dbo].[AZIONIUTENTEFORM] (
    [PROGRESSIVO]        DECIMAL (10)  NOT NULL,
    [OWNERHELPCONTEXTID] INT           NOT NULL,
    [NRRIGA]             INT           NOT NULL,
    [NOMEUTENTE]         VARCHAR (25)  NULL,
    [DESCRIZIONE]        VARCHAR (255) NULL,
    [VOCEMENU]           VARCHAR (255) NULL,
    [HELPCONTEXTID]      INT           NOT NULL,
    [TIPOPARAMETRO]      SMALLINT      DEFAULT ((0)) NOT NULL,
    [CONTROLLO]          VARCHAR (255) NULL,
    [ANAGRAFICA]         VARCHAR (255) NULL,
    [VARIABILE]          VARCHAR (255) NULL,
    [SINCRONIZZAFORM]    SMALLINT      DEFAULT ((0)) NOT NULL,
    [FORZAAPERTURAFORM]  SMALLINT      DEFAULT ((0)) NOT NULL,
    [FORZACHIUSURAFORM]  SMALLINT      DEFAULT ((0)) NOT NULL,
    [IDRIGAFILTRO]       SMALLINT      NULL,
    [IMPOSTAZIONE]       VARCHAR (50)  NULL,
    [TOTALE]             VARCHAR (50)  NULL,
    [UTENTEMODIFICA]     VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]       DATETIME      NOT NULL,
    [SINCRTOTALE]        SMALLINT      DEFAULT ((0)) NOT NULL,
    [CAMPODBVIS]         VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[AZIONIUTENTEFORM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AZIONIUTENTEFORM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AZIONIUTENTEFORM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AZIONIUTENTEFORM] TO [Metodo98]
    AS [dbo];
