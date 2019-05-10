
CREATE FUNCTION [dbo].[MB_DocumentiValidiAll]()
    RETURNS TABLE 
AS
RETURN 
(

With RisaliteDoc As (
    SELECT 

        T.ESERCIZIO,
        T.TIPODOC, 
        T.NUMERODOC, 
        T.CLIFATT,
        R.IDTESTA,
        R.IDRIGA,
        0 AS ISCONTRATTO
    FROM 
        (       
            SELECT
                R.PROGRESSIVO,
                R.TIPODOC, 
                R.NUMERODOC, 
                R.CLIFATT,
                R.ESERCIZIO
            FROM
            (
                SELECT DISTINCT
                    C.IDTESTADOC,
                    T.PROGRESSIVO,
                    T.TIPODOC, 
                    T.NUMERODOC, 
                    T.CODCLIFOR AS CLIFATT,
                    T.ESERCIZIO
                FROM
                    TESTEDOCUMENTI T WITH(NOLOCK)
                LEFT JOIN
                    CONTRATTI_COSTIFICAZIONERIGHE C
                ON 
                    C.IDTESTADOC = T.PROGRESSIVO
            ) R
            INNER JOIN 
                (SELECT DISTINCT CODICEDOC FROM MB_RAGGRUPPAMENTO_DOCUMENTI) M 
            ON
                R.TIPODOC = M.CODICEDOC 
            WHERE
                R.IDTESTADOC IS NULL
        ) T
    INNER JOIN 
        RIGHEDOCUMENTI AS R  WITH(NOLOCK)
    ON 
        R.IDTESTA = T.PROGRESSIVO
        UNION
    SELECT 


        T.ESERCIZIO,
        T.TIPODOC, 
        T.NUMERODOC, 
        T.CLIFATT,
        R.IDTESTA,
        R.IDRIGA,
        0 AS ISCONTRATTO
    FROM 
        (       
            SELECT
                A.PROGRESSIVO,
                A.TIPODOC, 
                A.NUMERODOC, 
                A.CLIFATT,
                A.ESERCIZIO
            FROM
            (
                SELECT
                    T.PROGRESSIVO,
                    T.TIPODOC, 
                    T.NUMERODOC, 
                    T.CLIFATT,
                    T.ESERCIZIO,
                    T.DATADOC
                FROM
                    (
                        SELECT
                            T.PROGRESSIVO,
                            T.TIPODOC, 
                            T.NUMERODOC, 
                            T.CODCLIFOR AS CLIFATT,
                            T.ESERCIZIO,
                            T.DATADOC
                        FROM
                            TESTEDOCUMENTI T  WITH(NOLOCK)
                        INNER JOIN 
                            (SELECT DISTINCT CODICEDOC FROM MB_RAGGRUPPAMENTO_DOCUMENTI) M 
                        ON
                            T.TIPODOC = M.CODICEDOC 
                    ) T
            ) A
            INNER JOIN (
                        SELECT DISTINCT
                            K.IDTESTADOC,
                            TK.DADATA,
                            TK.ADATA
                        FROM 
                            CONTRATTI_COSTIFICAZIONERIGHE K
                        INNER JOIN
                            CONTRATTI_CONSDOC TK
                        ON
                            K.CONTRATTO = TK.RIFPROGRESSIVO
                        --Inizio Gestione contratti doc Parameteri generali ----
                        UNION 
                        SELECT  DISTINCT
                            K.IDTESTADOC,
                            TK.DADATA,
                            TK.ADATA
                        FROM 
                            CONTRATTI_COSTIFICAZIONERIGHE K,
                            --CONTRATTI_CONSDOC_ATT

                            (SELECT 
                            CASE WHEN DOCATTTUTTI=0 THEN DADATA ELSE CONVERT(DATETIME,CONVERT(VARCHAR(4),UTENTE.ESERCIZIOATTIVO) +'-' + CONVERT(VARCHAR(2),MONTH(DADATA)) +'-'+CONVERT(VARCHAR(2),DAY(DADATA)) ,101) END DADATA
                            ,CASE WHEN DOCATTTUTTI=0 THEN ADATA ELSE CONVERT(DATETIME,CONVERT(VARCHAR(4),UTENTE.ESERCIZIOATTIVO) +'-' + CONVERT(VARCHAR(2),MONTH(ADATA)) +'-'+CONVERT(VARCHAR(2),DAY(ADATA))   ,101) END ADATA

                             FROM dbo.CONTRATTI_CONSDOC_ATT ATT,
                            dbo.CONTRATTI_PARAMETRI,
                            dbo.TABUTENTI UTENTE
                            WHERE UTENTE.USERDB= USER_NAME()
                            ) 
                            TK 

                        UNION
                        SELECT DISTINCT
                            K.IDTESTADOC,
                            TK.DADATA,
                            TK.ADATA
                        FROM 
                            CONTRATTI_COSTIFICAZIONERIGHE K,
                        --, CONTRATTI_CONSDOC_PASS
                            (SELECT 
                            CASE WHEN DOCPASSTUTTI=0 THEN DADATA ELSE CONVERT(DATETIME, CONVERT(VARCHAR(4),UTENTE.ESERCIZIOATTIVO) +'-' + CONVERT(VARCHAR(2),MONTH(DADATA)) +'-'+CONVERT(VARCHAR(2),DAY(DADATA)),101) END DADATA
                            ,CASE WHEN DOCPASSTUTTI=0 THEN ADATA ELSE CONVERT(DATETIME, CONVERT(VARCHAR(4),UTENTE.ESERCIZIOATTIVO) +'-' + CONVERT(VARCHAR(2),MONTH(ADATA)) +'-'+CONVERT(VARCHAR(2),DAY(ADATA))  ,101) END ADATA

                             FROM dbo.CONTRATTI_CONSDOC_PASS PASS,
                            dbo.CONTRATTI_PARAMETRI,
                            dbo.TABUTENTI UTENTE
                            WHERE UTENTE.USERDB= USER_NAME()
                            ) 
                            TK


                       --Fine Gestione contratti doc Parameteri generali ----
                       ) KON
            ON
                KON.IDTESTADOC = A.PROGRESSIVO AND
                A.DATADOC  BETWEEN KON.DADATA AND KON.ADATA 
        ) T
    INNER JOIN 
        RIGHEDOCUMENTI AS R  WITH(NOLOCK)
    ON 
        R.IDTESTA = T.PROGRESSIVO

    )
    SELECT  TIPODOC, 
        NUMERODOC, 
        CLIFATT,
        ISNULL(Ris.CLIORIG, dbo.FUSGetCustomer4ProgressivoDoc(dbo.[FUNSGetDUMP_IDTESTARP_RigheDocumenti] (Doc.IDTESTA,doc.IDRIGA,MBP.NUMRISALITE,MBP.BLOCCASENULL),ESERCIZIO)) AS CLIORIG ,
        ISNULL(Ris.CLIFATTORIG,dbo.FUSGetCustomerFatt4ProgressivoDoc(dbo.[FUNSGetDUMP_IDTESTARP_RigheDocumenti] (doc.IDTESTA,doc.IDRIGA,MBP.NUMRISALITE,MBP.BLOCCASENULL),ESERCIZIO)) AS CLIFATTORIG,
        ISNULL(Ris.DESTDIVMERCIORIG,dbo.FUSGetDestDiv4ProgressivoDoc(dbo.[FUNSGetDUMP_IDTESTARP_RigheDocumenti] (doc.IDTESTA,doc.IDRIGA,MBP.NUMRISALITE,MBP.BLOCCASENULL),ESERCIZIO)) AS DESTDIVMERCIORIG,
        Doc.IDTESTA,
        Doc.IDRIGA,
        0 AS ISCONTRATTO
    FROM RisaliteDoc Doc
        LEFT OUTER JOIN 
            MB_RisaliteDoc Ris ON Ris.Idtesta = Doc.Idtesta and Ris.idriga= doc.idriga
        CROSS JOIN
            MB_PARAMETRI MBP
)


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_DocumentiValidiAll] TO [Metodo98]
    AS [dbo];

