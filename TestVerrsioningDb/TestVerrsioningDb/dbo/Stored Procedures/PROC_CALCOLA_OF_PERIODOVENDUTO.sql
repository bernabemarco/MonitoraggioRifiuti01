


CREATE PROCEDURE [dbo].[PROC_CALCOLA_OF_PERIODOVENDUTO](@PERIODO INT,
                                                         @OSSERVAZIONE INT,
                                                          @DOCUMENTI VARCHAR(250), 
                                                           @CAUSALI VARCHAR(250), 
                                                            @ALL_STATISTICS SMALLINT)
AS

BEGIN

SET NOCOUNT ON

DECLARE @SQL nVARCHAR(4000)
    
    SET @SQL = N'UPDATE
                    TP_PERIODI_VENDUTO
                 SET
                    TP_PERIODI_VENDUTO.[' + CAST(@PERIODO AS VARCHAR(2)) + '] = ISNULL(ARTICOLI.SUMQTA,0),
                    TP_PERIODI_VENDUTO.[P_' + CAST(@PERIODO AS VARCHAR(2)) + '] = ISNULL(ARTICOLI.SUMPREZZO,0),
                    TP_PERIODI_VENDUTO.[M_' + CAST(@PERIODO AS VARCHAR(2)) + '] = ISNULL(ARTICOLI.SUMQTAMEDIA,0)
                 FROM
                    TP_PERIODI_VENDUTO TPV
                 LEFT JOIN
                    (
                        SELECT 
                            TEM.CODART,
                            STMAG.CODDEPOSITO,
                            SUM(STMAG.QTA1UM * (STMAG.GIACENZA * -1)) AS SUMQTA,
                            SUM(STMAG.IMPORTOTOTNETTOEURO * (STMAG.GIACENZA * -1)) AS SUMPREZZO,
                            (SUM(STMAG.QTA1UM) / ISNULL(NULLIF(TPC.GIORNILAVORO,0),1)) AS SUMQTAMEDIA
                         FROM 
                            STORICOMAG STMAG, 
                            TP_PERIODI_CALCOLATI TPC,
                            TP_PERIODI_VENDUTO TPV,
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
                    TP_PERIODI_VENDUTO
                 SET
                    TP_PERIODI_VENDUTO.[' + CAST(@PERIODO AS VARCHAR(2)) + '] = (CASE WHEN ARTICOLI.SommaQtaStat = 0 THEN ISNULL(ARTICOLI.SUMQTA,0) ELSE (TPV.[' + CAST(@PERIODO AS VARCHAR(2)) + '] + ISNULL(ARTICOLI.SUMQTA,0)) END),
                    TP_PERIODI_VENDUTO.[P_' + CAST(@PERIODO AS VARCHAR(2)) + '] = (CASE WHEN ARTICOLI.SommaQtaStat = 0 THEN ISNULL(ARTICOLI.SUMPREZZO,0) ELSE (TPV.[P_' + CAST(@PERIODO AS VARCHAR(2)) + '] + ISNULL(ARTICOLI.SUMPREZZO,0)) END),
                    TP_PERIODI_VENDUTO.[M_' + CAST(@PERIODO AS VARCHAR(2)) + '] = (CASE WHEN ARTICOLI.SommaQtaStat = 0 THEN ISNULL(ARTICOLI.SUMQTAMEDIA,0) ELSE (TPV.[M_' + CAST(@PERIODO AS VARCHAR(2)) + '] + ISNULL(ARTICOLI.SUMQTAMEDIA,0)) END)
                 FROM
                    TP_PERIODI_VENDUTO TPV
                 LEFT JOIN
                    (
                        SELECT 
                            TEM.CODART,
                            STMAG.CODDEPOSITO,
                            SUM(STMAG.QTA1UM * (STMAG.GIACENZA * -1)) AS SUMQTA,
                            SUM(STMAG.IMPORTOTOTNETTOEURO * (STMAG.GIACENZA * -1)) AS SUMPREZZO,
                            (SUM(STMAG.QTA1UM) / ISNULL(NULLIF(TPC.GIORNILAVORO,0),1)) AS SUMQTAMEDIA,
                            (CASE WHEN TEM.OFCODARTRIF <> '''' THEN TEM.SommaQtaStat ELSE 0 END) As SommaQtaStat
                         FROM 
                            STORICOMAG STMAG, 
                            TP_PERIODI_CALCOLATI TPC,
                            TP_PERIODI_VENDUTO TPV,
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
    ON OBJECT::[dbo].[PROC_CALCOLA_OF_PERIODOVENDUTO] TO [Metodo98]
    AS [dbo];

