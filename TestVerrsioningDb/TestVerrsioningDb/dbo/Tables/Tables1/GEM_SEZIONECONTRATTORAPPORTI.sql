CREATE TABLE [dbo].[GEM_SEZIONECONTRATTORAPPORTI] (
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
    [flag_GeneraListeCicloPass]      CHAR (1)         DEFAULT ('') NOT NULL,
    [IdSessioneProcessiRapCicloPass] DECIMAL (5)      NULL,
    [RifOfferta]                     VARCHAR (30)     NULL,
    [OreIntPreviste]                 DECIMAL (10, 2)  NULL,
    [FlgOblPiattaforma]              SMALLINT         DEFAULT ((0)) NOT NULL,
    [FlgPrevistoAllegato]            SMALLINT         DEFAULT ((0)) NOT NULL,
    [FlgAllegato]                    SMALLINT         DEFAULT ((0)) NOT NULL,
    [DATA_Riprogrammazione]          DATETIME         NULL,
    [FLG_RichiestaRDO]               CHAR (1)         DEFAULT ('0') NULL,
    [NoteRichiestaRDO]               VARCHAR (1000)   NULL,
    [AnnotationID]                   UNIQUEIDENTIFIER NULL,
    [FLG_AttRipristCompr]            CHAR (1)         DEFAULT ('S') NULL,
    [ValoreSogliaRiprist]            NUMERIC (10, 2)  DEFAULT ((0)) NULL,
    [FLG_AmbientiConf]               SMALLINT         DEFAULT ((0)) NULL,
    [FLG_LavoriInQuota]              SMALLINT         DEFAULT ((0)) NULL,
    CONSTRAINT [GEM_SEZIONECONTRATTORAPPORTI_PK] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_ContrSezione]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_RappAggreg]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([IDRAPPORTOAGGREGATO] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_DATA_PREV_ASC]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([DATA_PREV] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_DATA_EFF_ASC]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([DATA_EFF] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_StatoRapp]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([STATO] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_TIPOLOGIARAPPORTO_ASC]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([TIPOLOGIARAPPORTO] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_TIPO_RAPPORTO_ASC]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([TIPO_RAPPORTO] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_TECNICO_PREV]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([TECNICO_PREV] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_TECNICO_EFF]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([TECNICO_EFF] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_Contr]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([IDCONTRATTO] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_SEZIONECONTRATTORAPPORTI_Sezione]
    ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI]([SEZIONECONTRATTO] ASC);


GO

CREATE TRIGGER [dbo].[TU_GEM_SEZIONECONTRATTORAPPORTI] On [dbo].[GEM_SEZIONECONTRATTORAPPORTI] For insert, Update, delete As
--ALTER TRIGGER [TU_GEM_SEZIONECONTRATTORAPPORTI] ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI] FOR UPDATE AS
BEGIN

  --Begin tran

   DECLARE
	  @AzTecEffettiva	Varchar(50),
      @MAXCARD  INT,
      @NUMROWS  INT,
      @NUMNULL  INT,
      @ERRNO    INT,
      @ERRMSG   VARCHAR(255),
      @MESSAGGIOERRORE		AS VARCHAR(255)	,
	  @CONN VARCHAR(255),
	  @ST VARCHAR(1)

	  Set @AzTecEffettiva = (select TOP 1 idsocieta from extraagenti, INSERTED I1, GEM_SEZIONECONTRATTORAPPORTI T2 where T2.IDRAPPORTO=I1.IDRAPPORTO AND codagente=T2.TECNICO_EFF)
	  SET @ST=(select TOP 1 STATO from GEM_SEZIONECONTRATTORAPPORTI T2 where T2.STATO IN ('V','F'))
	--SET @MESSAGGIOERRORE = @AzTecEffettiva  + 'azienda'
    --PRINT @MESSAGGIOERRORE

	--SET @MESSAGGIOERRORE = (select I1.IDRAPPORTO from INSERTED I1) + 'INSERTED'
    --PRINT @MESSAGGIOERRORE 

	--SET @MESSAGGIOERRORE = (select D1.IDRAPPORTO from DELETED D1) + 'DELETED'
    --PRINT @MESSAGGIOERRORE 
--!= D1.IDRAPPORTO)

    SELECT  @NUMROWS = @@ROWCOUNT
	--SET @MESSAGGIOERRORE = cast(@@ROWCOUNT as varchar(10)) + ' @@ROWCOUNT'
    --PRINT @MESSAGGIOERRORE 

      --IF @NUMROWS = 0
      --   RETURN
      
    
      /*  MODIFY tecnico_Eff for "GEM_SEZIONECONTRATTORAPPORTI" */
 /*  MODIFY tecnico_Eff for "GEM_SEZIONECONTRATTORAPPORTI" */
     IF UPDATE(TECNICO_EFF)
      BEGIN
         UPDATE GEM_SEZIONECONTRATTORAPPORTI
		 --SET   AZ_TEC_EFF = 'BOL'
         SET   AZ_TEC_EFF = @AzTecEffettiva
		 --SET   AZ_TEC_EFF = (select idsocieta from extraagenti, INSERTED I1 where codagente=I1.TECNICO_EFF)
         FROM   GEM_SEZIONECONTRATTORAPPORTI T2, INSERTED I1, DELETED D1
         WHERE  T2.IDRAPPORTO = D1.IDRAPPORTO
          --AND  (I1.IDRAPPORTO != D1.IDRAPPORTO)
      
		--SET @MESSAGGIOERRORE = 'passo di qui'
		--PRINT @MESSAGGIOERRORE 
	  END

	/*  MODIFY STATO for "GEM_SEZIONECONTRATTORAPPORTI" */
     IF UPDATE(STATO)
	  
      BEGIN
         UPDATE GEM_SEZIONECONTRATTORAPPORTI
		 --SET   AZ_TEC_EFF = 'BOL'
         SET   AZ_TEC_EFF = @AzTecEffettiva
		 --SET   AZ_TEC_EFF = (select idsocieta from extraagenti, INSERTED I1 where codagente=I1.TECNICO_EFF)
         FROM   GEM_SEZIONECONTRATTORAPPORTI T2, INSERTED I1, DELETED D1
         WHERE  T2.IDRAPPORTO = D1.IDRAPPORTO 
			and t2.stato in('G', 'X') 
          --AND  (I1.IDRAPPORTO != D1.IDRAPPORTO)
      
		--SET @MESSAGGIOERRORE = 'passo di qui'
		--PRINT @MESSAGGIOERRORE 


/*
				--INIZIO inserimento per cambio stato su tabella LOG
		IF @ST='V' OR @ST='F'

		BEGIN
			
			SELECT @CONN =  CONCAT(APP_NAME(), ' -- ', SESSION_USER,  ' -- ',system_USER, ' -- ', CONVERT(VARCHAR(255),CONNECTIONPROPERTY ('client_net_address')))
			
			INSERT INTO Biri_StatoRapportiService
							 (CURRENTUSER,IDRAPPORTO, STATO, UTENTEMODIFICA, DATAMODIFICA)
			SELECT      @CONN, IDRAPPORTO, STATO, UTENTEMODIFICA, DATAMODIFICA
			FROM        inserted

			INSERT INTO Biri_StatoRapportiService
							 (CURRENTUSER,IDRAPPORTO, STATO, UTENTEMODIFICA, DATAMODIFICA)
			SELECT      @CONN, IDRAPPORTO, STATO, UTENTEMODIFICA, DATAMODIFICA
			FROM        deleted
		END
		--FINE inserimento per cambio stato su tabella LOG
*/

	  END

  --Commit tran
--SET @MESSAGGIOERRORE = 'passo di qui 2'
		--PRINT @MESSAGGIOERRORE 

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END





GO

CREATE Trigger [dbo].[TIUD_GEM_SEZIONECONTRATTORAPPORTI] On [dbo].[GEM_SEZIONECONTRATTORAPPORTI] For Insert, Update, Delete As

Begin
	
  Begin tran

  Declare @INS		Numeric(10,0)
  Declare @DEL		Numeric(10,0)
  Declare @Tabella	Varchar(50)

  Set @INS = (Select Count(*) From Inserted)
  Set @DEL = (Select Count(*) From Deleted)
  Set @Tabella = 'GEM_SEZIONECONTRATTORAPPORTI'	

  If @INS > 0 And @DEL > 0
  Begin

    -- UPDATE
	
	DELETE FROM GEM_SedeToPalmare
	WHERE RifRecord IN (SELECT IDRAPPORTO FROM Inserted)
	AND Oggetto = @Tabella AND TipoOperazione = 'U'

	INSERT INTO GEM_SedeToPalmare
           (RifRecord
           ,Oggetto
           ,TipoOperazione
           ,DataModifica)
     SELECT
           I.IDRAPPORTO
           ,@Tabella
           ,'U'
           ,GetDate()
	 FROM Inserted I
	 INNER JOIN Deleted D ON I.IDRAPPORTO = D.IDRAPPORTO
	 WHERE I.STATO = 'T'     
	--scarto l'update fatta dalla procedura metodo_to_interscambio
  End


  If @INS > 0 And @DEL = 0
  Begin

    -- INSERT

	DELETE FROM GEM_SedeToPalmare
	WHERE RifRecord IN (SELECT IDRAPPORTO FROM Inserted)
	AND Oggetto = @Tabella AND TipoOperazione = 'I'

	INSERT INTO GEM_SedeToPalmare
           (RifRecord
           ,Oggetto
           ,TipoOperazione
           ,DataModifica)
     SELECT
           IDRAPPORTO
           ,@Tabella
           ,'I'
           ,GetDate()
	 FROM Inserted    
     WHERE STATO = 'T'

  End


/*
  If @INS = 0 And @DEL > 0
  Begin

    -- DELETE
	DELETE FROM [Sicura].[dbo].[GEM_SedeToPalmare]
	WHERE RifRecord IN (SELECT IDRAPPORTO FROM Deleted)
	AND Oggetto = @Tabella AND TipoOperazione = 'D'

    INSERT INTO [Sicura].[dbo].[GEM_SedeToPalmare]
           (RifRecord
           ,Oggetto
           ,TipoOperazione
           ,DataModifica)
     SELECT
           IDRAPPORTO
           ,@Tabella
           ,'D'
           ,GetDate()
	 FROM Deleted 
     WHERE STATO IN ('X','T')   


  End
*/

  Commit tran

End
GO

/*  UPDATE TRIGGER [ALD_TU_TestaRapportiContrattoCPagamento] FOR TABLE "GEM_SEZIONECONTRATTORAPPORTI"  */
CREATE TRIGGER [ALD_TU_TestaRapportiContrattoCPagamento] ON [dbo].GEM_SEZIONECONTRATTORAPPORTI FOR UPDATE AS
BEGIN
   DECLARE
      @MAXCARD  INT,
      @NUMROWS  INT,
      @NUMNULL  INT,
      @ERRNO    INT,
      @ERRMSG   VARCHAR(255)

      SELECT  @NUMROWS = @@ROWCOUNT
      IF @NUMROWS = 0
         RETURN

      
      /*  Accoda record per variazioni su codice pagamento */
      IF UPDATE(CODPAG)
      BEGIN
		insert into [ALD_TestaRapportiContrattoCPagamento] (IDCONTRATTO, SEZIONECONTRATTO, IDRAPPORTO, DescrAzione, UTENTEMODIFICA, DATAMODIFICA, CODPAGAMENTO)
		select IDCONTRATTO, SEZIONECONTRATTO, IDRAPPORTO, 'Variazione pagamento rapporto contratto',  user, GETDATE(), CODPAG
		FROM   INSERTED T1 
      END
      


      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

/****** Object:  Trigger [dbo].[ALD_TU_TestaRapportiContrattoCPagamento]    Script Date: 30/05/2013 16:08:23 ******/
SET ANSI_NULLS ON

GO

/*  ALTER TRIGGER "ALD_TD_TestCancRapportiContratto" FOR TABLE "GEM_SEZIONECONTRATTORAPPORTI"  */
CREATE TRIGGER [ALD_TD_TestCancRapportiContratto] ON [dbo].[GEM_SEZIONECONTRATTORAPPORTI] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)
 
    SELECT  @NUMROWS = @@ROWCOUNT

    IF @NUMROWS = 0
       RETURN 

    /*  Accoda record testa cancellata su tbl temporanea ALD_TestCancRapportiContratto*/
    insert into ALD_TestCancRapportiContratto (IDRAPPORTO, DescrAzione, IDCONTRATTO, SEZIONECONTRATTO, UTENTEMODIFICA, DATAMODIFICA)
   select IDRAPPORTO, 'cancellazione Anagrafica rapporto', IDCONTRATTO, SEZIONECONTRATTO, user, GETDATE()
    FROM   DELETED T1  

    RETURN
 
/*  ERRORS HANDLING  */

ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

/****** Object:  Table [dbo].[ALD_TestCancSezioniContratto]    Script Date: 13/06/2012 12:31:33 ******/

SET ANSI_NULLS ON

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_SEZIONECONTRATTORAPPORTI] TO [Metodo98]
    AS [dbo];

