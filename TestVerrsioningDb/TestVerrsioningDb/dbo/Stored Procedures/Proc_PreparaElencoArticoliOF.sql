

CREATE PROCEDURE [dbo].[Proc_PreparaElencoArticoliOF](@IdSessione Decimal(5,0),
                                                       @CodBuyer    Varchar(7),
                                                        @WhereF    Varchar(MAX),
                                                         @WhereA    Varchar(MAX),
                                                          @Articolo Varchar(MAX),
                                                           @IsTuttiFornitori    smallint)

AS

BEGIN

DECLARE @nSQL       Varchar(MAX)
DECLARE @Esercizio  Decimal(5,0)

    SET NOCOUNT ON 
    
    SELECT @Esercizio = ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME();
    
    SET @nSQL = ''
    
    IF @Articolo <> ''
        BEGIN
            SET @nSQL = CAST('DELETE FROM #TP_ELENCOARTICOLIOF_TEMP WHERE (CodArt = ''' + @Articolo + ''');' AS Varchar(MAX))
            EXEC(@nSQL)
        END
    ELSE
        BEGIN
            SET @nSQL = CAST('TRUNCATE TABLE #TP_ELENCOARTICOLIOF_TEMP;' AS Varchar(MAX))
            EXEC(@nSQL)
        END
        
    SET @nSQL = CAST('INSERT INTO #TP_ELENCOARTICOLIOF_TEMP(IDSESSIONE,Prog_ID,TP_CodDep,CodArt,CodFor,ModalitaCalcolo,Gruppo,Categoria,CodCategoriaStat,GruppoPrzPart,CodFamigliaPos,CodRepartoPos,CodLivello,CodMarchio,VarEsplicite,
                                    NettificaDisponibilita,Giacenza,Ordinato,Impegnato,Disponibilita,ScortaSicurezza,LottoRiordino,LivelloRiordino,Proposta,DescrizioneArt,NOMEPIANIF,DATACONS,RIFCOMMCLI,PropostaPrd, 
                                    QtaMinima,DepositoOrdinabile,IsPreferenziale,Selezionato,UtenteModifica,DataModifica)
    SELECT DISTINCT
        ' + CAST(@IdSessione AS Varchar(MAX)) + ' AS IDSESSIONE,
        0 AS PROG_ID,
        TLR.TP_CODDEP AS CODDEPOSITO,
        TLR.CODART,
        TLR.CODFOR,
        ISNULL(TLR.MODALITACALCOLO,0),
        TLR.GRUPPO,
        TLR.CATEGORIA,
        TLR.CODCATEGORIASTAT,
        TLR.GRUPPOPRZPART,
        TLR.CodFamigliaPOS,
        TLR.CodRepartoPOS,
        TLM.CodLivelloInterno,
        TLR.CodMarchio,
        TLR.VARESPLICITE,
        ISNULL(TLR.NETTIFICADISPONIBILITA,0),
        0 AS GIACENZA,
        0 AS ORDINATO,
        0 AS IMPEGNATO,
        0 AS DISPONIBILITA,
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
                        WHEN 1 THEN TLR.LOTTORIF
                        WHEN 2 THEN TLR.LOTTORIF
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
        TLR.NOMEPIANIF,
        CONVERT(Varchar(8),GETDATE(),112) AS DATACONS,
        TLR.RIFCOMMCLI,
        ISNULL(TLR.QTAORD,0) AS QTAORD,
        TLR.QtaMinima,
        ISNULL(TTM.USAPERORDINE,0) AS DepositoOrdinabile,
        ISNULL(
                (
                    CASE ISNULL(TLR.MODALITACALCOLO,0)
                        WHEN 0 THEN (CASE WHEN (EOQ.CodFornPref = TLR.CODFOR) And (EOQ.CodDeposito = TLR.TP_CODDEP) THEN 1 ELSE 0 END)
                        WHEN 1 THEN (CASE WHEN (PFR.CodFornPref = TLR.CODFOR) And (PFR.CodDeposito = TLR.TP_CODDEP) THEN 1 ELSE 0 END)
                        WHEN 2 THEN (CASE WHEN (SCRT.CodFornPref = TLR.CODFOR) And (SCRT.CodDeposito = TLR.TP_CODDEP) THEN 1 ELSE 0 END)
                        WHEN 3 THEN (CASE WHEN (PERS.CodFornPref = TLR.CODFOR) And (PERS.CodDeposito = TLR.TP_CODDEP) THEN 1 ELSE 0 END)
                    END
                )
            ,0) AS IsFornitorePreferenziale,
        1 As Selezionato,
        USER_NAME(),
        GETDATE()
    FROM
        (SELECT DISTINCT AA.CODICE AS CODART,TLR.CODFOR,TLR.TP_CODDEP,TLR.QtaMinima,AA.GRUPPO,AA.CATEGORIA,AA.CODCATEGORIASTAT,AA.DESCRIZIONE,AA.VARESPLICITE,TEM.CodFamigliaPOS,TEM.CodRepartoPOS,TEM.MODALITACALCOLO,TEM.CodMarchio,TEM.NETTIFICADISPONIBILITA,PP.NomePianif,PP.RIFCOMMCLI,PP.QTAORD,TLR.LOTTORIF,AAC.GRUPPOPRZPART
         FROM
         (
             SELECT DISTINCT
                TLR.* 
             FROM 
                (SELECT DISTINCT CODART AS A,CODFOR AS F,TP_CODDEP AS D FROM TABLOTTIRIORDINO ' + CAST((CASE WHEN @WhereF <> '' THEN ' WHERE ' + @WhereF ELSE '' END) As Varchar(MAX)) + ') TLR1
             INNER JOIN
                (SELECT DISTINCT CODART AS A,CODFOR AS F,TP_CODDEP AS D FROM TABLOTTIRIORDINO) TLR
             ON
                TLR.A = TLR1.A AND TLR.D = TLR1.D AND (' + CAST(@IsTuttiFornitori AS varchar(Max))+ ' = 1 OR TLR.F = TLR1.F)
         ) SA
         INNER JOIN TABLOTTIRIORDINO TLR
         ON TLR.CODART = SA.A AND TLR.TP_CODDEP = SA.D AND TLR.CODFOR = SA.F
         INNER JOIN ANAGRAFICAARTICOLI AA
         ON AA.CODICE = TLR.CODART AND AA.ARTTIPOLOGIA = 0
         INNER JOIN ANAGRAFICAARTICOLICOMM AAC 
         ON AAC.CODICEART = TLR.CODART AND AAC.ESERCIZIO = ' + CAST(@Esercizio As Varchar(MAX)) + '
         INNER JOIN (SELECT X.CodArt AS A, X.CodFamigliaPOS,X.CodRepartoPOS,X.ConsidAcq,X.MODALITACALCOLO,X.CodMarchio,X.NETTIFICADISPONIBILITA FROM TP_EXTRAMAG X INNER JOIN TP_PERIODO_OSSERVAZIONE TPOSS ON TPOSS.PROGRESSIVO=X.TP_PERIODODIOSSERVAZIONE) TEM
         ON TEM.A = TLR.CODART AND TEM.ConsidAcq = 1
         LEFT JOIN (SELECT NomePianif,CODART As Articolo,CODFOR As Fornitore,RIFCOMMCLI,SUM(QTAORD) OVER(PARTITION BY CodDeposito,CodArt,CodFor) AS QTAORD FROM PROGPRODUZIONE WHERE (QTAORD > QTADOCUMENTO) AND TIPO = 1) PP
         ON PP.Articolo = TLR.CODART AND PP.Fornitore = TLR.CODFOR
         WHERE (Codice = ''' + CAST(@Articolo AS Varchar(MAX)) + ''' OR ''' + CAST(@Articolo AS Varchar(MAX)) + ''' = '''') ' + CAST((CASE WHEN @WhereA <> '' THEN ' AND ' + @WhereA ELSE '' END) As Varchar(MAX)) + '
         ) TLR
    INNER JOIN
        (
            SELECT 
                TP_CONFIGURAZIONIBUYER.* 
            FROM
                TP_CONFIGURAZIONIBUYER
            WHERE 
                CODBUYER = ''' + CAST(@CodBuyer As Varchar(MAX)) + '''
        ) TCB
    ON
        TCB.CODDEPOSITO = TLR.TP_CODDEP AND TCB.CODFORNITORE = TLR.CODFOR
    INNER JOIN
        TP_TABMAGAZZINI TTM
    ON 
        TTM.CODDEPOSITO = TLR.TP_CODDEP
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
    LEFT JOIN 
        Tp_LivelliArticoli TLM
    ON 
        TLM.Codice = TLR.CODART
    WHERE
        (
            ((TCBG.CODGRUPPO = TLR.GRUPPO AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBG.CODGRUPPO IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
            ((TCBC.CODCATEGORIA = TLR.CATEGORIA AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBC.CODCATEGORIA IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
            ((TCBS.CODCATEGORIAST = TLR.CODCATEGORIASTAT AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBS.CODCATEGORIAST IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
            ((TCBZ.CODGRUPPOPRZPART = TLR.GRUPPOPRZPART AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBZ.CODGRUPPOPRZPART IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
            ((TCBL.CODLIVELLO = TLM.CodLivelloInterno AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR (TCBL.CODLIVELLO IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL)) OR
            ((TCBFR.CODFAMIGLIA = TLR.CodFamigliaPOS AND TCBFR.CODREPARTO = TLR.CodRepartoPOS AND TCB.TUTTIARTICOLI = 0 AND TCB.CODBUYER IS NOT NULL) OR 
             (TCBFR.CODFAMIGLIA IS NULL AND TCBFR.CODREPARTO IS NULL AND TCB.TUTTIARTICOLI = 1 AND TCB.CODBUYER IS NOT NULL) OR (TCB.CODBUYER IS NULL))
        );' AS Varchar(MAX))
        
    EXEC(@nSQL)
    
    --TRUNCATE TABLE [dbo].[#TP_ELENCOARTICOLIOF_TEMP];
    
    /*Equivale al print*/
    --select @nSQL as [processing-instruction(x)] FOR XML PATH 
    
    /*18.04.2016 Giacenza*/
    EXEC [PROC_CREA_GIACENZE_RUNTIME] @IdSessione, @Esercizio, @Articolo;
END
    

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_PreparaElencoArticoliOF] TO [Metodo98]
    AS [dbo];

