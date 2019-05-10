

CREATE PROCEDURE [dbo].[Proc_PreparaElencoBuyersOF](@IdSessione Decimal(5,0), @CodBuyer nVarchar(7), @Mode As Smallint, @WhereAgg As Varchar(MAX))

AS

BEGIN

--@ModalitaCalcolo as Smallint

SET NOCOUNT ON 

DECLARE @ESERCIZIO      DECIMAL(5,0)
DECLARE @SqlInsert      Varchar(MAX)
DECLARE @SqlBase        Varchar(MAX)

--DECLARE @SqlModalita  Varchar(MAX)

    SET @ESERCIZIO  = 0
    SET @SqlBase    = ''
    SET @SqlInsert  = ''
    --SET @SqlModalita = ''
    
    
    /*PULISCO LE TABELLE*/
    DELETE FROM TP_OF_BUYERS WHERE IdSessione = @IdSessione AND (Tipo = @Mode OR Tipo = 0);
    DELETE FROM TP_OF_SUPPLIERS WHERE IdSessione = @IdSessione AND (Tipo = @Mode OR Tipo = 0);
    DELETE FROM TP_OF_DOCKS WHERE IdSessione = @IdSessione;
    
    /*RECUPERO L'ESERCIZIO*/
    SELECT @ESERCIZIO = ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME()
    
    /*COMPONGO LE QUERY BASE*/
    /*SET @SqlModalita = (SELECT CASE @ModalitaCalcolo
                              WHEN 0 THEN '((EOQ = 1) OR (PFR = 1) OR (SCT = 1) OR (PRS = 1))'
                              WHEN 1 THEN '(EOQ = 1)'
                              WHEN 2 THEN '(PFR = 1)'
                              WHEN 3 THEN '(SCT = 1)'
                              WHEN 4 THEN '(PRS = 1)'
                              WHEN 5 THEN '(ALF = 1)'
                        END)*/
    SELECT @SqlBase =
    CASE 
        WHEN @Mode = 4 THEN /*Prenotato*/
              CAST('SELECT 
                       TAB.CODICE AS CODBUYER, 
                       TAB.DESCRIZIONE AS DSCBUYER, 
                       TCB.CODDEPOSITO, 
                       AD.DESCRIZIONE AS DSCDEPOSITO, 
                       TCB.CODFORNITORE, 
                       AF.DSCCONTO1 AS DSCFORNITORE, 
                       4 AS [Tipo],
                       0 AS [EOQ],
                       0 AS [PFR],
                       0 AS [SCT],
                       0 AS [PRS],
                       0 AS [ALL],
                       1 AS [ALF] 
                    FROM 
                       TP_ANAGRAFICABUYER TAB, 
                       TP_CONFIGURAZIONIBUYER TCB, 
                       ANAGRAFICADEPOSITI AD, 
                       ANAGRAFICACF AF, 
                       TP_VISTAORDINEFORNITOREPRENOTATI_NO_TO DP 
                    WHERE
                       ((TAB.CODICE = ''' + @CodBuyer + ''' AND TAB.SUPERVISOR = 1) OR 
                        (TAB.CODICE <> ''' + @CodBuyer + ''' AND TAB.SUPERVISOR = 0)) AND 
                       TCB.CODBUYER = TAB.CODICE AND 
                       AD.CODICE = TCB.CODDEPOSITO AND 
                       AF.CODCONTO = TCB.CODFORNITORE AND 
                       DP.CodFor = TCB.CODFORNITORE AND 
                       DP.TP_CODDEP = TCB.CODDEPOSITO ' AS Varchar(MAX))
        WHEN @Mode = 5 THEN /*Prenotato TO*/
               CAST('SELECT 
                        CODBUYER,
                        DSCBUYER,
                        CODDEPOSITO,
                        DSCDEPOSITO,
                        CODFORNITORE,
                        DSCFORNITORE, 
                        5 AS [Tipo],
                        0 AS [EOQ],
                        0 AS [PFR],
                        0 AS [SCT],
                        0 AS [PRS],
                        0 AS [ALL],
                        1 AS [ALF] 
                    FROM 
                    ( 
                       SELECT DISTINCT TAB.CODICE AS CODBUYER,TAB.DESCRIZIONE AS DSCBUYER,TCB.CODDEPOSITO,AD.DESCRIZIONE AS DSCDEPOSITO, 
                                       TCB.CODFORNITORE,AF.DSCCONTO1 AS DSCFORNITORE,DP.RifTransferOrder 
                       FROM TP_ANAGRAFICABUYER TAB 
                       INNER JOIN TP_CONFIGURAZIONIBUYER TCB 
                       ON TCB.CODBUYER = TAB.CODICE  
                       INNER JOIN ANAGRAFICADEPOSITI AD 
                       ON AD.CODICE = TCB.CODDEPOSITO   
                       INNER JOIN ANAGRAFICACF AF 
                       ON AF.CODCONTO = TCB.CODFORNITORE  
                       INNER JOIN TP_VISTAORDINEFORNITOREPRENOTATI_TO DP 
                       ON DP.CodFor = TCB.CODFORNITORE AND DP.TP_CODDEP = TCB.CODDEPOSITO 
                       WHERE ((TAB.CODICE = ''' + @CodBuyer + ''' AND TAB.SUPERVISOR = 1) OR 
                              (TAB.CODICE <> ''' + @CodBuyer + ''' AND TAB.SUPERVISOR = 0))  
                    ) BASE 
                    INNER JOIN ACQ_TESTAOFFERTA ATO 
                    ON ATO.PROGRESSIVO = RifTransferOrder AND ATO.FORNITORE = BASE.CODFORNITORE ' AS Varchar(MAX))
        WHEN (@Mode = 0) OR (@Mode = 2) THEN /*Libero*/
            CAST('SELECT DISTINCT
                    TCB.CODBUYER,
                    TAB.DESCRIZIONE AS DSCBUYER,
                    TCB.CODDEPOSITO,
                    AD.DESCRIZIONE AS DSCDEPOSITO,
                    TCB.CODFORNITORE,
                    AC.DSCCONTO1 AS DSCFORNITORE,
                    ARCF.STATOORDINI,
                    0 AS Tipo,
                    ISNULL(TEF.EOQ,0) AS EOQ,
                    ISNULL(TEF.PFR,0) AS PFR,
                    ISNULL(TEF.SCT,0) AS SCT,
                    ISNULL(TEF.PRS,0) AS PRS,
                    (CASE WHEN (TEF.EOQ IS NULL) AND (TEF.PFR IS NULL) AND (TEF.SCT IS NULL) AND (TEF.PRS IS NULL) THEN 0 ELSE 1 END) AS [ALL],
                    1 AS [ALF]
                  FROM
                    (
                     SELECT 
                        TAB1.CODICE,
                        TAB1.DESCRIZIONE 
                     FROM 
                        TP_ANAGRAFICABUYER TAB1 
                     CROSS JOIN (SELECT 
                                    SUPERVISOR 
                                 FROM 
                                    TP_ANAGRAFICABUYER 
                                 WHERE 
                                    CODICE = ''' + @CodBuyer + '''
                                ) TAB2 
                     WHERE 
                        (TAB1.SUPERVISOR <> TAB2.SUPERVISOR AND TAB2.SUPERVISOR = 1) OR
                        (TAB1.CODICE = ''' + @CodBuyer + ''')
                    ) TAB
                  INNER JOIN 
                    TP_CONFIGURAZIONIBUYER TCB 
                  ON 
                    TCB.CODBUYER = TAB.CODICE
                  INNER JOIN
                    (
                     SELECT DISTINCT 
                        TL.CODFOR,
                        TL.CODART,
                        TL.TP_CODDEP 
                     FROM 
                        TABLOTTIRIORDINO TL
                     INNER JOIN
                        ANAGRAFICAARTICOLI AA
                     ON
                        AA.CODICE = TL.CODART
                     INNER JOIN
                        (SELECT DISTINCT CODART AS X_CodArt,CODFAMIGLIAPOS,CODREPARTOPOS From tp_Extramag X WHERE ConsidAcq = 1) X
                     ON
                        X.X_CodArt = TL.CODART 
                     ' + (CASE WHEN @WhereAgg <> '' THEN ' WHERE ' + @WhereAgg ELSE '' END) + ' 
                     ) TLR
                  ON
                    TLR.CODFOR = TCB.CODFORNITORE AND
                    TLR.TP_CODDEP = TCB.CodDeposito
                  LEFT JOIN 
                    TP_ELENCOFORNITORIOF_TEMP TEF 
                  ON 
                    TEF.CodBuyer = TCB.CodBuyer AND
                    TEF.CodFornitore = TCB.CODFORNITORE AND
                    TEF.CodDeposito = TCB.CodDeposito AND
                    TEF.Ordinato = 0 AND
                    TEF.Data = CONVERT(varchar(8),GetDate(),112)
                  INNER JOIN 
                    ANAGRAFICACF AC 
                  ON 
                    AC.CODCONTO = TCB.CODFORNITORE
                  INNER JOIN 
                    ANAGRAFICARISERVATICF ARCF
                  ON 
                    ARCF.CODCONTO = AC.CODCONTO AND ARCF.ESERCIZIO = ' + CAST(@ESERCIZIO AS Varchar(4)) + '
                  INNER JOIN 
                    ANAGRAFICADEPOSITI AD 
                  ON 
                    AD.CODICE = TCB.CODDEPOSITO' AS Varchar(MAX))
        ELSE
             CAST('SELECT DISTINCT
                    TCB.CODBUYER,
                    TAB.DESCRIZIONE AS DSCBUYER,
                    TCB.CODDEPOSITO,
                    AD.DESCRIZIONE AS DSCDEPOSITO,
                    TCB.CODFORNITORE,
                    AC.DSCCONTO1 AS DSCFORNITORE,
                    ARCF.STATOORDINI,
                    0 AS Tipo,
                    ISNULL(TEF.EOQ,0) AS EOQ,
                    ISNULL(TEF.PFR,0) AS PFR,
                    ISNULL(TEF.SCT,0) AS SCT,
                    ISNULL(TEF.PRS,0) AS PRS,
                    (CASE WHEN (TEF.EOQ IS NULL) AND (TEF.PFR IS NULL) AND (TEF.SCT IS NULL) AND (TEF.PRS IS NULL) THEN 0 ELSE 1 END) AS [ALL],
                    1 AS [ALF]
                  FROM
                    (
                     SELECT 
                        TAB1.CODICE,
                        TAB1.DESCRIZIONE 
                     FROM 
                        TP_ANAGRAFICABUYER TAB1 
                     CROSS JOIN (SELECT 
                                    SUPERVISOR 
                                 FROM 
                                    TP_ANAGRAFICABUYER 
                                 WHERE 
                                    CODICE = ''' + @CodBuyer + '''
                                ) TAB2 
                     WHERE 
                        (TAB1.SUPERVISOR <> TAB2.SUPERVISOR AND TAB2.SUPERVISOR = 1) OR
                        (TAB1.CODICE = ''' + @CodBuyer + ''')
                    ) TAB
                  INNER JOIN 
                    TP_CONFIGURAZIONIBUYER TCB 
                  ON 
                    TCB.CODBUYER = TAB.CODICE
                  LEFT JOIN 
                    TP_ELENCOFORNITORIOF_TEMP TEF 
                  ON 
                    TEF.CodBuyer = TCB.CodBuyer AND
                    TEF.CodFornitore = TCB.CODFORNITORE AND
                    TEF.CodDeposito = TCB.CodDeposito AND
                    TEF.Ordinato = 0 AND
                    TEF.Data = CONVERT(varchar(8),GetDate(),112)
                  INNER JOIN 
                    ANAGRAFICACF AC 
                  ON 
                    AC.CODCONTO = TCB.CODFORNITORE
                  INNER JOIN 
                    ANAGRAFICARISERVATICF ARCF
                  ON 
                    ARCF.CODCONTO = AC.CODCONTO AND ARCF.ESERCIZIO = ' + CAST(@ESERCIZIO AS Varchar(4)) + '
                  INNER JOIN 
                    ANAGRAFICADEPOSITI AD 
                  ON 
                    AD.CODICE = TCB.CODDEPOSITO' AS Varchar(MAX))
       END    
        
        /*DEBUG*/
        --select @SqlBase as [processing-instruction(x)] FOR XML PATH
        
        /*INSERT BUYERS*/
        SET @SqlInsert = 'INSERT INTO [TP_OF_BUYERS]([IdSessione],[CodBuyer],[Selezionato],[Tipo],[UtenteModifica],[DataModifica]) 
                          SELECT DISTINCT
                                ' + CAST(@IdSessione AS Varchar(7)) + ' AS IDSESSIONE,
                                CODBUYER,
                                0 As SELEZIONATO,
                                [Tipo],
                                USER_NAME() AS UTENTEMODIFICA,
                                GETDATE() AS DATAMODIFICA
                          FROM
                          (
                          ' + @SqlBase + '
                          ) BUYERS;'
        
        EXEC(@SqlInsert)
        
        /*DEBUG*/
        --select @SqlInsert as [processing-instruction(x)] FOR XML PATH
        
        /*INSERT SUPPLIERS*/
        SET @SqlInsert = 'INSERT INTO [TP_OF_SUPPLIERS]([IdSessione],[CodBuyer],[CodFornitore],[GiorniCopertura],[Selezionato],[Tipo],[EOQ],[PFR],[SCT],[PRS],[ALL],[ALF],[UtenteModifica],[DataModifica]) 
                          SELECT DISTINCT
                                ' + CAST(@IdSessione AS Varchar(7)) + ' AS IDSESSIONE,
                                CODBUYER,
                                CODFORNITORE,
                                0 As GiorniCoperture,
                                0 As Selezionato,
                                [Tipo],
                                SUM([EOQ]) AS [EOQ],
                                SUM([PFR]) AS [PFR],
                                SUM([SCT]) AS [SCT],
                                SUM([PRS]) AS [PRS],
                                SUM([ALL]) AS [ALL],
                                [ALF],
                                USER_NAME() AS UTENTEMODIFICA,
                                GETDATE() AS DATAMODIFICA
                          FROM
                          (
                          ' + @SqlBase + '
                          ) SUPPLIERS
                          GROUP BY
                            CODBUYER,
                            CODFORNITORE,
                            [Tipo],
                            [ALF];'
        
        EXEC(@SqlInsert)
        
        /*DEBUG*/
        --select @SqlInsert as [processing-instruction(x)] FOR XML PATH
        
        /*INSERT DOCK*/
        SET @SqlInsert = 'INSERT INTO [TP_OF_DOCKS]([IdSessione],[CodBuyer],[CodDeposito],[Selezionato],[UtenteModifica],[DataModifica]) 
                          SELECT DISTINCT
                                ' + CAST(@IdSessione AS Varchar(7)) + ' AS IDSESSIONE,
                                CODBUYER,
                                CODDEPOSITO,
                                0 As SELEZIONATO,
                                USER_NAME() AS UTENTEMODIFICA,
                                GETDATE() AS DATAMODIFICA
                          FROM
                          (
                          ' + @SqlBase + '
                          ) DOCKS;'
        
        EXEC(@SqlInsert)
        
        /*DEBUG*/
        --select @SqlInsert as [processing-instruction(x)] FOR XML PATH             
END
    

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_PreparaElencoBuyersOF] TO [Metodo98]
    AS [dbo];

