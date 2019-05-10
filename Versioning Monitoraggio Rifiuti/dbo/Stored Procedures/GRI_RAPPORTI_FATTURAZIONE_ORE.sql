


CREATE PROCEDURE [dbo].[GRI_RAPPORTI_FATTURAZIONE_ORE] (@IDRAPPORTO AS VARCHAR(30), @IDSESSIONE AS INT) AS
	/* TEST 
	DECLARE @IDRAPPORTO			AS VARCHAR(30)
	DECLARE @IDSESSIONE			AS INT

	SET @IDRAPPORTO			= '2010OR000480SI'
	SET @IDSESSIONE			= 3131
	*/

	-- VARIABILI
	DECLARE @TIPOAGENTE 								AS SMALLINT
	DECLARE @CodArticoloMET_OREORD			AS VARCHAR(50)
	DECLARE @CodArticoloMET_ORESTRA			AS VARCHAR(50)
	DECLARE @CodArticoloMET_OREVIAGGIO	AS VARCHAR(50)
	DECLARE @CodArticoloMET_TRASFERTA		AS VARCHAR(50)
	DECLARE @CodArticoloMET_KM					AS VARCHAR(50)
	DECLARE @OREORD											AS DECIMAL(5,2)
	DECLARE @ORESTRA										AS DECIMAL(5,2)
	DECLARE @OREVIAGGIO									AS DECIMAL(5,2)
	DECLARE @TRASFERTA									AS DECIMAL(5,2)
	DECLARE @KM													AS DECIMAL(5,2)
	DECLARE @IDRIGA											AS DECIMAL (5,0)
	DECLARE @IDMATERIALE								AS VARCHAR(50)
	DECLARE @PREZZO											AS DECIMAL(12,4)
	DECLARE @SCONTO											AS DECIMAL(10,5)
	DECLARE @QTA												DECIMAL(5,0)
	DECLARE @PROVVIGIONE1								AS DECIMAL(10,2)
	DECLARE @PROVVIGIONE2								AS DECIMAL(10,2)
	DECLARE @PROVVIGIONE3								AS DECIMAL(10,2)
	
	DECLARE @ELEMENTI_INSERITI					AS INT
	DECLARE @DESCINSERITA								AS INT

	SET @ELEMENTI_INSERITI = 0
	SET @DESCINSERITA = 0

	DECLARE CURR_RIGHE CURSOR LOCAL FAST_FORWARD FOR
	SELECT 
		[IDRIGA]
		,ISNULL([TIPOAGENTE],0)
		,ISNULL([OREORD],0)
		,ISNULL([ORESTRA],0)
		,ISNULL([OREVIAGGIO],0)
		,ISNULL([TRASFERTA],0)
		,ISNULL([KM],0)
	FROM [dbo].[GRI_RAPPORTI_OreLavoroAddebito]
	WHERE IDRAPPORTO = @IDRAPPORTO
	
	OPEN CURR_RIGHE
		FETCH NEXT FROM CURR_RIGHE INTO @IDRIGA, @TIPOAGENTE, @OREORD, @ORESTRA, @OREVIAGGIO, @TRASFERTA, @KM

		WHILE @@FETCH_STATUS = 0
		BEGIN
print @IDRIGA
			-- inserimento riga che descrive il prossimo elenco
			IF @DESCINSERITA = 0 AND ( @OREORD > 0 OR @ORESTRA > 0 OR @OREVIAGGIO > 0 OR @TRASFERTA > 0 OR @KM > 0 ) BEGIN

				EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																		,@IDRAPPORTO	--@IDRAPPORTO_RIF
																		,'D' 					--@TipologiaElemento
																		,0						--@idRigaMateriali
																		,0						--@idRigaServizi 
																		,0						--@idRigaOreLav 
																		,''						--@CodArticolo
																		,'Riepilogo ORE LAVORO'		--@DscrizioneRiga
																		,0						--@QTA 
																		,0						--@PREZZO 
																		,0						--@SCONTO 
																		,0						--@PROVVIGIONE1 
																		,0						--@PROVVIGIONE2 
																		,0						--@PROVVIGIONE3 
																		,1000					--@Posizione
																		,@IDSESSIONE	-- per i LOG

				SET @DESCINSERITA = 1

			END

			/*
			-- ------------------------ Leggo tutti i codici articoli relativi ai servizi fatturazione di una tipologia
			SELECT	@CodArticoloMET_OREORD=ISNULL(CodArticoloMET_OREORD,'')
							,@CodArticoloMET_ORESTRA=ISNULL(CodArticoloMET_ORESTRA,'')
							,@CodArticoloMET_OREVIAGGIO=ISNULL(CodArticoloMET_OREVIAGGIO,'')
							,@CodArticoloMET_TRASFERTA=ISNULL(CodArticoloMET_TRASFERTA,'')
							,@CodArticoloMET_KM=ISNULL(CodArticoloMET_KM,'')
			FROM GRI_T_TAB_ORE_ADDEBITO
			WHERE TipoAgente=@TIPOAGENTE
			*/
			
			-- ------------------------ ORE ORDINARIE
			IF @OREORD > 0 BEGIN
print 'oreord'			
				SELECT 	@IDMATERIALE= ISNULL([CODART_OREORD],'')
								,@PREZZO= ISNULL([PREZZO_OREORD],0)
								,@SCONTO=ISNULL([SCONTO_OREORD],0)
								,@PROVVIGIONE1= ISNULL([PROVV1_OREORD],0)
								,@PROVVIGIONE2= ISNULL([PROVV2_OREORD],0)
								,@PROVVIGIONE3= ISNULL([PROVV3_OREORD],0)
				FROM [GRI_TMP_OreLavoro_Valorizzate]
				WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA

				-- Inserisce solo il codice articolo metodo e la qta 
				EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																		,@IDRAPPORTO	--@IDRAPPORTO_RIF
																		,'O' 					--@TipologiaElemento
																		,0						--@idRigaMateriali
																		,0						--@idRigaServizi 
																		,@IDRIGA			--@idRigaOreLav 
																		,@IDMATERIALE	--@CodArticolo
																		,@IDMATERIALE	--@DscrizioneRiga
																		,@OREORD			--@QTA 
																		,@PREZZO			--@PREZZO 
																		,@SCONTO 			--@SCONTO 
																		,@PROVVIGIONE1	--@PROVVIGIONE1
																		,@PROVVIGIONE2	--@PROVVIGIONE2
																		,@PROVVIGIONE3					--@PROVVIGIONE3 
																		,1000					--@Posizione
																		,@IDSESSIONE	-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI + 1
				END
				
			END

			-- ------------------------ ORE STRAORDINARIE
			IF @ORESTRA > 0 BEGIN
print 'orestr'				
				SELECT 	@IDMATERIALE= ISNULL([CODART_ORESTRA],'')
								,@PREZZO= ISNULL([PREZZO_ORESTRA],0)
								,@SCONTO=ISNULL([SCONTO_ORESTRA],0)
								,@PROVVIGIONE1= ISNULL([PROVV1_ORESTRA],0)
								,@PROVVIGIONE2= ISNULL([PROVV2_ORESTRA],0)
								,@PROVVIGIONE3= ISNULL([PROVV3_ORESTRA],0)
				FROM [GRI_TMP_OreLavoro_Valorizzate]
				WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA
				
				-- Inserisce solo il codice articolo metodo e la qta 
				EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																		,@IDRAPPORTO	--@IDRAPPORTO_RIF
																		,'O' 					--@TipologiaElemento
																		,0						--@idRigaMateriali
																		,0						--@idRigaServizi 
																		,@IDRIGA			--@idRigaOreLav 
																		,@IDMATERIALE	--@CodArticolo
																		,@IDMATERIALE	--@DscrizioneRiga
																		,@ORESTRA			--@QTA 
																		,@PREZZO			--@PREZZO 
																		,@SCONTO 			--@SCONTO 
																		,@PROVVIGIONE1	--@PROVVIGIONE1
																		,@PROVVIGIONE2	--@PROVVIGIONE2
																		,@PROVVIGIONE3					--@PROVVIGIONE3 
																		,1000					--@Posizione
																		,@IDSESSIONE	-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI + 1
				END
				
			END			

			-- ------------------------ ORE VIAGGIO 
			IF @OREVIAGGIO > 0 BEGIN
print 'oreViaggio'					
				SELECT 	@IDMATERIALE= ISNULL([CODART_OREVIAGGIO],'')
								,@PREZZO= ISNULL([PREZZO_OREVIAGGIO],0)
								,@SCONTO=ISNULL([SCONTO_OREVIAGGIO],0)
								,@PROVVIGIONE1= ISNULL([PROVV1_OREVIAGGIO],0)
								,@PROVVIGIONE2= ISNULL([PROVV2_OREVIAGGIO],0)
								,@PROVVIGIONE3= ISNULL([PROVV3_OREVIAGGIO],0)
				FROM [GRI_TMP_OreLavoro_Valorizzate]
				WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA		
				
				-- Inserisce solo il codice articolo metodo e la qta 
				EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																		,@IDRAPPORTO	--@IDRAPPORTO_RIF
																		,'O' 					--@TipologiaElemento
																		,0						--@idRigaMateriali
																		,0						--@idRigaServizi 
																		,@IDRIGA			--@idRigaOreLav 
																		,@IDMATERIALE	--@CodArticolo
																		,@IDMATERIALE	--@DscrizioneRiga
																		,@OREVIAGGIO	--@QTA 
																		,@PREZZO			--@PREZZO 
																		,@SCONTO 			--@SCONTO 
																		,@PROVVIGIONE1	--@PROVVIGIONE1
																		,@PROVVIGIONE2	--@PROVVIGIONE2
																		,@PROVVIGIONE3	--@PROVVIGIONE3 
																		,1000					--@Posizione
																		,@IDSESSIONE	-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI + 1
				END
				
			END			

			-- ------------------------ ORE TRASFERTA 
			IF @TRASFERTA > 0 BEGIN
print 'oreTrasf'	
				SELECT 	@IDMATERIALE= ISNULL([CODART_TRASFERTA],'')
								,@PREZZO= ISNULL([PREZZO_TRASFERTA],0)
								,@SCONTO=ISNULL([SCONTO_TRASFERTA],0)
								,@PROVVIGIONE1= ISNULL([PROVV1_TRASFERTA],0)
								,@PROVVIGIONE2= ISNULL([PROVV2_TRASFERTA],0)
								,@PROVVIGIONE3= ISNULL([PROVV3_TRASFERTA],0)
				FROM [GRI_TMP_OreLavoro_Valorizzate]
				WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA
				
				-- Inserisce solo il codice articolo metodo e la qta 
				EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																		,@IDRAPPORTO	--@IDRAPPORTO_RIF
																		,'O' 					--@TipologiaElemento
																		,0						--@idRigaMateriali
																		,0						--@idRigaServizi 
																		,@IDRIGA			--@idRigaOreLav 
																		,@IDMATERIALE	--@CodArticolo
																		,@IDMATERIALE	--@DscrizioneRiga
																		,@TRASFERTA		--@QTA 
																		,@PREZZO			--@PREZZO 
																		,@SCONTO 			--@SCONTO 
																		,@PROVVIGIONE1	--@PROVVIGIONE1
																		,@PROVVIGIONE2	--@PROVVIGIONE2
																		,@PROVVIGIONE3   --@PROVVIGIONE3 
																		,1000					--@Posizione
																		,@IDSESSIONE	-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI + 1
				END
				
			END			
			
			-- ------------------------ ORE KM 
			IF @KM > 0 BEGIN
print 'km'
				SELECT 	@IDMATERIALE= ISNULL([CODART_KM],'')
								,@PREZZO= ISNULL([PREZZO_KM],0)
								,@SCONTO=ISNULL([SCONTO_KM],0)
								,@PROVVIGIONE1= ISNULL([PROVV1_KM],0)
								,@PROVVIGIONE2= ISNULL([PROVV2_KM],0)
								,@PROVVIGIONE3= ISNULL([PROVV3_KM],0)
				FROM [GRI_TMP_OreLavoro_Valorizzate]
				WHERE [idSessione] = @IDSESSIONE AND [IDRAPPORTO] = @IDRAPPORTO AND [idRiga] = @IDRIGA			
					
				-- Inserisce solo il codice articolo metodo e la qta 
				EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																		,@IDRAPPORTO	--@IDRAPPORTO_RIF
																		,'O' 					--@TipologiaElemento
																		,0						--@idRigaMateriali
																		,0						--@idRigaServizi 
																		,@IDRIGA			--@idRigaOreLav 
																		,@IDMATERIALE	--@CodArticolo
																		,@IDMATERIALE	--@DscrizioneRiga
																		,@KM					--@QTA 
																		,@PREZZO			--@PREZZO 
																		,@SCONTO 			--@SCONTO 
																		,@PROVVIGIONE1	--@PROVVIGIONE1
																		,@PROVVIGIONE2	--@PROVVIGIONE2
																		,@PROVVIGIONE3						--@PROVVIGIONE3 
																		,1000					--@Posizione
																		,@IDSESSIONE	-- per i LOG

				IF @@ERROR = 0 BEGIN
					SET @ELEMENTI_INSERITI = @ELEMENTI_INSERITI + 1
				END
				
			END			

		FETCH NEXT FROM CURR_RIGHE INTO @IDRIGA, @TIPOAGENTE, @OREORD ,@ORESTRA ,@OREVIAGGIO ,@TRASFERTA ,@KM
	END

	CLOSE CURR_RIGHE
	DEALLOCATE CURR_RIGHE

	RETURN @ELEMENTI_INSERITI



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_RAPPORTI_FATTURAZIONE_ORE] TO [Metodo98]
    AS [dbo];

