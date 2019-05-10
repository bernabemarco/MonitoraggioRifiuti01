

CREATE PROCEDURE [dbo].[PROC_CALCOLA_OF_STAGIONALEORDINATO](@PERIODO INT,
                                                             @OSSERVAZIONE INT,
                                                              @ALL_STATISTICS SMALLINT)
AS

BEGIN

SET NOCOUNT ON

DECLARE @SQL nVARCHAR(4000)

    SET @SQL = N'UPDATE
                    TP_STAGIONALE_ORDINATO
                 SET
                    TP_STAGIONALE_ORDINATO.[' + CAST(@PERIODO AS VARCHAR(2)) + '] = ISNULL(ARTICOLI.SUMQTA,0)
                 FROM
                    TP_STAGIONALE_ORDINATO TSA
                 LEFT JOIN
                    (
                        SELECT 
                            TEM.CODART,
                            STMAG.CODDEPOSITO,
                            SUM(STMAG.QTA1UM) AS SUMQTA
                         FROM 
                            STORICOMAG STMAG, 
                            TP_STAGIONALE_CALCOLATI TSC,
                            TP_STAGIONALE_ORDINATO TSA,
                            TP_EXTRAMAG TEM
                         WHERE 
                            TSA.CODARTICOLO = (CASE WHEN (((TEM.OFCODARTRIF <> '''') AND (TEM.OFCODARTRIF IS NOT NULL)) And ' + CAST(@ALL_STATISTICS AS VARCHAR(2)) + ' = 0) THEN TEM.OFCODARTRIF ELSE TEM.CODART END) AND
                            TEM.ConsidAcq = 1 AND
                            STMAG.CODART = TSA.CODARTICOLO AND
                            STMAG.CODDEPOSITO = TSA.CODDEPOSITO AND 
                            STMAG.Ordinato = 1 AND
                            TSC.PERIODO = ' + CAST(@PERIODO AS VARCHAR(2)) + ' AND 
                            TSC.OSSERVAZIONE = TSA.PERIODOOSSERVAZIONE AND 
                            TSC.OSSERVAZIONE = ' + CAST(@OSSERVAZIONE AS VARCHAR(2)) + ' AND
                            STMAG.DATAMOV BETWEEN TSC.INIZIO AND TSC.FINE
                         GROUP BY
                            TEM.CODART,
                            TEM.OFCODARTRIF,
                            STMAG.CODDEPOSITO
                    ) ARTICOLI
                 ON
                    ARTICOLI.CODART = TSA.CODARTICOLO AND
                    ARTICOLI.CODDEPOSITO = TSA.CODDEPOSITO'
                    
    EXEC sp_executesql @SQL
    --select @SQL as [processing-instruction(x)] FOR XML PATH
    
RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLA_OF_STAGIONALEORDINATO] TO [Metodo98]
    AS [dbo];

