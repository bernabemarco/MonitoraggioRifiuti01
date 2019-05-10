




-- --------------------------------------------------------------------------------------
-- Funzione	:	Fatturazione Rapporti Intervento - Servizi Accessori
-- Autore  : Moreno Feletto
-- Data  	: 04.05.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_RAPPORTI_FATTURAZIONE_SERVIZIACCESSORI] (@IDRAPPORTO AS VARCHAR(30), @IDSESSIONE AS INT) AS
	/* TEST
	DECLARE @IDRAPPORTO			AS VARCHAR(30)
	DECLARE @IDSESSIONE			AS INT

	SET @IDRAPPORTO			= '2010OR000480SI'
	SET @IDSESSIONE			= 3131
	*/

	-- VARIABILI
	DECLARE @IDRIGA							AS DECIMAL (5,0)
	DECLARE @IDMATERIALE				AS VARCHAR(50)
	DECLARE @PREZZO							AS DECIMAL(12,4)
	DECLARE @SCONTO							AS DECIMAL(10,5)
	DECLARE @QTA								AS DECIMAL(10,2)
	DECLARE @PROVVIGIONE1				AS DECIMAL(10,2)
	DECLARE @PROVVIGIONE2				AS DECIMAL(10,2)
	DECLARE @PROVVIGIONE3				AS DECIMAL(10,2)
	DECLARE @ELEMENTI_INSERITI	AS INT
	DECLARE @DESCINSERITA				AS INT

	SET @ELEMENTI_INSERITI = 0
	SET @DESCINSERITA = 0

	DECLARE CURR_RIGHE CURSOR LOCAL FAST_FORWARD FOR
	SELECT [IDRIGA]
				,[IDMATERIALE]
				,ISNULL([PREZZO],0)
				,ISNULL([SCONTO],0)
				,ISNULL([QTA],0)
				,ISNULL([PROVVIGIONE1],0)
				,ISNULL([PROVVIGIONE2],0)
				,ISNULL([PROVVIGIONE3],0)
	FROM [GRI_RAPPORTI_ServiziAccessori]
	WHERE IDRAPPORTO = @IDRAPPORTO
	AND ISNULL([flg_mat_dafatt],'S') = 'S'
	
	OPEN CURR_RIGHE
		FETCH NEXT FROM CURR_RIGHE INTO @IDRIGA, @IDMATERIALE, @PREZZO, @SCONTO, @QTA, @PROVVIGIONE1, @PROVVIGIONE2,@PROVVIGIONE3

		WHILE @@FETCH_STATUS = 0
		BEGIN
				-- inserimento riga che descrive il prossimo elenco
				IF @DESCINSERITA = 0 BEGIN

					EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																			,@IDRAPPORTO	--@IDRAPPORTO_RIF
																			,'D' 					--@TipologiaElemento
																			,0						--@idRigaMateriali
																			,0						--@idRigaServizi 
																			,0						--@idRigaOreLav 
																			,''						--@CodArticolo
																			,'Riepilogo SERVIZI ACCESSORI'		--@DscrizioneRiga
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

				EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																		,@IDRAPPORTO	--@IDRAPPORTO_RIF
																		,'S' 					--@TipologiaElemento
																		,0						--@idRigaMateriali
																		,@IDRIGA			--@idRigaServizi 
																		,0						--@idRigaOreLav 
																		,@IDMATERIALE	--@CodArticolo
																		,@IDMATERIALE	--@DscrizioneRiga
																		,@QTA 				--@QTA 
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

		FETCH NEXT FROM CURR_RIGHE INTO @IDRIGA, @IDMATERIALE, @PREZZO, @SCONTO, @QTA, @PROVVIGIONE1, @PROVVIGIONE2,@PROVVIGIONE3
	END

	CLOSE CURR_RIGHE
	DEALLOCATE CURR_RIGHE

	RETURN @ELEMENTI_INSERITI





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_RAPPORTI_FATTURAZIONE_SERVIZIACCESSORI] TO [Metodo98]
    AS [dbo];

