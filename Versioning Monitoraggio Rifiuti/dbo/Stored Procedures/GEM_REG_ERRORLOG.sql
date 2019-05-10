
CREATE PROCEDURE GEM_REG_ERRORLOG (  @IDSESSIONE INT, @SMESSAGGIO AS VARCHAR(255)  )
AS

	DECLARE @IDRIGA		AS INT

	--calcolo il nuovo progressivi riga all'interno del 
	SELECT @IdRiga = isnull(max(IDRIGA),0)+1
	FROM GEM_LogControlloFatturazione
	WHERE  [idSessione] = @IDSESSIONE
	
	INSERT INTO [GEM_LogControlloFatturazione]
           ([idSessione]
           ,[idRiga]
           ,[Messaggio]
           ,[DataModifica]
           ,[UtenteModifica])
     VALUES (
			@idSessione
           ,@idRiga
           ,@SMESSAGGIO
           ,GETDATE()
           ,USER_NAME()
	)

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_REG_ERRORLOG] TO [Metodo98]
    AS [dbo];

