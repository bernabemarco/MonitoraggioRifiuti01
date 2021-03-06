﻿

CREATE PROCEDURE [dbo].[PROC_ARTICOLI_OFN_COM] (@IDSESSIONE DECIMAL(5,0),@SOLOSOTTOSCORTA SMALLINT)
AS

BEGIN

SET NOCOUNT ON

DECLARE @GIACENZAINIZIALE TABLE (CODART nVARCHAR(50),
                                 DSCART nVARCHAR(80),
                                  CODDEPOSITO nVARCHAR(10),
                                   GIACENZA NUMERIC(16,6),
                                    ORDINATO NUMERIC(16,6),
                                     IMPEGNATO NUMERIC(16,6))


DECLARE @GIACENZA TABLE (CODART nVARCHAR(50),
                         DSCART nVARCHAR(80),
                          CODDEPOSITO nVARCHAR(10),
                           GIACENZA NUMERIC(16,6),
                            ORDINATO NUMERIC(16,6),
                             IMPEGNATO NUMERIC(16,6))

DECLARE @TPGIACENZA TABLE (CODART nVARCHAR(50),
                            DSCART nVARCHAR(80),
                            CODDEPOSITO nVARCHAR(10),
                             GIACENZA NUMERIC(16,6),
                              ORDINATO NUMERIC(16,6),
                               IMPEGNATO NUMERIC(16,6))

DECLARE @PROGRESSIVO        NUMERIC(18,0)
DECLARE @Esercizio          DECIMAL(5,0)

    SET @PROGRESSIVO = 0
    SET @Esercizio = 0

    SELECT @Esercizio = ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME()
    SELECT DISTINCT  @PROGRESSIVO = ISNULL(ProgressivoSTMAG,0) FROM TP_GIACENZE

    INSERT INTO @GIACENZAINIZIALE
    EXEC('SELECT  CODART,
        DESCRIZIONE,
        CODDEPOSITO,
        SUM(GIACENZA) AS GIACENZA,
        SUM(ORDINATO) AS ORDINATO,
        SUM(IMPEGNATO) AS IMPEGNATO
    FROM
    (
        SELECT  CODART,
            DESCRIZIONE,
            CODDEPOSITO,
            (CARICO - SCARICO - RESODACARICO + RESODASCARICO) AS GIACENZA,
            ORDINATO,
            IMPEGNATO,
            UM
        FROM
        (
        SELECT  STMAG.CODART,
            TAT.DESCRIZIONE,
            STMAG.CODDEPOSITO,
            SUM((STMAG.QTA1UM*STMAG.ORDINATO)) AS ORDINATO,
            SUM((STMAG.QTA1UM*STMAG.IMPEGNATO)) AS IMPEGNATO,
            SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS CARICO,
            SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS SCARICO,
            SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODACARICO,
            SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODASCARICO,
            AUM.UM
        FROM STORICOMAG AS STMAG 
        INNER JOIN TABVINCOLIGIC AS TVG 
            ON STMAG.ESERCIZIO=TVG.ESERCIZIO
        INNER JOIN ANAGRAFICAARTICOLI ART 
            ON ART.CODICE=STMAG.CODART
        INNER JOIN ARTICOLIUMPREFERITE AUM 
            ON AUM.CODART=STMAG.CODART AND AUM.TIPOUM=1
        INNER JOIN TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAT
            ON TAT.CODART=STMAG.CODART AND TAT.CODDEPOSITO=STMAG.CODDEPOSITO AND TAT.IDSESSIONE = ' + @IDSESSIONE + '
        WHERE 
            STMAG.PROGRESSIVO > ' + @PROGRESSIVO + ' 
            AND STMAG.DataMov < (SELECT DATAINIMAG FROM TABESERCIZI WHERE CODICE =' + @Esercizio + ')
        GROUP BY STMAG.CODART,TAT.DESCRIZIONE,
             STMAG.CODDEPOSITO,
             AUM.UM
        HAVING  SUM(STMAG.QTA1UM*STMAG.ORDINATO) <>0 OR 
            SUM(STMAG.QTA1UM*STMAG.IMPEGNATO) <>0 OR 
            SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
            SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
            SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
            SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 
        ) AS GIACENZAINIZIALEMETODO
    ) AS GIACENZAINIZIALEUNIFICATA
    GROUP BY CODART,DESCRIZIONE,CODDEPOSITO,UM')

    INSERT INTO @GIACENZA
    EXEC('SELECT  CODART,
        DESCRIZIONE,
        CODDEPOSITO,
        SUM(GIACENZA) AS GIACENZA,
        SUM(ORDINATO) AS ORDINATO,
        SUM(IMPEGNATO) AS IMPEGNATO
    FROM
    (
        SELECT  
            CODART,
            DESCRIZIONE,
            CODDEPOSITO,
            (CARICO - SCARICO - RESODACARICO + RESODASCARICO) AS GIACENZA,
            ORDINATO,
            IMPEGNATO,
            UM
        FROM
        (
        SELECT  STMAG.CODART,
            TAT.DESCRIZIONE,
            STMAG.CODDEPOSITO,
            SUM((STMAG.QTA1UM*STMAG.ORDINATO)) AS ORDINATO,
            SUM((STMAG.QTA1UM*STMAG.IMPEGNATO)) AS IMPEGNATO,
            SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS CARICO,
            SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS SCARICO,
            SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODACARICO,
            SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODASCARICO,
            AUM.UM
        FROM STORICOMAG AS STMAG 
        INNER JOIN TABVINCOLIGIC AS TVG 
            ON STMAG.ESERCIZIO=TVG.ESERCIZIO
        INNER JOIN ANAGRAFICAARTICOLI ART 
            ON ART.CODICE=STMAG.CODART
        INNER JOIN ARTICOLIUMPREFERITE AUM 
            ON AUM.CODART=STMAG.CODART AND AUM.TIPOUM=1
        INNER JOIN TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAT
            ON TAT.CODART=STMAG.CODART AND TAT.CODDEPOSITO=STMAG.CODDEPOSITO AND TAT.IDSESSIONE = ' + @IDSESSIONE + '
        WHERE 
            STMAG.PROGRESSIVO > ' + @PROGRESSIVO + ' 
            AND STMAG.ESERCIZIO = ' + @Esercizio + '
        GROUP BY STMAG.CODART,TAT.DESCRIZIONE,
             STMAG.CODDEPOSITO,
             AUM.UM
        HAVING  SUM(STMAG.QTA1UM*STMAG.ORDINATO) <>0 OR 
            SUM(STMAG.QTA1UM*STMAG.IMPEGNATO) <>0 OR 
            SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
            SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
            SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
            SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 
        ) AS GIACENZAMETODO
    ) AS GIACENZAUNIFICATA
    GROUP BY CODART,DESCRIZIONE,CODDEPOSITO,UM')
    
    INSERT INTO @TPGIACENZA
    EXEC('SELECT 
            TP_GIACENZE.CODARTICOLO AS CODART,
            TAT.DESCRIZIONE,
            TP_GIACENZE.CODDEPOSITO,
            TP_GIACENZE.GIACENZA,
            TP_GIACENZE.ORDINATO,
            TP_GIACENZE.IMPEGNATO
        FROM 
             TP_GIACENZE
        INNER JOIN TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAT
            ON TAT.CODART=TP_GIACENZE.CODARTICOLO AND TAT.CODDEPOSITO=TP_GIACENZE.CODDEPOSITO AND TAT.IDSESSIONE = ' + @IDSESSIONE + '')
    
    
    UPDATE TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP
    SET QTAPROPOSTA = FINALE.PREVISIONE
    FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAOFFT
    INNER JOIN
    (
        SELECT
            CODART,
            CODDEPOSITO,
            ISNULL(SUM(CASE MODALITACALCOLO
                            WHEN 0 THEN QTA_EOQ
                            WHEN 1 THEN QTA_PFR
                            WHEN 2 THEN QTA_SSC
                            WHEN 3 THEN QTA_PRS
                        END), 0) AS PREVISIONE
        FROM
        (
            SELECT
                GIACENZE.CODART,
                GIACENZE.DESCRIZIONE,
                GIACENZE.CODDEPOSITO,
                TXMAG.MODALITACALCOLO,
                (CASE WHEN ISNULL(LIV_EOQ,0) >= GIACENZE.GIACENZA THEN ISNULL(QTA_EOQ,0) ELSE 0 END) AS QTA_EOQ,
                ISNULL(QTA_PFR,0) - (GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO) AS QTA_PFR,
                ISNULL(QTA_PRS,0) AS QTA_PRS,
                (CASE WHEN LIVELLORIORDINO > 0
                      THEN (CASE WHEN (GIACENZE.GIACENZA - SCORTASICUREZZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO) <= LIVELLORIORDINO 
                                 THEN LOTTORIORDINO * (CAST((ABS(GIACENZE.GIACENZA - SCORTASICUREZZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO) / LOTTORIORDINO) AS INT) + 1)
                                 ELSE 0
                            END)
                      ELSE 0
                 END) AS QTA_SSC
            FROM
            (
                SELECT  
                    GIACENZAFINALE.CODART,
                    GIACENZAFINALE.DSCART AS DESCRIZIONE,
                    GIACENZAFINALE.CODDEPOSITO,
                    SUM(GIACENZA) AS GIACENZA,  
                    SUM(ORDINATO) AS ORDINATO,
                    SUM(IMPEGNATO) AS IMPEGNATO
                FROM
                (
                    SELECT * 
                    FROM    @GIACENZAINIZIALE GIACINIT
                    UNION
                    SELECT * 
                    FROM    @GIACENZA GIAC
                    UNION
                    SELECT *
                    FROM    @TPGIACENZA TPGIAC
                ) AS GIACENZAFINALE,
                TP_TABMAGAZZINI
                WHERE
                    TP_TABMAGAZZINI.CODDEPOSITO = GIACENZAFINALE.CODDEPOSITO 
                GROUP BY 
                     GIACENZAFINALE.CODART,
                     GIACENZAFINALE.DSCART,
                     GIACENZAFINALE.CODDEPOSITO
            ) GIACENZE
            INNER JOIN
                TP_EXTRAMAG TXMAG
            ON
                TXMAG.CodArt = GIACENZE.CODART
            LEFT JOIN
                (
                SELECT
                    TAD.CODARTICOLO,
                    TAD.CODDEPOSITO,
                    SUM(CASE WHEN TAD.USAVALOREFORZATO = 0 THEN TAD.LOTTORIORDINOCALCOLATO ELSE TAD.LOTTORIORDINOFORZATO END) AS QTA_EOQ,
                    SUM(CASE WHEN TAD.USAVALOREFORZATO = 0 THEN TAD.LivelloRiordinoCalcolato ELSE TAD.LivelloRiordinoForzato END) AS LIV_EOQ
                FROM 
                    TP_APPROVV_DEPOSITI TAD
                INNER JOIN (SELECT DISTINCT CODART,CODDEPOSITO,IDSESSIONE FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP WHERE IDSESSIONE = @IDSESSIONE) TAT
                    ON TAT.CODART=TAD.CODARTICOLO AND TAT.CODDEPOSITO=TAD.CODDEPOSITO AND TAT.IDSESSIONE = @IDSESSIONE
                GROUP BY
                    TAD.CODARTICOLO,
                    TAD.CODDEPOSITO
                ) TAD
            ON
                TAD.CODARTICOLO = GIACENZE.CODART AND
                TAD.CODDEPOSITO = GIACENZE.CODDEPOSITO
            LEFT JOIN
                (
                SELECT
                    TPFR.CODARTICOLO,
                    TPFR.CODDEPOSITO,
                    SUM(CASE WHEN TPFR.USAVALOREFORZATO = 0 THEN TPFR.QTAOBIETTIVOCALCOLATA ELSE TPFR.QTAOBIETTIVOFORZATO END) AS QTA_PFR
                FROM 
                    TP_PUNTOFISSORIORDINO TPFR
                INNER JOIN (SELECT DISTINCT CODART,CODDEPOSITO,IDSESSIONE FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP WHERE IDSESSIONE = @IDSESSIONE) TAT
                    ON TAT.CODART=TPFR.CODARTICOLO AND TAT.CODDEPOSITO=TPFR.CODDEPOSITO AND TAT.IDSESSIONE = @IDSESSIONE
                GROUP BY
                    TPFR.CODARTICOLO,
                    TPFR.CODDEPOSITO
                ) TPFR
            ON
                TPFR.CODARTICOLO = GIACENZE.CODART AND
                TPFR.CODDEPOSITO = GIACENZE.CODDEPOSITO
            LEFT JOIN
                (
                SELECT 
                    TS.CODARTICOLO,
                    TS.CODDEPOSITO,
                    SUM(TS.SCORTASICUREZZA) AS SCORTASICUREZZA,
                    0 AS LOTTORIORDINO,
                    SUM(CASE WHEN TS.USAVALOREFORZATO = 0 THEN TS.LIVELLORIORDINOCALCOLATO ELSE TS.LIVELLORIORDINOFORZATO END) AS LIVELLORIORDINO
                FROM 
                    TP_SCORTA TS
                INNER JOIN (SELECT DISTINCT CODART,CODDEPOSITO,IDSESSIONE FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP WHERE IDSESSIONE = @IDSESSIONE) TAT
                    ON TAT.CODART=TS.CODARTICOLO AND TAT.CODDEPOSITO=TS.CODDEPOSITO AND TAT.IDSESSIONE = @IDSESSIONE
                GROUP BY
                    TS.CODARTICOLO,
                    TS.CODDEPOSITO
                ) SCRT
            ON
                SCRT.CODARTICOLO = GIACENZE.CODART AND
                SCRT.CODDEPOSITO = GIACENZE.CODDEPOSITO
            LEFT JOIN
                (
                SELECT
                    TPL.CODARTICOLO,
                    TPL.CODDEPOSITO,
                    SUM(TPL.QTA) AS QTA_PRS
                FROM 
                    TP_PERSONALIZZATOLIBERO TPL
                INNER JOIN (SELECT DISTINCT CODART,CODDEPOSITO,IDSESSIONE FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP WHERE IDSESSIONE = @IDSESSIONE) TAT
                    ON TAT.CODART=TPL.CODARTICOLO AND TAT.CODDEPOSITO=TPL.CODDEPOSITO AND TAT.IDSESSIONE = @IDSESSIONE
                GROUP BY
                    TPL.CODARTICOLO,
                    TPL.CODDEPOSITO
                ) PERS
            ON
                PERS.CODARTICOLO = GIACENZE.CODART AND
                PERS.CODDEPOSITO = GIACENZE.CODDEPOSITO
        ) RIORDINO
        GROUP BY
            CODART,
            CODDEPOSITO
    ) FINALE
    ON
        TAOFFT.CODART = FINALE.CODART AND
        TAOFFT.CODDEPOSITO = FINALE.CODDEPOSITO AND
        TAOFFT.IDSESSIONE = @IDSESSIONE
    
    DELETE FROM TP_ARTICOLIORDINEFORNITORE_TEMP WHERE IDSESSIONE = @IDSESSIONE

    IF (@SOLOSOTTOSCORTA = 0)
        BEGIN
            INSERT INTO TP_ARTICOLIORDINEFORNITORE_TEMP([IdSessione],[CodArt],[DescArticolo],[QtaOrdinata],[Previsione],[Annulla],[UtenteModifica],[DataModifica])
            SELECT
                [IdSessione],[CodArt],[Descrizione],[QtaOrdinata],
                (CASE WHEN [Previsione]< 0 
                      THEN 0 
                      ELSE (CASE OFARRQTAINORD 
                                WHEN 0 THEN FLOOR((NRPEZZIIMBALLO * (ABS(Previsione) / NRPEZZIIMBALLO))+ 0.9)
                                WHEN 1 THEN FLOOR(Previsione + 0.9)
                            ELSE Previsione END) 
                 END) AS Previsione,
                [Annulla],[UtenteModifica],[DataModifica]               
            FROM
            (
                SELECT AF_TMP.IdSessione,
                       AF_TMP.CodArt,
                       AF_TMP.Descrizione,
                       0 AS QtaOrdinata,
                       SUM(AF_TMP.QtaProposta) AS Previsione,
                       0 AS Annulla,
                       USER_NAME() AS UtenteModifica,
                       GETDATE() AS DataModifica,
                       TEM.OFARRQTAINORD,
                       ISNULL(NULLIF(ANA.NRPEZZIIMBALLO,0),1) AS NRPEZZIIMBALLO
                FROM 
                    (SELECT DISTINCT IDSESSIONE,CODART,CODDEPOSITO,DESCRIZIONE,(CASE WHEN QTAPROPOSTA < 0 THEN 0 ELSE QTAPROPOSTA END) AS QTAPROPOSTA FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP WHERE IDSESSIONE = @IDSESSIONE) AF_TMP,
                    (SELECT DISTINCT TEM.CODART , TEM.OFARRQTAINORD FROM TP_EXTRAMAG TEM, TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAT WHERE TAT.CODART=TEM.CODART AND TAT.IDSESSIONE = @IDSESSIONE) TEM,
                    (SELECT DISTINCT AA.CODICE , AA.NRPEZZIIMBALLO FROM ANAGRAFICAARTICOLI AA, TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAT WHERE TAT.CODART=AA.CODICE AND TAT.IDSESSIONE = @IDSESSIONE) ANA
                WHERE 
                        TEM.CODART = AF_TMP.CODART
                    AND ANA.CODICE = AF_TMP.CODART
                GROUP BY AF_TMP.IdSessione,
                         AF_TMP.CodArt,
                         AF_TMP.Descrizione,
                         TEM.OFARRQTAINORD,
                         ANA.NRPEZZIIMBALLO
            ) TUTTI
        END
    ELSE
        BEGIN
            INSERT INTO TP_ARTICOLIORDINEFORNITORE_TEMP([IdSessione],[CodArt],[DescArticolo],[QtaOrdinata],[Previsione],[Annulla],[UtenteModifica],[DataModifica])
            SELECT
                [IdSessione],[CodArt],[Descrizione],[QtaOrdinata],
                (CASE WHEN [Previsione]< 0 
                      THEN 0 
                      ELSE (CASE OFARRQTAINORD 
                                WHEN 0 THEN FLOOR((NRPEZZIIMBALLO * (ABS(Previsione) / NRPEZZIIMBALLO))+ 0.9)
                                WHEN 1 THEN FLOOR(Previsione + 0.9)
                            ELSE Previsione END) 
                 END) AS Previsione,
                [Annulla],[UtenteModifica],[DataModifica]
            FROM
            (
                SELECT AF_TMP.IdSessione,
                       AF_TMP.CodArt,
                       AF_TMP.Descrizione,
                       0 AS QtaOrdinata,
                       SUM(AF_TMP.QtaProposta) AS Previsione,
                       0 AS Annulla,
                       USER_NAME() AS UtenteModifica,
                       GETDATE() AS DataModifica,
                       TEM.OFARRQTAINORD,
                       ISNULL(NULLIF(ANA.NRPEZZIIMBALLO,0),1) AS NRPEZZIIMBALLO
                FROM 
                    (SELECT DISTINCT IDSESSIONE,CODART,CODDEPOSITO,DESCRIZIONE,(CASE WHEN QTAPROPOSTA < 0 THEN 0 ELSE QTAPROPOSTA END) AS QTAPROPOSTA FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP WHERE IDSESSIONE = @IDSESSIONE AND QTAPROPOSTA > 0) AF_TMP,
                    (SELECT DISTINCT TEM.CODART , TEM.OFARRQTAINORD FROM TP_EXTRAMAG TEM, TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAT WHERE TAT.CODART=TEM.CODART AND TAT.IDSESSIONE = @IDSESSIONE) TEM,
                    (SELECT DISTINCT AA.CODICE , AA.NRPEZZIIMBALLO FROM ANAGRAFICAARTICOLI AA, TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAT WHERE TAT.CODART=AA.CODICE AND TAT.IDSESSIONE = @IDSESSIONE) ANA
                WHERE 
                        TEM.CODART = AF_TMP.CODART
                    AND ANA.CODICE = AF_TMP.CODART
                GROUP BY AF_TMP.IdSessione,
                         AF_TMP.CodArt,
                         AF_TMP.Descrizione,
                         TEM.OFARRQTAINORD,
                         ANA.NRPEZZIIMBALLO
            ) SOTTOSCORTA
        END

RETURN

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_ARTICOLI_OFN_COM] TO [Metodo98]
    AS [dbo];

