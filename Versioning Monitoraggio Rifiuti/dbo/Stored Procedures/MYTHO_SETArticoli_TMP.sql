


CREATE PROCEDURE [dbo].[MYTHO_SETArticoli_TMP]
    @Where  NVARCHAR(MAX) ='',
    @IdSessione DECIMAL(5,0),
    @ProgressivoMapping DECIMAL(10,0) ,
    @ErrorMessage VARCHAR(MAX)  =''  OUTPUT 
AS


BEGIN 

BEGIN TRY

    DECLARE @ColumnsSelect NVARCHAR(MAX)
    DECLARE @ColumnsInsert NVARCHAR(MAX)
    DECLARE @QueryCMD NVARCHAR(MAX)

    IF @Where =''
        SET @Where = 'CHANGED = 0 AND 1=1'

    ELSE
        SET @Where =  'CHANGED = 0 AND '+ @Where

    DELETE FROM MYTHO_Articoli_TMP Where changed = 0
    IF OBJECT_ID('tempdb.dbo.##Listini') IS NOT NULL
    BEGIN
      DROP TABLE ##Listini;
    END

    /** Listini ***********************************/


    DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)

    SELECT @cols = STUFF((SELECT ',' + QUOTENAME(NRLISTINO) 
                        from TABLISTINI
                  
                FOR XML PATH(''), TYPE
                ).value('.', 'NVARCHAR(MAX)') 
            ,1,1,'')



    SET @query = 'SELECT * INTO ##Listini FROM 
             (
                SELECT   LS.CODART, PREZZO, NRLISTINO as NRLISTINO , LS.UM
                from LISTINIARTICOLI LS
                INNER JOIN  [ARTICOLIUMPREFERITE] PREF
                ON LS.CODART = PREF.CODART 
                WHERE LS.UM = PREF.UM AND TIPOUM = (SELECT TIPOUM FROM [MYTHO_Parametri] WHERE PROGRESSIVO = 1)
            
            ) x
            pivot 
            (
                MAX(PREZZO)
                FOR NRLISTINO IN  (' + @cols + ') 
            ) p '




    BEGIN TRAN QueryExec

    execute sp_executesql @query


    SELECT @ColumnsSelect =   COALESCE(@ColumnsSelect + ',' + [Valore] + ' AS ['+ [Nome Colonna] +']'
            ,'' + CASE UPPER([Nome Colonna]) WHEN 'ITEMSKU' THEN '' ELSE  [Valore] + ' AS ['+[Nome Colonna]+']' END  )
    FROM 
     [MYTHO_Mapping_Colonne] cln
        Inner Join [dbo].[MYTHO_Mapping] ma On ma.progressivo = cln.rifprogressivo
    WHERE ma.Oggetto =1  and ma.Progressivo=@ProgressivoMapping  and ( valore is not null   ) 
                        order by  [Nome Colonna]


    SELECT @ColumnsInsert =   COALESCE(@ColumnsInsert + ', '+ [Nome Colonna] +''
            ,''+[Nome Colonna]+'')
    FROM 
     [MYTHO_Mapping_Colonne] cln
        Inner Join [dbo].[MYTHO_Mapping] ma On ma.progressivo = cln.rifprogressivo
    where ma.Oggetto =1 and ma.Progressivo=@ProgressivoMapping  and (valore is not null and valore <>'')
                        order by  [Nome Colonna]


    SET @ColumnsSelect = 'SELECT CODICE, ' + CAST(@IDSESSIONE As VARCHAR(5)) + ', ' + @ColumnsSelect + ' FROM Vista_MYTHO_Articoli Left Outer Join ##Listini LS On LS.CODART = Vista_MYTHO_Articoli.Codice WHERE ' + @Where

    SET @QueryCMD = 'INSERT INTO MYTHO_Articoli_TMP (CODICEMETODO,IdSessione,' + @ColumnsInsert + ') ' + @ColumnsSelect


    exec sp_executesql  @QueryCMD

    COMMIT TRAN QueryExec


END TRY
BEGIN CATCH
    ROLLBACK 
                
    SET @ErrorMessage = ERROR_MESSAGE()
    

END CATCH




RETURN 0 

END 


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MYTHO_SETArticoli_TMP] TO [Metodo98]
    AS [dbo];

