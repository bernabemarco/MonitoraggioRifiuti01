CREATE TABLE [dbo].[GRI_RAPPORTI] (
    [IDRAPPORTO]                     VARCHAR (14)    NOT NULL,
    [IDCONTRATTO]                    VARCHAR (13)    NULL,
    [SEZIONECONTRATTO]               DECIMAL (5)     NULL,
    [IdDivisione]                    SMALLINT        DEFAULT ((0)) NULL,
    [CODCLIENTE]                     VARCHAR (7)     NOT NULL,
    [CODCLIFAT]                      VARCHAR (7)     NULL,
    [CODDEST]                        DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [IdTipoRapporto]                 DECIMAL (5)     NOT NULL,
    [IdTipoIntervento]               SMALLINT        NOT NULL,
    [CODPAG]                         CHAR (4)        NULL,
    [CodAGENTE1]                     VARCHAR (7)     NULL,
    [CodAGENTE2]                     VARCHAR (7)     NULL,
    [RIFCOMMCLI]                     VARCHAR (30)    NULL,
    [ResponsabileCommessa]           VARCHAR (80)    NULL,
    [NodoID]                         VARCHAR (50)    NULL,
    [CodiceMezzo]                    VARCHAR (50)    NOT NULL,
    [Referente]                      VARCHAR (50)    NULL,
    [Tel_Ref]                        VARCHAR (50)    NULL,
    [Email_Responsabile]             VARCHAR (100)   NULL,
    [FlgInvioEmailResp]              SMALLINT        DEFAULT ((1)) NULL,
    [FlgOblPiattaforma]              SMALLINT        DEFAULT ((0)) NULL,
    [TIPO_PIATTAFORMA]               VARCHAR (3)     NULL,
    [GIORNI_PIATT]                   DECIMAL (6, 2)  DEFAULT ((0)) NULL,
    [TECNICO_EFF]                    VARCHAR (7)     NULL,
    [TECNICO_PREV]                   VARCHAR (7)     NULL,
    [DATA_PREV]                      DATETIME        NULL,
    [DATA_EFF]                       DATETIME        NULL,
    [DATA_FATT]                      DATETIME        NULL,
    [VersioneChekList]               DECIMAL (5)     DEFAULT ((0)) NULL,
    [TitoloChekList]                 VARCHAR (80)    NULL,
    [STATO]                          CHAR (1)        NULL,
    [DA_FATT]                        CHAR (1)        NULL,
    [DataInserimento]                DATETIME        NULL,
    [DataEliminazione]               DATETIME        NULL,
    [ELIMINATO]                      CHAR (1)        NULL,
    [MOTIVAZIONE_ANN]                NVARCHAR (500)  NULL,
    [INVIOFORZATO]                   CHAR (1)        DEFAULT ('N') NOT NULL,
    [RefRDO]                         VARCHAR (7)     NULL,
    [FlgPrevistoAllegato]            SMALLINT        DEFAULT ((0)) NULL,
    [FlgAllegato]                    SMALLINT        DEFAULT ((0)) NULL,
    [FlgOblLetturaNote]              SMALLINT        DEFAULT ((0)) NOT NULL,
    [FlgLetturaNote]                 SMALLINT        DEFAULT ((0)) NOT NULL,
    [EsitoDelControllo]              CHAR (1)        DEFAULT ('P') NULL,
    [NUMERO_RFW]                     NUMERIC (18)    NULL,
    [DATA_CREAZIONE]                 DATETIME        NULL,
    [NOTE_INTERNE]                   NTEXT           NULL,
    [NOTE_TECNICO]                   NTEXT           NULL,
    [DESCR_INT]                      NVARCHAR (160)  NULL,
    [RICHIESTA_INT]                  NVARCHAR (1000) NULL,
    [RifDocOrigineMetodo]            NUMERIC (18)    NULL,
    [AZRIF]                          CHAR (3)        NULL,
    [DATA_ULT_MOD]                   DATETIME        NULL,
    [UTENTE_ULT_MOD]                 NVARCHAR (50)   NULL,
    [IP_ULT_MOD]                     NVARCHAR (50)   NULL,
    [AZ_TEC_EFF]                     CHAR (3)        NULL,
    [BLOCCOSYNC]                     CHAR (1)        NULL,
    [NUMERORATA]                     NUMERIC (18)    NULL,
    [DATABLOCCO]                     DATETIME        NULL,
    [UTENTEBLOCCO]                   NVARCHAR (50)   NULL,
    [FLAGBLOCCO]                     CHAR (1)        NULL,
    [NUMMETODO]                      DECIMAL (10)    NULL,
    [TECNICO1]                       NVARCHAR (7)    NULL,
    [TECNICO2]                       NVARCHAR (7)    NULL,
    [RIFCLIENTE]                     NVARCHAR (100)  NULL,
    [FLGEXP]                         SMALLINT        DEFAULT ((0)) NULL,
    [DATA_STAMPA_TABLET]             DATETIME        NULL,
    [TOTALE_TABLET]                  DECIMAL (10, 2) NULL,
    [FLG_VER_TEC]                    CHAR (1)        NULL,
    [NOTE_GestioneRapporto]          NTEXT           NULL,
    [FLG_BLOCCO_SEGNALATO]           CHAR (1)        NULL,
    [BIGCUSTOMER]                    CHAR (1)        NULL,
    [PresaVisAvviso]                 CHAR (1)        NULL,
    [DataSync]                       DATETIME        NULL,
    [UTENTEMODIFICA]                 VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]                   DATETIME        NOT NULL,
    [flag_GeneraListeSMS]            VARCHAR (1)     DEFAULT ('') NULL,
    [IdSessioneProcessiRap]          DECIMAL (5)     NULL,
    [Periodicita]                    VARCHAR (30)    NULL,
    [NrRevisione]                    SMALLINT        NULL,
    [FunzioneReferente]              VARCHAR (50)    NULL,
    [NomeEstesoFirma]                VARCHAR (100)   NULL,
    [NomeFileAllegato]               VARCHAR (255)   NULL,
    [CostoInterventoFornitore]       NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [CostoMaterialeFornitore]        NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [RifDocTerzita]                  DECIMAL (10)    NULL,
    [NoteTerzista]                   NTEXT           NULL,
    [RifOfferta]                     VARCHAR (30)    NULL,
    [OreIntPreviste]                 DECIMAL (10, 2) NULL,
    [flag_GeneraListeCicloPass]      CHAR (1)        DEFAULT ('') NOT NULL,
    [IdSessioneProcessiRapCicloPass] DECIMAL (5)     NULL,
    [DATA_Riprogrammazione]          DATETIME        NULL,
    [Flag_GenCheckList]              SMALLINT        DEFAULT ((0)) NOT NULL,
    [USAPRZPART]                     SMALLINT        DEFAULT ((0)) NOT NULL,
    [gestProvvAg1]                   VARCHAR (1)     DEFAULT ('V') NULL,
    [Provv1MatSerAcc]                NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv1OreAdd]                   NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [gestProvvAg3]                   VARCHAR (1)     DEFAULT ('V') NULL,
    [Provv3MatSerAcc]                NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [Provv3OreAdd]                   NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [RefRespCommessa]                SMALLINT        NULL,
    CONSTRAINT [GRI_RAPPORTI_PK] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC)
);


GO


-- --------------------------------------------------------------------------------------
-- Funzione : Crea nuovo Rapporto Intervento
-- Autore  	: Moreno Feletto
-- Data    	: 16.05.2016
-- --------------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[TIUD_GRI_RAPPORTI] ON [dbo].[GRI_RAPPORTI] FOR INSERT, UPDATE, DELETE AS
BEGIN
	
  BEGIN TRAN

  DECLARE @INS		Numeric(10,0)
  DECLARE @DEL		Numeric(10,0)
  DECLARE @Tabella	Varchar(50)

  SET @INS = (SELECT COUNT(*) FROM Inserted)
  SET @DEL = (SELECT COUNT(*) FROM Deleted)
  SET @Tabella = 'GRI_RAPPORTI'	

  If @INS > 0 And @DEL > 0 BEGIN
    -- UPDATE		
		DELETE FROM GRI_SedeToTablet
		WHERE RifRecord IN (SELECT IDRAPPORTO FROM Inserted)
		AND Oggetto = @Tabella AND TipoOperazione = 'U'

		INSERT INTO GRI_SedeToTablet
						 (RifRecord
						 ,Oggetto
						 ,TipoOperazione
						 ,DataModifica)
			 SELECT
						 I.IDRAPPORTO
						 ,@Tabella
						 ,'U'
						 ,GETDATE()
		 FROM Inserted I
		 INNER JOIN Deleted D ON I.IDRAPPORTO = D.IDRAPPORTO
		 WHERE I.STATO in ( 'X', 'T')
		--scarto l'update fatta dalla procedura metodo_to_interscambio
  END


  If @INS > 0 And @DEL = 0 BEGIN

    -- INSERT
		DELETE FROM GRI_SedeToTablet
		WHERE RifRecord IN (SELECT IDRAPPORTO FROM Inserted)
		AND Oggetto = @Tabella AND TipoOperazione = 'I'

		INSERT INTO GRI_SedeToTablet
						 (RifRecord
						 ,Oggetto
						 ,TipoOperazione
						 ,DataModifica)
			 SELECT
						 IDRAPPORTO
						 ,@Tabella
						 ,'I'
						 ,GETDATE()
		 FROM Inserted    
			 WHERE STATO = 'X'

  END

  COMMIT TRAN

End

GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_RAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_RAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_RAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_RAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_RAPPORTI] TO [Metodo98]
    AS [dbo];

