
-- --------------------------------------------------------------------------------------
-- Funzione : GRI_REG_ERRORLOG
-- Autore   : Moreno Feletto
-- Data    	: 16.05.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_REG_ERRORLOG] (  @IDSESSIONE INT, @SMESSAGGIO AS VARCHAR(255)  ) AS
BEGIN
	DECLARE @IDRIGA		AS INT

	--calcolo il nuovo progressivi riga all'interno del 
	SELECT @IdRiga = ISNULL(max(IDRIGA),0)+1
	FROM GRI_LogControlloFatturazione
	WHERE  [idSessione] = @IDSESSIONE
	
	INSERT INTO [GRI_LogControlloFatturazione]
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
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_REG_ERRORLOG] TO [Metodo98]
    AS [dbo];

