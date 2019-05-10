


CREATE PROCEDURE [dbo].[MYTHO_SETListiniArticoli_TMP]
  
AS

BEGIN

    /** Listini ***********************************/

    IF OBJECT_ID('tempdb.dbo.##Listini') IS NOT NULL
    BEGIN
      DROP TABLE ##Listini;
    END

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
                WHERE LS.UM = PREF.UM AND TIPOUM = (SELECT TIPOUM FROM [MYTHO_Parametri] WHERE PROGRESSIVO = 1 AND 1=0)
            
            ) x
            pivot 
            (
                MAX(PREZZO)
                FOR NRLISTINO IN  (' + @cols + ') 
            ) p '


    execute sp_executesql @query



    RETURN 0 

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MYTHO_SETListiniArticoli_TMP] TO [Metodo98]
    AS [dbo];

