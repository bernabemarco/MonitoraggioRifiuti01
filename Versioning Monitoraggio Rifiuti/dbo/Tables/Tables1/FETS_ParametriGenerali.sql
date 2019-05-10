CREATE TABLE [dbo].[FETS_ParametriGenerali] (
    [Progressivo]             DECIMAL (10)  NOT NULL,
    [Usr]                     VARCHAR (255) NOT NULL,
    [Psw]                     VARCHAR (255) NOT NULL,
    [TipoArchiviazioneCCT]    SMALLINT      DEFAULT ((0)) NOT NULL,
    [DataUltimaLetturaWS]     DATETIME      NOT NULL,
    [OraUltimaLetturaWS]      VARCHAR (2)   DEFAULT ('00') NOT NULL,
    [MinUltimaLetturaWS]      VARCHAR (2)   DEFAULT ('00') NOT NULL,
    [PercorsoDownloadFile]    VARCHAR (200) DEFAULT ('') NOT NULL,
    [CodiceUfficio]           VARCHAR (20)  DEFAULT ('') NOT NULL,
    [PrioritaCCFD]            SMALLINT      DEFAULT ((0)) NOT NULL,
    [Utentemodifica]          VARCHAR (25)  NOT NULL,
    [Datamodifica]            DATETIME      NOT NULL,
    [CODICEFISCALEFIRMATARIO] VARCHAR (20)  DEFAULT ('') NULL,
    [PINFIRMATARIO]           VARCHAR (20)  DEFAULT ('') NULL,
    [TIPOINVIO]               INT           DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_ParametriGenerali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_ParametriGenerali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_ParametriGenerali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_ParametriGenerali] TO [Metodo98]
    AS [dbo];

