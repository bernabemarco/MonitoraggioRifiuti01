CREATE TABLE [dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI] (
    [IDRAPPORTO]                     VARCHAR (14)     NOT NULL,
    [IDCONTRATTO]                    VARCHAR (13)     NULL,
    [SEZIONECONTRATTO]               DECIMAL (5)      NULL,
    [IDRAPPORTOAGGREGATO]            VARCHAR (14)     NULL,
    [TIPOLOGIARAPPORTO]              VARCHAR (2)      NOT NULL,
    [TIPO_RAPPORTO]                  CHAR (1)         NULL,
    [DATA_PREV]                      DATETIME         NULL,
    [DATA_EFF]                       DATETIME         NULL,
    [DATA_FATT]                      DATETIME         NULL,
    [VersioneChekList]               DECIMAL (5)      DEFAULT ((0)) NULL,
    [TitoloChekList]                 VARCHAR (80)     NULL,
    [STATO]                          CHAR (1)         NULL,
    [DA_FATT]                        CHAR (1)         NULL,
    [DataInserimento]                DATETIME         NULL,
    [DataEliminazione]               DATETIME         NULL,
    [FLG_DerogaRicScadenze]          CHAR (1)         DEFAULT ('N') NULL,
    [EsitoDelControllo]              CHAR (1)         DEFAULT ('P') NULL,
    [NUMERO_RFW]                     NUMERIC (18)     NULL,
    [DATA_CREAZIONE]                 DATETIME         NULL,
    [NOTE_INTERNE]                   NTEXT            NULL,
    [NOTE_TECNICO]                   NTEXT            NULL,
    [TECNICO_EFF]                    VARCHAR (7)      NULL,
    [TECNICO_PREV]                   VARCHAR (7)      NULL,
    [CodAGENTE1]                     VARCHAR (7)      NULL,
    [CodAGENTE2]                     VARCHAR (7)      NULL,
    [DESCR_INT]                      NVARCHAR (160)   NULL,
    [RICHIESTA_INT]                  NVARCHAR (1000)  NULL,
    [AZRIF]                          CHAR (3)         NULL,
    [DATA_ULT_MOD]                   DATETIME         NULL,
    [UTENTE_ULT_MOD]                 NVARCHAR (50)    NULL,
    [IP_ULT_MOD]                     NVARCHAR (50)    NULL,
    [INVIOFORZATO]                   CHAR (1)         DEFAULT ('N') NOT NULL,
    [AZ_TEC_EFF]                     CHAR (3)         NULL,
    [BLOCCOSYNC]                     CHAR (1)         NULL,
    [NUMERORATA]                     NUMERIC (18)     NULL,
    [CODCLIENTE]                     VARCHAR (7)      NULL,
    [CODPAG]                         CHAR (4)         NULL,
    [CODDEST]                        DECIMAL (5)      NULL,
    [DATABLOCCO]                     DATETIME         NULL,
    [UTENTEBLOCCO]                   NVARCHAR (50)    NULL,
    [FLAGBLOCCO]                     CHAR (1)         NULL,
    [NUMMETODO]                      DECIMAL (10)     NULL,
    [TECNICO1]                       NVARCHAR (7)     NULL,
    [TECNICO2]                       NVARCHAR (7)     NULL,
    [RIFCLIENTE]                     NVARCHAR (50)    NULL,
    [FLGEXP]                         SMALLINT         DEFAULT ((0)) NULL,
    [DATA_STAMPA_PALMTEC]            DATETIME         NULL,
    [TOTALE_PALMTEC]                 DECIMAL (10, 2)  NULL,
    [MOTIVAZIONE_ANN]                NVARCHAR (500)   NULL,
    [FLG_VER_TEC]                    CHAR (1)         NULL,
    [NOTE_GestioneRapporto]          NTEXT            NULL,
    [FLG_BLOCCO_SEGNALATO]           CHAR (1)         NULL,
    [BIGCUSTOMER]                    CHAR (1)         NULL,
    [PresaVisAvviso]                 CHAR (1)         NULL,
    [ELIMINATO]                      CHAR (1)         NULL,
    [DataSync]                       DATETIME         NULL,
    [UTENTEMODIFICA]                 VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]                   DATETIME         NOT NULL,
    [flag_GeneraListeSMS]            VARCHAR (1)      DEFAULT ('') NULL,
    [IdSessioneProcessiRap]          DECIMAL (5)      NULL,
    [NrVisita]                       DECIMAL (5)      DEFAULT ((0)) NULL,
    [TV]                             CHAR (1)         NULL,
    [Referente]                      VARCHAR (50)     NULL,
    [Tel_Ref]                        VARCHAR (50)     NULL,
    [Email_Responsabile]             VARCHAR (100)    NULL,
    [RIFCOMMCLI]                     VARCHAR (30)     NULL,
    [Periodicita]                    VARCHAR (30)     NULL,
    [FlgOblLetturaNote]              SMALLINT         DEFAULT ((0)) NOT NULL,
    [FlgLetturaNote]                 SMALLINT         DEFAULT ((0)) NOT NULL,
    [NrRevisione]                    SMALLINT         NULL,
    [FunzioneReferente]              VARCHAR (50)     NULL,
    [NomeEstesoFirma]                VARCHAR (100)    NULL,
    [NomeFileAllegato]               VARCHAR (255)    NULL,
    [CostoInterventoFornitore]       NUMERIC (10, 2)  DEFAULT ((0)) NULL,
    [CostoMaterialeFornitore]        NUMERIC (10, 2)  DEFAULT ((0)) NULL,
    [RifDocTerzita]                  DECIMAL (10)     NULL,
    [NoteTerzista]                   NTEXT            NULL,
    [DATA_Riprogrammazione]          DATETIME         NULL,
    [FLG_RichiestaRDO]               CHAR (1)         DEFAULT ('0') NULL,
    [NoteRichiestaRDO]               VARCHAR (1000)   NULL,
    [AnnotationID]                   UNIQUEIDENTIFIER NULL,
    [flag_GeneraListeCicloPass]      CHAR (1)         DEFAULT ('') NOT NULL,
    [IdSessioneProcessiRapCicloPass] DECIMAL (5)      NULL,
    [RifOfferta]                     VARCHAR (30)     NULL,
    [OreIntPreviste]                 DECIMAL (10, 2)  NULL,
    [FlgOblPiattaforma]              SMALLINT         DEFAULT ((0)) NOT NULL,
    [FlgPrevistoAllegato]            SMALLINT         DEFAULT ((0)) NOT NULL,
    [FlgAllegato]                    SMALLINT         DEFAULT ((0)) NOT NULL,
    [FLG_AttRipristCompr]            CHAR (1)         DEFAULT ('S') NULL,
    [ValoreSogliaRiprist]            NUMERIC (10, 2)  DEFAULT ((0)) NULL,
    [FLG_AmbientiConf]               SMALLINT         DEFAULT ((0)) NULL,
    [FLG_LavoriInQuota]              SMALLINT         DEFAULT ((0)) NULL,
    CONSTRAINT [GEM_STO_SEZIONECONTRATTORAPPORTI_PK] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_STO_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];

