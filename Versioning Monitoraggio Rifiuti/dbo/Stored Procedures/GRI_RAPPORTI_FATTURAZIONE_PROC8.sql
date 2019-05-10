



CREATE PROCEDURE [dbo].[GRI_RAPPORTI_FATTURAZIONE_PROC8] (@IDRAPPORTO AS VARCHAR(30), @IDSESSIONE AS INT) AS
	/* TEST

	DECLARE @IDRAPPORTO			AS VARCHAR(30)
	DECLARE @IDSESSIONE			AS INT

	SET @IDRAPPORTO			= '2010OR000540SI'
	SET @IDSESSIONE			= 3131

	*/

	-- Cancellazione elementi da fatturare di elaborazioni precendenti
	DELETE GRI_RAPPORTI_ELEMENTI_DA_FATTURARE WHERE [IDRAPPORTO] = @IDRAPPORTO

	-- VARIABILI
	DECLARE @MESSAGGIOERRORE				AS VARCHAR(255)
	DECLARE @RADICEMESS							AS VARCHAR(255)
	DECLARE @DESCR_INT							AS VARCHAR(255)
	DECLARE @DA_FATT								AS VARCHAR(1)
	DECLARE @TIPORAPPORTODESC				AS VARCHAR(80)
	DECLARE @TIPOINTERVENTODESC			AS VARCHAR(80)
	DECLARE @RIFCLIENTE							AS VARCHAR(100)
	DECLARE @POSIZIONE							AS INT
	DECLARE @DATA_INTERVENTO				AS DATETIME
	DECLARE @SEDEDESC								AS VARCHAR(120)
	DECLARE @SEDEINDIRIZZO					AS VARCHAR(120)
	DECLARE @SEDELOC								AS VARCHAR(120)
	DECLARE @SEDEPROV								AS VARCHAR(5)
	DECLARE @DESCRAPP								AS VARCHAR(255)
	DECLARE @DESCINSERITA						AS SMALLINT
	DECLARE @idRigaMateriali    		AS DECIMAL(5, 0)
	DECLARE @CodArticolo   					AS VARCHAR(50)
	DECLARE @PROVVIGIONE1      			AS NUMERIC(18, 0)
	DECLARE @CodAgente1       			AS VARCHAR(7) 
	DECLARE @DSCAGENTE       				AS VARCHAR(80)
	
	-- RECUPERO IDCONTRATT, SEZIONECONTRATTO E FLAG_FATT SUL RAPPORTO
	SELECT @DA_FATT=RI.DA_FATT, @DATA_INTERVENTO=RI.DATA_EFF, @DESCR_INT=RTRIM(ISNULL(RI.DESCR_INT,'')), @RIFCLIENTE	= RTRIM(ISNULL(RI.RifCLiente,'')),
				 @TIPORAPPORTODESC=ISNULL(TR.DscTipoRapporto,''), @TIPOINTERVENTODESC=ISNULL(NI.Descrizione,''),
				 @SEDEDESC=ISNULL(VR.SedeRagSoc,''), @SEDEINDIRIZZO=ISNULL(VR.SedeIndirizzo,''), @SEDELOC=ISNULL(VR.SedeLocalita,''), @SEDEPROV=ISNULL(VR.SedeProvincia,'')
	FROM dbo.GRI_RAPPORTI RI
	LEFT OUTER JOIN GRI_TIPOLOGIARAPPORTO TR ON TR.IdTipoRapporto=RI.IdTipoRapporto
	LEFT OUTER JOIN GRI_T_NATURAINTERVENTO NI ON NI.IdTipoIntervento=RI.IdTipoIntervento
	LEFT OUTER JOIN GRI_VistaRapporti VR ON VR.IdRapporto=RI.IdRapporto
	WHERE RI.IDRAPPORTO = @IDRAPPORTO	
	
	-- IMPOSTAZIONE MESSAGGIO DI ERRORE
	SET @RADICEMESS = 'ELAB RAPPORTO INTERVENTO: [' + @IDRAPPORTO + '] '
	SET @DESCINSERITA = 0

	
	-- ----------------------------------------------------------------------
	IF @DA_FATT <> 'S' BEGIN 
		SET @MESSAGGIOERRORE = @RADICEMESS + 'RAPPORTO CON FATTURAZIONE ESCLUSA. GRI_RAPPORTI.DA_FATT<>[S]'
		EXEC GRI_REG_ERRORLOG @IDSESSIONE, @MESSAGGIOERRORE 
		RETURN 0 
	END -- NON ELABORA I RAPP IN STATO DA FATT = 'S'
	-- ----------------------------------------------------------------------
print 'passato1'
	
	-- ---------------------------------------------------------------------------
	-- ---------------------- RIGA DESCRIZIONE RAPPORTO
	--- --------------------------------------------------------------------------	
	SET @POSIZIONE = 10
	SET @DESCRAPP = 'Rapporto Intervento Nr: ' + @IDRAPPORTO + ' del ' + LTRIM(STR(DAY(@DATA_INTERVENTO))) + '-' + LTRIM(STR(MONTH(@DATA_INTERVENTO)))+'-' +LTRIM(STR(YEAR(@DATA_INTERVENTO)))
	EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
															,@IDRAPPORTO	--@IDRAPPORTO_RIF
															,'D' 					--@TipologiaElemento
															,0						--@idRigaMateriali
															,0						--@idRigaServizi 
															,0						--@idRigaOreLav 
															,''						--@CodArticolo
															,@DESCRAPP		--@DscrizioneRiga
															,0						--@QTA 
															,0						--@PREZZO 
															,0						--@SCONTO 
															,0						--@PROVVIGIONE1 
															,0						--@PROVVIGIONE2 
															,0						--@PROVVIGIONE3 
															,@POSIZIONE		--@Posizione
															,@IDSESSIONE	-- per i LOG
	-- ---------------------- RIGA RIF. CLIENTE
	IF @RIFCLIENTE <> '' BEGIN
		
		SET @POSIZIONE = 15
		SET @DESCRAPP = 'Rif. Cliente : ' + @RIFCLIENTE	
		EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																,@IDRAPPORTO	--@IDRAPPORTO_RIF
																,'D' 					--@TipologiaElemento
																,0						--@idRigaMateriali
																,0						--@idRigaServizi 
																,0						--@idRigaOreLav 
																,''						--@CodArticolo
																,@DESCRAPP		--@DscrizioneRiga
																,0						--@QTA 
	       														,0						--@PREZZO 
																,0						--@SCONTO 
																,0						--@PROVVIGIONE1 
																,0						--@PROVVIGIONE2 
																,0						--@PROVVIGIONE3 
																,@POSIZIONE		--@Posizione
																,@IDSESSIONE	-- per i LOG
	END

															
	-- ---------------------- RIGA TIPOLOGIA RAPPORTO / INTERVENTO
	SET @POSIZIONE = 20
	SET @DESCRAPP = 'Tipologia Rapporto: ' + @TIPORAPPORTODESC + ' Tipo Intervento: ' + @TIPOINTERVENTODESC
	EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
															,@IDRAPPORTO	--@IDRAPPORTO_RIF
															,'D' 					--@TipologiaElemento
															,0						--@idRigaMateriali
															,0						--@idRigaServizi 
															,0						--@idRigaOreLav 
															,''						--@CodArticolo
															,@DESCRAPP		--@DscrizioneRiga
															,0						--@QTA 
															,0						--@PREZZO 
															,0						--@SCONTO 
															,0						--@PROVVIGIONE1 
															,0						--@PROVVIGIONE2 
															,0						--@PROVVIGIONE3 
															,@POSIZIONE		--@Posizione
															,@IDSESSIONE	-- per i LOG


	-- ---------------------- RIGA DI DESCRIZIONE SEDE
	SET @POSIZIONE = 30
	SET @DESCRAPP = 'Presso: ' + LEFT(@SEDEDESC,72)
	EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
															,@IDRAPPORTO	--@IDRAPPORTO_RIF
															,'D' 					--@TipologiaElemento
															,0						--@idRigaMateriali
															,0						--@idRigaServizi 
															,0						--@idRigaOreLav 
															,''						--@CodArticolo
															,@DESCRAPP		--@DscrizioneRiga
															,0						--@QTA 
															,0						--@PREZZO 
															,0						--@SCONTO 
															,0						--@PROVVIGIONE1 
															,0						--@PROVVIGIONE2 
															,0						--@PROVVIGIONE3 
															,@POSIZIONE		--@Posizione
															,@IDSESSIONE	-- per i LOG
	
	SET @POSIZIONE = 32
	SET @DESCRAPP = 'Indirizzo: ' + LEFT(@SEDEINDIRIZZO,69)
	EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
															,@IDRAPPORTO	--@IDRAPPORTO_RIF
															,'D' 					--@TipologiaElemento
															,0						--@idRigaMateriali
															,0						--@idRigaServizi 
															,0						--@idRigaOreLav 
															,''						--@CodArticolo
															,@DESCRAPP		--@DscrizioneRiga
															,0						--@QTA 
															,0						--@PREZZO 
															,0						--@SCONTO 
															,0						--@PROVVIGIONE1 
															,0						--@PROVVIGIONE2 
															,0						--@PROVVIGIONE3 
															,@POSIZIONE		--@Posizione
															,@IDSESSIONE	-- per i LOG
															
	SET @POSIZIONE = 34
	SET @DESCRAPP = 'Localita: ' + LEFT(@SEDELOC,65) + ' ' + @SEDEPROV 
	EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
															,@IDRAPPORTO	--@IDRAPPORTO_RIF
															,'D' 					--@TipologiaElemento
															,0						--@idRigaMateriali
															,0						--@idRigaServizi 
															,0						--@idRigaOreLav 
															,''						--@CodArticolo
															,@DESCRAPP		--@DscrizioneRiga
															,0						--@QTA 
															,0						--@PREZZO 
															,0						--@SCONTO 
															,0						--@PROVVIGIONE1 
															,0						--@PROVVIGIONE2 
															,0						--@PROVVIGIONE3 
															,@POSIZIONE		--@Posizione
															,@IDSESSIONE	-- per i LOG
															
			
	-- ---------------------- RIGA RIF. CLIENTE
	--IF @RIFCLIENTE <> '' BEGIN
		
		--SET @POSIZIONE = 40
		--SET @DESCRAPP = 'Rif. Cliente : ' + @RIFCLIENTE	
		--EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
		--														,@IDRAPPORTO	--@IDRAPPORTO_RIF
		--														,'D' 					--@TipologiaElemento
		--														,0						--@idRigaMateriali
		--														,0						--@idRigaServizi 
		--														,0						--@idRigaOreLav 
		--														,''						--@CodArticolo
		---														,@DESCRAPP		--@DscrizioneRiga
		--														,0						--@QTA 
		--														,0						--@PREZZO 
		--														,0						--@SCONTO 
		--														,0						--@PROVVIGIONE1 
		--														,0						--@PROVVIGIONE2 
		--														,0						--@PROVVIGIONE3 
		--														,@POSIZIONE		--@Posizione
		---														,@IDSESSIONE	-- per i LOG
	--END

	
	-- ---------------------- RIGA DESCRIZIONE INTERVENTO
	IF @DESCR_INT <> '' BEGIN

		SET @POSIZIONE = 50
		SET @DESCR_INT = 'Descrizione Intervento: ' + @DESCR_INT
		SET @DESCRAPP = LEFT(@DESCR_INT,80)
		EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																,@IDRAPPORTO	--@IDRAPPORTO_RIF
																,'D' 					--@TipologiaElemento
																,0						--@idRigaMateriali
																,0						--@idRigaServizi 
																,0						--@idRigaOreLav 
																,''						--@CodArticolo
																,@DESCRAPP		--@DscrizioneRiga
																,0						--@QTA 
																,0						--@PREZZO 
																,0						--@SCONTO 
																,0						--@PROVVIGIONE1 
																,0						--@PROVVIGIONE2 
																,0						--@PROVVIGIONE3 
																,@POSIZIONE		--@Posizione
																,@IDSESSIONE	-- per i LOG
																
		IF LEN(@DESCR_INT) > 80 BEGIN

			SET @POSIZIONE = 52
			SET @DESCRAPP = SUBSTRING(@DESCR_INT,81,80)
			EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																	,@IDRAPPORTO	--@IDRAPPORTO_RIF
																	,'D' 					--@TipologiaElemento
																	,0						--@idRigaMateriali
																	,0						--@idRigaServizi 
																	,0						--@idRigaOreLav 
																	,''						--@CodArticolo
																	,@DESCRAPP		--@DscrizioneRiga
																	,0						--@QTA 
																	,0						--@PREZZO 
																	,0						--@SCONTO 
																	,0						--@PROVVIGIONE1 
																	,0						--@PROVVIGIONE2 
																	,0						--@PROVVIGIONE3 
																	,@POSIZIONE		--@Posizione
																	,@IDSESSIONE	-- per i LOG													
		
			IF LEN(@DESCR_INT) > 160 BEGIN

				SET @POSIZIONE = 54
				SET @DESCRAPP = SUBSTRING(@DESCR_INT,161,80)
				EXEC GRI_PC_INS_ELEMENTIFATT @IDRAPPORTO 
																		,@IDRAPPORTO	--@IDRAPPORTO_RIF
																		,'D' 					--@TipologiaElemento
																		,0						--@idRigaMateriali
																		,0						--@idRigaServizi 
																		,0						--@idRigaOreLav 
																		,''						--@CodArticolo
																		,@DESCRAPP		--@DscrizioneRiga
																		,0						--@QTA 
																		,0						--@PREZZO 
																		,0						--@SCONTO 
																		,0						--@PROVVIGIONE1 
																		,0						--@PROVVIGIONE2 
																		,0						--@PROVVIGIONE3 
																		,@POSIZIONE		--@Posizione
																		,@IDSESSIONE	-- per i LOG	
			END 
			
		END
	
	END
		
	-- ---------------------------------------------------------------------------
	-- ---------------------- GESTIONE MATERIALI
	--- --------------------------------------------------------------------------	
	DECLARE @RET_MATERIALI AS INT
	SET @RET_MATERIALI = 0
	EXECUTE @RET_MATERIALI = [GRI_RAPPORTI_FATTURAZIONE_MATERIALI] @IDRAPPORTO, @IDSESSIONE
print 'passato2'
	-- -------- CONTROLLO PROVVIGIONE SU MATERIALI
	SET @MESSAGGIOERRORE=''	
	DECLARE CURR_RAPFAT CURSOR LOCAL FAST_FORWARD FOR
		SELECT REF.idRigaMateriali, 
			 ISNULL(REF.CodArticolo,'') AS CodArticolo, 
			 ISNULL(REF.PROVVIGIONE1, 0) AS PROVVIGIONE1,
			 ISNULL(RI.CodAgente1,'') AS CodAgente1, 
			 ISNULL(AA.DSCAGENTE,'') AS DSCAGENTE
		FROM ANAGRAFICAAGENTI AA
		RIGHT OUTER JOIN GRI_RAPPORTI RI ON AA.CODAGENTE = RI.CodAgente1
		RIGHT OUTER JOIN GRI_RAPPORTI_ELEMENTI_DA_FATTURARE REF ON RI.IDRAPPORTO = REF.IDRAPPORTO
		WHERE RI.IDRAPPORTO = @IDRAPPORTO
			AND TipologiaElemento='M' AND PROVVIGIONE1=0
		
	OPEN CURR_RAPFAT
		FETCH NEXT FROM CURR_RAPFAT INTO @idRigaMateriali, @CodArticolo, @PROVVIGIONE1, @CodAgente1, @DSCAGENTE
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
				SET @MESSAGGIOERRORE = 'Attenzione per la riga ' + LTRIM(@idRigaMateriali) + ' di addebito Materiale ' + RTRIM(@CodArticolo) + ' la provvigione dell'' agente ' + RTRIM(@CodAgente1) + '-' + RTRIM(@DSCAGENTE) + ' è a ZERO' 
				EXEC GRI_REG_ERRORLOG @IDSESSIONE, @MESSAGGIOERRORE 
				FETCH NEXT FROM CURR_RAPFAT INTO @idRigaMateriali, @CodArticolo, @PROVVIGIONE1, @CodAgente1, @DSCAGENTE
		END

	CLOSE CURR_RAPFAT
	DEALLOCATE CURR_RAPFAT
		
		
	-- ---------------------------------------------------------------------------
	-- ---------------------- SERVIZI ACCESSORI
	--- --------------------------------------------------------------------------	
print 'passato3'
	DECLARE @RET_SERVIZIACCESSORI AS INT
	SET @RET_SERVIZIACCESSORI = 0
	EXECUTE @RET_SERVIZIACCESSORI = [GRI_RAPPORTI_FATTURAZIONE_SERVIZIACCESSORI] @IDRAPPORTO, @IDSESSIONE
	
	-- -------- CONTROLLO PROVVIGIONE SU MATERIALI
	SET @MESSAGGIOERRORE=''	
	DECLARE CURR_RAPFAT CURSOR LOCAL FAST_FORWARD FOR
		SELECT REF.idRigaMateriali, 
			 ISNULL(REF.CodArticolo,'') AS CodArticolo, 
			 ISNULL(REF.PROVVIGIONE1, 0) AS PROVVIGIONE1,
			 ISNULL(RI.CodAgente1,'') AS CodAgente1, 
			 ISNULL(AA.DSCAGENTE,'') AS DSCAGENTE
		FROM ANAGRAFICAAGENTI AA
		RIGHT OUTER JOIN GRI_RAPPORTI RI ON AA.CODAGENTE = RI.CodAgente1
		RIGHT OUTER JOIN GRI_RAPPORTI_ELEMENTI_DA_FATTURARE REF ON RI.IDRAPPORTO = REF.IDRAPPORTO
		WHERE RI.IDRAPPORTO = @IDRAPPORTO
			AND TipologiaElemento='S' AND PROVVIGIONE1=0
		
	OPEN CURR_RAPFAT
		FETCH NEXT FROM CURR_RAPFAT INTO @idRigaMateriali, @CodArticolo, @PROVVIGIONE1, @CodAgente1, @DSCAGENTE
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
				SET @MESSAGGIOERRORE = 'Attenzione per la riga ' + LTRIM(@idRigaMateriali) + ' di addebito Servizi Accessori ' + RTRIM(@CodArticolo) + ' la provvigione dell'' agente ' + RTRIM(@CodAgente1) + '-' + RTRIM(@DSCAGENTE) + ' è a ZERO' 
				EXEC GRI_REG_ERRORLOG @IDSESSIONE, @MESSAGGIOERRORE 
				FETCH NEXT FROM CURR_RAPFAT INTO @idRigaMateriali, @CodArticolo, @PROVVIGIONE1, @CodAgente1, @DSCAGENTE
		END

	CLOSE CURR_RAPFAT
	DEALLOCATE CURR_RAPFAT		
		
	-- ---------------------------------------------------------------------------
	-- ---------------------- GESTIONE ORE LAVORO
	--- --------------------------------------------------------------------------		
print 'passato4'
	DECLARE @RET_ORE AS INT
	SET @RET_ORE = 0
	EXECUTE @RET_ORE = [GRI_RAPPORTI_FATTURAZIONE_ORE] @IDRAPPORTO, @IDSESSIONE

	-- NESSUN CONTROLLO PROVVIGIONE SULLE ORE PERCHE' INSERISCE SOLO I CODICI ARTICOLI E LE QTA
	-- I PREZZI/SCONTI/PROVV VENGONO CALCOLATI SECONDO STANDARD METODO
	
	-- -------- CONTROLLO PROVVIGIONE SU ORE ADDEBITO
	/*
	  -- CONTROLLO PROVVIGIONE SU Ore pachetto 9.6 i
    DECLARE CURR_RAPFATO CURSOR  LOCAL  FAST_FORWARD FOR
			SELECT REF.idRigaOreLav, 
          ISNULL(REF.CodArticolo,'') AS CodArticolo, 
          ISNULL(REF.PROVVIGIONE1, 0) AS PROVVIGIONE1,
          ISNULL(RI.CodAgente1,'') AS CodAgente1, 
          ISNULL(AA.DSCAGENTE,'') AS DSCAGENTE
      FROM ANAGRAFICAAGENTI AA
			RIGHT OUTER JOIN GRI_RAPPORTI RI ON AA.CODAGENTE = RI.CodAgente1
			RIGHT OUTER JOIN GRI_RAPPORTI_ELEMENTI_DA_FATTURARE REF ON RI.IDRAPPORTO = REF.IDRAPPORTO
      WHERE RI.IDRAPPORTO = @IDRAPPORTO
				AND TipologiaElemento='O' AND PROVVIGIONE1=0
			 
		 OPEN CURR_RAPFATO
			FETCH NEXT FROM CURR_RAPFATO INTO @idRigaOreLav, @CodArticolo, @PROVVIGIONE1, @CodAgente1, @DSCAGENTE
				
			 WHILE @@FETCH_STATUS = 0
			 BEGIN
				SET @MESSAGGIOERRORE = 'Attenzione per la riga ' + LTRIM(@idRigaOreLav) + ' di addebito ore ' + RTRIM(@CodArticolo) + ' la provvigione dell'' agente ' + RTRIM(@CodAgente1) + '-' + RTRIM(@DSCAGENTE) + ' è a ZERO' 
				PRINT 'xx'
				PRINT @MESSAGGIOERRORE
				EXEC GEM_REG_ERRORLOG @IDSESSIONE, @MESSAGGIOERRORE 
				FETCH NEXT FROM CURR_RAPFATO INTO @idRigaOreLav, @CodArticolo, @PROVVIGIONE1, @CodAgente1, @DSCAGENTE
			 END

		CLOSE CURR_RAPFATO
	DEALLOCATE CURR_RAPFATO
	*/	
print 'passato5'
	-----------------------------------------------------------------------------
	--MESSAGGIO FINALE 
	-----------------------------------------------------------------------------
	IF @RET_MATERIALI > 0 BEGIN
		SET @MESSAGGIOERRORE = @MESSAGGIOERRORE + ' + [' + LTRIM(STR(@RET_MATERIALI)) +'] RECORD MATERIALI '
	END
	IF @RET_SERVIZIACCESSORI > 0 BEGIN
		SET @MESSAGGIOERRORE = @MESSAGGIOERRORE + ' + [' + LTRIM(STR(@RET_SERVIZIACCESSORI)) +'] RECORD SERVIZI ACCESSORI '
	END	
	IF @RET_ORE > 0 BEGIN
		SET @MESSAGGIOERRORE = @MESSAGGIOERRORE + ' + [' + LTRIM(STR(@RET_ORE)) +'] RECORD ORE '
	END

	EXEC GRI_REG_ERRORLOG @IDSESSIONE, @MESSAGGIOERRORE 

	RETURN 0




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_RAPPORTI_FATTURAZIONE_PROC8] TO [Metodo98]
    AS [dbo];

