

CREATE PROCEDURE [dbo].[GL_Proc_ElencoListiniNonAggiornati](@IdSessione Decimal(5,0), 
                                                             @SqlWhere varchar(MAX), 
                                                              @DataValiditaNuova varchar(8))

AS

BEGIN

SET NOCOUNT ON 

DECLARE @SqlBase        Varchar(MAX)

    DELETE FROM GL_ElencoListiniNonAggiornati WHERE IDSESSIONE = @IdSessione;
    
    SET @SqlBase = '';
    
    IF (ISNUMERIC(@DataValiditaNuova) = 0)
    SET @DataValiditaNuova = '';

    /*Query*/
    SELECT @SqlBase = CAST('INSERT INTO [dbo].[GL_ElencoListiniNonAggiornati]
                                        ([IDSESSIONE]
                                        ,[CODART]
                                        ,[NRLISTINO]
                                        ,[UM]
                                        ,[DataVal]
                                        ,[DataVal_New]
                                        ,[TP_Tipo]
                                        ,[CodConto]
                                        ,[PREZZO]
                                        ,[PREZZOEURO]
                                        ,[UTENTEMODIFICA]
                                        ,[DATAMODIFICA])
                            SELECT
                                    ' + CAST(@IdSessione AS VARCHAR(5))  + '
                                    ,[CODART]
                                    ,[NRLISTINO]
                                    ,[UM]
                                    ,[DataVal]
                                    ,' + (CASE WHEN @DataValiditaNuova <> '' THEN '''' + @DataValiditaNuova + '''' ELSE '[DataVal]' END) + '
                                    ,[TP_Tipo]
                                    ,[TP_CodConto]
                                    ,[PREZZO]
                                    ,[PREZZOEURO]
                                    ,User_Name()
                                    ,GetDate()
                                FROM [dbo].[GL_View_ElencoListiniNonAggiornati] ' + (CASE WHEN @SqlWhere <> '' THEN ' WHERE ' + @SqlWhere ELSE '' END) AS Varchar(MAX))
        
    /*DEBUG*/
    ---select @SqlBase as [processing-instruction(x)] FOR XML PATH;
    
    EXEC(@SqlBase);
                   
END
    

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GL_Proc_ElencoListiniNonAggiornati] TO [Metodo98]
    AS [dbo];

