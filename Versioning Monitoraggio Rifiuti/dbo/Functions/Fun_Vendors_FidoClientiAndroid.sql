

CREATE FUNCTION [dbo].[Fun_Vendors_FidoClientiAndroid]
(
   @IdSessione Decimal(5,0) = 0,
   @Esercizio Decimal(5,0) = 0
)
RETURNS TABLE AS RETURN
(
    SELECT
        CODCONTO AS CLIENTE,
        CODCONTO_QRY AS C2,
        ESERCIZIO,
        (
            FIDOEURO +
            (Case When CHARINDEX('-2',FORMULA,1) > 0 Then (-1 * ISNULL([2],0)) Else 0 End) +
            (Case When CHARINDEX('-3',FORMULA,1) > 0 Then (-1 * ISNULL([3],0)) Else 0 End) +
            (Case When CHARINDEX('-4',FORMULA,1) > 0 Then (-1 * ISNULL([4],0)) Else 0 End) +
            (Case When CHARINDEX('-5',FORMULA,1) > 0 Then (-1 * ISNULL([5],0)) Else 0 End) +
            (Case When CHARINDEX('-6',FORMULA,1) > 0 Then (-1 * ISNULL([6],0)) Else 0 End) +
            (Case When CHARINDEX('-7',FORMULA,1) > 0 Then (-1 * ISNULL([7],0)) Else 0 End) +
            (Case When CHARINDEX('-8',FORMULA,1) > 0 Then (-1 * ISNULL([8],0)) Else 0 End) +
            (Case When CHARINDEX('-9',FORMULA,1) > 0 Then (-1 * ISNULL([9],0)) Else 0 End) +
            (Case When CHARINDEX('+10',FORMULA,1) > 0 Then (-1 * ISNULL([10],0)) Else 0 End) +
            (Case When CHARINDEX('-11',FORMULA,1) > 0 Then (-1 * ISNULL([11],0)) Else 0 End) 
        ) As FIDO_DISPONIBILE,
        DATACALCOLO AS FIDO_DATACALC,
        FIDOEURO AS FIDO_CLIENTE,
        (CASE WHEN ESITO2 = 'S' THEN ISNULL([2],0) ELSE 0 END) AS FIDO_SCAD_NONEMESSO,
        (CASE WHEN ESITO3 = 'S' THEN ISNULL([3],0) ELSE 0 END) AS FIDO_SCAD_EMESSO,
        (CASE WHEN ESITO4 = 'S' THEN ISNULL([4],0) ELSE 0 END) AS FIDO_SCAD_PAGATO,
        (CASE WHEN ESITO5 = 'S' THEN ISNULL([5],0) ELSE 0 END) AS FIDO_SCAD_INSOLUTO,
        (CASE WHEN ESITO6 = 'S' THEN ISNULL([6],0) ELSE 0 END) AS FIDO_SCAD_INS_PAGATO,
        (CASE WHEN ESITO7 = 'S' THEN ISNULL([7],0) ELSE 0 END) AS FIDO_BOLLE,
        (CASE WHEN ESITO8 = 'S' THEN ISNULL([8],0) ELSE 0 END) AS FIDO_FATTURE,
        (CASE WHEN ESITO9 = 'S' THEN ISNULL([9],0) ELSE 0 END) AS FIDO_ORDINI,
        (CASE WHEN ESITO10 = 'S' THEN ISNULL([10],0) ELSE 0 END) AS FIDO_NOTAACCR,
        (CASE WHEN ESITO11 = 'S' THEN ISNULL([11],0) ELSE 0 END) AS FIDO_ALTRO
    FROM
    (
        SELECT DISTINCT
            CLI.CODCONTO,
            CLI.CODCONTO_QRY,
            CLI.ESERCIZIO,
            /*(
                CLI.FIDO +
                (ISNULL(SC.[2],0) * CLI.PercEsito0 / 100) +
                (ISNULL(SC.[3],0) * CLI.PercEsito1 / 100) +
                (ISNULL(SC.[4],0) * CLI.PercEsito2 / 100) +
                (ISNULL(SC.[5],0) * CLI.PercEsito3 / 100) +
                (ISNULL(SC.[6],0) * CLI.PercEsito4 / 100)
            ) AS FIDO,*/
            (
                CLI.FIDOEURO +
                (ISNULL(SC.[2],0) * CLI.PercEsito0 / 100) +
                (ISNULL(SC.[3],0) * CLI.PercEsito1 / 100) +
                (ISNULL(SC.[4],0) * CLI.PercEsito2 / 100) +
                (ISNULL(SC.[5],0) * CLI.PercEsito3 / 100) +
                (ISNULL(SC.[6],0) * CLI.PercEsito4 / 100)
            ) AS FIDOEURO,
            CLI.DATACALCOLO,
            CLI.USACLIFATT,
            CLI.ESITO0 AS ESITO2,
            CLI.ESITO1 AS ESITO3,
            CLI.ESITO2 AS ESITO4,
            CLI.ESITO3 AS ESITO5,
            CLI.ESITO4 AS ESITO6,
            CLI.BOLLE AS ESITO7,
            CLI.FATTURE AS ESITO8,
            CLI.ORDINI AS ESITO9,
            CLI.NOTEACCR AS ESITO10,
            CLI.ALTRO AS ESITO11,
            CLI.PercEsito0 AS PercEsito2,
            CLI.PercEsito1 AS PercEsito3,
            CLI.PercEsito2 AS PercEsito4,
            CLI.PercEsito3 AS PercEsito5,
            CLI.PercEsito4 AS PercEsito6,
            ('1' + CLI.FORMULA2 + CLI.FORMULA1) As FORMULA,
            CLI.ESCLUDIEFFETTI,
            CLI.ESCLUDIDOCUMENTI,
            ISNULL(SC.[2],0) AS [2],
            ISNULL(SC.[3],0) AS [3],
            ISNULL(SC.[4],0) AS [4],
            ISNULL(SC.[5],0) AS [5],
            ISNULL(SC.[6],0) AS [6]  
        FROM
        (
            SELECT DISTINCT
                ARC.CODCONTO,
                ARCC.CODCONTO AS CODCONTO_QRY,
                ARC.ESERCIZIO,
                ARCC.FIDO,
                ARCC.FIDOEURO,
                (CASE WHEN ISNULL(ARCC.DATAINIZIOCALCOLOFIDO,'') <> '' 
                      THEN ARCC.DATAINIZIOCALCOLOFIDO 
                      ELSE ISNULL(PF.DATAINIZCALC,'19900101') 
                      END) AS DATACALCOLO,
                PF.USACLIFATT,
                PF.ESITO0,
                PF.ESITO1,
                PF.ESITO2,
                PF.ESITO3,
                PF.ESITO4,
                PF.PercEsito0,
                PF.PercEsito1,
                PF.PercEsito2,
                PF.PercEsito3,
                PF.PercEsito4,
                PF.BOLLE,
                PF.FATTURE,
                PF.ORDINI,
                PF.NOTEACCR,
                PF.ALTRO,
                (CASE PF.BOLLE WHEN 'S' THEN (
                    CASE PF.FATTURE WHEN 'S' THEN (
                        CASE PF.ORDINI WHEN 'S' THEN (
                            CASE PF.NOTEACCR WHEN 'S' THEN (
                                CASE PF.ALTRO WHEN 'S' THEN ',-5,-7,-8,-9,+10,-11' ELSE ',-5,-7,-8,-9,+10' END) 
                            ELSE (
                                CASE PF.ALTRO WHEN 'S' THEN ',-7,-8,-9,-11' ELSE ',-7,-8,-9' END) 
                            END) 
                        ELSE (
                            CASE PF.NOTEACCR WHEN 'S' THEN (
                                CASE PF.ALTRO WHEN 'S' THEN ',-5,-7,-8,+10,-11' ELSE ',-5,-7,-8,+10' END) 
                            ELSE (
                                CASE PF.ALTRO WHEN 'S' THEN ',-7,-8,-11' ELSE ',-7,-8' END) 
                            END) 
                        END) 
                    ELSE (
                        CASE PF.ORDINI WHEN 'S' THEN (
                            CASE PF.NOTEACCR WHEN 'S' THEN (
                                CASE PF.ALTRO WHEN 'S' THEN ',-5,-7,-9,+10,-11' ELSE ',-5,-7,-9,+10' END) 
                            ELSE (
                                CASE PF.ALTRO WHEN 'S' THEN ',-7,-9,-11' ELSE ',-7,-9' END) 
                            END) 
                        ELSE (
                            CASE PF.NOTEACCR WHEN 'S' THEN (
                                CASE PF.ALTRO WHEN 'S' THEN ',-5,-7,+10,-11' ELSE ',-5,-7,+10' END) 
                            ELSE (
                                CASE PF.ALTRO WHEN 'S' THEN ',-7,-11' ELSE ',-7' END) 
                            END) 
                        END) 
                    END)
                ELSE (
                    CASE PF.FATTURE WHEN 'S' THEN (
                        CASE PF.ORDINI WHEN 'S' THEN (
                            CASE PF.NOTEACCR WHEN 'S' THEN (
                                CASE PF.ALTRO WHEN 'S' THEN ',-5,-8,-9,+10,-11' ELSE ',-5,-8,-9,+10' END) 
                            ELSE (
                                CASE PF.ALTRO WHEN 'S' THEN ',-8,-9,-11' ELSE ',-8,-9' END) 
                            END) 
                        ELSE (
                            CASE PF.NOTEACCR WHEN 'S' THEN (
                                CASE PF.ALTRO WHEN 'S' THEN ',-5,-8,+10,-11' ELSE ',-5,-8,+10' END) 
                            ELSE (
                                CASE PF.ALTRO WHEN 'S' THEN ',-8,-11' ELSE '-8' END) 
                            END) 
                        END) 
                    ELSE (
                        CASE PF.ORDINI WHEN 'S' THEN (
                            CASE PF.NOTEACCR WHEN 'S' THEN (
                                CASE PF.ALTRO WHEN 'S' THEN ',-5,-9,+10,-11' ELSE ',-5,-9,+10' END) 
                            ELSE (
                                CASE PF.ALTRO WHEN 'S' THEN ',-9,-11' ELSE '-9' END) 
                            END) 
                        ELSE (
                            CASE PF.NOTEACCR WHEN 'S' THEN (
                                CASE PF.ALTRO WHEN 'S' THEN ',-5,+10,-11' ELSE ',-5,+10' END) 
                            ELSE (
                                CASE PF.ALTRO WHEN 'S' THEN ',-11' ELSE '' END) 
                            END) 
                        END) 
                    END) 
                END) FORMULA1,
                (CASE PF.ESITO0 WHEN 'S' THEN (
                    CASE PF.ESITO1 WHEN 'S' THEN (
                        CASE PF.ESITO2 WHEN 'S' THEN (
                            CASE PF.ESITO3 WHEN 'S' THEN (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-2,-3,-4,-5,-6' ELSE ',-2,-3,-4,-5' END) 
                            ELSE (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-2,-3,-4,-6' ELSE ',-2,-3,-4' END) 
                            END) 
                        ELSE (
                            CASE PF.ESITO3 WHEN 'S' THEN (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-2,-3,-5,-6' ELSE ',-2,-3,-5' END) 
                            ELSE (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-2,-3,-6' ELSE ',-2,-3' END) 
                            END) 
                        END) 
                    ELSE (
                        CASE PF.ESITO2 WHEN 'S' THEN (
                            CASE PF.ESITO3 WHEN 'S' THEN (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-2,-4,-5,-6' ELSE ',-2,-4,-5' END) 
                            ELSE (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-2,-4,-6' ELSE ',-2,-4' END) 
                            END) 
                        ELSE (
                            CASE PF.ESITO3 WHEN 'S' THEN (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-2,-5,-6' ELSE ',-2,-5' END) 
                            ELSE (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-2,-6' ELSE ',-2' END) 
                            END) 
                        END) 
                    END)
                ELSE (
                    CASE PF.ESITO1 WHEN 'S' THEN (
                        CASE PF.ESITO2 WHEN 'S' THEN (
                            CASE PF.ESITO3 WHEN 'S' THEN (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-3,-4,-5,-6' ELSE ',-3,-4,-5' END) 
                            ELSE (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-3,-4,-6' ELSE ',-3,-4' END) 
                            END) 
                        ELSE (
                            CASE PF.ESITO3 WHEN 'S' THEN (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-3,-5,-6' ELSE ',-3,-5' END) 
                            ELSE (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-3,-6' ELSE ',-3-8' END) 
                            END) 
                        END) 
                    ELSE (
                        CASE PF.ESITO2 WHEN 'S' THEN (
                            CASE PF.ESITO3 WHEN 'S' THEN (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-4,-5,-6' ELSE ',-4,-5' END) 
                            ELSE (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-4,-6' ELSE ',-4-9' END) 
                            END) 
                        ELSE (
                            CASE PF.ESITO3 WHEN 'S' THEN (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-5,-6' ELSE ',-5' END) 
                            ELSE (
                                CASE PF.ESITO4 WHEN 'S' THEN ',-6' ELSE '' END) 
                            END) 
                        END) 
                    END) 
                END) FORMULA2,
                (CASE WHEN (COUNT(ISNULL(EF.PROGRESSIVO,0)) OVER(PARTITION BY EF.ESERCIZIO,EF.PROGRESSIVO)) > 0 THEN 1 ELSE 0 END) AS ESCLUDIEFFETTI,
                (CASE WHEN (COUNT(ISNULL(ED.PROGRESSIVO,0)) OVER(PARTITION BY ED.ESERCIZIO,ED.PROGRESSIVO)) > 0 THEN 1 ELSE 0 END) AS ESCLUDIDOCUMENTI
            FROM 
                AnagraficaRiservatiCF ARC
            Inner Join
                ParametriFido PF
            ON
                PF.ESERCIZIO = ARC.ESERCIZIO
            Left Join 
                ESCLUDIEFF_FIDO EF
            ON
                EF.ESERCIZIO = ARC.ESERCIZIO
            Left Join 
                ESCLUDIDOC_FIDO ED
            ON
                EF.ESERCIZIO = ARC.ESERCIZIO
            INNER JOIN
                AnagraficaRiservatiCF ARCC
            ON
                ARCC.CODCONTO = (CASE WHEN PF.USACLIFATT = 1 THEN ARC.CODCONTOFATT ELSE ARC.CODCONTO END) AND
                ARCC.ESERCIZIO = ARC.ESERCIZIO
            WHERE 
                --ARC.FIDOEURO > 0 AND
                ARC.CodConto IN(SELECT CODCONTO FROM TP_CLIENTIEXPORT WHERE MODCHIAVE = @IdSessione) AND 
                ARC.ESERCIZIO = @Esercizio
        ) CLI
        CROSS JOIN
        (
            SELECT CambioEuro FROM TabCambi WHERE TabCambi.CODICE = 0
        ) TCAM
        OUTER APPLY
        (
            Select
                EscludiFido,
                CODCLIFOR,
                SUM(ISNULL([0],0)) As [2],
                SUM(ISNULL([1],0)) As [3],
                SUM(ISNULL([2],0)) As [4],
                SUM(ISNULL([3],0)) As [5],
                SUM(ISNULL([4],0)) As [6]
            From
            (
                /*_NonEmesso*/ 
                SELECT 1 As EscludiFido, Esito, CodCliFor, ImportoScadEuro FROM VistaScadenze WHERE Esito=0 AND TipoEffetto NOT in (SELECT TipoEff FROM ESCLUDIEFF_FIDO WHERE Esercizio=@Esercizio AND Esito=0) And CodCliFor = CLI.CODCONTO_QRY AND Convert(varchar,DATAFATTURA,112) >= Convert(varchar,CLI.DATACALCOLO,112)
                UNION ALL
                /*_Emesso*/ 
                SELECT 1 As EscludiFido, Esito, CodCliFor, ImportoScadEuro FROM VistaScadenze WHERE Esito=1 AND TipoEffetto NOT in (SELECT TipoEff FROM ESCLUDIEFF_FIDO WHERE Esercizio=@Esercizio AND Esito=1) And CodCliFor = CLI.CODCONTO_QRY AND Convert(varchar,DATAFATTURA,112) >= Convert(varchar,CLI.DATACALCOLO,112)
                UNION ALL
                /*_Pagato*/ 
                SELECT 1 As EscludiFido, Esito, CodCliFor, ImportoScadEuro FROM VistaScadenze WHERE Esito=2 AND TipoEffetto NOT in (SELECT TipoEff FROM ESCLUDIEFF_FIDO WHERE Esercizio=@Esercizio AND Esito=2) And CodCliFor = CLI.CODCONTO_QRY  AND Convert(varchar,DATAFATTURA,112) >= Convert(varchar,CLI.DATACALCOLO,112)
                UNION ALL
                /*_Insoluto*/ 
                SELECT 1 As EscludiFido, Esito, CodCliFor, ImportoScadEuro FROM VistaScadenze WHERE Esito=3 AND TipoEffetto NOT in (SELECT TipoEff FROM ESCLUDIEFF_FIDO WHERE Esercizio=@Esercizio AND Esito=3) And CodCliFor = CLI.CODCONTO_QRY  AND Convert(varchar,DATAFATTURA,112) >= Convert(varchar,CLI.DATACALCOLO,112)
                UNION ALL
                /*_InsolutoPagato*/ 
                SELECT 1 As EscludiFido, Esito, CodCliFor, ImportoScadEuro FROM VistaScadenze WHERE Esito=4 AND TipoEffetto NOT in (SELECT TipoEff FROM ESCLUDIEFF_FIDO WHERE Esercizio=@Esercizio AND Esito=4) And CodCliFor = CLI.CODCONTO_QRY  AND Convert(varchar,DATAFATTURA,112) >= Convert(varchar,CLI.DATACALCOLO,112)
                UNION ALL
                /*ESCLUDI NO*/
                SELECT 0 As EscludiFido, Esito, CodCliFor, ImportoScadEuro FROM VistaScadenze WHERE CodCliFor = CLI.CODCONTO_QRY AND Convert(varchar,DATAFATTURA,112) >= Convert(varchar,CLI.DATACALCOLO,112)
            ) t1
            PIVOT
            (
                SUM(ImportoScadEuro) FOR ESITO IN([0],[1],[2],[3],[4])
            ) p1
            WHERE
                EscludiFido = CLI.ESCLUDIEFFETTI 
            GROUP BY
                EscludiFido,
                CODCLIFOR
        ) SC
    ) SCA
    OUTER APPLY
    (
        SELECT
            SUM([BOLLA_EURO]) AS [7],
            --SUM([BOLLA_LIRA]) AS [7_LIRA],
            SUM([FATTURA_EURO]) AS [8],
            --SUM([FATTURA_LIRA]) AS [8_LIRA],
            SUM([ORDINE_EURO]) AS [9],
            --SUM([ORDINE_LIRA]) AS [9_LIRA],
            SUM([NOTACREDITO_EURO]) AS [10],
            --SUM([NOTACREDITO_LIRA]) AS [10_LIRA],
            SUM([ALTRO_EURO]) AS [11]
            --SUM([ALTRO_LIRA]) AS [11_LIRA]
        FROM
        (
            SELECT
                0 As [ALTRO_LIRA],
                0 As [ORDINE_LIRA],
                0 As [FATTURA_LIRA],
                0 As [NOTACREDITO_LIRA],
                0 As [BOLLA_LIRA],
                ISNULL([A],0) As [ALTRO_EURO],
                ISNULL([O],0) As [ORDINE_EURO],
                ISNULL([F],0) As [FATTURA_EURO],
                ISNULL([N],0) As [NOTACREDITO_EURO],
                ISNULL([B],0) As [BOLLA_EURO]
            FROM
            (
                SELECT
                    SUM(FidoEuro) As FidoEuro,
                    TipoPar
                From
                (
                    SELECT 
                    (TotImponibileEuroRes+TotImpostaEuroRes) FidoEuro,
                    ((TotImponibileEuroRes+TotImpostaEuroRes)* TCAM.CambioEuro) FidoLire, 
                    Tipo As TipoPar 
                    FROM 
                        TesteDocumenti,
                        TabCambi TCAM,
                        ParametriDoc
                    WHERE 
                        ParametriDoc.Codice=TipoDoc AND
                        TCAM.Codice=0 AND DocChiuso=0 AND ((SCA.USACLIFATT = 0 AND CODCLIFOR = SCA.CODCONTO_QRY) OR (SCA.USACLIFATT = 1 AND CODCFFATT = SCA.CODCONTO_QRY)) AND Convert(varchar,DataDoc,112)>=Convert(varchar,SCA.DATACALCOLO,112) AND 
                        TipoDoc NOT in (SELECT CodDoc FROM ESCLUDIDOC_FIDO WHERE Esercizio=@Esercizio) 
                ) A
                GROUP BY TipoPar
            ) T
            PIVOT
            (
                SUM(FidoEuro) FOR TipoPar IN([A],[O],[F],[N],[B])
            ) P1
            UNION
            SELECT
                ISNULL([A],0) As [ALTRO_LIRA],
                ISNULL([O],0) As [ORDINE_LIRA],
                ISNULL([F],0) As [FATTURA_LIRA],
                ISNULL([N],0) As [NOTACREDITO_LIRA],
                ISNULL([B],0) As [BOLLA_LIRA],
                0 As [ALTRO_EURO],
                0 As [ORDINE_EURO],
                0 As [FATTURA_EURO],
                0 As [NOTACREDITO_EURO],
                0 As [BOLLA_EURO]
            FROM
            (
                SELECT
                    SUM(FidoLire) As FidoLire,
                    TipoPar
                From
                (
                    SELECT 
                    (TotImponibileEuroRes+TotImpostaEuroRes) FidoEuro,
                    ((TotImponibileEuroRes+TotImpostaEuroRes)* TCAM.CambioEuro) FidoLire, 
                    Tipo As TipoPar 
                    FROM 
                        TesteDocumenti,
                        TabCambi TCAM,
                        ParametriDoc
                    WHERE 
                        ParametriDoc.Codice=TipoDoc AND
                        TCAM.Codice=0 AND DocChiuso=0 AND ((SCA.USACLIFATT = 0 AND CODCLIFOR = SCA.CODCONTO_QRY) OR (SCA.USACLIFATT = 1 AND CODCFFATT = SCA.CODCONTO_QRY)) AND Convert(varchar,DataDoc,112)>=Convert(varchar,SCA.DATACALCOLO,112) AND 
                        TipoDoc NOT in (SELECT CodDoc FROM ESCLUDIDOC_FIDO WHERE Esercizio=@Esercizio) 
                ) A
                GROUP BY TipoPar
            ) T
            PIVOT
            (
                SUM(FidoLire) FOR TipoPar IN([A],[O],[F],[N],[B])
            ) P1
        ) B
    ) TD
    WHERE
        SCA.FIDOEURO > 0

)




GO
GRANT SELECT
    ON OBJECT::[dbo].[Fun_Vendors_FidoClientiAndroid] TO [Metodo98]
    AS [dbo];

