CREATE TABLE [dbo].[GRI_TIPOLOGIARAPPORTO] (
    [IdTipoRapporto]                 DECIMAL (5)     NOT NULL,
    [DscTipoRapporto]                VARCHAR (80)    NULL,
    [SiglaRapporto]                  VARCHAR (3)     NOT NULL,
    [IdSocieta]                      VARCHAR (3)     NOT NULL,
    [SiglaSocieta]                   VARCHAR (3)     NOT NULL,
    [ContatoreRapporti]              DECIMAL (5)     NOT NULL,
    [CheckList]                      INT             DEFAULT ((0)) NULL,
    [ObbligoCheckList]               INT             DEFAULT ((0)) NULL,
    [ParametroDocScaricoMateriali]   VARCHAR (3)     NOT NULL,
    [ParametroDocPerFattura]         VARCHAR (3)     NOT NULL,
    [ParametroDocPerConsuntivazione] VARCHAR (3)     NOT NULL,
    [ParametroFamigliaAdiuto]        VARCHAR (250)   NULL,
    [PercorsoDocumentiCollegati]     VARCHAR (250)   NULL,
    [PercorsoAllegatiMezzi]          VARCHAR (250)   NULL,
    [UTENTEMODIFICA]                 VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]                   DATETIME        NOT NULL,
    [CodMezzo]                       VARCHAR (50)    NULL,
    [IdTipoIntervento]               SMALLINT        NULL,
    [DA_FATT]                        CHAR (1)        DEFAULT ('N') NOT NULL,
    [RIFCOMMCLI]                     VARCHAR (30)    NULL,
    [NodoID]                         VARCHAR (50)    NULL,
    [AssegnazionePrezziTablet]       INT             DEFAULT ((0)) NULL,
    [TRASPACURA]                     DECIMAL (5)     NULL,
    [PORTO]                          DECIMAL (5)     NULL,
    [DefaultPROVVAG1Materiali]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [DefaultPROVVAG1OreAdd]          DECIMAL (19, 4) DEFAULT ((0)) NULL,
    CONSTRAINT [GRI_TIPOLOGIARAPPORTO_PK] PRIMARY KEY CLUSTERED ([IdTipoRapporto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_TIPOLOGIARAPPORTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_TIPOLOGIARAPPORTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_TIPOLOGIARAPPORTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_TIPOLOGIARAPPORTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_TIPOLOGIARAPPORTO] TO [Metodo98]
    AS [dbo];

