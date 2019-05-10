



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

CREATE PROCEDURE [dbo].[GEM_RAPPORTI_FATTURAZIONE_ORE] (@IDRAPPORTO AS VARCHAR(30), @IDSESSIONE AS INT)
AS
/* TEST 
DECLARE @IDRAPPORTO			AS VARCHAR(30)
DECLARE @IDSESSIONE			AS INT
SET @IDRAPPORTO			= '2010OR000480SI'
SET @IDSESSIONE			= 3131
*/


	-- VARIABILI DELLA STORED
	DECLARE @IDCONTRATTO			AS VARCHAR(13)
	DECLARE @SEZIONECONTRATTO		AS DECIMAL (5,0)
	DECLARE @MESSAGGIOERRORE		AS VARCHAR(255)
	DECLARE @RADICEMESS				AS VARCHAR(255)
	DECLARE @CODICEMEZZOCONTRATTO	AS VARCHAR(50)
	DECLARE @CODICEARTICOLO			AS VARCHAR(50)
	DECLARE @CODARTICOLOFATT		AS VARCHAR(50)
	DECLARE @IDMODFATT				AS DECIMAL (5,0)
	DECLARE @IDTIPOFATT				AS DECIMAL (5,0)
	DECLARE @IDTIPOLOGMEZZO			AS DECIMAL (5,0)
	DECLARE @IDRIGAMEZZO			AS DECIMAL (5,0)
	DECLARE @IDATTIVITA			AS DECIMAL (5,0)
	DECLARE @IDRIGAATTIVITA			AS DECIMAL (5,0)
	--DA GEM_SEZIONECONTRATTORAPPORTI_OreLavoro
	DECLARE @TIPOLOGIARAPPORTO	AS VARCHAR(2)
	DECLARE @OREORD				AS DECIMAL(5,2)
	DECLARE @ORESTRA			AS DECIMAL(5,2)
	DECLARE @OREVIAGGIO			AS DECIMAL(5,2)
	DECLARE @TRASFERTA			AS DECIMAL(5,2)
	DECLARE @KM					AS DECIMAL(5,2)
	DECLARE @IDRIGA				AS DECIMAL (5,0)
	DECLARE @IDMATERIALE		AS VARCHAR(50)
	DECLARE @PREZZO				AS DECIMAL(12,4)
	DECLARE @SCONTO				AS DECIMAL(10,2)
	DECLARE @QTA				DECIMAL(5,0)
	DECLARE @PROVVIGIONE1		AS DECIMAL(10,2)
	DECLARE @PROVVIGIONE2		AS DECIMAL(10,2)
	DECLARE @ELEMENTI_INSERITI	AS INT
	DECLARE @DESCINSERITA		AS INT
	-- Moreno Feletto - 05.03.2018 - Modifica descrizione righe rapporti (TV1800027)
	DECLARE @ProvvExtraContr	AS CHAR(1)
	DECLARE @Provv1OreAdd		AS NUMERIC(10,2)

	SET @ELEMENTI_INSERITI = 0

	--RECUPERO IDCONTRATT, SEZIONECONTRATTO E FLAG_FATT SUL RAPPORTO
	SELECT @IDCONTRATTO=IDCONTRATTO, @SEZIONECONTRATTO=SEZIONECONTRATTO
	from dbo.GEM_SEZIONECONTRATTORAPPORTI
	where IDRAPPORTO = @IDRAPPORTO

	-- Moreno Feletto - 05.03.2018 - Modifica descrizione righe rapporti (TV1800027)
	-- RECUPERO FLG_ProvvExtraContratto Dalla Sezione Contratto
	SELECT 	@ProvvExtraContr = UPPER(ISNULL(FLG_ProvvExtraContratto,''))
			,@Provv1OreAdd = ISNULL(Provv1OreAdd,0)
	FROM dbo.GEM_SEZIONICONTRATTO
	WHERE IDContratto = @IDCONTRATTO
		AND SezioneContratto = @SEZIONECONTRATTO
		
	--IMPOSTAZIONE MESSAGGIO DI ERRORE
	SET @RADICEMESS = 'ELAB RAPPORTO: [' +  @IDRAPPORTO + '] - ORE '
	SET @ELEMENTI_INSERITI = 0
	SET @DESCINSERITA = 0

	--LEGGO TIPO FATTURAZIONE E TIPOLOGIA MEZZO
	SELECT @IDMODFATT=TC.IDMODFATT, @IDTIPOFATT=SC.IDTIPOFATT, @IDTIPOLOGMEZZO=SC.IDTIPOLOGMEZZO
			,@CODICEMEZZOCONTRATTO=CODICEMEZZO
	FROM dbo.GEM_TESTACONTRATTO TC INNER JOIN dbo.GEM_SEZIONICONTRATTO SC  ON TC.IDCONTRATTO = SC.IDCONTRATTO
	WHERE TC.IDCONTRATTO = @IDCONTRATTO AND SC.SEZIONECONTRATTO = @SEZIONECONTRATTO


	DECLARE CURR_RIGHE CURSOR  LOCAL  FAST_FORWARD FOR
	SELECT 
      [IDRIGA]
      ,[TIPOLOGIARAPPORTO]
      ,ISNULL([OREORD],0)
      ,ISNULL([ORESTRA],0)
      ,ISNULL([OREVIAGGIO],0)
      ,ISNULL([TRASFERTA],0)
      ,ISNULL([KM],0)
	FROM [dbo].[GEM_SEZIONECONTRATTORAPPORTI_OreLavoro]
	where IDRAPPORTO = @IDRAPPORTO
	OPEN CURR_RIGHE
	FETCH NEXT FROM CURR_RIGHE INTO  @IDRIGA, @TIPOLOGIARAPPORTO,@OREORD ,@ORESTRA ,@OREVIAGGIO ,@TRASFERTA ,@KM

	WHILE @@FETCH_STATUS = 0
	BEGIN

			--inserimento riga che descrive il prossimo elenco
			IF @DESCINSERITA = 0 AND ( @OREORD  > 0 OR @ORESTRA > 0 OR @OREVIAGGIO > 0 OR @TRASFERTA > 0  OR @KM > 0 )
			BEGIN

				EXEC GEM_PC_INS_ELEMENTIFATT @IDCONTRATTO 
						,@SEZIONECONTRATTO 
						,@IDRAPPORTO 
						,@IDRAPPORTO
						,'D' 
						,0
						,0						--@idRigaMateriali
						,0						--@idRigaOreLav 
						,0						--@idRigaRata
						,''						--CODART
						,'Riepilogo Lavoro'		--DSCART	Rif vista GEM_VISTA_ELEMENTI_FATT
						,0						--@QTA 
						,0						--@PREZZO 
						,0						--@SCONTO 
						,0						--@PROVVIGIONE1 
						,0						--@PROVVIGIONE2 
						,0						--@PROVVIGIONE3 
						,''						--@TipoFatturazione 
						,''						--@Validita 
						,1000					--@Posizione
						,@IDSESSIONE			-- per i LOG


				SET @DESCINSERITA = 1

			END 
			

		--ORE ORDINARIE
		IF @OREORD > 0 BEGIN
			SELECT 	@IDMATERIALE= ISNULL([CODART_OREORD],'')
				  ,@PREZZO= ISNULL([PREZZO_OREORD],0)
				  ,@SCONTO=ISNULL([SCONTO_OREORD],0)
				  ,@PROVVIGIONE1= (CASE WHEN @ProvvExtraContr='S' THEN @Provv1OreAdd ELSE ISNULL([PROVV1_OREORD],0) END) -- Moreno Feletto - 05.03.2018 - Modifica descrizione righe rapporti (TV1800027)  pre modif (ISNULL([PROVV1_OREORD],0))
				  ,@PROVVIGIONE2= ISNULL([PROVV2_OREORD],0)
			FROM [GEM_TMP_OreLavoro_Valorizzate]
			WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA	
			
			EXEC GEM_PC_INS_ELEMENTIFATT @IDCONTRATTO 
					,@SEZIONECONTRATTO 
					,@IDRAPPORTO 
					,@IDRAPPORTO
					,'O' 
					,0						--@idRigaAttivita		
					,0						--@idRigaMateriali
					,@IDRIGA				--@idRigaOreLav 
					,0						--@idRigaRata
					,@IDMATERIALE			--CODART
					,@IDMATERIALE						--DSCART
					,@OREORD				--@QTA 
					,@PREZZO				--@PREZZO 
					,@SCONTO 				--@SCONTO 
					,@PROVVIGIONE1			--@PROVVIGIONE1 
					,@PROVVIGIONE2			--@PROVVIGIONE2 
					,0						--@PROVVIGIONE3 
					,'Visita'				--@TipoFatturazione 
					,'A Consumo'			--@Validita 
					,1000					--@Posizione
					,@IDSESSIONE			-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI  + 1
				END 		
		END

		--ORE STRAORDINARIE
		IF @ORESTRA > 0 BEGIN
			SELECT 	@IDMATERIALE= ISNULL([CODART_ORESTRA],'')
					,@PREZZO= ISNULL([PREZZO_ORESTRA],0)
					,@SCONTO=ISNULL([SCONTO_ORESTRA],0)
					,@PROVVIGIONE1= (CASE WHEN @ProvvExtraContr='S' THEN @Provv1OreAdd ELSE ISNULL([PROVV1_ORESTRA],0) END) -- Moreno Feletto - 05.03.2018 - Modifica descrizione righe rapporti (TV1800027)  pre modif (ISNULL([PROVV1_ORESTRA],0))
					,@PROVVIGIONE2= ISNULL([PROVV2_ORESTRA],0)
			FROM [GEM_TMP_OreLavoro_Valorizzate]
			WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA

			EXEC GEM_PC_INS_ELEMENTIFATT @IDCONTRATTO 
					,@SEZIONECONTRATTO 
					,@IDRAPPORTO 
					,@IDRAPPORTO
					,'O' 
					,0						--@idRigaAttivita		
					,0						--@idRigaMateriali
					,@IDRIGA				--@idRigaOreLav 
					,0						--@idRigaRata
					,@IDMATERIALE			--CODART
					,@IDMATERIALE						--DSCART
					,@ORESTRA				--@QTA 
					,@PREZZO				--@PREZZO 
					,@SCONTO 				--@SCONTO 
					,@PROVVIGIONE1			--@PROVVIGIONE1 
					,@PROVVIGIONE2			--@PROVVIGIONE2 
					,0						--@PROVVIGIONE3 
					,'Visita'				--@TipoFatturazione 
					,'A Consumo'			--@Validita 
					,1000					--@Posizione
					,@IDSESSIONE			-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI  + 1
				END 					
		END 

		--ORE VIAGGIO 
		IF @OREVIAGGIO > 0 BEGIN
			SELECT 	@IDMATERIALE= ISNULL([CODART_OREVIAGGIO],'')
					,@PREZZO= ISNULL([PREZZO_OREVIAGGIO],0)
					,@SCONTO=ISNULL([SCONTO_OREVIAGGIO],0)
					,@PROVVIGIONE1= (CASE WHEN @ProvvExtraContr='S' THEN @Provv1OreAdd ELSE ISNULL([PROVV1_OREVIAGGIO],0) END) -- Moreno Feletto - 05.03.2018 - Modifica descrizione righe rapporti (TV1800027)  pre modif (ISNULL([PROVV1_OREVIAGGIO],0))
					,@PROVVIGIONE2= ISNULL([PROVV2_OREVIAGGIO],0)
			FROM [GEM_TMP_OreLavoro_Valorizzate]
			WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA

			EXEC GEM_PC_INS_ELEMENTIFATT @IDCONTRATTO 
					,@SEZIONECONTRATTO 
					,@IDRAPPORTO 
					,@IDRAPPORTO
					,'O' 
					,0						--@idRigaAttivita		
					,0						--@idRigaMateriali
					,@IDRIGA				--@idRigaOreLav 
					,0						--@idRigaRata
					,@IDMATERIALE			--CODART
					,@IDMATERIALE						--DSCART
					,@OREVIAGGIO				--@QTA 
					,@PREZZO				--@PREZZO 
					,@SCONTO 				--@SCONTO 
					,@PROVVIGIONE1			--@PROVVIGIONE1 
					,@PROVVIGIONE2			--@PROVVIGIONE2 
					,0						--@PROVVIGIONE3 
					,'Visita'				--@TipoFatturazione 
					,'A Consumo'			--@Validita 
					,1000					--@Posizione
					,@IDSESSIONE			-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI  + 1
				END 					

		END 

		--ORE TRASFERTA
		IF @TRASFERTA > 0 BEGIN
			SELECT 	@IDMATERIALE= ISNULL([CODART_TRASFERTA],'')
					,@PREZZO= ISNULL([PREZZO_TRASFERTA],0)
					,@SCONTO=ISNULL([SCONTO_TRASFERTA],0)
					,@PROVVIGIONE1= (CASE WHEN @ProvvExtraContr='S' THEN @Provv1OreAdd ELSE ISNULL([PROVV1_TRASFERTA],0) END) -- Moreno Feletto - 05.03.2018 - Modifica descrizione righe rapporti (TV1800027)  pre modif (ISNULL([PROVV1_TRASFERTA],0))
					,@PROVVIGIONE2= ISNULL([PROVV2_TRASFERTA],0)
			FROM [GEM_TMP_OreLavoro_Valorizzate]
			WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA

			EXEC GEM_PC_INS_ELEMENTIFATT @IDCONTRATTO 
					,@SEZIONECONTRATTO 
					,@IDRAPPORTO 
					,@IDRAPPORTO
					,'O' 
					,0						--@idRigaAttivita		
					,0						--@idRigaMateriali
					,@IDRIGA				--@idRigaOreLav 
					,0						--@idRigaRata
					,@IDMATERIALE			--CODART
					,@IDMATERIALE						--DSCART
					,@TRASFERTA				--@QTA 
					,@PREZZO				--@PREZZO 
					,@SCONTO 				--@SCONTO 
					,@PROVVIGIONE1			--@PROVVIGIONE1 
					,@PROVVIGIONE2			--@PROVVIGIONE2 
					,0						--@PROVVIGIONE3 
					,'Visita'				--@TipoFatturazione 
					,'A Consumo'			--@Validita 
					,1000					--@Posizione
					,@IDSESSIONE			-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI  + 1
				END 					

		END 


		--km
		IF @KM > 0 BEGIN
			SELECT 	@IDMATERIALE= ISNULL([CODART_KM],'')
					,@PREZZO= ISNULL([PREZZO_KM],0)
					,@SCONTO=ISNULL([SCONTO_KM],0)
					,@PROVVIGIONE1= (CASE WHEN @ProvvExtraContr='S' THEN @Provv1OreAdd ELSE ISNULL([PROVV1_KM],0) END) -- Moreno Feletto - 05.03.2018 - Modifica descrizione righe rapporti (TV1800027)  pre modif (ISNULL([PROVV1_KM],0))
					,@PROVVIGIONE2= ISNULL([PROVV2_KM],0)
			FROM [GEM_TMP_OreLavoro_Valorizzate]
			WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA

			EXEC GEM_PC_INS_ELEMENTIFATT @IDCONTRATTO 
					,@SEZIONECONTRATTO 
					,@IDRAPPORTO 
					,@IDRAPPORTO
					,'O' 
					,0						--@idRigaAttivita		
					,0						--@idRigaMateriali
					,@IDRIGA				--@idRigaOreLav 
					,0						--@idRigaRata
					,@IDMATERIALE			--CODART
					,@IDMATERIALE						--DSCART
					,@KM				--@QTA 
					,@PREZZO				--@PREZZO 
					,@SCONTO 				--@SCONTO 
					,@PROVVIGIONE1			--@PROVVIGIONE1 
					,@PROVVIGIONE2			--@PROVVIGIONE2 
					,0						--@PROVVIGIONE3 
					,'Visita'				--@TipoFatturazione 
					,'A Consumo'			--@Validita 
					,1000					--@Posizione
					,@IDSESSIONE			-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI  + 1
				END 					

		END 


		FETCH NEXT FROM CURR_RIGHE INTO @IDRIGA, @TIPOLOGIARAPPORTO,@OREORD ,@ORESTRA ,@OREVIAGGIO ,@TRASFERTA ,@KM
	END

	CLOSE CURR_RIGHE
	DEALLOCATE CURR_RIGHE


	-----------------------------------------------------------------------------
	--MESSAGGIO FINALE 
	--MESSAGGIO FINALE TUTTO OK
	-----------------------------------------------------------------------------
	/*
	IF @ELEMENTI_INSERITI = 0 BEGIN
		SET @MESSAGGIOERRORE = @RADICEMESS + ' NESSUN ELEMENTO INSERITO PER LA FATTURAZIONE '
	END
	ELSE BEGIN
		SET @MESSAGGIOERRORE = @RADICEMESS + ' ELABORAZIONE OK - INSERITI [' + LTRIM(STR(@ELEMENTI_INSERITI)) +'] RECORD PER LA FATTURAZIONE '
	END
	EXEC GEM_REG_ERRORLOG @IDSESSIONE, @MESSAGGIOERRORE 
	*/

	RETURN @ELEMENTI_INSERITI

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_RAPPORTI_FATTURAZIONE_ORE] TO [Metodo98]
    AS [dbo];

