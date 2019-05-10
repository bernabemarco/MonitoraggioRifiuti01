
CREATE PROCEDURE [dbo].[Proc_PreparaGiacenzeArticoliOF](@IdSessione Decimal(5,0), 
                                                         @SoloSottoScorta Smallint,
                                                          @Tipo Smallint,
                                                           @Articolo nVarchar(50),
                                                            @PreAssegnaQuantita Smallint)

AS

BEGIN
    
    SET NOCOUNT ON 
    
DECLARE @Esercizio      Decimal(5,0)
DECLARE @AllSuppliers   Smallint
    
SELECT @Esercizio = ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME();
Select @AllSuppliers = ISNULL(ATTRIBUZIONEQTA,0) FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO = 1
    
DELETE FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP WHERE IdSessione = @IdSessione And ((CODART = @Articolo) OR (@Articolo = ''));
DELETE FROM TP_ARTICOLIORDINEFORNITORE_TEMP WHERE IdSessione = @IdSessione And ((CODART = @Articolo) OR (@Articolo = ''));
    
/*Test Proposta di Claudio 25/11/2013*/
UPDATE #TP_ELENCOARTICOLIOF_TEMP
    SET Selezionato = 1
WHERE 
    IdSessione = @IdSessione And 
    CodArt In(Select Distinct CodArt From #TP_ELENCOARTICOLIOF_TEMP Where Selezionato = 1 And IdSessione = @IdSessione) And
    (@Tipo <> 0 And @Tipo <> -1) And
    @AllSuppliers = 0;
        
/*Calcolo le Giacenze*/
UPDATE #TP_ELENCOARTICOLIOF_TEMP
SET 
    #TP_ELENCOARTICOLIOF_TEMP.Giacenza = GIACENZE.GIACENZA,
    #TP_ELENCOARTICOLIOF_TEMP.Ordinato = GIACENZE.ORDINATO,
    #TP_ELENCOARTICOLIOF_TEMP.Impegnato = GIACENZE.IMPEGNATO,
    #TP_ELENCOARTICOLIOF_TEMP.Disponibilita = (GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO),
    #TP_ELENCOARTICOLIOF_TEMP.PropostaCom =(
                                            CASE WHEN #TP_ELENCOARTICOLIOF_TEMP.ModalitaCalcolo IN(0,2)
                                                THEN (
                                                    CASE WHEN ((GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO) < #TP_ELENCOARTICOLIOF_TEMP.LivelloRiordino)
                                                            THEN (
                                                                CASE WHEN (#TP_ELENCOARTICOLIOF_TEMP.LottoRiordino > 1)
                                                                        THEN #TP_ELENCOARTICOLIOF_TEMP.LottoRiordino * FLOOR((ABS(GIACENZE.Giacenza - #TP_ELENCOARTICOLIOF_TEMP.ScortaSicurezza + GIACENZE.Ordinato - GIACENZE.Impegnato) / #TP_ELENCOARTICOLIOF_TEMP.LottoRiordino) + 1) 
                                                                        ELSE ABS(GIACENZE.Giacenza - #TP_ELENCOARTICOLIOF_TEMP.ScortaSicurezza + GIACENZE.Ordinato - GIACENZE.Impegnato)
                                                                END
                                                                )
                                                            ELSE 0
                                                    END 
                                                    )
                                                WHEN #TP_ELENCOARTICOLIOF_TEMP.ModalitaCalcolo IN(1)
                                                THEN (
                                                    CASE WHEN ((GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO) < #TP_ELENCOARTICOLIOF_TEMP.LivelloRiordino)
                                                            THEN (
                                                                CASE WHEN (#TP_ELENCOARTICOLIOF_TEMP.LottoRiordino > 1)
                                                                        THEN #TP_ELENCOARTICOLIOF_TEMP.LottoRiordino * FLOOR((ABS(GIACENZE.Giacenza - #TP_ELENCOARTICOLIOF_TEMP.LivelloRiordino + GIACENZE.Ordinato - GIACENZE.Impegnato) / #TP_ELENCOARTICOLIOF_TEMP.LottoRiordino) + 1)                                                            
                                                                        ELSE ABS(GIACENZE.Giacenza - #TP_ELENCOARTICOLIOF_TEMP.LivelloRiordino + GIACENZE.Ordinato - GIACENZE.Impegnato)
                                                                END
                                                                )
                                                            ELSE 0
                                                    END
                                                    )
                                                ELSE
                                                    0
                                                /*WHEN (#TP_ELENCOARTICOLIOF_TEMP.ModalitaCalcolo = 0) OR (#TP_ELENCOARTICOLIOF_TEMP.ModalitaCalcolo = 1) 
                                                THEN (
                                                    CASE WHEN #TP_ELENCOARTICOLIOF_TEMP.NETTIFICADISPONIBILITA = 1
                                                            THEN (#TP_ELENCOARTICOLIOF_TEMP.LIVELLORIORDINO - (GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO)) 
                                                            ELSE #TP_ELENCOARTICOLIOF_TEMP.LIVELLORIORDINO
                                                    END
                                                    )*/
                                            END
                                            )/*,
    /*Personalizzazione*/                                     
    #TP_ELENCOARTICOLIOF_TEMP.PropostaLbr = (
                                            CASE WHEN ((GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO) < #TP_ELENCOARTICOLIOF_TEMP.PropostaLbr)
                                                    THEN (
                                                        CASE WHEN (#TP_ELENCOARTICOLIOF_TEMP.PropostaLbr - (GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO)) < #TP_ELENCOARTICOLIOF_TEMP.QtaMinima
                                                                THEN #TP_ELENCOARTICOLIOF_TEMP.QtaMinima
                                                                ELSE (#TP_ELENCOARTICOLIOF_TEMP.PropostaLbr - (GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO))
                                                        END
                                                        )
                                                            
                                                    ELSE 0
                                            END 
                                            )*/
                                                
                                                
FROM #TP_ELENCOARTICOLIOF_TEMP
INNER JOIN
(
    SELECT
        IdSessione,
        CODART,
        CODDEPOSITO,
        SUM(GIACENZA_I + GIACENZA_F) AS GIACENZA,
        SUM(ORDINATO_I + ORDINATO_F) AS ORDINATO,
        SUM(IMPEGNATO_I + IMPEGNATO_F) AS IMPEGNATO
    FROM
    (
        SELECT
            ISNULL(GIACENZAMETODO.IdSessione,@IdSessione) As IdSessione,
            ISNULL(GIACENZAMETODO.CODART,GIACENZAINIZIALEMETODO.CODART) AS CODART,
            ISNULL(GIACENZAMETODO.CODDEPOSITO,GIACENZAINIZIALEMETODO.CodDeposito) AS CODDEPOSITO,
            ISNULL((GIACENZAMETODO.CARICO - GIACENZAMETODO.SCARICO - GIACENZAMETODO.RESODACARICO + GIACENZAMETODO.RESODASCARICO),0) AS GIACENZA_F,
            ISNULL(GIACENZAMETODO.ORDINATO,0) AS ORDINATO_F,
            ISNULL(GIACENZAMETODO.IMPEGNATO,0) AS IMPEGNATO_F,
            ISNULL(GIACENZAINIZIALEMETODO.ORDINATO,0) AS ORDINATO_I,
            ISNULL(GIACENZAINIZIALEMETODO.IMPEGNATO,0) AS IMPEGNATO_I,
            ISNULL(GIACENZAINIZIALEMETODO.GIACENZA,0) AS GIACENZA_I
        FROM
        (
            SELECT
                STMAG.IdSessione,
                STMAG.CODART,
                STMAG.CODDEPOSITO,
                SUM((STMAG.QTA1UM*STMAG.ORDINATO)) AS ORDINATO,
                SUM((STMAG.QTA1UM*STMAG.IMPEGNATO)) AS IMPEGNATO,
                SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS CARICO,
                SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END)) AS SCARICO,
                SUM((CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODACARICO,
                SUM((CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END)) AS RESODASCARICO
            FROM 
                (
                    /*Giacenza per prodotti senza Articoli di riferimento*/
                    SELECT distinct
                        TEAOF.IdSessione,
                        STMAG.PROGRESSIVO,
                        STMAG.CODART,
                        STMAG.CODDEPOSITO,
                        STMAG.QTA1UM,
                        STMAG.ORDINATO,
                        STMAG.IMPEGNATO,
                        STMAG.GIACENZA,
                        STMAG.RESO
                    FROM
                        #TP_ELENCOARTICOLIOF_TEMP TEAOF  WITH(NOLOCK)
                    INNER JOIN
                        TP_EXTRAMAG AS TEM WITH(NOLOCK)
                    ON
                        TEM.CodArt = TEAOF.CodArt
                    INNER JOIN
                        STORICOMAG AS STMAG  WITH(NOLOCK)    
                    ON
                        (STMAG.CODART = TEM.CodArt And ((TEM.OFCODARTRIF = '') OR (TEM.OFCODARTRIF IS NULL))) And
                        STMAG.CodDeposito = TEAOF.Tp_CodDep  And
                        STMAG.ESERCIZIO = @Esercizio
                    LEFT JOIN
                        TP_GIACENZE AS TPG WITH(NOLOCK)
                    ON
                        TPG.CodArticolo = STMAG.CODART AND
                        TPG.CodDeposito = STMAG.CODDEPOSITO
                    WHERE
                        STMAG.PROGRESSIVO > ISNULL(TPG.ProgressivoSTMAG,0) AND
                        TEAOF.IdSessione = @IdSessione AND
                        TEAOF.Selezionato = 1 AND
                        ((TEAOF.CODART = @Articolo) OR (@Articolo = ''))
                    UNION ALL
                    /*Giacenza per prodotti con Articoli di riferimento in sostituzione (Flag = 0)*/
                    SELECT distinct
                        TEAOF.IdSessione,
                        STMAG.PROGRESSIVO,
                        TEM.CODART,
                        STMAG.CODDEPOSITO,
                        STMAG.QTA1UM,
                        STMAG.ORDINATO,
                        STMAG.IMPEGNATO,
                        STMAG.GIACENZA,
                        STMAG.RESO
                    FROM
                        #TP_ELENCOARTICOLIOF_TEMP TEAOF  WITH(NOLOCK)
                    INNER JOIN
                        TP_EXTRAMAG AS TEM WITH(NOLOCK)
                    ON
                        TEM.CodArt = TEAOF.CodArt
                    INNER JOIN
                        STORICOMAG AS STMAG  WITH(NOLOCK)    
                    ON
                        (STMAG.CODART = TEM.OFCODARTRIF And TEM.SOMMAQTASTAT = 0 And ((TEM.OFCODARTRIF <> '') AND (TEM.OFCODARTRIF IS NOT NULL))) And
                        STMAG.CodDeposito = TEAOF.Tp_CodDep  And
                        STMAG.ESERCIZIO = @Esercizio
                    LEFT JOIN
                        TP_GIACENZE AS TPG WITH(NOLOCK)
                    ON
                        TPG.CodArticolo = STMAG.CODART AND
                        TPG.CodDeposito = STMAG.CODDEPOSITO
                    WHERE
                        STMAG.PROGRESSIVO > ISNULL(TPG.ProgressivoSTMAG,0) AND
                        TEAOF.IdSessione = @IdSessione AND
                        TEAOF.Selezionato = 1 AND
                        ((TEAOF.CODART = @Articolo) OR (@Articolo = ''))
                    UNION ALL
                    /*Giacenza per prodotti con Articoli di riferimento in aggiunta (Flag = 1)*/
                    (
                        SELECT distinct
                            TEAOF.IdSessione,
                            STMAG.PROGRESSIVO,
                            TEM.CODART,
                            STMAG.CODDEPOSITO,
                            STMAG.QTA1UM,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA,
                            STMAG.RESO
                        FROM
                            #TP_ELENCOARTICOLIOF_TEMP TEAOF  WITH(NOLOCK)
                        INNER JOIN
                            TP_EXTRAMAG AS TEM WITH(NOLOCK)
                        ON
                            TEM.CodArt = TEAOF.CodArt
                        INNER JOIN
                            STORICOMAG AS STMAG  WITH(NOLOCK)    
                        ON
                            (STMAG.CODART = TEM.OFCODARTRIF And TEM.SOMMAQTASTAT = 1 And ((TEM.OFCODARTRIF <> '') AND (TEM.OFCODARTRIF IS NOT NULL))) And
                            STMAG.CodDeposito = TEAOF.Tp_CodDep  And
                            STMAG.ESERCIZIO = @Esercizio
                        LEFT JOIN
                            TP_GIACENZE AS TPG WITH(NOLOCK)
                        ON
                            TPG.CodArticolo = STMAG.CODART AND
                            TPG.CodDeposito = STMAG.CODDEPOSITO
                        WHERE
                            STMAG.PROGRESSIVO > ISNULL(TPG.ProgressivoSTMAG,0) AND
                            TEAOF.IdSessione = @IdSessione AND
                            TEAOF.Selezionato = 1 AND
                            ((TEAOF.CODART = @Articolo) OR (@Articolo = ''))
                        UNION ALL
                        SELECT distinct
                            TEAOF.IdSessione,
                            STMAG.PROGRESSIVO,
                            STMAG.CODART,
                            STMAG.CODDEPOSITO,
                            STMAG.QTA1UM,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA,
                            STMAG.RESO
                        FROM
                            #TP_ELENCOARTICOLIOF_TEMP TEAOF  WITH(NOLOCK)
                        INNER JOIN
                            TP_EXTRAMAG AS TEM WITH(NOLOCK)
                        ON
                            TEM.CodArt = TEAOF.CodArt
                        INNER JOIN
                            STORICOMAG AS STMAG  WITH(NOLOCK)    
                        ON
                            (STMAG.CODART = TEM.CodArt And TEM.SOMMAQTASTAT = 1 And ((TEM.OFCODARTRIF <> '') AND (TEM.OFCODARTRIF IS NOT NULL))) And
                            STMAG.CodDeposito = TEAOF.Tp_CodDep  And
                            STMAG.ESERCIZIO = @Esercizio
                        LEFT JOIN
                            TP_GIACENZE AS TPG WITH(NOLOCK)
                        ON
                            TPG.CodArticolo = STMAG.CODART AND
                            TPG.CodDeposito = STMAG.CODDEPOSITO
                        WHERE
                            STMAG.PROGRESSIVO > ISNULL(TPG.ProgressivoSTMAG,0) AND
                            TEAOF.IdSessione = @IdSessione AND
                            TEAOF.Selezionato = 1 AND
                            ((TEAOF.CODART = @Articolo) OR (@Articolo = ''))
                    )

                ) STMAG
            GROUP BY 
                STMAG.IdSessione,
                STMAG.CODART,
                STMAG.CODDEPOSITO
            HAVING  
                SUM(STMAG.QTA1UM*STMAG.ORDINATO) <>0 OR 
                SUM(STMAG.QTA1UM*STMAG.IMPEGNATO) <>0 OR 
                SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
                SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 0 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
                SUM(CASE WHEN STMAG.GIACENZA=-1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 OR 
                SUM(CASE WHEN STMAG.GIACENZA=1 and STMAG.RESO = 1 THEN STMAG.QTA1UM ELSE 0 END) <>0 
        ) AS GIACENZAMETODO
        FULL JOIN
            (
                SELECT 
                    IdSessione,
                    CODART,
                    CODDEPOSITO,
                    SUM(ORDINATO) AS ORDINATO,
                    SUM(IMPEGNATO) AS IMPEGNATO,
                    SUM(GIACENZA) AS GIACENZA
                FROM
                (
                    /*Giacenza Iniziale = 0*/
                    SELECT distinct
                        TEAOF.IdSessione,
                        TEAOF.CODART AS CODART,
                        TEAOF.TP_CODDEP AS CODDEPOSITO,
                        0 AS ORDINATO,
                        0 AS IMPEGNATO,
                        0 AS GIACENZA
                    FROM
                        #TP_ELENCOARTICOLIOF_TEMP TEAOF WITH(NOLOCK)
                    WHERE
                        TEAOF.Selezionato = 1 AND
                        ((TEAOF.CODART = @Articolo) OR (@Articolo = '')) AND
                        TEAOF.IdSessione = @IdSessione
                    UNION ALL
                    /*Giacenza Iniziale per prodotti senza Articoli di riferimento*/
                    SELECT
                        TEAOF.IdSessione,
                        STMAG.CODARTICOLO AS CODART,
                        STMAG.CODDEPOSITO AS CODDEPOSITO,
                        STMAG.ORDINATO,
                        STMAG.IMPEGNATO,
                        STMAG.GIACENZA
                    FROM
                        #TP_ELENCOARTICOLIOF_TEMP TEAOF WITH(NOLOCK)
                    INNER JOIN
                        TP_EXTRAMAG AS TEM WITH(NOLOCK)
                    ON
                        TEM.CodArt = TEAOF.CodArt
                    INNER JOIN
                        TP_GIACENZE AS STMAG WITH(NOLOCK)
                    ON
                        (STMAG.CodArticolo = TEM.CodArt And ((TEM.OFCODARTRIF = '') OR (TEM.OFCODARTRIF IS NULL))) And
                        TEAOF.TP_CodDep = STMAG.CodDeposito AND
                        STMAG.Esercizio = @Esercizio AND
                        TEAOF.IdSessione = @IdSessione AND
                        TEAOF.Selezionato = 1
                    WHERE
                        ((TEAOF.CODART = @Articolo) OR (@Articolo = '')) 
                    GROUP BY
                        TEAOF.IdSessione,
                        STMAG.CODARTICOLO,
                        STMAG.CODDEPOSITO,
                        STMAG.ORDINATO,
                        STMAG.IMPEGNATO,
                        STMAG.GIACENZA
                    UNION ALL
                    /*Giacenza Iniziale per prodotti con Articoli di riferimento in sostituzione (Flag = 0)*/
                    SELECT
                        TEAOF.IdSessione,
                        TEM.CodArt,
                        STMAG.CODDEPOSITO AS CODDEPOSITO,
                        STMAG.ORDINATO,
                        STMAG.IMPEGNATO,
                        STMAG.GIACENZA
                    FROM
                        #TP_ELENCOARTICOLIOF_TEMP TEAOF WITH(NOLOCK)
                    INNER JOIN
                        TP_EXTRAMAG AS TEM WITH(NOLOCK)
                    ON
                        TEM.CodArt = TEAOF.CodArt
                    INNER JOIN
                        TP_GIACENZE AS STMAG WITH(NOLOCK)
                    ON
                        (STMAG.CodArticolo = TEM.CodArt And TEM.SOMMAQTASTAT = 0 And ((TEM.OFCODARTRIF <> '') AND (TEM.OFCODARTRIF IS NOT NULL))) And
                        TEAOF.TP_CodDep = STMAG.CodDeposito AND
                        STMAG.Esercizio = @Esercizio AND
                        TEAOF.IdSessione = @IdSessione AND
                        TEAOF.Selezionato = 1
                    WHERE
                        ((TEAOF.CODART = @Articolo) OR (@Articolo = '')) 
                    GROUP BY
                        TEAOF.IdSessione,
                        TEM.CodArt,
                        STMAG.CODDEPOSITO,
                        STMAG.ORDINATO,
                        STMAG.IMPEGNATO,
                        STMAG.GIACENZA
                    UNION ALL
                    /*Giacenza Iniziale per prodotti con Articoli di riferimento in aggiunta (Flag = 1)*/
                    (
                        SELECT
                            TEAOF.IdSessione,
                            STMAG.CodArticolo AS CodArt,
                            STMAG.CODDEPOSITO AS CODDEPOSITO,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA
                        FROM
                            #TP_ELENCOARTICOLIOF_TEMP TEAOF WITH(NOLOCK)
                        INNER JOIN
                            TP_EXTRAMAG AS TEM WITH(NOLOCK)
                        ON
                            TEM.CodArt = TEAOF.CodArt
                        INNER JOIN
                            TP_GIACENZE AS STMAG WITH(NOLOCK)
                        ON
                            (STMAG.CodArticolo = TEM.CodArt And TEM.SOMMAQTASTAT = 1 And ((TEM.OFCODARTRIF <> '') AND (TEM.OFCODARTRIF IS NOT NULL))) And
                            TEAOF.TP_CodDep = STMAG.CodDeposito AND
                            STMAG.Esercizio = @Esercizio AND
                            TEAOF.IdSessione = @IdSessione AND
                            TEAOF.Selezionato = 1
                        WHERE
                            ((TEAOF.CODART = @Articolo) OR (@Articolo = '')) 
                        GROUP BY
                            TEAOF.IdSessione,
                            STMAG.CodArticolo,
                            STMAG.CODDEPOSITO,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA
                        UNION ALL
                        SELECT
                            TEAOF.IdSessione,
                            TEM.CodArt,
                            STMAG.CODDEPOSITO AS CODDEPOSITO,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA
                        FROM
                            #TP_ELENCOARTICOLIOF_TEMP TEAOF WITH(NOLOCK)
                        INNER JOIN
                            TP_EXTRAMAG AS TEM WITH(NOLOCK)
                        ON
                            TEM.CodArt = TEAOF.CodArt
                        INNER JOIN
                            TP_GIACENZE AS STMAG WITH(NOLOCK)
                        ON
                            (STMAG.CodArticolo = TEM.OFCODARTRIF And TEM.SOMMAQTASTAT = 1 And ((TEM.OFCODARTRIF <> '') AND (TEM.OFCODARTRIF IS NOT NULL))) And
                            TEAOF.TP_CodDep = STMAG.CodDeposito AND
                            STMAG.Esercizio = @Esercizio AND
                            TEAOF.IdSessione = @IdSessione AND
                            TEAOF.Selezionato = 1
                        WHERE
                            ((TEAOF.CODART = @Articolo) OR (@Articolo = '')) 
                        GROUP BY
                            TEAOF.IdSessione,
                            TEM.CodArt,
                            STMAG.CODDEPOSITO,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA
                    )
                ) AS GCC
                GROUP BY
                    IdSessione,
                    CODART,
                    CODDEPOSITO
            ) AS GIACENZAINIZIALEMETODO
        ON  
            GIACENZAMETODO.CODART = GIACENZAINIZIALEMETODO.CODART AND
            GIACENZAMETODO.CODDEPOSITO = GIACENZAINIZIALEMETODO.CodDeposito AND
            GIACENZAMETODO.IdSessione = GIACENZAINIZIALEMETODO.IdSessione 
    ) AS GIACENZAMETODOUNIFICATA
    GROUP BY IdSessione,CODART,CODDEPOSITO
) GIACENZE
ON
    #TP_ELENCOARTICOLIOF_TEMP.Selezionato = 1 AND
    ((#TP_ELENCOARTICOLIOF_TEMP.CODART = @Articolo) OR (@Articolo = '')) AND
    GIACENZE.IdSessione = #TP_ELENCOARTICOLIOF_TEMP.IdSessione AND
    GIACENZE.CODART = #TP_ELENCOARTICOLIOF_TEMP.CodArt AND
    GIACENZE.CodDeposito = #TP_ELENCOARTICOLIOF_TEMP.Tp_CodDep;
    
/*Scelta Proposta*/
UPDATE #TP_ELENCOARTICOLIOF_TEMP
    SET Proposta = (CASE @Tipo 
                        WHEN 0 THEN PropostaPrd
                        WHEN 1 THEN (CASE WHEN PropostaCom <= QtaMinima THEN QtaMinima ELSE PropostaCom END)  
                        WHEN 2 THEN PropostaDoc
                        WHEN 3 THEN (CASE WHEN PropostaLbr <= QtaMinima THEN QtaMinima ELSE PropostaLbr END) 
                        WHEN 4 THEN PropostaDoc
                        ELSE 0
                    END)
WHERE   Selezionato = 1 And 
        IdSessione = @IdSessione And 
        ((#TP_ELENCOARTICOLIOF_TEMP.CODART = @Articolo) OR (@Articolo = ''));
    
    
    
/*Se proposta ?egativa vuol dire che la disponibilit? maggiore della proposta perci??ve essere 0*/
UPDATE #TP_ELENCOARTICOLIOF_TEMP
    SET Proposta = 0
WHERE   Selezionato = 1 And 
        IdSessione = @IdSessione And 
        Proposta < 0 And 
        ((#TP_ELENCOARTICOLIOF_TEMP.CODART = @Articolo) OR (@Articolo = ''));
    
/*Popolo la Tabella Temporanea con i soli Articoli che mi servono*/
INSERT INTO TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP(IdSessione,CodDeposito,CodArt,CodFornitore,CodFornitoreFatt,Descrizione,Gruppo,Categoria,CodCategoriaStat,VarEsplicite,CodFamigliaPos,CodRepartoPos,CodLivello,CodMarchio,
                                                    QtaProposta,DepositoOrdinabile,IsPreferenziale,DataConsegna,UtenteModifica,DataModifica)
SELECT DISTINCT 
    TEAT.IdSessione,
    TEAT.TP_CodDep,
    TEAT.CodArt,
    TEAT.CodFor,
    TLR.TP_FORNFATTURAZIONE,
    TEAT.DescrizioneArt,
    TEAT.Gruppo,
    TEAT.Categoria,
    TEAT.CodCategoriaStat,
    TEAT.VarEsplicite,
    TEAT.CodFamigliaPos,
    TEAT.CodRepartoPos,
    TEAT.CodLivello,
    TEAT.CodMarchio,
    SUM(TEAT.Proposta) OVER(PARTITION BY TEAT.IdSessione,TEAT.TP_CodDep,TEAT.CodArt,TEAT.CodFor,TLR.TP_FORNFATTURAZIONE),
    TEAT.DepositoOrdinabile,
    TEAT.IsPreferenziale,
    TEAT.DataCons,
    TEAT.UtenteModifica,
    TEAT.DataModifica
FROM 
    #TP_ELENCOARTICOLIOF_TEMP TEAT  WITH(NOLOCK)
INNER JOIN
    TABLOTTIRIORDINO TLR  WITH(NOLOCK)
ON 
    TLR.CODART = TEAT.CODART AND
    TLR.CODFOR = TEAT.CodFor AND
    TLR.TP_CODDEP = TEAT.Tp_CodDep
WHERE   TEAT.IdSessione = @IdSessione AND 
        TEAT.Selezionato = 1 And 
        ((TEAT.CODART = @Articolo) OR (@Articolo = ''))  AND 
        ((@Tipo = 0 AND NomePianif <> '' AND NomePianif IS NOT NULL) OR (@Tipo <> 0 AND (NomePianif IS NULL OR NomePianif = '')));
    
/*Arrotondo le quantit�*/
UPDATE TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP
SET TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.QtaProposta = TEAT.Proposta,
    TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.QtaOrdinata = (CASE WHEN TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.IsPreferenziale = 1 And @PreAssegnaQuantita = 1 THEN TEAT.Proposta ELSE 0 END)
FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP
INNER JOIN
(
    SELECT
        TEAT.IdSessione,
        TEAT.CodArt,
        TEAT.CodDeposito,
        TEAT.CodFornitore,
        (CASE WHEN TEAT.[QtaProposta] <= 0 
                THEN 0 
                ELSE (CASE TEM.OFARRQTAINORD 
                        WHEN 0 THEN FLOOR((AA.NRPEZZIIMBALLO * (ABS(TEAT.[QtaProposta]) / AA.NRPEZZIIMBALLO))+ 0.9)
                        WHEN 1 THEN FLOOR(TEAT.[QtaProposta] + 0.9)
                    ELSE TEAT.[QtaProposta] END) 
            END) AS PROPOSTA
    FROM 
        TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TEAT  WITH(NOLOCK)
    INNER JOIN
        TP_EXTRAMAG TEM  WITH(NOLOCK)
    ON
        TEM.CODART = TEAT.CODART
    INNER JOIN
        (SELECT CODICE,ISNULL(NULLIF(NRPEZZIIMBALLO,0),1) AS NRPEZZIIMBALLO FROM ANAGRAFICAARTICOLI  WITH(NOLOCK)) AS AA
    ON
        AA.CODICE = TEAT.CODART
    WHERE
        TEAT.IdSessione = @IdSessione And ((TEAT.CODART = @Articolo) OR (@Articolo = ''))
) TEAT
ON
        TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.IdSessione = TEAT.IdSessione
    AND TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodArt = TEAT.CodArt
    AND TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodDeposito = TEAT.CodDeposito
    AND TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodFornitore = TEAT.CodFornitore;
    
/*Riga Bloccata*/
UPDATE TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP
SET TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.IsLocked = TF.TotFornitore
FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP
INNER JOIN
(   
    select
        IdSessione,
        CodArt,
        CodDeposito,
        CodFornitore,
        COUNT(CodFornitore) OVER(Partition By CodArt,CodDeposito) TotFornitore
    from 
        TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP  WITH(NOLOCK)
    Where IdSessione = @IdSessione 
) TF
ON
    TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.IdSessione = TF.IdSessione
AND TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodArt = TF.CodArt
AND TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodDeposito = TF.CodDeposito
AND TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodFornitore = TF.CodFornitore;
    
/*Miglior Prezzo*/
UPDATE [TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP] SET IsPrezzoMigliore = 0
WHERE IdSessione = @IdSessione AND ((CodArt = @Articolo) OR (@Articolo = ''));
    
/*
UPDATE [TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP]
SET IsPrezzoMigliore = ISNULL(MP.MPREZZOEURO,0)
FROM [TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP]
INNER JOIN
(
    select 
        TAFFT.IdSessione,
        LA.CODART,
        LA.Nrlistino,
        LA.tp_codconto,
        (CASE WHEN LA.PREZZOEURO = MIN(LA.PREZZOEURO) OVER (Partition By LA.CODART) THEN 1 ELSE 0 END) AS MPREZZOEURO
    from 
        listiniarticoli LA  WITH(NOLOCK)
    inner join 
        TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP TAFFT  WITH(NOLOCK)
    on 
        TAFFT.CodArt = LA.CODART AND
        TAFFT.IdSessione = @IdSessione
    Inner join 
        ANAGRAFICARISERVATICF ARCF 
    On
        ARCF.CODCONTO = LA.TP_CodConto AND
        ARCF.ESERCIZIO = @Esercizio AND
        ARCF.LISTINO = LA.NRLISTINO
    where 
        ((LA.TP_CodConto is not null) and 
            (LA.TP_CodConto <> '')) and 
        (LA.PREZZOEURO > 0)
) MP
ON
    [TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP].IdSessione = MP.IdSessione AND
    [TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP].CodArt = MP.CODART AND
    [TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP].CodFornitore = MP.TP_CodConto;
*/
    
/*Elenco dei soli articoli*/
INSERT INTO [TP_ARTICOLIORDINEFORNITORE_TEMP]([IdSessione],[CodArt],[DescArticolo],[QtaOrdinata],[Previsione],[Annulla],[Nuovo],[UtenteModifica],[DataModifica])
SELECT DISTINCT
    [IdSessione],
    [CodArt],
    [Descrizione],
    SUM([QtaOrdinata]) OVER(PARTITION BY [CodArt]) As QtaOrdinata,
    SUM([QtaProposta]) OVER(PARTITION BY [CodArt]) AS QtaProposta,
    0 As [Annulla],
    0 AS Nuovo,
    USER_NAME(),
    GETDATE()
FROM
(
    SELECT DISTINCT ROW_NUMBER() OVER(PARTITION BY [CodArt],[CodDeposito],[QtaProposta] ORDER BY [CodArt],[CodDeposito],[QtaOrdinata] DESC,[QtaProposta] DESC) AS [Counter],
    [IdSessione],[CodArt],[Descrizione],[CodDeposito],
    [QtaOrdinata],
    (CASE WHEN [IsPreferenziale] = 1 THEN [QtaProposta] ELSE 0 END) AS [QtaProposta]
    FROM [TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP]  WITH(NOLOCK)
    WHERE IDSESSIONE = @IdSessione And ((CODART = @Articolo) OR (@Articolo = ''))
) Data
WHERE
    Data.Counter = 1;
    
/*Sotto Scorta*/
IF (@SoloSottoScorta = 1) AND (@Articolo = '') AND (@Tipo <> 2)
    BEGIN
        DELETE FROM [TP_ARTICOLIORDINEFORNITORE_TEMP] WHERE [IdSessione] = @IdSessione AND [Previsione] = 0;
    END
END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_PreparaGiacenzeArticoliOF] TO [Metodo98]
    AS [dbo];

