CREATE PROCEDURE [dbo].[GEM_PC_INS_ELEMENTIFATT] ( @IDCONTRATTO AS varchar(13)
	,@SEZIONECONTRATTO AS decimal(5,0)
		,@IDRAPPORTO AS varchar(14)
		,@IDRAPPORTO_RIF AS varchar(14)
		,@TipologiaElemento AS varchar(1)
		,@idRigaAttvita AS decimal(5,0)
		,@idRigaMateriali AS decimal(5,0)
		,@idRigaOreLav AS decimal(5,0)
		,@idRigaRata AS decimal(5,0)
		,@CodArticolo AS varchar(50)
		,@DscrizioneRiga AS varchar(255)
		,@QTA AS decimal(12,4)
		,@PREZZO AS decimal(12,4)
		,@SCONTO AS decimal(10,2)
		,@PROVVIGIONE1 AS decimal(10,2)
		,@PROVVIGIONE2 AS decimal(10,2)
		,@PROVVIGIONE3 AS decimal(10,2)
		,@TipoFatturazione AS varchar(20)
		,@Validita AS varchar(20)
		,@Posizione as int  = 1000
		,@IDSESSIONE as int  = 0
		)

AS
DECLARE @IdRiga AS decimal(5,0)
DECLARE @MESSAGGIOERRORE		AS VARCHAR(255)


	

	--calcolo il nuovo progressivi riga all'interno del 
	--SELECT @IdRiga = isnull(max(IDRIGA),0)+1
	--FROM GEM_SEZIONE_CONTRATTO_RAPPORTI_ELEMENTI_DA_FATTURARE
	--WHERE  [IDCONTRATTO] = @IDCONTRATTO
 --          AND [SEZIONECONTRATTO] = @SEZIONECONTRATTO
 --          AND [IDRAPPORTO] = @IDRAPPORTO

	SELECT @IdRiga = isnull(max(IDRIGA),0)+1
	FROM GEM_SEZIONE_CONTRATTO_RAPPORTI_ELEMENTI_DA_FATTURARE
	WHERE  [IDCONTRATTO] = @IDCONTRATTO
           AND [IDRAPPORTO_RIF] = @IDRAPPORTO_RIF

	IF @TipologiaElemento <> 'D' and isnull(@CodArticolo,'') <> '' BEGIN
		SELECT @DscrizioneRiga=isnull(Descrizione,@DscrizioneRiga)
		from anagraficaarticoli
		where codice = @CodArticolo
	END 

	INSERT INTO [GEM_SEZIONE_CONTRATTO_RAPPORTI_ELEMENTI_DA_FATTURARE]
           ([IDCONTRATTO]
           ,[SEZIONECONTRATTO]
           ,[IDRAPPORTO]
           ,[IdRiga]
           ,[IDRAPPORTO_RIF]
           ,[TipologiaElemento]
           ,[idRigaAttvita]
           ,[idRigaMateriali]
           ,[idRigaOreLav]
           ,[idRigaRata]
           ,[CodArticolo]
           ,[DscrizioneRiga]
           ,[QTA]
           ,[PREZZO]
           ,[SCONTO]
           ,[PROVVIGIONE1]
           ,[PROVVIGIONE2]
           ,[PROVVIGIONE3]
           ,[TipoFatturazione]
           ,[Validita]
           ,[Posizione]
           ,[UTENTEMODIFICA]
           ,[DATAMODIFICA])
     VALUES
           (@IDCONTRATTO
           ,@SEZIONECONTRATTO 
           ,@IDRAPPORTO
           ,@IdRiga
           ,@IDRAPPORTO_RIF
           ,@TipologiaElemento 
           ,@idRigaAttvita
           ,@idRigaMateriali 
           ,@idRigaOreLav 
           ,@idRigaRata
           ,@CodArticolo
           ,@DscrizioneRiga 
           ,@QTA 
           ,@PREZZO 
           ,@SCONTO 
           ,@PROVVIGIONE1 
           ,@PROVVIGIONE2 
           ,@PROVVIGIONE3 
           ,@TipoFatturazione 
           ,@Validita
			,@Posizione
           ,user_name()
           ,getdate()
			)

		--Warning se prezzo = 0 e riga non descrittiva
		IF @TipologiaElemento <> 'D' and isnull(@PREZZO,0) = 0 and @CodArticolo<>'' 
		BEGIN

			SET @MESSAGGIOERRORE = 'ELAB RAPPORTO: [' +  @IDRAPPORTO + ']: TROVATO PREZZO A ZERO PER ARTICOLO [' + @CodArticolo + ']'

			EXEC GEM_REG_ERRORLOG @IDSESSIONE, @MESSAGGIOERRORE 

		END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_PC_INS_ELEMENTIFATT] TO [Metodo98]
    AS [dbo];

