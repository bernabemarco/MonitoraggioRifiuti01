
CREATE VIEW [dbo].[View_TpScheduler_PriceUpdate]
AS
    /*
    La Ricorsione, messa in Join con la Query di Base,
    ? stata suddivisa in pi? select per essere
    meglio leggibile in caso di debug
    */

    /*Ricorsione per individuare Padre\Figlio*/
    WITH A (ORDINE,LISTINO_P,CODART,UM,LISTINO,DATAVAL)
    AS
    (
        SELECT
            0 AS ORDINE, 
            ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(L.TP_SCONTI,CHARINDEX('(',L.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0) AS LISTINO_P, 
            L.CODART,
            L.UM,
            L.NRLISTINO AS LISTINO,
            L.DATAVAL
        FROM TP_LISTINIART L
        WHERE 
            L.Aggiornato = 0 And CONVERT(CHAR, L.DataVal,112) <= CONVERT(CHAR, GetDate(), 112)
            AND 
                (
                    ((CHARINDEX('L',L.TP_SCONTI) = 0) OR (L.TP_SCONTI IS NULL)) OR
                    NOT EXISTS(SELECT T.NRLISTINO FROM TP_LISTINIART T WHERE T.AGGIORNATO = 0 AND T.UM = L.UM AND T.CodArt = L.Codart AND T.NRLISTINO = ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(L.TP_SCONTI,CHARINDEX('(',L.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0)) OR
                    EXISTS(SELECT T.NRLISTINO FROM TP_LISTINIART T WHERE T.AGGIORNATO = 0 AND T.UM = L.UM AND T.CodArt = L.Codart AND L.NRLISTINO = ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(L.TP_SCONTI,CHARINDEX('(',L.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0))
                )
        UNION ALL
        SELECT
            (A.ORDINE + 1) AS ORDINE, 
            ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(TLA.TP_SCONTI,CHARINDEX('(',TLA.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0) AS LISTINO_P, 
            TLA.CODART,
            TLA.UM,
            TLA.NRLISTINO AS LISTINO,
            TLA.DATAVAL
        FROM TP_LISTINIART TLA
        INNER JOIN A
            ON
                (
                    ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(TLA.TP_SCONTI,CHARINDEX('(',TLA.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0) = A.LISTINO AND
                    ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(TLA.TP_SCONTI,CHARINDEX('(',TLA.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0) <> TLA.NRLISTINO 
                )
                    AND
                TLA.CODART = A.CODART AND
                TLA.UM = A.UM AND
                CONVERT(CHAR, TLA.DATAVAL, 112) >= CONVERT(CHAR, A.DATAVAL, 112) AND CHARINDEX('L',TLA.TP_SCONTI) > 0
        WHERE TLA.Aggiornato = 0  And TLA.DataVal <= GetDate()
    )
    /*Query per Gestione Cambi*/
    SELECT
         ROW_NUMBER() OVER(PARTITION BY CODART ORDER BY DATAVAL,ORDINAMENTO) AS Sequenza
        ,Ordinamento
        ,LISTINO
        ,CODART
        ,UM
        ,CAST(TP_PREZZOPART AS Decimal(19,6)) AS TP_PREZZOPART
        ,CAST((TP_PREZZOPART / TCF.CAMBIOEURO) AS Decimal(19,6)) AS TP_PREZZOPARTEURO
        ,ISNULL(STRINGASCONTI,'') AS STRINGASCONTI
		,dbo.FunCalcSconti(TP_SCONTI) As TP_SCONTI
        ,DATAVAL
        ,CAST(str(Prezzo,19,TCF.NDECIMALIUNITARIO) AS Decimal(19,6)) AS Prezzo
        ,CAST(str((Prezzo / TCF.CAMBIOEURO),19,TCF.NDECIMALIUNITARIO) AS Decimal(19,6)) AS PrezzoEuro
        ,ISNEW
        ,TLF.CODCAMBIO
        ,TCF.CAMBIOEURO
    FROM
    (
        /*Query su Ricorsione*/
        SELECT
             S.Ordinamento
            ,S.LISTINO
            ,S.CODART
            ,S.UM
            ,(CASE WHEN S.LISTINO_P = 0 THEN S.TP_PREZZOPART ELSE L.PREZZO END) As TP_PREZZOPART
            ,S.STRINGASCONTI
			,S.TP_SCONTI
            ,S.DATAVAL
            ,(CASE S.SEGNO 
                WHEN '+' 
                THEN (CASE WHEN S.LISTINO_P = 0 THEN S.PREZZO ELSE L.PREZZO END) + ((CASE WHEN S.LISTINO_P = 0 THEN S.PREZZO ELSE L.PREZZO END) * ABS(dbo.FunCalcSconti(S.TP_SCONTI)) / 100.00) 
                ELSE (CASE WHEN S.LISTINO_P = 0 THEN S.PREZZO ELSE L.PREZZO END) - ((CASE WHEN S.LISTINO_P = 0 THEN S.PREZZO ELSE L.PREZZO END) * ABS(dbo.FunCalcSconti(S.TP_SCONTI)) / 100.00)
                END) as Prezzo
            ,(CASE WHEN X.NRLISTINO IS NULL THEN 1 ELSE 0 END) AS ISNEW
        FROM
        (
            /*Query Base*/
            SELECT 
                ORDINE As Ordinamento,
                (CASE WHEN CHARINDEX('L',TP_LISTINIART.TP_SCONTI) > 0 
                      THEN ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(TP_LISTINIART.TP_SCONTI,CHARINDEX('(',TP_LISTINIART.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0) 
                      ELSE 0
                      END) AS LISTINO_P,
                TP_LISTINIART.CODART,
                TP_LISTINIART.UM,
                ISNULL(TP_LISTINIART.PREZZO,0) AS PREZZO,
                ISNULL(TP_LISTINIART.TP_PREZZOPART,0) AS TP_PREZZOPART,
                --ISNULL(NULLIF(REPLACE(RIGHT(TP_LISTINIART.TP_SCONTI,(LEN(TP_LISTINIART.TP_SCONTI) - CHARINDEX('(',TP_LISTINIART.TP_SCONTI))),')',''),''),0) AS TP_SCONTI,
				(CASE WHEN CHARINDEX('+(',TP_LISTINIART.TP_SCONTI) > 0 
					  THEN '+(' + REPLACE(REPLACE((ISNULL(NULLIF(REPLACE(RIGHT(TP_LISTINIART.TP_SCONTI,(LEN(TP_LISTINIART.TP_SCONTI) - CHARINDEX('(',TP_LISTINIART.TP_SCONTI))),')',''),''),0)),'+',')+('),'((','(') + ')'
					  ELSE ISNULL(NULLIF(REPLACE(RIGHT(TP_LISTINIART.TP_SCONTI,(LEN(TP_LISTINIART.TP_SCONTI) - CHARINDEX('(',TP_LISTINIART.TP_SCONTI))),')',''),''),0)
				 END) AS TP_SCONTI,
                (CASE WHEN CHARINDEX('+(',TP_LISTINIART.TP_SCONTI) > 0 THEN '+' ELSE '-' END) AS SEGNO,
                TP_LISTINIART.TP_SCONTI AS STRINGASCONTI,
                TP_LISTINIART.DATAVAL,
                TP_LISTINIART.NRLISTINO AS LISTINO,
                TP_LISTINIART.Aggiornato
            FROM 
                A
            INNER JOIN
                TP_LISTINIART
            ON
                TP_LISTINIART.NRLISTINO = A.LISTINO AND
                TP_LISTINIART.CODART = A.CODART AND
                TP_LISTINIART.UM = A.UM AND
                TP_LISTINIART.DataVal = A.DataVal
            INNER JOIN
                ANAGRAFICAARTICOLI AA
            ON
                AA.CODICE = TP_LISTINIART.CODART
        ) S
        LEFT JOIN 
            LISTINIARTICOLI L
        ON
                (
                 (L.NRLISTINO = S.LISTINO_P AND S.LISTINO_P <> 0) OR 
                 (L.NRLISTINO = S.LISTINO AND S.LISTINO_P = 0)
                )
            AND L.CODART = S.CODART 
            AND L.UM = S.UM
        LEFT JOIN 
            LISTINIARTICOLI X
        ON 
                X.NRLISTINO = S.LISTINO
            AND X.CODART = S.CODART 
            AND X.UM = S.UM
        WHERE 
            S.Aggiornato = 0 AND 
            (
                (L.NRLISTINO IS NULL AND S.LISTINO_P = 0) OR
                (L.NRLISTINO IS NOT NULL)
            )
    ) L
    /*CAMBIO LISTINO FIGLIO\SENZA PADRE*/
    INNER JOIN
        TABLISTINI TLF
    ON
        TLF.NRLISTINO = L.LISTINO
    INNER JOIN
        (
            SELECT 
                TC.CODICE,TC.DIVISA,TC.DESCRIZIONE,(CASE WHEN TVC.VALORE IS NULL THEN TC.CAMBIOEURO ELSE TVC.VALORE END) AS CAMBIOEURO,TC.NDECIMALIUNITARIO
            FROM 
                TABCAMBI TC
            LEFT JOIN
                (
                    SELECT VC.CODCAMBIO,VC.VALORE 
                    FROM VALORICAMBIO VC
                    /*
                    INNER JOIN
                        (
                            SELECT CODCAMBIO,MAX(DATA) AS DATA  
                            FROM VALORICAMBIO 
                            GROUP BY CODCAMBIO
                        ) VCM
                        ON 
                            VCM.CODCAMBIO = VC.CODCAMBIO AND VCM.DATA = VC.DATA
                    */
                    WHERE CONVERT(CHAR, VC.DATA, 112) >= CONVERT(CHAR, GetDate(), 112)
                ) TVC
            ON 
                TVC.CODCAMBIO = TC.CODICE 
        )TCF
    ON
        TCF.CODICE = TLF.CODCAMBIO

        --AND ((TLP.CODCAMBIO = TLF.CODCAMBIO AND S.LISTINO_P <> 0) OR (S.LISTINO_P = 0))
        --and S.codart = 'OMM3W'
        --AND ((L.PREZZO <> TP_LISTINIART.TP_PREZZOPART OR L.PREZZOEURO <> TP_LISTINIART.TP_PREZZOPARTEURO))

GO
GRANT SELECT
    ON OBJECT::[dbo].[View_TpScheduler_PriceUpdate] TO [Metodo98]
    AS [dbo];

