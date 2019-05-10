

CREATE PROCEDURE [dbo].[GEM_RAPPORTI_FATTURAZIONE_ALLINEA_MEZZI](@IDRAPPORTO VARCHAR(14), @IDSESSIONE	INT)
AS
/*TEST 
DECLARE @IDRAPPORTO VARCHAR(14)
DECLARE @IDSESSIONE	INT
SET @IDRAPPORTO = '2010ST000007SI'
*/

DECLARE @IDCONTRATTO AS VARCHAR(13) 
DECLARE @SEZIONECONTRATTO AS DECIMAL(5,0) 
DECLARE @IDRIGAMEZZO AS DECIMAL(5,0) 
DECLARE @CODMEZZO AS VARCHAR(50) 
DECLARE @DATAINSERIMENTO AS DATETIME 
DECLARE @DATAELIMINAZIONE AS DATETIME 
DECLARE @ELIMINATO AS VARCHAR(1) 
DECLARE @POSIZIONE AS NUMERIC 
DECLARE @SUBPOSIZIONE AS NUMERIC 
DECLARE @UBICAZIONE AS VARCHAR(50) 
DECLARE @POSCLIENTE AS VARCHAR(10) 
DECLARE @NOTE AS VARCHAR(900) 
DECLARE @ORDINE AS NUMERIC 
DECLARE @CARTESTO1 AS VARCHAR(50) 
DECLARE @CARTESTO2 AS VARCHAR(50) 
DECLARE @CARTESTO3 AS VARCHAR(50) 
DECLARE @CARTESTO4 AS VARCHAR(50) 
DECLARE @CARTESTO5 AS VARCHAR(50) 
DECLARE @CARTESTO6 AS VARCHAR(50) 
DECLARE @CARTESTO7 AS VARCHAR(50) 
DECLARE @CARTESTO8 AS VARCHAR(50) 
DECLARE @CARTESTO9 AS VARCHAR(50) 
DECLARE @CODICEBARRE AS NVARCHAR(50) 
DECLARE @OMOLOGATO AS CHAR(1) 
DECLARE @ANNO AS NUMERIC 
DECLARE @FLAG_INST AS VARCHAR(1) 
DECLARE @STATO AS VARCHAR(1) 
DECLARE @POSQLIK AS VARCHAR(50) 
DECLARE @QUANTITA AS NUMERIC 
DECLARE @TEMPO_MAN AS DECIMAL(5,2) 
DECLARE @IMPORTOAT1 AS DECIMAL(12,4) 
DECLARE @IMPORTOAT2 AS DECIMAL(12,4) 
DECLARE @IMPORTOAT3 AS DECIMAL(12,4) 
DECLARE @IMPORTOAT4 AS DECIMAL(12,4) 
DECLARE @IMPORTOAT5 AS DECIMAL(12,4) 
DECLARE @SCONTOAT1 AS NUMERIC 
DECLARE @SCONTOAT2 AS NUMERIC 
DECLARE @SCONTOAT3 AS NUMERIC 
DECLARE @SCONTOAT4 AS NUMERIC 
DECLARE @SCONTOAT5 AS NUMERIC 
DECLARE @PROV1AT1 AS NUMERIC 
DECLARE @PROV1AT2 AS NUMERIC 
DECLARE @PROV1AT3 AS NUMERIC 
DECLARE @PROV1AT4 AS NUMERIC 
DECLARE @PROV1AT5 AS NUMERIC 
DECLARE @PROV2AT1 AS NUMERIC 
DECLARE @PROV2AT2 AS NUMERIC 
DECLARE @PROV2AT3 AS NUMERIC 
DECLARE @PROV2AT4 AS NUMERIC 
DECLARE @PROV2AT5 AS NUMERIC 
DECLARE @PROV3AT1 AS NUMERIC 
DECLARE @PROV3AT2 AS NUMERIC 
DECLARE @PROV3AT3 AS NUMERIC 
DECLARE @PROV3AT4 AS NUMERIC 
DECLARE @PROV3AT5 AS NUMERIC 
DECLARE @DATA_REV AS DATETIME 
DECLARE @DATA_PREV AS DATETIME 
DECLARE @DATA_COLL AS DATETIME 
DECLARE @DATA_PCOLL AS DATETIME 
DECLARE @STATOFUORISEDE AS SMALLINT 
           
DECLARE @STATOATTIVITA INT
DECLARE @MESSAGGIO		VARCHAR(255)
          
DECLARE @PubblicaGemmaPlus	VARCHAR(1)
DECLARE @TIPOLOGIARAPPORTO	VARCHAR(2)

-- Rif. Ns. SF PD1500231 PUNTO 5.1.4
DECLARE @AnnotazioniTecnica	VARCHAR(900)

DECLARE @RifLinkImmagine varchar(300) 
DECLARE @CodiceEdificio varchar(30)
DECLARE @CodiceLivello varchar(50)
DECLARE @CodiceVano varchar(50)
DECLARE @PosizioneMappa varchar(50)
DECLARE @CodBarCoord varchar(50)
DECLARE @TipologiaBarre SMALLINT

	--PER TUTTI I MEZZI DEL RAPPORTO 
	DECLARE CURR_RIGHE CURSOR  LOCAL  FAST_FORWARD FOR

           
           SELECT [IDCONTRATTO]
	         ,[SEZIONECONTRATTO]
	         ,ISNULL([IDRIGAMEZZO],0) AS IDRIGAMEZZO
	         ,[CODMEZZO]
	         ,CAST(CONVERT(CHAR(10), isnull([DATAINSERIMENTO],getdate()), 112) AS DATETIME) 
	         ,[DATAELIMINAZIONE]
	         ,[ELIMINATO]
	         ,[POSIZIONE]
	         ,[SUBPOSIZIONE]
	         ,[UBICAZIONE]
	         ,[POSCLIENTE]
	         ,[NOTE]
	         ,[ORDINE]
	         ,[CARTESTO1]
	         ,[CARTESTO2]
	         ,[CARTESTO3]
	         ,[CARTESTO4]
	         ,[CARTESTO5]
	         ,[CARTESTO6]
	         ,[CARTESTO7]
	         ,[CARTESTO8]
	         ,[CARTESTO9]
	         ,[CODICEBARRE]
	         ,[OMOLOGATO]
	         ,[ANNO]
	         ,[FLAG_INST]
	         ,[STATO]
	         ,[POSQLIK]
	         ,[QUANTITA]
	         ,[TEMPO_MAN]
	         ,[IMPORTOAT1]
	         ,[IMPORTOAT2]
	         ,[IMPORTOAT3]
	         ,[IMPORTOAT4]
	         ,[IMPORTOAT5]
	         ,[SCONTOAT1]
	         ,[SCONTOAT2]
	         ,[SCONTOAT3]
	         ,[SCONTOAT4]
	         ,[SCONTOAT5]
	         ,[PROV1AT1]
	         ,[PROV1AT2]
	         ,[PROV1AT3]
	         ,[PROV1AT4]
	         ,[PROV1AT5]
	         ,[PROV2AT1]
	         ,[PROV2AT2]
	         ,[PROV2AT3]
	         ,[PROV2AT4]
	         ,[PROV2AT5]
	         ,[PROV3AT1]
	         ,[PROV3AT2]
	         ,[PROV3AT3]
	         ,[PROV3AT4]
	         ,[PROV3AT5]
	         ,[DATA_REV]
	         ,[DATA_PREV]
	         ,[DATA_COLL]
	         ,[DATA_PCOLL]
	         ,[STATOFUORISEDE]
	         ,[STATOATTIVITA]

			 -- Rif. Ns. SF PD1500231 PUNTO 5.1.4
			 ,[AnnotazioniTecnica]
			 ,[RifLinkImmagine]
			 ,[CodiceEdificio]
			 ,[CodiceLivello]
			 ,[CodiceVano]
			 ,[PosizioneMappa]
			 ,[CodBarCoord]
			 ,[TipologiaBarre]
		FROM DBO.GEM_SEZIONECONTRATTORAPPORTIMEZZI
		WHERE IDRAPPORTO = @IDRAPPORTO 
		ORDER BY IDRIGAMEZZO

	OPEN CURR_RIGHE
	FETCH NEXT FROM CURR_RIGHE INTO 
		      @IDCONTRATTO,
		      @SEZIONECONTRATTO,
		      @IDRIGAMEZZO,
		      @CODMEZZO,
		      @DATAINSERIMENTO,
		      @DATAELIMINAZIONE,
		      @ELIMINATO,
		      @POSIZIONE,
		      @SUBPOSIZIONE,
		      @UBICAZIONE,
		      @POSCLIENTE,
		      @NOTE,
		      @ORDINE,
		      @CARTESTO1,
		      @CARTESTO2,
		      @CARTESTO3,
		      @CARTESTO4,
		      @CARTESTO5,
		      @CARTESTO6,
		      @CARTESTO7,
		      @CARTESTO8,
		      @CARTESTO9,
		      @CODICEBARRE,
		      @OMOLOGATO,
		      @ANNO,
		      @FLAG_INST,
		      @STATO,
		      @POSQLIK,
		      @QUANTITA,
		      @TEMPO_MAN,
		      @IMPORTOAT1,
		      @IMPORTOAT2,
		      @IMPORTOAT3,
		      @IMPORTOAT4,
		      @IMPORTOAT5,
		      @SCONTOAT1,
		      @SCONTOAT2,
		      @SCONTOAT3,
		      @SCONTOAT4,
		      @SCONTOAT5,
		      @PROV1AT1,
		      @PROV1AT2,
		      @PROV1AT3,
		      @PROV1AT4,
		      @PROV1AT5,
		      @PROV2AT1,
		      @PROV2AT2,
		      @PROV2AT3,
		      @PROV2AT4,
		      @PROV2AT5,
		      @PROV3AT1,
		      @PROV3AT2,
		      @PROV3AT3,
		      @PROV3AT4,
		      @PROV3AT5,
		      @DATA_REV,
		      @DATA_PREV,
		      @DATA_COLL,
		      @DATA_PCOLL,
		      @STATOFUORISEDE,
			  @STATOATTIVITA
			  -- Rif. Ns. SF PD1500231 PUNTO 5.1.4
			 ,@AnnotazioniTecnica
			 ,@RifLinkImmagine
			 ,@CodiceEdificio
			 ,@CodiceLivello
			 ,@CodiceVano
			 ,@PosizioneMappa
			 ,@CodBarCoord
			 ,@TipologiaBarre
	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		IF EXISTS ( SELECT 1 FROM DBO.GEM_SEZIONICONTRATTODETTMEZZI 
				WHERE IDCONTRATTO= @IDCONTRATTO AND SEZIONECONTRATTO=@SEZIONECONTRATTO AND IDRIGAMEZZO=@IDRIGAMEZZO ) 
		BEGIN
	
			IF @STATOATTIVITA <> 0 BEGIN	

				UPDATE dbo.[GEM_SEZIONICONTRATTODETTMEZZI]
				   SET 
					  [CODMEZZO] = @CODMEZZO,
					  [DATAINSERIMENTO] = @DATAINSERIMENTO, 
					  [DATAELIMINAZIONE] = @DATAELIMINAZIONE, 
					  [ELIMINATO] = @ELIMINATO, 
					  [SUBPOSIZIONE] = @SUBPOSIZIONE, 
					  [UBICAZIONE] = @UBICAZIONE, 
					  --[POSCLIENTE] = @POSCLIENTE, 
					  [NOTE] = @NOTE, 
					  [ORDINE] = @ORDINE, 
					  [CARTESTO1] = @CARTESTO1, 
					  [CARTESTO2] = @CARTESTO2, 
					  [CARTESTO3] = @CARTESTO3,
					  [CARTESTO4] = @CARTESTO4, 
					  [CARTESTO5] = @CARTESTO5, 
					  [CARTESTO6] = @CARTESTO6, 
					  [CARTESTO7] = @CARTESTO7, 
					  [CARTESTO8] = @CARTESTO8, 
					  [CARTESTO9] = @CARTESTO9, 
					  [CODICEBARRE] = @CODICEBARRE, 
					  [OMOLOGATO] = @OMOLOGATO, 
					  [ANNO] = @ANNO,
					  --[FLAG_INST] = @FLAG_INST, 
					  [FLAG_INST] = 'N',
					  [STATO] = @STATO, 
					  [POSQLIK] = @POSQLIK, 
					  [QUANTITA] = @QUANTITA, 
					  [TEMPO_MAN] = @TEMPO_MAN, 
					  [IMPORTOAT1] = @IMPORTOAT1, 
					  [IMPORTOAT2] = @IMPORTOAT2, 
					  [IMPORTOAT3] = @IMPORTOAT3, 
					  [IMPORTOAT4] = @IMPORTOAT4, 
					  [IMPORTOAT5] = @IMPORTOAT5, 
					  [SCONTOAT1] = @SCONTOAT1, 
					  [SCONTOAT2] = @SCONTOAT2, 
					  [SCONTOAT3] = @SCONTOAT3, 
					  [SCONTOAT4] = @SCONTOAT4,
					  [SCONTOAT5] = @SCONTOAT5, 
					  [PROV1AT1] = @PROV1AT1, 
					  [PROV1AT2] = @PROV1AT2, 
					  [PROV1AT3] = @PROV1AT3, 
					  [PROV1AT4] = @PROV1AT4, 
					  [PROV1AT5] = @PROV1AT5, 
					  [PROV2AT1] = @PROV2AT1, 
					  [PROV2AT2] = @PROV2AT2, 
					  [PROV2AT3] = @PROV2AT3, 
					  [PROV2AT4] = @PROV2AT4, 
					  [PROV2AT5] = @PROV2AT5, 
					  [PROV3AT1] = @PROV3AT1, 
					  [PROV3AT2] = @PROV3AT2, 
					  [PROV3AT3] = @PROV3AT3, 
					  [PROV3AT4] = @PROV3AT4, 
					  [PROV3AT5] = @PROV3AT5, 
					  [DATA_REV] = @DATA_REV, 
					  [DATA_PREV] = @DATA_PREV, 
					  [DATA_COLL] = @DATA_COLL, 
					  [DATA_PCOLL] = @DATA_PCOLL, 
					  [UTENTEMODIFICA] = USER_NAME(),
					  [DATAMODIFICA] = GETDATE(),
					  [STATOFUORISEDE] = @STATOFUORISEDE
					  -- Rif. Ns. SF PD1500231 PUNTO 5.1.4
					  ,[AnnotazioniTecnica] = @AnnotazioniTecnica
					  ,[RifLinkImmagine] = @RifLinkImmagine
					  ,[CodiceEdificio] = @CodiceEdificio
					  ,[CodiceLivello] = @CodiceLivello
					  ,[CodiceVano] = @CodiceVano
					  ,[PosizioneMappa] = @PosizioneMappa
					  ,[CodBarCoord] = @CodBarCoord
					  ,[TipologiaBarre] = @TipologiaBarre
				 WHERE [IDCONTRATTO] = @IDCONTRATTO AND 
					  [SEZIONECONTRATTO] = @SEZIONECONTRATTO AND 
					  [IDRIGAMEZZO] = @IDRIGAMEZZO
				IF @@ERROR <> 0 BEGIN
					SET @MESSAGGIO	=	'RAPPORTO: ' + @IDRAPPORTO + ' - ERRORE IN AGGIORNAMENTO MEZZO: ' + STR(@IDRIGAMEZZO)
					EXEC GEM_REG_ERRORLOG @IDSESSIONE,@MESSAGGIO
					RETURN 1
				END 					
			
				--aggiornamento posizione cliente
				/* nuovi criteri aggiunti il 21-07-2011
					--
					AGG.TO POSCLIENTE SE
					GEMMAPLUS='N' QUALSIASI TIPORAPPORTO
					GEMMAPLUS='S' E TIPORAPPORTO='S'
					NON AGGIORNA POSCLIENTE
					GEMMAPLUS='S' E TIPORAPPORTO='O'
				*/
				SELECT @PubblicaGemmaPlus = ISNULL(PubblicaGemmaPlus,'N')
				FROM GEM_TESTACONTRATTO WHERE IDCONTRATTO = @IDCONTRATTO 

				SELECT @TIPOLOGIARAPPORTO = ISNULL(TIPOLOGIARAPPORTO,'O')
				FROM dbo.GEM_SEZIONECONTRATTORAPPORTI WHERE IDRAPPORTO= @IDRAPPORTO 

				IF @PubblicaGemmaPlus = 'N' OR ( @PubblicaGemmaPlus = 'S' AND @TIPOLOGIARAPPORTO = 'S') BEGIN
				
					UPDATE dbo.[GEM_SEZIONICONTRATTODETTMEZZI]
					SET  POSCLIENTE = @POSCLIENTE,
						  [UTENTEMODIFICA] = USER_NAME(),
						  [DATAMODIFICA] = GETDATE()
					 WHERE [IDCONTRATTO] = @IDCONTRATTO AND 
						  [SEZIONECONTRATTO] = @SEZIONECONTRATTO AND 
						  [IDRIGAMEZZO] = @IDRIGAMEZZO
					IF @@ERROR <> 0 BEGIN
						SET @MESSAGGIO	=	'RAPPORTO: ' + @IDRAPPORTO + ' - ERRORE IN AGG. CODICE POSIZIONE  MEZZO: ' + STR(@IDRIGAMEZZO)
						EXEC GEM_REG_ERRORLOG @IDSESSIONE,@MESSAGGIO
						RETURN 1

					END 					

				END 
				
			END
			ELSE BEGIN

				--ANCHE SE STATO_ATTIVITA' è ZERO ... AGGIORNO GLI ELEMINATI
				IF  @ELIMINATO <> 0 BEGIN
					UPDATE dbo.[GEM_SEZIONICONTRATTODETTMEZZI]
					   SET  [ELIMINATO] = @ELIMINATO,
						  [DATAELIMINAZIONE] = @DATAELIMINAZIONE, 
						  [UTENTEMODIFICA] = USER_NAME(),
						  [DATAMODIFICA] = GETDATE()
					 WHERE [IDCONTRATTO] = @IDCONTRATTO AND 
						  [SEZIONECONTRATTO] = @SEZIONECONTRATTO AND 
						  [IDRIGAMEZZO] = @IDRIGAMEZZO
				END 
			END 
		END
		ELSE BEGIN

			IF 	@IDRIGAMEZZO = 0 BEGIN
				SELECT 	@IDRIGAMEZZO= ISNULL(MAX(IDRIGAMEZZO),0)
				FROM [GEM_SEZIONICONTRATTODETTMEZZI]
				 WHERE [IDCONTRATTO] = @IDCONTRATTO AND 
					  [SEZIONECONTRATTO] = @SEZIONECONTRATTO 
 
				SET @IDRIGAMEZZO = 	@IDRIGAMEZZO +1
			END 
		
			INSERT INTO DBO.[GEM_SEZIONICONTRATTODETTMEZZI]
				   ([IDCONTRATTO]
				   ,[SEZIONECONTRATTO]
				   ,[IdRigaMezzo]
				   ,[CodMezzo]
				   ,[DataInserimento]
				   ,[DataEliminazione]
				   ,[ELIMINATO]
				   ,[POSIZIONE]
				   ,[SUBPOSIZIONE]
				   ,[UBICAZIONE]
				   ,[POSCLIENTE]
				   ,[NOTE]
				   ,[ORDINE]
				   ,[CarTesto1]
				   ,[CarTesto2]
				   ,[CarTesto3]
				   ,[CarTesto4]
				   ,[CarTesto5]
				   ,[CarTesto6]
				   ,[CarTesto7]
				   ,[CarTesto8]
				   ,[CarTesto9]
				   ,[CodiceBarre]
				   ,[OMOLOGATO]
				   ,[ANNO]
				   ,[FLAG_INST]
				   ,[STATO]
				   ,[POSQLIK]
				   ,[QUANTITA]
				   ,[TEMPO_MAN]
				   ,[IMPORTOAT1]
				   ,[IMPORTOAT2]
				   ,[IMPORTOAT3]
				   ,[IMPORTOAT4]
				   ,[IMPORTOAT5]
				   ,[SCONTOAT1]
				   ,[SCONTOAT2]
				   ,[SCONTOAT3]
				   ,[SCONTOAT4]
				   ,[SCONTOAT5]
				   ,[PROV1AT1]
				   ,[PROV1AT2]
				   ,[PROV1AT3]
				   ,[PROV1AT4]
				   ,[PROV1AT5]
				   ,[PROV2AT1]
				   ,[PROV2AT2]
				   ,[PROV2AT3]
				   ,[PROV2AT4]
				   ,[PROV2AT5]
				   ,[PROV3AT1]
				   ,[PROV3AT2]
				   ,[PROV3AT3]
				   ,[PROV3AT4]
				   ,[PROV3AT5]
				   ,[DATA_REV]
				   ,[DATA_PREV]
				   ,[DATA_COLL]
				   ,[DATA_PCOLL]
				   ,[StatoFuoriSede]
				   ,DATAMODIFICA, UTENTEMODIFICA
				   -- Rif. Ns. SF PD1500231 PUNTO 5.1.4
				   ,[AnnotazioniTecnica]
				   ,[RifLinkImmagine]
				   ,[CodiceEdificio]
				   ,[CodiceLivello]
				   ,[CodiceVano]
				   ,[PosizioneMappa]
				   ,[CodBarCoord]
				   ,[TipologiaBarre]
					)
			     VALUES (
				      @IDCONTRATTO,
				      @SEZIONECONTRATTO,
				      @IDRIGAMEZZO,
				      @CODMEZZO,
				      @DATAINSERIMENTO,
				      @DATAELIMINAZIONE,
				      @ELIMINATO,
				      @POSIZIONE,
				      @SUBPOSIZIONE,
				      @UBICAZIONE,
				      @POSCLIENTE,
				      @NOTE,
				      @ORDINE,
				      @CARTESTO1,
				      @CARTESTO2,
				      @CARTESTO3,
				      @CARTESTO4,
				      @CARTESTO5,
				      @CARTESTO6,
				      @CARTESTO7,
				      @CARTESTO8,
				      @CARTESTO9,
				      @CODICEBARRE,
				      @OMOLOGATO,
				      @ANNO,
				      --@FLAG_INST, omesso in quanto va valutato solo al primo inserimento sul rapporto non in sezione (richiesta Flavio 11.09.2018)
					  'N',
				      @STATO,
				      @POSQLIK,
				      @QUANTITA,
				      @TEMPO_MAN,
				      @IMPORTOAT1,
				      @IMPORTOAT2,
				      @IMPORTOAT3,
				      @IMPORTOAT4,
				      @IMPORTOAT5,
				      @SCONTOAT1,
				      @SCONTOAT2,
				      @SCONTOAT3,
				      @SCONTOAT4,
				      @SCONTOAT5,
				      @PROV1AT1,
				      @PROV1AT2,
				      @PROV1AT3,
				      @PROV1AT4,
				      @PROV1AT5,
				      @PROV2AT1,
				      @PROV2AT2,
				      @PROV2AT3,
				      @PROV2AT4,
				      @PROV2AT5,
				      @PROV3AT1,
				      @PROV3AT2,
				      @PROV3AT3,
				      @PROV3AT4,
				      @PROV3AT5,
				      @DATA_REV,
				      @DATA_PREV,
				      @DATA_COLL,
				      @DATA_PCOLL,
				      @STATOFUORISEDE,
					GETDATE(), USER_NAME()

					  -- Rif. Ns. SF PD1500231 PUNTO 5.1.4
					 ,@AnnotazioniTecnica
					 ,@RifLinkImmagine
					 ,@CodiceEdificio
					 ,@CodiceLivello
					 ,@CodiceVano
					 ,@PosizioneMappa
					 ,@CodBarCoord
					 ,@TipologiaBarre
			     )
				IF @@ERROR <> 0 BEGIN
					SET @MESSAGGIO	=	'RAPPORTO: ' + @IDRAPPORTO + ' - ERRORE IN INSERIMENTO MEZZO: ' + STR(@IDRIGAMEZZO)
					EXEC GEM_REG_ERRORLOG @IDSESSIONE,@MESSAGGIO
					RETURN 1

				END 					

     
		END
				
	
		FETCH NEXT FROM CURR_RIGHE INTO 
				      @IDCONTRATTO,
				      @SEZIONECONTRATTO,
				      @IDRIGAMEZZO,
				      @CODMEZZO,
				      @DATAINSERIMENTO,
				      @DATAELIMINAZIONE,
				      @ELIMINATO,
				      @POSIZIONE,
				      @SUBPOSIZIONE,
				      @UBICAZIONE,
				      @POSCLIENTE,
				      @NOTE,
				      @ORDINE,
				      @CARTESTO1,
				      @CARTESTO2,
				      @CARTESTO3,
				      @CARTESTO4,
				      @CARTESTO5,
				      @CARTESTO6,
				      @CARTESTO7,
				      @CARTESTO8,
				      @CARTESTO9,
				      @CODICEBARRE,
				      @OMOLOGATO,
				      @ANNO,
				      @FLAG_INST,
				      @STATO,
				      @POSQLIK,
				      @QUANTITA,
				      @TEMPO_MAN,
				      @IMPORTOAT1,
				      @IMPORTOAT2,
				      @IMPORTOAT3,
				      @IMPORTOAT4,
				      @IMPORTOAT5,
				      @SCONTOAT1,
				      @SCONTOAT2,
				      @SCONTOAT3,
				      @SCONTOAT4,
				      @SCONTOAT5,
				      @PROV1AT1,
				      @PROV1AT2,
				      @PROV1AT3,
				      @PROV1AT4,
				      @PROV1AT5,
				      @PROV2AT1,
				      @PROV2AT2,
				      @PROV2AT3,
				      @PROV2AT4,
				      @PROV2AT5,
				      @PROV3AT1,
				      @PROV3AT2,
				      @PROV3AT3,
				      @PROV3AT4,
				      @PROV3AT5,
				      @DATA_REV,
				      @DATA_PREV,
				      @DATA_COLL,
				      @DATA_PCOLL,
				      @STATOFUORISEDE,
					  @STATOATTIVITA
			          -- Rif. Ns. SF PD1500231 PUNTO 5.1.4
			          ,@AnnotazioniTecnica
					 ,@RifLinkImmagine
					 ,@CodiceEdificio
					 ,@CodiceLivello
					 ,@CodiceVano
					 ,@PosizioneMappa
					 ,@CodBarCoord
					 ,@TipologiaBarre
	END

	CLOSE CURR_RIGHE
	DEALLOCATE CURR_RIGHE
	RETURN 0


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_RAPPORTI_FATTURAZIONE_ALLINEA_MEZZI] TO [Metodo98]
    AS [dbo];

