

CREATE PROCEDURE [dbo].[Proc_PreparaElencoFornitoriOF]

AS

BEGIN
    
DECLARE @nSQL       Varchar(MAX)
DECLARE @Esercizio  Decimal(5,0)

    SET NOCOUNT ON 
    
    SET @Esercizio = YEAR(GETDATE())
    SET @nSQL = ''
    
    /*Creo la tabella temporanea*/
    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[#TP_ELENCOARTICOLIFORNITORIOF_TEMP]') AND type in (N'U'))   
        DROP TABLE [dbo].[#TP_ELENCOARTICOLIFORNITORIOF_TEMP];   

    CREATE TABLE [dbo].[#TP_ELENCOARTICOLIFORNITORIOF_TEMP]
    (
        [Tp_CodDep] [varchar](10) NOT NULL,
        [CodArt] [varchar](50) NOT NULL,
        [CodFor] [varchar](7) NOT NULL,
        [ModalitaCalcolo] [smallint] NOT NULL, 
        [Gruppo] [decimal](5, 0) NULL,
        [Categoria] [decimal](5, 0) NULL,
        [CodCategoriaStat] [decimal](5, 0) NULL,   
        [GruppoPrzPart] [decimal](5, 0) NULL,
        [VarEsplicite] [varchar](255) NULL,
        [CodFamigliaPos] [decimal](5, 0) NULL,   
        [CodRepartoPos] [decimal](5, 0) NULL,
        [CodMarchio] [varchar](50) NULL,
        [CodLivello] [varchar](250) NULL,   
        [Giacenza] [decimal](18, 6) NULL,
        [Ordinato] [decimal](18, 6) NULL,
        [Impegnato] [decimal](18, 6) NULL,   
        [Disponibilita] [decimal](18, 6) NULL,
        [ScortaSicurezza] [decimal](18, 6) NULL,
        [LottoRiordino] [decimal](18, 6) NULL,   
        [LivelloRiordino] [decimal](18, 6) NULL,
        [Proposta] [decimal](18, 6) NOT NULL,
        [DescrizioneArt] [varchar](80) NULL,
        [QtaMinima] [decimal](18, 6) DEFAULT(0) NOT NULL, 
        [UtenteModifica] [varchar](25) NULL,
        [DataModifica] [datetime] NULL,
        PRIMARY KEY CLUSTERED ([Tp_CodDep] ASC,[CodArt] ASC,[CodFor] ASC)) ON [PRIMARY];
        
    /*Pulisco la tabella (anche se non serve)*/
    SET @nSQL = CAST('TRUNCATE TABLE #TP_ELENCOARTICOLIFORNITORIOF_TEMP;' AS Varchar(MAX))
    EXEC(@nSQL);
    
    
    /*Prendo tutti gli articoli abilitati per l'ordine a fornitore e i relativi dati(Scorta,Lotto, Etc)*/
    SET @nSQL = CAST('INSERT INTO #TP_ELENCOARTICOLIFORNITORIOF_TEMP(TP_CodDep,CodArt,CodFor,ModalitaCalcolo,Gruppo,Categoria,CodCategoriaStat,GruppoPrzPart,CodFamigliaPos,CodRepartoPos,CodLivello,CodMarchio,VarEsplicite,
                                                            ScortaSicurezza,LottoRiordino,LivelloRiordino,Proposta,DescrizioneArt,QtaMinima,UtenteModifica,DataModifica)
                      SELECT DISTINCT
                        TLR.TP_CODDEP AS CODDEPOSITO,
                        TLR.CODART,
                        TLR.CODFOR,
                        ISNULL(TLR.MODALITACALCOLO,0) AS MODALITACALCOLO,
                        TLR.GRUPPO,
                        TLR.CATEGORIA,
                        TLR.CODCATEGORIASTAT,
                        AAC.GRUPPOPRZPART,
                        TLR.CodFamigliaPOS,
                        TLR.CodRepartoPOS,
                        TLM.CodLivelloInterno,
                        TLR.CodMarchio,
                        TLR.VARESPLICITE,
                        ISNULL(
                                (
                                    CASE ISNULL(TLR.MODALITACALCOLO,0)
                                        WHEN 0 THEN EOQ.SCORTASICUREZZA
                                        WHEN 1 THEN PFR.SCORTASICUREZZA
                                        WHEN 2 THEN SCRT.SCORTASICUREZZA
                                        WHEN 3 THEN PERS.SCORTASICUREZZA
                                    END
                                )
                            ,0) AS SCORTASICUREZZA,
                        ISNULL(
                                (
                                    CASE ISNULL(TLR.MODALITACALCOLO,0)
                                        WHEN 0 THEN EOQ.LOTTORIORDINO
                                        WHEN 1 THEN TLR.LottoRif
                                        WHEN 2 THEN TLR.LottoRif
                                        WHEN 3 THEN PERS.LOTTORIORDINO
                                    END
                                )
                            ,0) AS LOTTORIORDINO,
                        ISNULL(
                                (
                                    CASE ISNULL(TLR.MODALITACALCOLO,0)
                                        WHEN 0 THEN EOQ.LIVELLORIORDINO
                                        WHEN 1 THEN PFR.LIVELLORIORDINO
                                        WHEN 2 THEN SCRT.LIVELLORIORDINO
                                        WHEN 3 THEN PERS.LIVELLORIORDINO
                                    END
                                )
                            ,0) AS LIVELLORIORDINO,
                        0 AS PROPOSTA,
                        TLR.Descrizione,
                        ISNULL(TLR.QtaMinima,0) AS QtaMinima,
                        USER_NAME(),
                        GETDATE()
                      FROM
                        (SELECT DISTINCT CODICE AS CODART,TP_CODDEP,CODFOR,LottoRif,QtaMinima,GRUPPO,CATEGORIA,CODCATEGORIASTAT,DESCRIZIONE,AA.VARESPLICITE,TEM.CodFamigliaPOS,TEM.CodRepartoPOS,TEM.MODALITACALCOLO,TEM.CodMarchio
                         FROM TABLOTTIRIORDINO TLR
                         INNER JOIN ANAGRAFICAARTICOLI AA
                         ON AA.CODICE = TLR.CODART AND AA.ARTTIPOLOGIA = 0
                         INNER JOIN TP_EXTRAMAG TEM
                         ON TEM.CodArt = TLR.CODART AND TEM.ConsidAcq = 1
                         ) TLR 
                      INNER JOIN
                        TP_TABMAGAZZINI TTM
                      ON 
                        TTM.CODDEPOSITO = TLR.TP_CODDEP
                      INNER JOIN
                        ANAGRAFICAARTICOLICOMM AAC
                      ON
                        AAC.CODICEART = TLR.CODART AND AAC.ESERCIZIO = ' + CAST(@Esercizio As Varchar(MAX)) + '
                      LEFT JOIN
                        Tp_LivelliArticoli TLM
                      ON
                        TLM.Codice = TLR.CODART
                      LEFT JOIN
                        (
                            SELECT
                                CodArticolo,
                                CodDeposito,
                                CodFornPref,
                                (CASE WHEN USAVALOREFORZATO = 0 THEN SCORTAMINIMACALCOLATA ELSE SCORTAMINIMAFORZATO END) AS SCORTASICUREZZA,
                                (CASE WHEN USAVALOREFORZATO = 0 THEN LOTTORIORDINOCALCOLATO ELSE LOTTORIORDINOFORZATO END) AS LOTTORIORDINO,
                                (CASE WHEN USAVALOREFORZATO = 0 THEN LIVELLORIORDINOCALCOLATO ELSE LIVELLORIORDINOFORZATO END) AS LIVELLORIORDINO
                            FROM TP_APPROVV_DEPOSITI
                        ) EOQ
                      ON
                        EOQ.CODARTICOLO = TLR.CODART AND
                        EOQ.CODDEPOSITO = TLR.TP_CODDEP
                      LEFT JOIN
                        (
                            SELECT 
                                CodArticolo,
                                CodDeposito,
                                CodFornPref,
                                (CASE WHEN USAVALOREFORZATO = 0 THEN SCORTASICUREZZACALCOLATA ELSE SCORTASICUREZZAFORZATO END) AS SCORTASICUREZZA,
                                0 AS LOTTORIORDINO,
                                (CASE WHEN USAVALOREFORZATO = 0 THEN QTAOBIETTIVOCALCOLATA ELSE QTAOBIETTIVOFORZATO END) AS LIVELLORIORDINO
                            FROM TP_PUNTOFISSORIORDINO
                        ) PFR
                      ON
                        PFR.CODARTICOLO = TLR.CODART AND
                        PFR.CODDEPOSITO = TLR.TP_CODDEP
                      LEFT JOIN
                        (
                            SELECT
                                CodArticolo,
                                CodDeposito,
                                CodFornPref,
                                (CASE WHEN USAVALOREFORZATO = 0 THEN SCORTASICUREZZA ELSE SCORTASICUREZZAFORZATO END) AS SCORTASICUREZZA,
                                (CASE WHEN USAVALOREFORZATO = 0 THEN LIVELLORIORDINOCALCOLATO ELSE LIVELLORIORDINOFORZATO END) AS LIVELLORIORDINO
                            FROM TP_SCORTA
                        ) SCRT
                      ON
                        SCRT.CODARTICOLO = TLR.CODART AND
                        SCRT.CODDEPOSITO = TLR.TP_CODDEP
                      LEFT JOIN
                        (
                            SELECT 
                                CodArticolo,
                                CodDeposito,
                                CodFornPref,
                                0 AS SCORTASICUREZZA,
                                0 AS LOTTORIORDINO,
                                TP_PERSONALIZZATOLIBERO.Qta AS LIVELLORIORDINO
                            FROM TP_PERSONALIZZATOLIBERO
                        ) PERS
                      ON
                        PERS.CODARTICOLO = TLR.CODART AND
                        PERS.CODDEPOSITO = TLR.TP_CODDEP
                      ;' AS Varchar(MAX))
                        
                    EXEC(@nSQL);
                    
                    /*Equivale al print (per il debug)*/
                    --select @nSQL as [processing-instruction(x)] FOR XML PATH ;
    
    /*Aggiorno la giacenza*/
    UPDATE #TP_ELENCOARTICOLIFORNITORIOF_TEMP
    SET
        #TP_ELENCOARTICOLIFORNITORIOF_TEMP.Proposta = (
                                                CASE WHEN #TP_ELENCOARTICOLIFORNITORIOF_TEMP.ModalitaCalcolo IN(0,2)
                                                    THEN (
                                                        CASE WHEN ((GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO) < #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LivelloRiordino)
                                                             THEN (
                                                                    CASE WHEN (#TP_ELENCOARTICOLIFORNITORIOF_TEMP.LottoRiordino > 1)
                                                                         THEN #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LottoRiordino * FLOOR((ABS(GIACENZE.Giacenza - #TP_ELENCOARTICOLIFORNITORIOF_TEMP.ScortaSicurezza + GIACENZE.Ordinato - GIACENZE.Impegnato) / #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LottoRiordino) + 1) 
                                                                         ELSE ABS(GIACENZE.Giacenza - #TP_ELENCOARTICOLIFORNITORIOF_TEMP.ScortaSicurezza + GIACENZE.Ordinato - GIACENZE.Impegnato)
                                                                    END
                                                                  )
                                                             ELSE 0
                                                        END 
                                                        )
                                                    WHEN #TP_ELENCOARTICOLIFORNITORIOF_TEMP.ModalitaCalcolo IN(1)
                                                    THEN (
                                                        CASE WHEN ((GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO) < #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LivelloRiordino)
                                                             THEN (
                                                                    CASE WHEN (#TP_ELENCOARTICOLIFORNITORIOF_TEMP.LottoRiordino > 1)
                                                                         THEN #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LottoRiordino * FLOOR((ABS(GIACENZE.Giacenza - #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LivelloRiordino + GIACENZE.Ordinato - GIACENZE.Impegnato) / #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LottoRiordino) + 1)                                                            
                                                                         ELSE ABS(GIACENZE.Giacenza - #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LivelloRiordino + GIACENZE.Ordinato - GIACENZE.Impegnato)
                                                                    END
                                                                  )
                                                             ELSE 0
                                                        END
                                                        )
                                                    ELSE
                                                        0
                                                    /*WHEN (#TP_ELENCOARTICOLIFORNITORIOF_TEMP.ModalitaCalcolo = 0) OR (#TP_ELENCOARTICOLIFORNITORIOF_TEMP.ModalitaCalcolo = 1) 
                                                    THEN (
                                                        CASE WHEN #TP_ELENCOARTICOLIFORNITORIOF_TEMP.NETTIFICADISPONIBILITA = 1
                                                             THEN (#TP_ELENCOARTICOLIFORNITORIOF_TEMP.LIVELLORIORDINO - (GIACENZE.GIACENZA + GIACENZE.ORDINATO - GIACENZE.IMPEGNATO)) 
                                                             ELSE #TP_ELENCOARTICOLIFORNITORIOF_TEMP.LIVELLORIORDINO
                                                        END
                                                        )*/
                                               END
                                              )
                                               
    FROM #TP_ELENCOARTICOLIFORNITORIOF_TEMP
    INNER JOIN
    (
        SELECT
            CODART,
            CODDEPOSITO,
            SUM(GIACENZA_I + GIACENZA_F) AS GIACENZA,
            SUM(ORDINATO_I + ORDINATO_F) AS ORDINATO,
            SUM(IMPEGNATO_I + IMPEGNATO_F) AS IMPEGNATO
        FROM
        (
            SELECT
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
                        SELECT distinct
                            STMAG.PROGRESSIVO,
                            STMAG.CODART,
                            STMAG.CODDEPOSITO,
                            STMAG.QTA1UM,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA,
                            STMAG.RESO
                        FROM
                            STORICOMAG AS STMAG  WITH(NOLOCK)
                        INNER JOIN
                            #TP_ELENCOARTICOLIFORNITORIOF_TEMP TEAOF  WITH(NOLOCK)
                        ON
                            TEAOF.CodArt = STMAG.CODART AND
                            TEAOF.Tp_CodDep = STMAG.CodDeposito AND
                            STMAG.ESERCIZIO = @Esercizio
                    ) STMAG
                GROUP BY 
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
                        CODART,
                        CODDEPOSITO,
                        SUM(ORDINATO) AS ORDINATO,
                        SUM(IMPEGNATO) AS IMPEGNATO,
                        SUM(GIACENZA) AS GIACENZA
                    FROM
                    (
                        SELECT
                            STMAG.CODARTICOLO AS CODART,
                            STMAG.CODDEPOSITO AS CODDEPOSITO,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA
                        FROM 
                            TP_GIACENZESTORICO AS STMAG WITH(NOLOCK)
                        INNER JOIN
                            #TP_ELENCOARTICOLIFORNITORIOF_TEMP TEAOF WITH(NOLOCK)
                        ON
                            TEAOF.CodArt = STMAG.CodArticolo AND
                            TEAOF.TP_CodDep = STMAG.CodDeposito AND
                            STMAG.Esercizio = (@Esercizio - 1)
                        GROUP BY
                            STMAG.CODARTICOLO,
                            STMAG.CODDEPOSITO,
                            STMAG.ORDINATO,
                            STMAG.IMPEGNATO,
                            STMAG.GIACENZA
                        UNION ALL
                        SELECT distinct
                            TEAOF.CODART AS CODART,
                            TEAOF.TP_CODDEP AS CODDEPOSITO,
                            0 AS ORDINATO,
                            0 AS IMPEGNATO,
                            0 AS GIACENZA
                        FROM
                            #TP_ELENCOARTICOLIFORNITORIOF_TEMP TEAOF WITH(NOLOCK)
                    ) AS GCC
                    GROUP BY
                        CODART,
                        CODDEPOSITO
                ) AS GIACENZAINIZIALEMETODO
            ON  
                GIACENZAMETODO.CODART = GIACENZAINIZIALEMETODO.CODART AND
                GIACENZAMETODO.CODDEPOSITO = GIACENZAINIZIALEMETODO.CodDeposito
        ) AS GIACENZAMETODOUNIFICATA
        GROUP BY CODART,CODDEPOSITO
    ) GIACENZE
    ON
        GIACENZE.CODART = #TP_ELENCOARTICOLIFORNITORIOF_TEMP.CodArt AND
        GIACENZE.CodDeposito = #TP_ELENCOARTICOLIFORNITORIOF_TEMP.Tp_CodDep
    ;
    
    /*Pulisco la tabella dei fornitori*/
    DELETE FROM [TP_ELENCOFORNITORIOF_TEMP];
    
    /*Inserisco i dati nella tabella dei fornitori*/
    INSERT INTO [TP_ELENCOFORNITORIOF_TEMP]([CodBuyer],[CodDeposito],[CodFornitore],[EOQ],[PFR],[SCT],[PRS],[Data],[Ordinato],[UtenteModifica],[DataModifica])
    Select
        CodBuyer,
        Tp_CodDep,
        CodFor,
        (Case When Sum([EOQ]) > 0 Then 1 Else 0 End) As [EOQ],
        (Case When (Sum([PFR]) > 0) AND (ISPFR = 1) Then 1 Else 0 End) As [PFR],
        (Case When Sum([SCT]) > 0 Then 1 Else 0 End) As [SCT],
        (Case When Sum([PRS]) > 0 Then 1 Else 0 End) As [PRS],
        Convert(Varchar(8),GetDate(),112) As Data,
        0 As Ordinato,
        USER_NAME() As UtenteModifica,
        GetDate() As DataModifica
    From
    (
        Select
            TCB.CODBUYER,
            (CASE WHEN (TCPFR.DATARIORDINO IS NOT NULL) THEN 1 ELSE 0 END) As ISPFR,
            Art.Tp_CodDep,
            Art.CodArt,
            Art.CodFor,
            Art.[EOQ],
            Art.[PFR],
            Art.[SCT],
            Art.[PRS]
        From
        (
            Select 
                Tp_CodDep,
                CodArt,
                CodFor,
                Gruppo,
                Categoria,
                CodCategoriaStat,
                CodFamigliaPos,
                CodRepartoPos,
                CodLivello,
                GruppoPrzPart,
                ISNULL([0],0) As [EOQ],
                ISNULL([1],0) As [PFR],
                ISNULL([2],0) As [SCT],
                ISNULL([3],0) As [PRS]
            From
            (   
                SELECT 
                    Tp_CodDep,CodArt,CodFor,Gruppo,Categoria,CodCategoriaStat,CodFamigliaPos,CodRepartoPos,CodLivello,GruppoPrzPart,ModalitaCalcolo,Proposta 
                FROM 
                    #TP_ELENCOARTICOLIFORNITORIOF_TEMP 
                WHERE 
                    Proposta > 0
            ) As t
            PIVOT
            (
                Sum(Proposta) For ModalitaCalcolo IN([0],[1],[2],[3])
            ) As p
        ) Art
        INNER JOIN
            TP_CONFIGURAZIONIBUYER TCB
        ON
            TCB.CODDEPOSITO = Art.TP_CODDEP AND 
            TCB.CODFORNITORE = Art.CODFOR
        LEFT JOIN
            TP_CONFIGURAZIONIPUNTOFISSORIORDINO_RIORDINO TCPFR
        ON
            TCPFR.CodDeposito = TCB.CODDEPOSITO And
            TCPFR.CodFornitore = TCB.CODFORNITORE And
            Convert(Varchar(8),TCPFR.DATARIORDINO,112) = Convert(Varchar(8),GETDATE(),112)
        LEFT JOIN 
            TP_CONFIGURAZIONIBUYER_GRUPPI TCBG 
        ON 
            TCBG.CODBUYER = TCB.CODBUYER AND 
            TCBG.CODDEPOSITO = TCB.CODDEPOSITO AND 
            TCBG.CODFORNITORE = TCB.CODFORNITORE
        LEFT JOIN 
            TP_CONFIGURAZIONIBUYER_CATEGORIE TCBC 
        ON 
            TCBC.CODBUYER = TCB.CODBUYER AND 
            TCBC.CODDEPOSITO = TCB.CODDEPOSITO AND 
            TCBC.CODFORNITORE = TCB.CODFORNITORE 
        LEFT JOIN 
            TP_CONFIGURAZIONIBUYER_CATEGORIEST TCBS 
        ON 
            TCBS.CODBUYER = TCB.CODBUYER AND 
            TCBS.CODDEPOSITO = TCB.CODDEPOSITO AND 
            TCBS.CODFORNITORE = TCB.CODFORNITORE   
        LEFT JOIN 
            TP_CONFIGURAZIONIBUYER_GRUPPIPRZ TCBZ 
        ON     
            TCBZ.CODBUYER = TCB.CODBUYER AND 
            TCBZ.CODDEPOSITO = TCB.CODDEPOSITO AND 
            TCBZ.CODFORNITORE = TCB.CODFORNITORE   
        LEFT JOIN 
            TP_CONFIGURAZIONIBUYER_LIVELLIMERC TCBL 
        ON     
            TCBL.CODBUYER = TCB.CODBUYER AND 
            TCBL.CODDEPOSITO = TCB.CODDEPOSITO AND 
            TCBL.CODFORNITORE = TCB.CODFORNITORE 
        LEFT JOIN 
            TP_CONFIGURAZIONIBUYER_FAMIGLIEREPARTI TCBFR 
        ON 
            TCBFR.CODBUYER = TCB.CODBUYER AND 
            TCBFR.CODDEPOSITO = TCB.CODDEPOSITO AND 
            TCBFR.CODFORNITORE = TCB.CODFORNITORE
        WHERE
            (
                ((TCBG.CODGRUPPO = Art.GRUPPO AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBG.CODGRUPPO IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
                ((TCBC.CODCATEGORIA = Art.CATEGORIA AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBC.CODCATEGORIA IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
                ((TCBS.CODCATEGORIAST = Art.CODCATEGORIASTAT AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBS.CODCATEGORIAST IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
                ((TCBZ.CODGRUPPOPRZPART = Art.GRUPPOPRZPART AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBZ.CODGRUPPOPRZPART IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
                ((TCBL.CODLIVELLO = Art.CodLivello AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBL.CODLIVELLO IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
                ((TCBFR.CODFAMIGLIA = Art.CodFamigliaPOS AND TCBFR.CODREPARTO = Art.CodRepartoPOS AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR 
                 (TCBFR.CODFAMIGLIA IS NULL AND TCBFR.CODREPARTO IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL))
            )
    ) A
    Group By
        CodBuyer,
        Tp_CodDep,
        CodFor,
        IsPfr;
    
    
    /*Distruggo la tabella dei temporanea*/
    DROP TABLE [dbo].[#TP_ELENCOARTICOLIFORNITORIOF_TEMP]

END
    

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_PreparaElencoFornitoriOF] TO [Metodo98]
    AS [dbo];

