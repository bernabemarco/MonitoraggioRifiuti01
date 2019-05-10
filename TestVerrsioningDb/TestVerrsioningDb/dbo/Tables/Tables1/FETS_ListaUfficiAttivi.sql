CREATE TABLE [dbo].[FETS_ListaUfficiAttivi] (
    [CODICEFISCALEPARTITAIVA]    VARCHAR (16)  NOT NULL,
    [PROGRESSIVOUFFICIO]         VARCHAR (255) NOT NULL,
    [Stato]                      SMALLINT      DEFAULT ((0)) NOT NULL,
    [CODCF]                      VARCHAR (7)   NULL,
    [CODCFFATT]                  VARCHAR (7)   NULL,
    [DESTINAZIONEDIVERSA]        DECIMAL (5)   NOT NULL,
    [DESCRIZIONEUFFICIO]         VARCHAR (255) NULL,
    [INDIRIZZO]                  VARCHAR (255) NULL,
    [CITTA]                      VARCHAR (255) NULL,
    [NAZIONE]                    VARCHAR (50)  NULL,
    [PROVINCIA]                  VARCHAR (5)   NULL,
    [CAP]                        VARCHAR (7)   NULL,
    [DatamodificaWS]             DATETIME      NOT NULL,
    [Utentemodifica]             VARCHAR (25)  NOT NULL,
    [Datamodifica]               DATETIME      NOT NULL,
    [TIPOINVIO]                  SMALLINT      DEFAULT ((0)) NOT NULL,
    [MAIL]                       VARCHAR (255) DEFAULT ('') NOT NULL,
    [UFFICIORIFERIMENTO]         VARCHAR (26)  NULL,
    [NRUFFCOLL]                  INT           DEFAULT ((0)) NULL,
    [CLIFOR]                     VARCHAR (7)   DEFAULT ('') NOT NULL,
    [RIFERIMENTOAMMINISTRAZIONE] VARCHAR (20)  DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_FETS_ListaUfficiAttivi] PRIMARY KEY CLUSTERED ([CODICEFISCALEPARTITAIVA] ASC, [PROGRESSIVOUFFICIO] ASC, [CLIFOR] ASC, [DESTINAZIONEDIVERSA] ASC, [RIFERIMENTOAMMINISTRAZIONE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_ListaUfficiAttivi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_ListaUfficiAttivi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_ListaUfficiAttivi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_ListaUfficiAttivi] TO [Metodo98]
    AS [dbo];

