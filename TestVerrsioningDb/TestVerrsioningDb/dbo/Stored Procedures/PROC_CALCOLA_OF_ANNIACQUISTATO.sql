

CREATE PROCEDURE [dbo].[PROC_CALCOLA_OF_ANNIACQUISTATO](@PERIODO INT,
                                                         @OSSERVAZIONE INT,
                                                          @DOCUMENTI VARCHAR(250), 
                                                           @CAUSALI VARCHAR(250), 
                                                            @ALL_STATISTICS SMALLINT)
AS

BEGIN

SET NOCOUNT ON

DECLARE @SqlQuery nVARCHAR(MAX)
    
    IF (@ALL_STATISTICS = 0)
        BEGIN
            SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                              SET TP_ANNI_ACQUISTATO.[1] = SOMME.[1],
                                  TP_ANNI_ACQUISTATO.[2] = SOMME.[2],
                                  TP_ANNI_ACQUISTATO.[3] = SOMME.[3],
                                  TP_ANNI_ACQUISTATO.[4] = SOMME.[4],
                                  TP_ANNI_ACQUISTATO.[5] = SOMME.[5],
                                  TP_ANNI_ACQUISTATO.[6] = SOMME.[6],
                                  TP_ANNI_ACQUISTATO.[7] = SOMME.[7],
                                  TP_ANNI_ACQUISTATO.[8] = SOMME.[8],
                                  TP_ANNI_ACQUISTATO.[9] = SOMME.[9],
                                  TP_ANNI_ACQUISTATO.[10] = SOMME.[10],
                                  TP_ANNI_ACQUISTATO.[11] = SOMME.[11],
                                  TP_ANNI_ACQUISTATO.[12] = SOMME.[12],
                                  TP_ANNI_ACQUISTATO.[V_1] = SOMME.[V_1],
                                  TP_ANNI_ACQUISTATO.[V_2] = SOMME.[V_2],
                                  TP_ANNI_ACQUISTATO.[V_3] = SOMME.[V_3],
                                  TP_ANNI_ACQUISTATO.[V_4] = SOMME.[V_4],
                                  TP_ANNI_ACQUISTATO.[V_5] = SOMME.[V_5],
                                  TP_ANNI_ACQUISTATO.[V_6] = SOMME.[V_6],
                                  TP_ANNI_ACQUISTATO.[V_7] = SOMME.[V_7],
                                  TP_ANNI_ACQUISTATO.[V_8] = SOMME.[V_8],
                                  TP_ANNI_ACQUISTATO.[V_9] = SOMME.[V_9],
                                  TP_ANNI_ACQUISTATO.[V_10] = SOMME.[V_10],
                                  TP_ANNI_ACQUISTATO.[V_11] = SOMME.[V_11],
                                  TP_ANNI_ACQUISTATO.[V_12] = SOMME.[V_12]
                              FROM TP_ANNI_ACQUISTATO
                              INNER JOIN
                              (
                                 SELECT 
                                    ARTICOLI.CodArticolo,
                                    ARTICOLI.CodDeposito,
                                    STMAG.Esercizio,
                                    sum(case when month(STMAG.datamov)= 1 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [1],
                                    sum(case when month(STMAG.datamov)= 2 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [2],
                                    sum(case when month(STMAG.datamov)= 3 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [3],
                                    sum(case when month(STMAG.datamov)= 4 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [4],
                                    sum(case when month(STMAG.datamov)= 5 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [5],
                                    sum(case when month(STMAG.datamov)= 6 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [6],
                                    sum(case when month(STMAG.datamov)= 7 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [7],
                                    sum(case when month(STMAG.datamov)= 8 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [8],
                                    sum(case when month(STMAG.datamov)= 9 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [9],
                                    sum(case when month(STMAG.datamov)= 10 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [10],
                                    sum(case when month(STMAG.datamov)= 11 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [11],
                                    sum(case when month(STMAG.datamov)= 12 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [12],
                                    sum(case when month(STMAG.datamov)= 1 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_1],
                                    sum(case when month(STMAG.datamov)= 2 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_2],
                                    sum(case when month(STMAG.datamov)= 3 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_3],
                                    sum(case when month(STMAG.datamov)= 4 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_4],
                                    sum(case when month(STMAG.datamov)= 5 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_5],
                                    sum(case when month(STMAG.datamov)= 6 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_6],
                                    sum(case when month(STMAG.datamov)= 7 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_7],
                                    sum(case when month(STMAG.datamov)= 8 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_8],
                                    sum(case when month(STMAG.datamov)= 9 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_9],
                                    sum(case when month(STMAG.datamov)= 10 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_10],
                                    sum(case when month(STMAG.datamov)= 11 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_11],
                                    sum(case when month(STMAG.datamov)= 12 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_12],
                                    USER_NAME() AS UTENTEMODIFICA,
                                    GETDATE() AS DATAMODIFICA
                                 FROM 
                                    (
                                    SELECT
                                        TLR.CODART As CODARTICOLO,
                                        TLR.TP_CODDEP As CODDEPOSITO
                                    FROM
                                        TABLOTTIRIORDINO TLR,
                                        TP_EXTRAMAG TEM
                                    WHERE
                                        TEM.CODART = TLR.CODART AND
                                        TEM.CONSIDACQ = 1
                                    GROUP BY
                                        TLR.CODART,
                                        TLR.TP_CODDEP
                                    ) ARTICOLI
                                 INNER JOIN
                                    storicomag STMAG
                                 ON
                                    STMAG.CodArt = ARTICOLI.CODARTICOLO And
                                    STMAG.CodDeposito = ARTICOLI.CODDEPOSITO And
                                    STMAG.CodCausale In(' + @CAUSALI + ') And
                                    STMAG.TipoDoc In(' + @DOCUMENTI + ') 
                                 GROUP BY
                                    ARTICOLI.CodArticolo,
                                    ARTICOLI.CodDeposito,
                                    STMAG.esercizio
                               ) SOMME
                              ON 
                                SOMME.CodArticolo = TP_ANNI_ACQUISTATO.CodArticolo AND
                                SOMME.CodDeposito = TP_ANNI_ACQUISTATO.CodDeposito AND
                                SOMME.Esercizio = TP_ANNI_ACQUISTATO.Esercizio'

            EXEC sp_executesql @SqlQuery
            --select @SqlQuery as [processing-instruction(x)] FOR XML PATH  

            /*Gestione Articolo Riferimento*/
            SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                              SET TP_ANNI_ACQUISTATO.[1] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[1] ELSE (TP_ANNI_ACQUISTATO.[1] + SOMME.[1]) END),
                                  TP_ANNI_ACQUISTATO.[2] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[2] ELSE (TP_ANNI_ACQUISTATO.[2] + SOMME.[2]) END),
                                  TP_ANNI_ACQUISTATO.[3] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[3] ELSE (TP_ANNI_ACQUISTATO.[3] + SOMME.[3]) END),
                                  TP_ANNI_ACQUISTATO.[4] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[4] ELSE (TP_ANNI_ACQUISTATO.[4] + SOMME.[4]) END),
                                  TP_ANNI_ACQUISTATO.[5] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[5] ELSE (TP_ANNI_ACQUISTATO.[5] + SOMME.[5]) END),
                                  TP_ANNI_ACQUISTATO.[6] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[6] ELSE (TP_ANNI_ACQUISTATO.[6] + SOMME.[6]) END),
                                  TP_ANNI_ACQUISTATO.[7] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[7] ELSE (TP_ANNI_ACQUISTATO.[7] + SOMME.[7]) END),
                                  TP_ANNI_ACQUISTATO.[8] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[8] ELSE (TP_ANNI_ACQUISTATO.[8] + SOMME.[8]) END),
                                  TP_ANNI_ACQUISTATO.[9] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[9] ELSE (TP_ANNI_ACQUISTATO.[9] + SOMME.[9]) END),
                                  TP_ANNI_ACQUISTATO.[10] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[10] ELSE (TP_ANNI_ACQUISTATO.[10] + SOMME.[10]) END),
                                  TP_ANNI_ACQUISTATO.[11] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[11] ELSE (TP_ANNI_ACQUISTATO.[11] + SOMME.[11]) END),
                                  TP_ANNI_ACQUISTATO.[12] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[12] ELSE (TP_ANNI_ACQUISTATO.[12] + SOMME.[12]) END),
                                  TP_ANNI_ACQUISTATO.[V_1] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_1] ELSE (TP_ANNI_ACQUISTATO.[V_1] + SOMME.[V_1]) END),
                                  TP_ANNI_ACQUISTATO.[V_2] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_2] ELSE (TP_ANNI_ACQUISTATO.[V_2] + SOMME.[V_2]) END),
                                  TP_ANNI_ACQUISTATO.[V_3] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_3] ELSE (TP_ANNI_ACQUISTATO.[V_3] + SOMME.[V_3]) END),
                                  TP_ANNI_ACQUISTATO.[V_4] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_4] ELSE (TP_ANNI_ACQUISTATO.[V_4] + SOMME.[V_4]) END),
                                  TP_ANNI_ACQUISTATO.[V_5] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_5] ELSE (TP_ANNI_ACQUISTATO.[V_5] + SOMME.[V_5]) END),
                                  TP_ANNI_ACQUISTATO.[V_6] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_6] ELSE (TP_ANNI_ACQUISTATO.[V_6] + SOMME.[V_6]) END),
                                  TP_ANNI_ACQUISTATO.[V_7] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_7] ELSE (TP_ANNI_ACQUISTATO.[V_7] + SOMME.[V_7]) END),
                                  TP_ANNI_ACQUISTATO.[V_8] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_8] ELSE (TP_ANNI_ACQUISTATO.[V_8] + SOMME.[V_8]) END),
                                  TP_ANNI_ACQUISTATO.[V_9] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_9] ELSE (TP_ANNI_ACQUISTATO.[V_9] + SOMME.[V_9]) END),
                                  TP_ANNI_ACQUISTATO.[V_10] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_10] ELSE (TP_ANNI_ACQUISTATO.[V_10] + SOMME.[V_10]) END),
                                  TP_ANNI_ACQUISTATO.[V_11] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_11] ELSE (TP_ANNI_ACQUISTATO.[V_11] + SOMME.[V_11]) END),
                                  TP_ANNI_ACQUISTATO.[V_12] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_12] ELSE (TP_ANNI_ACQUISTATO.[V_12] + SOMME.[V_12]) END)
                              FROM TP_ANNI_ACQUISTATO
                              INNER JOIN
                              (
                                 SELECT 
                                    ARTICOLI.CodArticolo,
                                    ARTICOLI.CodDeposito,
                                    ARTICOLI.SommaQtaStat,
                                    STMAG.Esercizio,
                                    sum(case when month(STMAG.datamov)= 1 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [1],
                                    sum(case when month(STMAG.datamov)= 2 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [2],
                                    sum(case when month(STMAG.datamov)= 3 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [3],
                                    sum(case when month(STMAG.datamov)= 4 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [4],
                                    sum(case when month(STMAG.datamov)= 5 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [5],
                                    sum(case when month(STMAG.datamov)= 6 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [6],
                                    sum(case when month(STMAG.datamov)= 7 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [7],
                                    sum(case when month(STMAG.datamov)= 8 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [8],
                                    sum(case when month(STMAG.datamov)= 9 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [9],
                                    sum(case when month(STMAG.datamov)= 10 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [10],
                                    sum(case when month(STMAG.datamov)= 11 then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [11],
                                    sum(case when month(STMAG.datamov)= 12 then STMAG.qta1um else 0 end) as [12],
                                    sum(case when month(STMAG.datamov)= 1 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_1],
                                    sum(case when month(STMAG.datamov)= 2 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_2],
                                    sum(case when month(STMAG.datamov)= 3 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_3],
                                    sum(case when month(STMAG.datamov)= 4 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_4],
                                    sum(case when month(STMAG.datamov)= 5 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_5],
                                    sum(case when month(STMAG.datamov)= 6 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_6],
                                    sum(case when month(STMAG.datamov)= 7 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_7],
                                    sum(case when month(STMAG.datamov)= 8 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_8],
                                    sum(case when month(STMAG.datamov)= 9 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_9],
                                    sum(case when month(STMAG.datamov)= 10 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_10],
                                    sum(case when month(STMAG.datamov)= 11 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_11],
                                    sum(case when month(STMAG.datamov)= 12 then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_12],
                                    USER_NAME() AS UTENTEMODIFICA,
                                    GETDATE() AS DATAMODIFICA
                                 FROM 
                                    (
                                    SELECT
                                        TLR.CODART As CODARTICOLO,
                                        (CASE WHEN ((TEM.OFCODARTRIF = '''') OR (TEM.OFCODARTRIF IS NULL)) THEN TLR.CODART ELSE TEM.OFCODARTRIF END) AS CODARTICOLORIF,
                                        TLR.TP_CODDEP As CODDEPOSITO,
                                        (CASE WHEN TEM.OFCODARTRIF <> '''' THEN ISNULL(TEM.SOMMAQTASTAT,0) ELSE 0 END) As SommaQtaStat
                                    FROM
                                        TABLOTTIRIORDINO TLR,
                                        TP_EXTRAMAG TEM
                                    WHERE
                                        (TEM.OFCODARTRIF <> '''' AND TEM.OFCODARTRIF IS NOT NULL) AND
                                        TEM.CODART = TLR.CODART AND
                                        TEM.CONSIDACQ = 1
                                    GROUP BY
                                        TLR.CODART,
                                        TEM.OFCODARTRIF,
                                        TLR.TP_CODDEP,
                                        TEM.SOMMAQTASTAT
                                    ) ARTICOLI
                                 INNER JOIN
                                    storicomag STMAG
                                 ON
                                    STMAG.CodArt = ARTICOLI.CODARTICOLORIF And
                                    STMAG.CodDeposito = ARTICOLI.CODDEPOSITO And
                                    STMAG.CodCausale In(' + @CAUSALI + ') And
                                    STMAG.TipoDoc In(' + @DOCUMENTI + ') 
                                 GROUP BY
                                    ARTICOLI.CodArticolo,
                                    ARTICOLI.CodDeposito,
                                    STMAG.esercizio,
                                    ARTICOLI.SommaQtaStat
                               ) SOMME
                              ON 
                                SOMME.CodArticolo = TP_ANNI_ACQUISTATO.CodArticolo AND
                                SOMME.CodDeposito = TP_ANNI_ACQUISTATO.CodDeposito AND
                                SOMME.Esercizio = TP_ANNI_ACQUISTATO.Esercizio'

            EXEC sp_executesql @SqlQuery
            --select @SqlQuery as [processing-instruction(x)] FOR XML PATH  
        END
    ELSE
        BEGIN
            /*AZZERO IL MESE CORRENTE*/
            SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                              SET TP_ANNI_ACQUISTATO.[' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] = 0,
                                  TP_ANNI_ACQUISTATO.[V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] = 0
                              FROM TP_ANNI_ACQUISTATO
                              WHERE TP_ANNI_ACQUISTATO.ESERCIZIO = ' + CAST(YEAR(GETDATE()) AS nVARCHAR(4))
            
            exec sp_executesql @SqlQuery
            --select @SqlQuery as [processing-instruction(x)] FOR XML PATH 

            /*AZZERO IL MESE PRECEDENTE*/
            SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                              SET TP_ANNI_ACQUISTATO.[' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] = 0,
                                  TP_ANNI_ACQUISTATO.[V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] = 0
                              FROM TP_ANNI_ACQUISTATO
                              WHERE TP_ANNI_ACQUISTATO.ESERCIZIO = ' + CAST(YEAR(DATEADD(m,-1,GETDATE())) AS nVARCHAR(4))
            
            exec sp_executesql @SqlQuery
            --select @SqlQuery as [processing-instruction(x)] FOR XML PATH 

            /*ACQUISTATO CORRENTE*/
            SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                              SET TP_ANNI_ACQUISTATO.[' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] = SOMME.[' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '],
                                  TP_ANNI_ACQUISTATO.[V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] = SOMME.[V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + ']
                              FROM TP_ANNI_ACQUISTATO
                              INNER JOIN
                              (
                                  SELECT
                                    STMAG.CodArt AS CodArticolo,
                                    STMAG.CodDeposito,
                                    STMAG.Esercizio,
                                    sum(case when (MONTH(STMAG.datamov) = MONTH(GETDATE()) AND YEAR(STMAG.datamov) = YEAR(GETDATE())) then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '],
                                    sum(case when (MONTH(STMAG.datamov) = MONTH(GETDATE()) AND YEAR(STMAG.datamov) = YEAR(GETDATE())) then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + ']
                                  FROM
                                    STORICOMAG STMAG
                                  WHERE
                                    MONTH(STMAG.DATAMOV) IN(MONTH(GETDATE())) AND
                                    YEAR(STMAG.DATAMOV) IN(YEAR(GETDATE())) AND
                                    STMAG.TIPODOC IN(' + @DOCUMENTI + ') AND
                                    STMAG.CODCAUSALE IN(' + @CAUSALI + ')
                                  GROUP BY
                                    STMAG.CodArt,
                                    STMAG.CodDeposito,
                                    STMAG.esercizio
                              ) SOMME
                              ON 
                                SOMME.CodArticolo = TP_ANNI_ACQUISTATO.CodArticolo AND
                                SOMME.CodDeposito = TP_ANNI_ACQUISTATO.CodDeposito AND
                                SOMME.Esercizio = TP_ANNI_ACQUISTATO.Esercizio'
            
            exec sp_executesql @SqlQuery
            --select @SqlQuery as [processing-instruction(x)] FOR XML PATH  
            
            /*Gestione Articolo Riferimento*/
            SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                              SET TP_ANNI_ACQUISTATO.[' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] =  (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] ELSE (TP_ANNI_ACQUISTATO.[' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] + SOMME.[' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + ']) END),
                                  TP_ANNI_ACQUISTATO.[V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] =  (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] ELSE (TP_ANNI_ACQUISTATO.[V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '] + SOMME.[V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + ']) END)
                              FROM TP_ANNI_ACQUISTATO
                              INNER JOIN
                              (
                                   SELECT
                                        ARTICOLI.CodArticolo,
                                        ARTICOLI.CodDeposito,
                                        ARTICOLI.SommaQtaStat,
                                        STMAG.Esercizio,
                                        sum(case when (MONTH(STMAG.datamov) = MONTH(GETDATE()) AND YEAR(STMAG.datamov) = YEAR(GETDATE())) then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + '],
                                        sum(case when (MONTH(STMAG.datamov) = MONTH(GETDATE()) AND YEAR(STMAG.datamov) = YEAR(GETDATE())) then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_' + CAST(MONTH(GETDATE()) AS nVARCHAR(2)) + ']
                                    FROM
                                    (
                                        SELECT
                                            TLR.CODART As CODARTICOLO,
                                            (CASE WHEN ((TEM.OFCODARTRIF = '''') OR (TEM.OFCODARTRIF IS NULL)) THEN TLR.CODART ELSE TEM.OFCODARTRIF END) AS CODARTICOLORIF,
                                            TLR.TP_CODDEP As CODDEPOSITO,
                                            (CASE WHEN TEM.OFCODARTRIF <> '''' THEN ISNULL(TEM.SOMMAQTASTAT,0) ELSE 0 END) As SommaQtaStat
                                        FROM
                                            TABLOTTIRIORDINO TLR,
                                            TP_EXTRAMAG TEM
                                        WHERE
                                            (TEM.OFCODARTRIF <> '''' AND TEM.OFCODARTRIF IS NOT NULL) AND
                                            TEM.CODART = TLR.CODART AND
                                            TEM.CONSIDACQ = 1
                                        GROUP BY
                                            TLR.CODART,
                                            TEM.OFCODARTRIF,
                                            TLR.TP_CODDEP,
                                            TEM.SOMMAQTASTAT
                                    ) ARTICOLI
                                    INNER JOIN
                                        storicomag STMAG
                                    ON
                                        STMAG.CodArt = ARTICOLI.CODARTICOLORIF And
                                        STMAG.CodDeposito = ARTICOLI.CODDEPOSITO And
                                        STMAG.CodCausale In(' + @CAUSALI + ') And
                                        STMAG.TipoDoc In(' + @DOCUMENTI + ')
                                    WHERE
                                        MONTH(STMAG.DATAMOV) IN(MONTH(GETDATE())) AND
                                        YEAR(STMAG.DATAMOV) IN(YEAR(GETDATE()))
                                    GROUP BY
                                        ARTICOLI.CodArticolo,
                                        ARTICOLI.CodDeposito,
                                        STMAG.esercizio,
                                        ARTICOLI.SommaQtaStat
                              ) SOMME
                              ON 
                                SOMME.CodArticolo = TP_ANNI_ACQUISTATO.CodArticolo AND
                                SOMME.CodDeposito = TP_ANNI_ACQUISTATO.CodDeposito AND
                                SOMME.Esercizio = TP_ANNI_ACQUISTATO.Esercizio'
            
            exec sp_executesql @SqlQuery
            --select @SqlQuery as [processing-instruction(x)] FOR XML PATH  

            /*ACQUISTATO PRECEDENTE*/
            SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                              SET TP_ANNI_ACQUISTATO.[' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] = SOMME.[' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '],
                                  TP_ANNI_ACQUISTATO.[V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] = SOMME.[V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + ']
                              FROM TP_ANNI_ACQUISTATO
                              INNER JOIN
                              (
                                  SELECT
                                    STMAG.CodArt AS CodArticolo,
                                    STMAG.CodDeposito,
                                    STMAG.Esercizio,
                                    sum(case when (MONTH(STMAG.datamov) = MONTH(DATEADD(m,-1,GETDATE())) AND YEAR(STMAG.datamov) = YEAR(DATEADD(m,-1,GETDATE()))) then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '],
                                    sum(case when (MONTH(STMAG.datamov) = MONTH(DATEADD(m,-1,GETDATE())) AND YEAR(STMAG.datamov) = YEAR(DATEADD(m,-1,GETDATE()))) then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + ']
                                  FROM
                                    STORICOMAG STMAG
                                  WHERE
                                    MONTH(DATAMOV) IN(MONTH(DATEADD(m,-1,GETDATE()))) AND
                                    YEAR(DATAMOV) IN(YEAR(DATEADD(m,-1,GETDATE()))) AND
                                    TIPODOC IN(' + @DOCUMENTI + ') AND
                                    CODCAUSALE IN(' + @CAUSALI + ')
                                  GROUP BY
                                    STMAG.CodArt,
                                    STMAG.CodDeposito,
                                    STMAG.esercizio
                              ) SOMME
                              ON 
                                SOMME.CodArticolo = TP_ANNI_ACQUISTATO.CodArticolo AND
                                SOMME.CodDeposito = TP_ANNI_ACQUISTATO.CodDeposito AND
                                SOMME.Esercizio = TP_ANNI_ACQUISTATO.Esercizio'
            
            exec sp_executesql @SqlQuery
            --select @SqlQuery as [processing-instruction(x)] FOR XML PATH
            
            /*Gestione Articolo Riferimento*/
            SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                              SET TP_ANNI_ACQUISTATO.[' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] ELSE (TP_ANNI_ACQUISTATO.[' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] + SOMME.[' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + ']) END),
                                  TP_ANNI_ACQUISTATO.[V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] = (CASE WHEN SOMME.SommaQtaStat = 0 THEN SOMME.[V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] ELSE (TP_ANNI_ACQUISTATO.[V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '] + SOMME.[V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + ']) END)
                              FROM TP_ANNI_ACQUISTATO
                              INNER JOIN
                              (
                                   SELECT
                                        ARTICOLI.CodArticolo,
                                        ARTICOLI.CodDeposito,
                                        ARTICOLI.SommaQtaStat,
                                        STMAG.Esercizio,
                                        sum(case when (MONTH(STMAG.datamov) = MONTH(DATEADD(m,-1,GETDATE())) AND YEAR(STMAG.datamov) = YEAR(DATEADD(m,-1,GETDATE()))) then (STMAG.qta1um * STMAG.GIACENZA) else 0 end) as [' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + '],
                                        sum(case when (MONTH(STMAG.datamov) = MONTH(DATEADD(m,-1,GETDATE())) AND YEAR(STMAG.datamov) = YEAR(DATEADD(m,-1,GETDATE()))) then (STMAG.ImportoTotNettoEuro * STMAG.GIACENZA) else 0 end) as [V_' + CAST(MONTH(DATEADD(m,-1,GETDATE())) AS nVARCHAR(2)) + ']
                                    FROM
                                    (
                                        SELECT
                                            TLR.CODART As CODARTICOLO,
                                            (CASE WHEN ((TEM.OFCODARTRIF = '''') OR (TEM.OFCODARTRIF IS NULL)) THEN TLR.CODART ELSE TEM.OFCODARTRIF END) AS CODARTICOLORIF,
                                            TLR.TP_CODDEP As CODDEPOSITO,
                                            (CASE WHEN TEM.OFCODARTRIF <> '''' THEN ISNULL(TEM.SOMMAQTASTAT,0) ELSE 0 END) As SommaQtaStat
                                        FROM
                                            TABLOTTIRIORDINO TLR,
                                            TP_EXTRAMAG TEM
                                        WHERE
                                            (TEM.OFCODARTRIF <> '''' AND TEM.OFCODARTRIF IS NOT NULL) AND
                                            TEM.CODART = TLR.CODART AND
                                            TEM.CONSIDACQ = 1
                                        GROUP BY
                                            TLR.CODART,
                                            TEM.OFCODARTRIF,
                                            TLR.TP_CODDEP,
                                            TEM.SOMMAQTASTAT
                                    ) ARTICOLI
                                    INNER JOIN
                                        storicomag STMAG
                                    ON
                                        STMAG.CodArt = ARTICOLI.CODARTICOLORIF And
                                        STMAG.CodDeposito = ARTICOLI.CODDEPOSITO And
                                        STMAG.CodCausale In(' + @CAUSALI + ') And
                                        STMAG.TipoDoc In(' + @DOCUMENTI + ')
                                    WHERE
                                        MONTH(DATAMOV) IN(MONTH(DATEADD(m,-1,GETDATE()))) AND
                                        YEAR(DATAMOV) IN(YEAR(DATEADD(m,-1,GETDATE())))
                                    GROUP BY
                                        ARTICOLI.CodArticolo,
                                        ARTICOLI.CodDeposito,
                                        STMAG.esercizio,
                                        ARTICOLI.SommaQtaStat
                              ) SOMME
                              ON 
                                SOMME.CodArticolo = TP_ANNI_ACQUISTATO.CodArticolo AND
                                SOMME.CodDeposito = TP_ANNI_ACQUISTATO.CodDeposito AND
                                SOMME.Esercizio = TP_ANNI_ACQUISTATO.Esercizio'
            
            exec sp_executesql @SqlQuery
            --select @SqlQuery as [processing-instruction(x)] FOR XML PATH 
        END

        SET @SqlQuery = N'UPDATE TP_ANNI_ACQUISTATO
                          SET TP_ANNI_ACQUISTATO.[TOTALE] = [1] + [2] + [3] + [4] + [5] + [6] + [7] + [8] + [9] + [10] + [11] + [12],
                              TP_ANNI_ACQUISTATO.[V_TOTALE] = [V_1] + [V_2] + [V_3] + [V_4] + [V_5] + [V_6] + [V_7] + [V_8] + [V_9] + [V_10] + [V_11] + [V_12]
                          FROM TP_ANNI_ACQUISTATO'

        exec sp_executesql @SqlQuery
        --select @SqlQuery as [processing-instruction(x)] FOR XML PATH  

RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLA_OF_ANNIACQUISTATO] TO [Metodo98]
    AS [dbo];

