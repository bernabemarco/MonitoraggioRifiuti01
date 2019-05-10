

CREATE PROCEDURE [dbo].[PROC_CALCOLA_OF_PERIODOACQUISTATO](@PERIODO INT,
                                                           @OSSERVAZIONE INT,
                                                            @DOCUMENTI VARCHAR(250), 
                                                             @CAUSALI VARCHAR(250), 
                                                              @ALL_STATISTICS SMALLINT)
AS

BEGIN

SET NOCOUNT ON

DECLARE @SQL nVARCHAR(4000)

    SET @SQL = N'UPDATE
                    TP_PERIODI_ACQUISTATO
                 SET
                    TP_PERIODI_ACQUISTATO.[' + CAST(@PERIODO AS VARCHAR(2)) + '] = ISNULL(ARTICOLI.SUMQTA,0)
                 FROM
                    TP_PERIODI_ACQUISTATO TPV
                 LEFT JOIN
                    (
                        SELECT
                            TEM.CODART,
                            STMAG.CODDEPOSITO,
                            SUM(STMAG.QTA1UM * STMAG.GIACENZA) AS SUMQTA
                         FROM 
                            STORICOMAG STMAG, 
                            TP_PERIODI_CALCOLATI TPC,
                            TP_PERIODI_ACQUISTATO TPV,
                            TP_EXTRAMAG TEM
                         WHERE 
                            TPV.CODARTICOLO = TEM.CODART AND
                            TEM.ConsidAcq = 1 AND
                            STMAG.CODART = TPV.CODARTICOLO AND
                            STMAG.CODDEPOSITO = TPV.CODDEPOSITO AND 
                            STMAG.CodCausale In(' + @CAUSALI + ') AND 
                            STMAG.TipoDoc In(' + @DOCUMENTI + ') AND 
                            TPC.PERIODO = ' + CAST(@PERIODO AS VARCHAR(2)) + ' AND 
                            TPC.OSSERVAZIONE = TPV.PERIODOOSSERVAZIONE AND 
                            TPC.OSSERVAZIONE = ' + CAST(@OSSERVAZIONE AS VARCHAR(2)) + ' AND
                            STMAG.DATAMOV BETWEEN TPC.INIZIO AND TPC.FINE
                         GROUP BY
                            TEM.CODART,
                            TEM.OFCODARTRIF,
                            STMAG.CODDEPOSITO,
                            TPC.GIORNILAVORO
                    ) ARTICOLI
                 ON
                    ARTICOLI.CODART = TPV.CODARTICOLO AND
                    ARTICOLI.CODDEPOSITO = TPV.CODDEPOSITO'

    EXEC sp_executesql @SQL
    --select @SQL as [processing-instruction(x)] FOR XML PATH 
    
    /*Articolo di riferimento*/
    SET @SQL = N'UPDATE
                    TP_PERIODI_ACQUISTATO
                 SET
                    TP_PERIODI_ACQUISTATO.[' + CAST(@PERIODO AS VARCHAR(2)) + '] = (CASE WHEN ARTICOLI.SommaQtaStat = 0 THEN ISNULL(ARTICOLI.SUMQTA,0) ELSE (TPV.[' + CAST(@PERIODO AS VARCHAR(2)) + '] + ISNULL(ARTICOLI.SUMQTA,0)) END)
                 FROM
                    TP_PERIODI_ACQUISTATO TPV
                 LEFT JOIN
                    (
                        SELECT 
                            TEM.CODART,
                            STMAG.CODDEPOSITO,
                            SUM(STMAG.QTA1UM * STMAG.GIACENZA) AS SUMQTA,
                            (CASE WHEN TEM.OFCODARTRIF <> '''' THEN TEM.SommaQtaStat ELSE 0 END) As SommaQtaStat
                         FROM 
                            STORICOMAG STMAG, 
                            TP_PERIODI_CALCOLATI TPC,
                            TP_PERIODI_ACQUISTATO TPV,
                            TP_EXTRAMAG TEM
                         WHERE 
                            (TEM.OFCODARTRIF <> '''' AND TEM.OFCODARTRIF IS NOT NULL) AND
                            TPV.CODARTICOLO = TEM.OFCODARTRIF AND
                            TEM.ConsidAcq = 1 AND
                            STMAG.CODART = TPV.CODARTICOLO AND
                            STMAG.CODDEPOSITO = TPV.CODDEPOSITO AND 
                            STMAG.CodCausale In(' + @CAUSALI + ') AND 
                            STMAG.TipoDoc In(' + @DOCUMENTI + ') AND 
                            TPC.PERIODO = ' + CAST(@PERIODO AS VARCHAR(2)) + ' AND 
                            TPC.OSSERVAZIONE = TPV.PERIODOOSSERVAZIONE AND 
                            TPC.OSSERVAZIONE = ' + CAST(@OSSERVAZIONE AS VARCHAR(2)) + ' AND
                            STMAG.DATAMOV BETWEEN TPC.INIZIO AND TPC.FINE
                         GROUP BY
                            TEM.CODART,
                            TEM.OFCODARTRIF,
                            STMAG.CODDEPOSITO,
                            TPC.GIORNILAVORO,
                            TEM.SommaQtaStat
                    ) ARTICOLI
                 ON
                    ARTICOLI.CODART = TPV.CODARTICOLO AND
                    ARTICOLI.CODDEPOSITO = TPV.CODDEPOSITO'

    EXEC sp_executesql @SQL
    --select @SQL as [processing-instruction(x)] FOR XML PATH 
RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLA_OF_PERIODOACQUISTATO] TO [Metodo98]
    AS [dbo];

