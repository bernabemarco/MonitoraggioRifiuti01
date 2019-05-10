


CREATE PROCEDURE [dbo].[MYTHO_SETusers_TMP]
    @Where  NVARCHAR(MAX) ='',
    @IdSessione DECIMAL(5,0),
    @ProgressivoMapping DECIMAL(10,0),
    @ErrorMessage VARCHAR(MAX)  =''  OUTPUT 
AS


BEGIN

    DECLARE @ColumnsSelect NVARCHAR(MAX)
    DECLARE @ColumnsInsert NVARCHAR(MAX)
    DECLARE @QueryCMD NVARCHAR(MAX)



    IF @Where =''
        SET @Where = 'CHANGED = 0 AND 1=1'

    ELSE
        SET @Where =  'CHANGED = 0 AND '+ @Where


    BEGIN TRY

		EXEC MYTHO_SETCODUSER

        DELETE FROM MYTHO_Users_TMP WHERE CHANGED=0


        SELECT @ColumnsSelect =   COALESCE(@ColumnsSelect + ',' + [Valore] + ' AS ['+ [Nome Colonna] +']'
                ,'' + CASE UPPER([Nome Colonna]) WHEN 'IDUSER' THEN '' ELSE  [Valore] + ' AS ['+[Nome Colonna]+']' END  )
        FROM 
         [MYTHO_Mapping_Colonne] cln
            Inner Join [dbo].[MYTHO_Mapping] ma On ma.progressivo = cln.rifprogressivo
        WHERE ma.Oggetto =2  and Progressivo = @ProgressivoMapping   and ( valore is not null   ) 
                            order by  [Nome Colonna]



        SELECT @ColumnsInsert =   COALESCE(@ColumnsInsert + ', '+ [Nome Colonna] +''
                ,''+[Nome Colonna]+'')
        FROM 
         [MYTHO_Mapping_Colonne] cln
            Inner Join [dbo].[MYTHO_Mapping] ma On ma.progressivo = cln.rifprogressivo
        where ma.Oggetto =2 and Progressivo = @ProgressivoMapping and (valore is not null and valore <>'')
                            order by  [Nome Colonna]


        SET @ColumnsSelect = 'SELECT CODICE, ' + CAST(@IDSESSIONE As VARCHAR(5)) + ', ' + @ColumnsSelect + ' FROM Vista_MYTHO_Users  WHERE ' + @Where
        --Print @ColumnsSelect

        SET @QueryCMD = 'INSERT INTO MYTHO_Users_TMP (CODICEMETODO,IdSessione,' + @ColumnsInsert + ') ' + @ColumnsSelect

        BEGIN TRAN QueryExecUser

        --print @QueryCMD
        exec sp_executesql  @QueryCMD


        commit Tran QueryExecUser
        RETURN 0 

    END TRY
BEGIN CATCH
    ROLLBACK 
        
    SET @ErrorMessage = ERROR_MESSAGE()
    RETURN -1 

END CATCH

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MYTHO_SETusers_TMP] TO [Metodo98]
    AS [dbo];

