

CREATE PROCEDURE [dbo].[PROC_CALCOLA_GIACENZE](@Articoli nVARCHAR(MAX), 
                                                @Depositi nVARCHAR(MAX),
                                                 @Esercizio DECIMAL(5,0),
                                                  @Tipo SMALLINT,
                                                   @IdSessione DECIMAL(5,0))
AS

BEGIN

SET NOCOUNT ON

DECLARE @SqlQuery   nVARCHAR(MAX)

DECLARE @GIACENZAZERO TABLE (CODART nVARCHAR(50) ,
                              CODDEPOSITO nVARCHAR(10) ,
                               GIACENZA NUMERIC(16,6),
                                ORDINATO NUMERIC(16,6),
                                 IMPEGNATO NUMERIC(16,6),
                                  CARICO NUMERIC(16,6),
                                   SCARICO NUMERIC(16,6),
                                    RESODACARICO NUMERIC(16,6),
                                     RESODASCARICO NUMERIC(16,6),
                                      INORDINE NUMERIC(16,0),
                                       UM nVARCHAR(3) ,
                                        INDROT NUMERIC(19,4))
                                        
DECLARE @GIACENZA TABLE (CODART nVARCHAR(50) ,
                          CODDEPOSITO nVARCHAR(10) ,
                           GIACENZA NUMERIC(16,6),
                            ORDINATO NUMERIC(16,6),
                             IMPEGNATO NUMERIC(16,6),
                              CARICO NUMERIC(16,6),
                               SCARICO NUMERIC(16,6),
                                RESODACARICO NUMERIC(16,6),
                                 RESODASCARICO NUMERIC(16,6),
                                  INORDINE NUMERIC(16,0),
                                   UM nVARCHAR(3) ,
                                    INDROT NUMERIC(19,4))
    
    SET @SqlQuery = ''
    
    IF (@Tipo = 0)
        BEGIN
            SET @SqlQuery = N'SELECT DISTINCT
                                ART.CODICE AS CODART,
                                AGD.CODICE AS CODDEPOSITO,
                                0 AS GIACENZA,
                                0 AS ORDINATO,
                                0 AS IMPEGNATO,
                                0 AS CARICO,
                                0 AS SCARICO,
                                0 AS RESODACARICO,
                                0 AS RESODASCARICO,
                                0 AS INORDINE,
                                AUM.UM,
                                0 AS INDROT
                            FROM
                                ANAGRAFICAARTICOLI ART,
                                ARTICOLIUMPREFERITE AUM,
                                ANAGRAFICADEPOSITI AGD
                            WHERE
                                ART.CODICE IN (' + @Articoli + ') AND 
                                AGD.CODICE IN (' + @Depositi + ') AND
                                AUM.CODART = ART.CODICE AND AUM.TIPOUM = 1'
            
            INSERT INTO @GIACENZAZERO
            EXEC sp_executesql @SQLQuery;
            
            INSERT INTO @GIACENZA
            EXEC('SELECT
                    GIACENZAMETODO.CODART,
                    GIACENZAMETODO.CODDEPOSITO,
                    ISNULL((GIACENZAMETODO.CARICO - GIACENZAMETODO.SCARICO - GIACENZAMETODO.RESODACARICO + GIACENZAMETODO.RESODASCARICO),0) AS GIACENZA_F,
                    ISNULL(GIACENZAMETODO.ORDINATO,0) AS ORDINATO_F,
                    ISNULL(GIACENZAMETODO.IMPEGNATO,0) AS IMPEGNATO_F,
                    ISNULL(GIACENZAMETODO.CARICO,0) AS CARICO_F,
                    ISNULL(GIACENZAMETODO.SCARICO,0) AS SCARICO_F,
                    ISNULL(GIACENZAMETODO.RESODACARICO,0) AS RESODACARICO_F,
                    ISNULL(GIACENZAMETODO.RESODASCARICO,0) AS RESODASCARICO_F,
                    0 AS InOrdine,
                    AUM.UM AS UM,
                    0 As IndRot
                FROM
                (
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
                            SELECT
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
                                TEM.CodArt = STMAG.CODART AND TEM.ConsidAcq = 1
                            WHERE
                                STMAG.CODART IN (' + @Articoli + ') AND 
                                STMAG.CODDEPOSITO IN (' + @Depositi + ')
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
                    ON AUM.CODART=GIACENZAMETODO.CODART AND AUM.TIPOUM=1')
            
            SELECT
                GIACENZE.CODART,
                GIACENZE.CODDEPOSITO,
                GIACENZE.RAGGRUPPAMENTO,
                GIACENZE.GIACENZA,  
                GIACENZE.ORDINATO,
                GIACENZE.IMPEGNATO,
                GIACENZE.CARICO,
                GIACENZE.SCARICO,
                GIACENZE.RESODACARICO,
                GIACENZE.RESODASCARICO,
                GIACENZE.INORDINE,
                GIACENZE.UM,
                GIACENZE.INDROT,
                (CASE GIACENZE.MODALITACALCOLO
                    WHEN 0
                    THEN ISNULL((CASE WHEN TP_APPROVV_DEPOSITI.UsaValoreForzato = 0 
                             THEN TP_APPROVV_DEPOSITI.SCORTAMINIMACALCOLATA
                             ELSE TP_APPROVV_DEPOSITI.SCORTAMINIMAFORZATO 
                        END),0)
                    WHEN 1
                    THEN ISNULL((CASE WHEN TP_PUNTOFISSORIORDINO.UsaValoreForzato = 0 
                             THEN TP_PUNTOFISSORIORDINO.ScortaSicurezzaCalcolata
                             ELSE TP_PUNTOFISSORIORDINO.ScortaSicurezzaForzato
                        END),0)
                    WHEN 2
                    THEN ISNULL(TP_SCORTA.ScortaSicurezza,0)
                    ELSE 0
                END) AS SCORTAMINIMA,
                (CASE GIACENZE.MODALITACALCOLO
                    WHEN 0
                    THEN ISNULL((CASE WHEN TP_APPROVV_DEPOSITI.UsaValoreForzato = 0 
                             THEN TP_APPROVV_DEPOSITI.LIVELLORIORDINOCALCOLATO
                             ELSE TP_APPROVV_DEPOSITI.LIVELLORIORDINOFORZATO 
                        END),0)
                    WHEN 1
                    THEN ISNULL((CASE WHEN TP_PUNTOFISSORIORDINO.UsaValoreForzato = 0 
                             THEN TP_PUNTOFISSORIORDINO.QtaObiettivoCalcolata
                             ELSE TP_PUNTOFISSORIORDINO.QtaObiettivoForzato
                        END),0)
                    WHEN 2
                    THEN ISNULL((CASE WHEN TP_SCORTA.UsaValoreForzato = 0 
                             THEN TP_SCORTA.LivelloRiordinoCalcolato
                             ELSE TP_SCORTA.LivelloRiordinoForzato 
                        END),0)
                END) AS LIVELLORIORDINO,
                (CASE GIACENZE.MODALITACALCOLO
                    WHEN 0
                    THEN ISNULL((CASE WHEN TP_APPROVV_DEPOSITI.UsaValoreForzato = 0 
                             THEN TP_APPROVV_DEPOSITI.LOTTORIORDINOCALCOLATO
                             ELSE TP_APPROVV_DEPOSITI.LOTTORIORDINOFORZATO 
                        END),0)
                    WHEN 1
                    THEN 0
                    WHEN 2
                    THEN 0  
                END) AS LOTTORIORDINO
            FROM
            (
                SELECT  
                    GIACENZAFINALE.CODART,
                    GIACENZAFINALE.CODDEPOSITO,
                    TXMAG.MODALITACALCOLO,
                    TP_TABMAGAZZINI.RAGGRUPPAMENTO,
                    SUM(GIACENZA) AS GIACENZA,  
                    SUM(ORDINATO) AS ORDINATO,
                    SUM(IMPEGNATO) AS IMPEGNATO,
                    SUM(CARICO) AS CARICO,
                    SUM(SCARICO) AS SCARICO,
                    SUM(RESODACARICO) AS RESODACARICO,
                    SUM(RESODASCARICO) AS RESODASCARICO,
                    SUM(INORDINE) AS INORDINE,
                    GIACENZAFINALE.UM,
                    SUM(INDROT) AS INDROT
                FROM
                    (
                    SELECT *
                    FROM @GIACENZA
                    UNION
                    SELECT *
                    FROM @GIACENZAZERO
                    ) GIACENZAFINALE
                INNER JOIN
                    TP_EXTRAMAG TXMAG
                ON
                    GIACENZAFINALE.CODART = TXMAG.CodArt
                INNER JOIN
                    TP_TABMAGAZZINI
                ON
                    TP_TABMAGAZZINI.CODDEPOSITO = GIACENZAFINALE.CODDEPOSITO
                GROUP BY 
                     GIACENZAFINALE.CODART,
                     GIACENZAFINALE.CODDEPOSITO,
                     TXMAG.MODALITACALCOLO,
                     TP_TABMAGAZZINI.RAGGRUPPAMENTO,
                     GIACENZAFINALE.UM
            ) GIACENZE
            LEFT JOIN
                TP_APPROVV_DEPOSITI
            ON
                TP_APPROVV_DEPOSITI.CODARTICOLO = GIACENZE.CODART AND
                TP_APPROVV_DEPOSITI.CODDEPOSITO = GIACENZE.CODDEPOSITO
            LEFT JOIN 
                TP_PUNTOFISSORIORDINO
            ON
                TP_PUNTOFISSORIORDINO.CODARTICOLO = GIACENZE.CODART AND
                TP_PUNTOFISSORIORDINO.CODDEPOSITO = GIACENZE.CODDEPOSITO    
            LEFT JOIN 
                TP_SCORTA
            ON
                TP_SCORTA.CODARTICOLO = GIACENZE.CODART AND
                TP_SCORTA.CODDEPOSITO = GIACENZE.CODDEPOSITO
            ORDER BY CODART,
                GIACENZE.CODDEPOSITO,
                GIACENZE.UM     
        END
    ELSE
        BEGIN
            SET @SqlQuery = N'IF EXISTS (SELECT * FROM tempdb.dbo.sysobjects o WHERE o.xtype in (''U'') AND o.id = object_id(N''tempdb..#TP_ELENCOARTICOLIOF_TEMP'')) 
                            BEGIN
                                SELECT
                                    ART.CodArt,
                                    DEP.CodDeposito,
                                    DEP.RAGGRUPPAMENTO,
                                    ISNULL(TMP.Giacenza,0) As Giacenza,
                                    ISNULL(TMP.Ordinato,0) As Ordinato,
                                    ISNULL(TMP.Impegnato,0) As Impegnato,
                                    0 AS CARICO,
                                    0 AS SCARICO,
                                    0 AS RESODACARICO,
                                    0 AS RESODASCARICO,
                                    ISNULL(GCC.INORDINE,0) AS INORDINE,
                                    ISNULL(GCC.UM,'''') AS UM,
                                    0 AS INDROT,
                                    ISNULL(TMP.ScortaSicurezza,0) AS SCORTAMINIMA,
                                    ISNULL(TMP.LivelloRiordino,0) AS LivelloRiordino,
                                    ISNULL(TMP.LottoRiordino,0) AS LottoRiordino,
                                    ''SI'' AS A
                                FROM
                                    TP_ARTICOLIORDINEFORNITORE_TEMP ART
                                CROSS JOIN
                                    TP_TABMagazzini DEP
                                LEFT JOIN
                                    TP_GIACENZE GCC
                                ON
                                    GCC.CodArticolo = ART.CodArt AND
                                    GCC.CodDeposito = DEP.CodDeposito
                                LEFT JOIN
                                    #TP_ELENCOARTICOLIOF_TEMP TMP
                                ON
                                    TMP.IdSessione = ART.IdSessione AND
                                    TMP.CodArt = ART.CodArt AND
                                    TMP.Tp_CodDep = DEP.CodDeposito
                                WHERE
                                    ART.IdSessione = ' + CAST(@IdSessione AS VARCHAR(5)) + ' AND
                                    ART.CodArt IN(' + @Articoli + ') 
                            END
                        ELSE
                            BEGIN
                                SELECT
                                    ART.CodArt,
                                    DEP.CodDeposito,
                                    DEP.RAGGRUPPAMENTO,
                                    0 As Giacenza,
                                    0 As Ordinato,
                                    0 As Impegnato,
                                    0 AS CARICO,
                                    0 AS SCARICO,
                                    0 AS RESODACARICO,
                                    0 AS RESODASCARICO,
                                    0 AS INORDINE,
                                    '''' AS UM,
                                    0 AS INDROT,
                                    0 AS SCORTAMINIMA,
                                    0 AS LivelloRiordino,
                                    0 AS LottoRiordino,
                                    ''NO'' AS A
                                FROM
                                    TP_ARTICOLIORDINEFORNITORE_TEMP ART
                                CROSS JOIN
                                    TP_TABMagazzini DEP
                                WHERE
                                    ART.IdSessione = ' + CAST(@IdSessione AS VARCHAR(5)) + ' AND
                                    ART.CodArt IN(' + @Articoli + ')
                            END';
            
            exec sp_sqlexec @SqlQuery
            --print @SqlQuery
        END
        
        
RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLA_GIACENZE] TO [Metodo98]
    AS [dbo];

