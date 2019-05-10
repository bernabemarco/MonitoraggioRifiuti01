
CREATE PROCEDURE DBO.GEM_InsLogRapportoRataEab ( @idSessione int, @IDRAPPORTO varchar(14), @IDContratto varchar(13), @NumeroRata numeric )
as 



INSERT INTO [dbo].[GEM_LogRapportoRataElab]
           ([idSessione]
           ,[IDRAPPORTO]
           ,[IDContratto]
           ,[NumeroRata]
           ,[DataModifica]
           ,[UtenteModifica])
     VALUES (

			@idSessione
           ,@IDRAPPORTO
           ,@IDContratto
           ,@NumeroRata
           ,getdate()
           ,user_name()
	)



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_InsLogRapportoRataEab] TO [Metodo98]
    AS [dbo];

