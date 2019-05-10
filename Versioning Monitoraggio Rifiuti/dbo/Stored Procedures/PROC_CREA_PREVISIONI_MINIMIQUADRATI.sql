

CREATE PROCEDURE [dbo].[PROC_CREA_PREVISIONI_MINIMIQUADRATI]
--ENCRY--
AS

BEGIN

SET NOCOUNT ON

DECLARE @SqlQuery nVarchar(4000)

    /*ARTICOLI PER PREVISIONE MINIMI QUADRATI*/
    DELETE FROM TP_STAGIONALE_PREVISIONI WHERE TIPO = 'MQ'

    SET @SqlQuery = N'INSERT INTO TP_STAGIONALE_PREVISIONI(CODARTICOLO,CODDEPOSITO,TIPO,[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],UTENTEMODIFICA,DATAMODIFICA)
                      SELECT 
                        CODART,
                        CODDEPOSITO,
                        ''MQ'',
                        [1],
                        [2],
                        [3],
                        [4],
                        [5],
                        [6],
                        [7],
                        [8],
                        [9],
                        [10],
                        [11],
                        [12],
                        USER_NAME(),
                        GETDATE() 
                      FROM
                      (
                      SELECT 
                        CODART,
                        CODDEPOSITO,
                        [1] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 1) THEN (12 - ABS(MONTH(GETDATE()) - 1) + 1) ELSE ((1 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [2] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 2) THEN (12 - ABS(MONTH(GETDATE()) - 2) + 1) ELSE ((2 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [3] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 3) THEN (12 - ABS(MONTH(GETDATE()) - 3) + 1) ELSE ((3 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [4] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 4) THEN (12 - ABS(MONTH(GETDATE()) - 4) + 1) ELSE ((4 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [5] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 5) THEN (12 - ABS(MONTH(GETDATE()) - 5) + 1) ELSE ((5 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [6] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 6) THEN (12 - ABS(MONTH(GETDATE()) - 6) + 1) ELSE ((6 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [7] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 7) THEN (12 - ABS(MONTH(GETDATE()) - 7) + 1) ELSE ((7 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [8] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 8) THEN (12 - ABS(MONTH(GETDATE()) - 8) + 1) ELSE ((8 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [9] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 9) THEN (12 - ABS(MONTH(GETDATE()) - 9) + 1) ELSE ((9 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [10] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 10) THEN (12 - ABS(MONTH(GETDATE()) - 10) + 1) ELSE ((10 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [11] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 11) THEN (12 - ABS(MONTH(GETDATE()) - 11) + 1) ELSE ((11 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '],
                        [12] AS [' + CAST((CASE WHEN (MONTH(GETDATE()) > 12) THEN (12 - ABS(MONTH(GETDATE()) - 12) + 1) ELSE ((12 - MONTH(GETDATE())) + 1) END) AS nVARCHAR(2)) + '] 
                      FROM 
                        TP_VISTAPREVISIONI_TREND_STAGIONALITA 
                      WHERE 
                        TIPO = ''previsioni'' 
                      ) MQ
                      ORDER BY 
                        CODART,CODDEPOSITO'

    EXEC sp_executesql @SqlQuery
    
RETURN

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_PREVISIONI_MINIMIQUADRATI] TO [Metodo98]
    AS [dbo];

