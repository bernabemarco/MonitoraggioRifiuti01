

CREATE PROCEDURE dbo.PROC_ELENCO_MERCEOLOGICI(@IDSESSIONE   DECIMAL(5,0))
AS
BEGIN
    SET NOCOUNT ON 
    
    SELECT 
        (  
          (CASE WHEN [1] IS NOT NULL THEN       [1] ELSE '' END)
        + (CASE WHEN [2] IS NOT NULL THEN ',' + [2] ELSE '' END)
        + (CASE WHEN [3] IS NOT NULL THEN ',' + [3] ELSE '' END)
        + (CASE WHEN [4] IS NOT NULL THEN ',' + [4] ELSE '' END)
        + (CASE WHEN [5] IS NOT NULL THEN ',' + [5] ELSE '' END)
        + (CASE WHEN [6] IS NOT NULL THEN ',' + [6] ELSE '' END)
        + (CASE WHEN [7] IS NOT NULL THEN ',' + [7] ELSE '' END)
        + (CASE WHEN [8] IS NOT NULL THEN ',' + [8] ELSE '' END)
        + (CASE WHEN [9] IS NOT NULL THEN ',' + [9] ELSE '' END)
        + (CASE WHEN [10] IS NOT NULL THEN ',' + [10] ELSE '' END)
        + (CASE WHEN [11] IS NOT NULL THEN ',' + [11] ELSE '' END)
        + (CASE WHEN [12] IS NOT NULL THEN ',' + [12] ELSE '' END)
        + (CASE WHEN [13] IS NOT NULL THEN ',' + [13] ELSE '' END)
        + (CASE WHEN [14] IS NOT NULL THEN ',' + [14] ELSE '' END)
        + (CASE WHEN [15] IS NOT NULL THEN ',' + [15] ELSE '' END)
        + (CASE WHEN [16] IS NOT NULL THEN ',' + [16] ELSE '' END)
        + (CASE WHEN [17] IS NOT NULL THEN ',' + [17] ELSE '' END)
        + (CASE WHEN [18] IS NOT NULL THEN ',' + [18] ELSE '' END)
        + (CASE WHEN [19] IS NOT NULL THEN ',' + [19] ELSE '' END)
        + (CASE WHEN [20] IS NOT NULL THEN ',' + [20] ELSE '' END)
        + (CASE WHEN [21] IS NOT NULL THEN ',' + [21] ELSE '' END)
        + (CASE WHEN [22] IS NOT NULL THEN ',' + [22] ELSE '' END)
        + (CASE WHEN [23] IS NOT NULL THEN ',' + [23] ELSE '' END)
        + (CASE WHEN [24] IS NOT NULL THEN ',' + [24] ELSE '' END)
        + (CASE WHEN [25] IS NOT NULL THEN ',' + [25] ELSE '' END)
        /*+ (CASE WHEN [26] IS NOT NULL THEN ',' + [26] ELSE '' END)
        + (CASE WHEN [27] IS NOT NULL THEN ',' + [27] ELSE '' END)
        + (CASE WHEN [28] IS NOT NULL THEN ',' + [28] ELSE '' END)
        + (CASE WHEN [29] IS NOT NULL THEN ',' + [29] ELSE '' END)
        + (CASE WHEN [30] IS NOT NULL THEN ',' + [30] ELSE '' END)*/
        ) AS CODICE1,
        '0' AS CODICE2,0 AS TIPO
    FROM
    (
        SELECT
            ROW_NUMBER() OVER(PARTITION BY ID1 ORDER BY ID1) AS ID,
            ID2,
            CODART
        FROM
        (
            SELECT
                FLOOR((ROW_NUMBER() OVER(ORDER BY CODART)) / 25) AS ID1,
                FLOOR((ROW_NUMBER() OVER(ORDER BY CODART)) / 25) AS ID2,
                CODART
            FROM
            (
                SELECT DISTINCT
                    A.CODART
                FROM 
                    TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP A 
                WHERE
                    A.IdSessione = @IDSESSIONE AND 
                    A.CODART <> ''
            ) A
        ) B
    )C
    PIVOT
    (
        MAX(CODART)
        FOR ID IN(
                    [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
                    [11],[12],[13],[14],[15],[16],[17],[18],[19],[20],
                    [21],[22],[23],[24],[25]
                 )
    )
    PVT
    UNION 
        SELECT DISTINCT CONVERT(nVARCHAR(5),A.Gruppo) AS CODICE1,'0' AS CODICE2,1 AS TIPO FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP A WHERE A.IdSessione = @IDSESSIONE AND A.Gruppo <> 0 
    UNION 
        SELECT DISTINCT CONVERT(nVARCHAR(5),A.Categoria) AS CODICE1,'0' AS CODICE2,2 AS TIPO FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP A WHERE A.IdSessione = @IDSESSIONE AND A.Categoria <> 0 
    UNION 
        SELECT DISTINCT CONVERT(nVARCHAR(5),A.CodCategoriaStat) AS CODICE1,'0' AS CODICE2,3 AS TIPO FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP A WHERE A.IdSessione = @IDSESSIONE AND A.CodCategoriaStat <> 0 
    UNION 
        SELECT DISTINCT CONVERT(nVARCHAR(5),C.GRUPPOPRZPART) AS CODICE1,'0' AS CODICE2,4 AS TIPO FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP A, ANAGRAFICAARTICOLICOMM C WHERE A.IdSessione = @IDSESSIONE AND C.CODICEART = A.CodArt AND C.ESERCIZIO = 2013 AND C.GRUPPOPRZPART <> 0 
    UNION 
        SELECT DISTINCT CONVERT(nVARCHAR(5),A.CodFamigliaPos) AS CODICE1,CONVERT(nVARCHAR(5),A.CodRepartoPos) AS CODICE2,5 AS TIPO FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP A WHERE A.IdSessione = @IDSESSIONE AND ((A.CodFamigliaPos <> 0) AND (A.CodRepartoPos <> 0)) 
END
        

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_ELENCO_MERCEOLOGICI] TO [Metodo98]
    AS [dbo];

