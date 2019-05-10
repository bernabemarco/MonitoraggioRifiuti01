

CREATE PROCEDURE [dbo].[PROC_CALCOLA_OF_STAGIONALEVENDUTO](@PERIODO INT,
                                                            @OSSERVAZIONE INT,
                                                             @DOCUMENTI VARCHAR(250), 
                                                              @CAUSALI VARCHAR(250),
                                                               @ALL_STATISTICS SMALLINT)
AS

BEGIN

SET NOCOUNT ON

DECLARE @SQL nVARCHAR(4000)

    SET @SQL = N'UPDATE
                    TP_STAGIONALE_VENDUTO
                 SET
                    TP_STAGIONALE_VENDUTO.[' + CAST(@PERIODO AS VARCHAR(2)) + '] = ISNULL(ARTICOLI.SUMQTA,0)
                 FROM
                    TP_STAGIONALE_VENDUTO TSV
                 LEFT JOIN
                    (
                        SELECT 
                            TEM.CODART,
                            STMAG.CODDEPOSITO,
                            SUM(STMAG.QTA1UM * (STMAG.GIACENZA * -1)) AS SUMQTA
                         FROM 
                            STORICOMAG STMAG, 
                            TP_STAGIONALE_CALCOLATI TSC,
                            TP_STAGIONALE_VENDUTO TSV,
                            TP_EXTRAMAG TEM
                         WHERE 
                            TSV.CODARTICOLO = (CASE WHEN (((TEM.OFCODARTRIF <> '''') AND (TEM.OFCODARTRIF IS NOT NULL)) And ' + CAST(@ALL_STATISTICS AS VARCHAR(2)) + ' = 0) THEN TEM.OFCODARTRIF ELSE TEM.CODART END) AND
                            TEM.ConsidAcq = 1 AND
                            STMAG.CODART = TSV.CODARTICOLO AND
                            STMAG.CODDEPOSITO = TSV.CODDEPOSITO AND 
                            STMAG.CodCausale In(' + @CAUSALI + ') AND 
                            STMAG.TipoDoc In(' + @DOCUMENTI + ') AND 
                            TSC.PERIODO = ' + CAST(@PERIODO AS VARCHAR(2)) + ' AND 
                            TSC.OSSERVAZIONE = TSV.PERIODOOSSERVAZIONE AND 
                            TSC.OSSERVAZIONE = ' + CAST(@OSSERVAZIONE AS VARCHAR(2)) + ' AND
                            STMAG.DATAMOV BETWEEN TSC.INIZIO AND TSC.FINE
                         GROUP BY
                            TEM.CODART,
                            TEM.OFCODARTRIF,
                            STMAG.CODDEPOSITO
                    ) ARTICOLI
                 ON
                    ARTICOLI.CODART = TSV.CODARTICOLO AND
                    ARTICOLI.CODDEPOSITO = TSV.CODDEPOSITO'
                    
    EXEC sp_executesql @SQL
    --select @SQL as [processing-instruction(x)] FOR XML PATH 
    
RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLA_OF_STAGIONALEVENDUTO] TO [Metodo98]
    AS [dbo];

