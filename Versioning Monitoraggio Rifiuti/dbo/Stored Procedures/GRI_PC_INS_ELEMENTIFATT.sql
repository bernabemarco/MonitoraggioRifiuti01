


-- --------------------------------------------------------------------------------------
-- Funzione  : Inserisce nuovi Rapporti Intervento da fatturare
-- Autore   : Moreno Feletto
-- Data    : 05.05.2016
-- --------------------------------------------------------------------------------------				 
CREATE PROCEDURE [dbo].[GRI_PC_INS_ELEMENTIFATT] ( 
																									@IDRAPPORTO AS varchar(14)
																									,@IDRAPPORTO_RIF AS varchar(14)
																									,@TipologiaElemento AS varchar(1)
																									,@idRigaMateriali AS decimal(5,0)
																									,@idRigaServizi AS decimal(5,0)
																									,@idRigaOreLav AS decimal(5,0)
																									,@CodArticolo AS varchar(50)
																									,@DscrizioneRiga AS varchar(255)
																									,@QTA AS decimal(12,4)
																									,@PREZZO AS decimal(12,4)
																									,@SCONTO AS decimal(10,5)
																									,@PROVVIGIONE1 AS decimal(10,2)
																									,@PROVVIGIONE2 AS decimal(10,2)
																									,@PROVVIGIONE3 AS decimal(10,2)
																									,@Posizione as int = 1000
																									,@IDSESSIONE as int = 0
																									)
AS
	DECLARE @IdRiga AS decimal(5,0)
	DECLARE @MESSAGGIOERRORE		AS VARCHAR(255)

	-- Calcolo il nuovo progressivo riga
	SELECT @IdRiga = ISNULL(MAX(IDRIGA),0)+1
	FROM GRI_RAPPORTI_ELEMENTI_DA_FATTURARE
	WHERE [IDRAPPORTO] = @IDRAPPORTO

	IF @TipologiaElemento <> 'D' and ISNULL(@CodArticolo,'') <> '' BEGIN
		SELECT @DscrizioneRiga=ISNULL(Descrizione, @DscrizioneRiga)
		FROM AnagraficaArticoli
		WHERE Codice = @CodArticolo
	END 
				 
	INSERT INTO [GRI_RAPPORTI_ELEMENTI_DA_FATTURARE]
      ([IDRAPPORTO]
      ,[IdRiga]
      ,[IDRAPPORTO_RIF]
      ,[TipologiaElemento]
      ,[idRigaMateriali]
			,[idRigaServizi]
      ,[idRigaOreLav]
      ,[CodArticolo]
      ,[DscrizioneRiga]
      ,[QTA]
      ,[PREZZO]
      ,[SCONTO]
      ,[PROVVIGIONE1]
      ,[PROVVIGIONE2]
      ,[PROVVIGIONE3]
      ,[Posizione]
      ,[UTENTEMODIFICA]
      ,[DATAMODIFICA])
   VALUES
						(@IDRAPPORTO
						,@IdRiga
						,@IDRAPPORTO_RIF
						,@TipologiaElemento 
						,@idRigaMateriali 
						,@idRigaServizi 
						,@idRigaOreLav 
						,@CodArticolo
						,@DscrizioneRiga 
						,@QTA 
						,@PREZZO 
						,@SCONTO 
						,@PROVVIGIONE1 
						,@PROVVIGIONE2 
						,@PROVVIGIONE3 
						,@Posizione
						,USER_NAME()
						,GETDATE() )

		--Warning se prezzo = 0 e riga non descrittiva
		IF @TipologiaElemento <> 'D' and ISNULL(@PREZZO,0) = 0 BEGIN
			SET @MESSAGGIOERRORE = 'ELAB RAPPORTO INTERVENTO: [' + @IDRAPPORTO + ']: TROVATO PREZZO A ZERO PER ARTICOLO [' + @CodArticolo + ']'
			EXEC GRI_REG_ERRORLOG @IDSESSIONE, @MESSAGGIOERRORE 
		END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_PC_INS_ELEMENTIFATT] TO [Metodo98]
    AS [dbo];

