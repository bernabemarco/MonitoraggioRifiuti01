

CREATE PROCEDURE [dbo].[PROC_CREA_GIACENZE_RUNTIME](@IdSessione Decimal(5,0), @Esercizio DECIMAL(5,0), @Articolo Varchar(MAX))

AS

BEGIN

DECLARE @PROGRESSIVO    AS DECIMAL(18,0)    = 0

SET NOCOUNT ON
    
    SELECT @PROGRESSIVO = MAX(PROGRESSIVO) FROM STORICOMAG;

    /*CALCOLO DELLA GIACENZA*/
    UPDATE 
        TP_GIACENZE
    SET 
        TP_GIACENZE.ProgressivoSTMAG = @PROGRESSIVO,
        TP_GIACENZE.Giacenza = GCC.GIACENZA_F,
        TP_GIACENZE.Ordinato = GCC.ORDINATO_F,
        TP_GIACENZE.Impegnato = GCC.IMPEGNATO_F,
        TP_GIACENZE.Carico = GCC.CARICO_F,
        TP_GIACENZE.Scarico = GCC.SCARICO_F,
        TP_GIACENZE.ResoDaCarico = GCC.RESODACARICO_F,
        TP_GIACENZE.ResoDaScarico = GCC.RESODASCARICO_F
    FROM
        TP_GIACENZE
    INNER JOIN
    (
        SELECT
            GIACENZAMETODO.CODDEPOSITO,
            GIACENZAMETODO.CODART,
            ISNULL((GIACENZAMETODO.CARICO - GIACENZAMETODO.SCARICO - GIACENZAMETODO.RESODACARICO + GIACENZAMETODO.RESODASCARICO),0) AS GIACENZA_F,
            ISNULL(GIACENZAMETODO.ORDINATO,0) AS ORDINATO_F,
            ISNULL(GIACENZAMETODO.IMPEGNATO,0) AS IMPEGNATO_F,
            ISNULL(GIACENZAMETODO.CARICO,0) AS CARICO_F,
            ISNULL(GIACENZAMETODO.SCARICO,0) AS SCARICO_F,
            ISNULL(GIACENZAMETODO.RESODACARICO,0) AS RESODACARICO_F,
            ISNULL(GIACENZAMETODO.RESODASCARICO,0) AS RESODASCARICO_F,
            AUM.UM AS UM
        FROM
        (
            SELECT
                TEM.CODART,
                TTM.CodDeposito,
                0 AS ORDINATO,
                0 AS IMPEGNATO,
                0 AS CARICO,
                0 AS SCARICO,
                0 AS RESODACARICO,
                0 AS RESODASCARICO,
                0 AS MODALITACALCOLO
            FROM
                TP_EXTRAMAG TEM
            INNER JOIN
                (SELECT DISTINCT CODART FROM #TP_ELENCOARTICOLIOF_TEMP WHERE IdSessione = @IdSessione AND (CodArt = @Articolo OR @Articolo = '')) TEAOT
            ON
                TEAOT.CodArt = TEM.CodArt
            CROSS JOIN
                TP_TABMagazzini TTM
            LEFT JOIN 
                STORICOMAG AS STMAG
            ON
                STMAG.CODART = TEM.CodArt AND
                STMAG.CODDEPOSITO = TTM.CodDeposito
            WHERE
                TEM.ConsidAcq = 1 AND
                STMAG.CODART IS NULL
            UNION
            SELECT
                STMAG.CODART,
                STMAG.CODDEPOSITO,
                SUM((STMAG.QTA1UM*STMAG.ORDINATO)) AS ORDINATO,
                SUM((STMAG.QTA1UM*STMAG.IMPEGNATO)) AS IMPEGNATO,
                SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS CARICO,
                SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS SCARICO,
                SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODACARICO,
                SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODASCARICO,
                STMAG.MODALITACALCOLO
            FROM 
                (
                    SELECT DISTINCT
                        STMAG.PROGRESSIVO,
                        STMAG.CODART,
                        STMAG.CODDEPOSITO,
                        STMAG.QTA1UM,
                        STMAG.ORDINATO,
                        STMAG.IMPEGNATO,
                        STMAG.GIACENZA,
                        STMAG.RESO,
                        0 AS MODALITACALCOLO
                    FROM
                        STORICOMAG AS STMAG
                    INNER JOIN 
                        TP_EXTRAMAG TEM
                    ON
                        (TEM.CodArt = STMAG.CODART OR TEM.OFCODARTRIF = STMAG.CODART) AND TEM.ConsidAcq = 1
                    INNER JOIN
                        (SELECT DISTINCT CODART FROM #TP_ELENCOARTICOLIOF_TEMP WHERE IdSessione = @IdSessione AND (CodArt = @Articolo OR @Articolo = '')) TEAOT
                    ON
                        TEAOT.CodArt = TEM.CodArt
                ) STMAG
            GROUP BY 
                STMAG.CODART,
                STMAG.CODDEPOSITO,
                STMAG.MODALITACALCOLO
            HAVING  
                SUM(STMAG.QTA1UM*STMAG.ORDINATO) <>0 OR 
                SUM(STMAG.QTA1UM*STMAG.IMPEGNATO) <>0 OR 
                SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
                SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
                SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
                SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 
        ) AS GIACENZAMETODO
        INNER JOIN ARTICOLIUMPREFERITE AUM 
            ON AUM.CODART=GIACENZAMETODO.CODART AND AUM.TIPOUM=1
    ) GCC
    ON
     GCC.CodArt = TP_GIACENZE.CodArticolo And
     GCC.CodDeposito = TP_GIACENZE.CodDeposito
    WHERE
     TP_GIACENZE.Esercizio = @Esercizio;
    
RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_GIACENZE_RUNTIME] TO [Metodo98]
    AS [dbo];

