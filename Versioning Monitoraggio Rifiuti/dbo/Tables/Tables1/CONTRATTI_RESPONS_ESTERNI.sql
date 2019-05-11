﻿CREATE TABLE [dbo].[CONTRATTI_RESPONS_ESTERNI] (
    [RIFPROGRESSIVO] DECIMAL (10)  NOT NULL,
    [NRRIGA]         INT           NOT NULL,
    [FLAGRIGA]       SMALLINT      NULL,
    [POSIZIONE]      INT           NULL,
    [COGNOME]        VARCHAR (100) NULL,
    [NOME]           VARCHAR (100) NULL,
    [TITOLO]         INT           NULL,
    [TELEFONO]       VARCHAR (20)  NULL,
    [CELLULARE]      VARCHAR (20)  NULL,
    [TELCASA]        VARCHAR (20)  NULL,
    [FAX]            VARCHAR (20)  NULL,
    [POSIZIONES]     VARCHAR (50)  NULL,
    [MAIL]           VARCHAR (30)  NULL,
    [NOTE]           VARCHAR (255) NULL,
    [ALLEGATO]       VARCHAR (500) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_ESTERNI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_ESTERNI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_ESTERNI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_ESTERNI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_RESPONS_ESTERNI] TO [Metodo98]
    AS [dbo];
