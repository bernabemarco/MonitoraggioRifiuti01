

CREATE PROCEDURE [dbo].[Proc_Vendors_StatisticheAgente](@IDSESSIONE DECIMAL(5,0),@CODAGENTE nVARCHAR(7))
AS
BEGIN
DECLARE @DOC VARCHAR(250)
DECLARE @CAU VARCHAR(250)
DECLARE @SQL nVARCHAR(4000)
    SELECT  
        @DOC = ISNULL(NULLIF(DOCUMENTI_RG1,''),'') + ',' + ISNULL(NULLIF(DOCUMENTI_RG2,''),'') + ',' + ISNULL(NULLIF(DOCUMENTI_RG3,''),''),
        @CAU = ISNULL(NULLIF(CAUSALI_RG1,''),0) + ',' + ISNULL(NULLIF(CAUSALI_RG2,''),0) + ',' +  ISNULL(NULLIF(CAUSALI_RG3,''),0)
    FROM 
        TP_DOCSTATAG WHERE CODAGENTE = @CODAGENTE
    SET @DOC = '''' + REPLACE(@DOC,',',''',''') + ''''
    SET @SQL = N'SELECT 
                    CODART,
                    CODDEPOSITO,
                    CODCLIFOR,
                    ESERCIZIO,
                    SUM(CASE WHEN MONTH(DATAMOV)= 1 THEN QTA1UM ELSE 0 END) AS "M1",
                    SUM(CASE WHEN MONTH(DATAMOV)= 2 THEN QTA1UM ELSE 0 END) AS "M2",
                    SUM(CASE WHEN MONTH(DATAMOV)= 3 THEN QTA1UM ELSE 0 END) AS "M3",
                    SUM(CASE WHEN MONTH(DATAMOV)= 4 THEN QTA1UM ELSE 0 END) AS "M4",
                    SUM(CASE WHEN MONTH(DATAMOV)= 5 THEN QTA1UM ELSE 0 END) AS "M5",
                    SUM(CASE WHEN MONTH(DATAMOV)= 6 THEN QTA1UM ELSE 0 END) AS "M6",
                    SUM(CASE WHEN MONTH(DATAMOV)= 7 THEN QTA1UM ELSE 0 END) AS "M7",
                    SUM(CASE WHEN MONTH(DATAMOV)= 8 THEN QTA1UM ELSE 0 END) AS "M8",
                    SUM(CASE WHEN MONTH(DATAMOV)= 9 THEN QTA1UM ELSE 0 END) AS "M9",
                    SUM(CASE WHEN MONTH(DATAMOV)= 10 THEN QTA1UM ELSE 0 END) AS "M10",
                    SUM(CASE WHEN MONTH(DATAMOV)= 11 THEN QTA1UM ELSE 0 END) AS "M11",
                    SUM(CASE WHEN MONTH(DATAMOV)= 12 THEN QTA1UM ELSE 0 END) AS "M12"
                FROM 
                    STORICOMAG 
                WHERE 
                    CODART IN(SELECT DISTINCT CODICE FROM Tp_ElencoVariazioni WHERE MODCHIAVE = ' + CAST(@IDSESSIONE AS VARCHAR(5)) + ') AND
                    CODCLIFOR IN(SELECT DISTINCT CODCONTO FROM TP_CLIENTIEXPORT WHERE MODCHIAVE = ' + CAST(@IDSESSIONE AS VARCHAR(5)) + ') AND
                    CODCAUSALE IN(' + @CAU + ') AND
                    TIPODOC IN(' + @DOC + ') AND
                    DATAMOV >= (SELECT ULTPREPAR FROM TP_TRASFAGENTI WHERE CODAGENTE = ''' + @CODAGENTE + ''')
                GROUP BY 
                    CODART,
                    CODDEPOSITO,
                    CODCLIFOR,
                    ESERCIZIO'
                    
    EXEC sp_executesql @SQL
    
    --PRINT @SQL
RETURN
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_Vendors_StatisticheAgente] TO [Metodo98]
    AS [dbo];

