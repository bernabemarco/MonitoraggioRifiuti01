﻿

CREATE PROCEDURE [dbo].[PROC_TRASPORTO_ACQ_DETTAGLIO_ARTICOLO_LOTTO](@RIFPROGRESSIVO DECIMAL(18,0)) AS

DECLARE @NDECIMALITOTALE INT

    SELECT @NDECIMALITOTALE = NDECIMALITOTALE FROM tabcambi WHERE CODICE = (select divisaeuro from TABVINCOLIGIC WHERE ESERCIZIO = (select esercizioattivo from tabutenti where userdb = USER_NAME()))


    DELETE FROM TP_TRASPORTOTOTALEARTICOLOLOTTO WHERE RIFPROGRESSIVO = @RIFPROGRESSIVO
    DELETE FROM TP_TRASPORTOTOTALEARTICOLOLOTTO_TMP WHERE RIFPROGRESSIVO = @RIFPROGRESSIVO
    
    /*HA DETTO ANDREA DI MANUZZI CHE CLAUDIO HA SBAGLIATO IL DISEGNINO*/
    /*CREO IL RECORDSET DEGLI ARTICOLI E LI INSERISCO IN UNA TABELLA TEMPORANEA*/
    INSERT INTO TP_TRASPORTOTOTALEARTICOLOLOTTO_TMP(RIFPROGRESSIVO,ESERCIZIO,TIPODOC,NUMERODOC,CODDEPOSITO,CODART,NRRIFPARTITA,TOTALEPEZZI,TOTALEPESO,TOTALEPEDANA,COSTOPEDANA,COSTOPEZZOXPEDANA,COSTOPEZZOXKG,UTENTEMODIFICA,DATAMODIFICA)
    SELECT
        @RIFPROGRESSIVO,
        ARTICOLICOSTITOTALI.ESERCIZIO,
        ARTICOLICOSTITOTALI.TIPODOC,
        ARTICOLICOSTITOTALI.NUMERODOC,
        ARTICOLICOSTITOTALI.CODDEPOSITO,
        ARTICOLICOSTITOTALI.CODART,
        ARTICOLICOSTITOTALI.NRRIFPARTITA,
        ARTICOLICOSTITOTALI.TOTALEPEZZI,
        ARTICOLICOSTITOTALI.TOTALEPESO,
        ARTICOLICOSTITOTALI.TOTALEPEDANA,
        ARTICOLICOSTITOTALI.COSTOPEDANA,
        ARTICOLICOSTITOTALI.COSTOSUPEDANA,
        ARTICOLICOSTITOTALI.COSTOPEZZOSUPESO,
        USER_NAME(),
        GETDATE()
    FROM
    (
        SELECT
            ARTICOLICOSTICALCOLATI.ESERCIZIO,
            ARTICOLICOSTICALCOLATI.TIPODOC,
            ARTICOLICOSTICALCOLATI.NUMERODOC,
            ARTICOLICOSTICALCOLATI.CODDEPOSITO,
            ARTICOLICOSTICALCOLATI.CODART,
            ARTICOLICOSTICALCOLATI.NRRIFPARTITA,
            ARTICOLICOSTICALCOLATI.TOTALEPEZZI,
            ARTICOLICOSTICALCOLATI.TOTALEPESO,
            ARTICOLICOSTICALCOLATI.TOTALEPEDANA,
            ROUND((ARTICOLICOSTICALCOLATI.PEDANECOSTOXFORNITORE * ARTICOLICOSTICALCOLATI.TOTALEPEDANA),@NDECIMALITOTALE)  AS COSTOPEDANA,
            (CASE WHEN (ARTICOLICOSTICALCOLATI.TOTALEPEZZI > 0)
                  THEN ((ARTICOLICOSTICALCOLATI.PEDANECOSTOXFORNITORE * ARTICOLICOSTICALCOLATI.TOTALEPEDANA) / ARTICOLICOSTICALCOLATI.TOTALEPEZZI)
                  ELSE 0
             END) AS COSTOSUPEDANA,
            (CASE WHEN (ARTICOLICOSTICALCOLATI.TOTALEKG > 0 AND ARTICOLICOSTICALCOLATI.TOTALEPEZZI > 0)
                  THEN ((ARTICOLICOSTICALCOLATI.COSTOTRASPORTOMEDIOKG + (ARTICOLICOSTICALCOLATI.PEDANECOSTOTOTALE / ARTICOLICOSTICALCOLATI.TOTALEKG)) * (ARTICOLICOSTICALCOLATI.TOTALEPESO / ARTICOLICOSTICALCOLATI.TOTALEPEZZI))
                  ELSE 0
             END) AS COSTOPEZZOSUPESO   
        FROM
        (
            SELECT
                ESERCIZIO,
                TIPODOC,
                NUMERODOC,
                CODDEPOSITO,
                CODART,
                PEDANECOSTOXFORNITORE,
                TOTALEKG,
                PEDANECOSTOTOTALE,
                COSTOTRASPORTOMEDIOKG,
                NRRIFPARTITA,
                SUM(QTACONV_QT) AS TOTALEPEZZI,
                SUM(QTACONV_KG) AS TOTALEPESO,
                SUM(QTACONV_PD) AS TOTALEPEDANA
            FROM
            (
                SELECT
                    ARTICOLI.ESERCIZIO,
                    ARTICOLI.TIPODOC,
                    ARTICOLI.NUMERODOC,
                    ARTICOLI.CODDEPOSITO,
                    ARTICOLI.CODART,
                    ARTICOLI.PEDANECOSTOXFORNITORE,
                    ARTICOLI.PEDANECOSTOTOTALE,
                    ARTICOLI.TOTALEKG,
                    ARTICOLI.COSTOTRASPORTOMEDIOKG,
                    ARTICOLI.NRRIFPARTITA,
                    dbo.FunCONVERTIUM(ARTICOLI.CODART,ARTICOLI.QTAGEST,ARTICOLI.UMGEST,PARAMETRI.UMTOTALEQTA) AS QTACONV_QT,
                    dbo.FunCONVERTIUM(ARTICOLI.CODART,ARTICOLI.QTAGEST,ARTICOLI.UMGEST,PARAMETRI.UMTOTALEKG) AS QTACONV_KG,
                    dbo.FunCONVERTIUM(ARTICOLI.CODART,ARTICOLI.QTAGEST,ARTICOLI.UMGEST,PARAMETRI.UMPEDANA) AS QTACONV_PD
                FROM
                (
                    SELECT 
                        RD.ESERCIZIO,
                        RD.TIPODOC,
                        RD.NUMERODOC,
                        RD.CODDEPOSITO,
                        RD.CODART,
                        RD.UMGEST,
                        RD.NRRIFPARTITA,
                        SUM(RD.QTAGEST) AS QTAGEST,
                        TTDA.PEDANECOSTOXFORNITORE,
                        TTDA.TOTALEKG,
                        TTDA.PEDANECOSTOTOTALE,
                        TTA.COSTOTRASPORTOMEDIOKG
                    FROM 
                        RIGHEDOCUMENTI RD,
                        TP_TRASPORTODETTAGLIOACQ TTDA,
                        TP_TRASPORTOACQ TTA
                    WHERE 
                        RD.ESERCIZIO =  TTDA.ESERCIZIO AND 
                        RD.TIPODOC = TTDA.TIPODOC AND 
                        RD.NUMERODOC = TTDA.NUMERODOC AND
                        RD.CODART <> '' AND
                        RD.CODDEPOSITO = TTA.CODDEPOSITO AND
                        TTDA.RIFPROGRESSIVO = TTA.PROGRESSIVO AND
                        TTA.PROGRESSIVO = @RIFPROGRESSIVO
                    GROUP BY
                        RD.ESERCIZIO,
                        RD.TIPODOC,
                        RD.NUMERODOC,
                        RD.CODDEPOSITO,
                        RD.CODART,
                        RD.UMGEST,
                        RD.NRRIFPARTITA,
                        TTDA.PEDANECOSTOXFORNITORE,
                        TTDA.TOTALEKG,
                        TTDA.PEDANECOSTOTOTALE,
                        TTA.COSTOTRASPORTOMEDIOKG
                ) ARTICOLI,
                  TP_TRASPORTOPARAMETRIACQ PARAMETRI
            ) ARTICOLIQTACONVERTITE
            GROUP BY
                ESERCIZIO,
                TIPODOC,
                NUMERODOC,
                CODDEPOSITO,
                CODART,
                NRRIFPARTITA,
                PEDANECOSTOXFORNITORE,
                TOTALEKG,
                PEDANECOSTOTOTALE,
                COSTOTRASPORTOMEDIOKG
        ) ARTICOLICOSTICALCOLATI
    ) ARTICOLICOSTITOTALI
    
    /*CALCOLO UNA EVENTUALE MEDIA ED INSERISCO I VALORI FINALI NELLA TABELLA*/
    INSERT INTO TP_TRASPORTOTOTALEARTICOLOLOTTO(RIFPROGRESSIVO,ESERCIZIO,TIPODOC,NUMERODOC,CODDEPOSITO,CODART,NRRIFPARTITA,TOTALEPEZZI,TOTALEPESO,TOTALEPEDANA,COSTOPEDANA,COSTOPEZZOXPEDANA,COSTOPEZZOXKG,UTENTEMODIFICA,DATAMODIFICA)
    SELECT
        TTTAT.RIFPROGRESSIVO,
        TTTAT.ESERCIZIO,
        TTTAT.TIPODOC,
        TTTAT.NUMERODOC,
        TTTAT.CODDEPOSITO,
        TTTAT.CODART,
        TTTAT.NRRIFPARTITA,
        TTTAT.TOTALEPEZZI,
        TTTAT.TOTALEPESO,
        TTTAT.TOTALEPEDANA,
        TTTAT.COSTOPEDANA,
        TTTAT.COSTOPEZZOXPEDANA,
        TTTAT.COSTOPEZZOXKG,
        USER_NAME(),
        GETDATE()
    FROM
        TP_TRASPORTOTOTALEARTICOLOLOTTO_TMP TTTAT
    WHERE
        TTTAT.RIFPROGRESSIVO = @RIFPROGRESSIVO
    
    /*CLAUDIO MI HA FATTO IL DISEGNINO*/
    /*CALCOLO UNA EVENTUALE MEDIA ED INSERISCO I VALORI FINALI NELLA TABELLA*/
    /*INSERT INTO TP_TRASPORTOTOTALEARTICOLOLOTTO(RIFPROGRESSIVO,ESERCIZIO,TIPODOC,NUMERODOC,CODDEPOSITO,CODART,NRRIFPARTITA,TOTALEPEZZI,TOTALEPESO,TOTALEPEDANA,COSTOPEDANA,COSTOPEZZOXPEDANA,COSTOPEZZOXKG,UTENTEMODIFICA,DATAMODIFICA)
    SELECT
        TTTAT.RIFPROGRESSIVO,
        TTTAT.ESERCIZIO,
        TTTAT.TIPODOC,
        TTTAT.NUMERODOC,
        TTTAT.CODDEPOSITO,
        TTTAT.CODART,
        TTTAT.NRRIFPARTITA,
        TTTAT.TOTALEPEZZI,
        TTTAT.TOTALEPESO,
        TTTAT.TOTALEPEDANA,
        MC AS COSTOPEDANA,
        MD AS COSTOSUPEDANA,
        ME AS COSTOPEZZOSUPESO,
        USER_NAME(),
        GETDATE()
    FROM
    (
        SELECT 
            CODART, 
            CODDEPOSITO,
            (X / A) AS MC,
            (Y / A) AS MD,
            (W / B) AS ME
        FROM
        (
            SELECT 
                CODART, 
                CODDEPOSITO,
                SUM(A) AS A,
                SUM(B) AS B,
                SUM(X) AS X, 
                SUM(Y) AS Y,
                SUM(W) AS W
            FROM
            (
                SELECT
                    ESERCIZIO,
                    TIPODOC,
                    NUMERODOC,
                    CODDEPOSITO,
                    CODART,
                    A,
                    B,
                    (A * COSTOPEDANA) AS X,
                    (A * COSTOPEZZOXPEDANA) AS Y,
                    (B * COSTOPEZZOXKG) AS W
                FROM
                (
                    SELECT DISTINCT
                        ESERCIZIO,
                        TIPODOC,
                        NUMERODOC,
                        CODDEPOSITO,
                        CODART,
                        SUM(TOTALEPEZZI) AS A,
                        TOTALEPESO AS B,
                        COSTOPEDANA,
                        COSTOPEZZOXPEDANA,
                        COSTOPEZZOXKG
                    FROM 
                        TP_TRASPORTOTOTALEARTICOLOLOTTO_TMP
                    GROUP BY
                        ESERCIZIO,
                        TIPODOC,
                        NUMERODOC,
                        CODDEPOSITO,
                        CODART,
                        TOTALEPESO,
                        COSTOPEDANA,
                        COSTOPEZZOXPEDANA,
                        COSTOPEZZOXKG
                ) ARTRAGGR
            ) ART1
            GROUP BY
                CODART,
                CODDEPOSITO
        ) ART2
    ) ART3,
    TP_TRASPORTOTOTALEARTICOLOLOTTO_TMP TTTAT
    WHERE
        TTTAT.RIFPROGRESSIVO = @RIFPROGRESSIVO AND
        TTTAT.CODDEPOSITO = ART3.CODDEPOSITO AND
        TTTAT.CODART = ART3.CODART*/
        
    /*AGGIORNO IL PESO PER DOCUMENTO/ARTICOLO/LOTTO*/
    /*UPDATE TP_TRASPORTOTOTALEARTICOLOLOTTO
    SET TP_TRASPORTOTOTALEARTICOLOLOTTO.TOTALEPESO = AP.TOTALEPESO
    FROM TP_TRASPORTOTOTALEARTICOLOLOTTO TL
    INNER JOIN
    (
        SELECT
            RIFPROGRESSIVO,
            ESERCIZIO,
            TIPODOC,
            NUMERODOC,
            CODDEPOSITO,
            NRRIFPARTITA,
            CODART,
            TOTALEPESO
        FROM
        (
            SELECT
                RIFPROGRESSIVO,
                ESERCIZIO,
                TIPODOC,
                NUMERODOC,
                CODDEPOSITO,
                NRRIFPARTITA,
                CODART,
                dbo.FunCONVERTIUM(ARTICOLI.CODART,ARTICOLI.QTAGEST,ARTICOLI.UMGEST,PARAMETRI.UMTOTALEKG) AS TOTALEPESO
            FROM
            (
                SELECT
                    TTDA.RIFPROGRESSIVO,
                    RD.ESERCIZIO,
                    RD.TIPODOC,
                    RD.NUMERODOC,
                    RD.CODDEPOSITO,
                    RD.NRRIFPARTITA,
                    RD.CODART,
                    RD.UMGEST,
                    SUM(RD.QTAGEST) AS QTAGEST
                FROM 
                    RIGHEDOCUMENTI RD,
                    TP_TRASPORTODETTAGLIOACQ TTDA,
                    TP_TRASPORTOACQ TTA
                WHERE 
                    RD.ESERCIZIO =  TTDA.ESERCIZIO AND 
                    RD.TIPODOC = TTDA.TIPODOC AND 
                    RD.NUMERODOC = TTDA.NUMERODOC AND
                    RD.CODART <> '' AND
                    RD.CODDEPOSITO = TTA.CODDEPOSITO AND
                    TTDA.RIFPROGRESSIVO = TTA.PROGRESSIVO AND
                    TTA.PROGRESSIVO = @RIFPROGRESSIVO
                GROUP BY
                    TTDA.RIFPROGRESSIVO,
                    RD.ESERCIZIO,
                    RD.TIPODOC,
                    RD.NUMERODOC,
                    RD.CODDEPOSITO,
                    RD.NRRIFPARTITA,
                    RD.CODART,
                    RD.UMGEST
            ) ARTICOLI,
            TP_TRASPORTOPARAMETRIACQ PARAMETRI
        ) ARTICOLIPESO
    ) AP
    ON  TL.RIFPROGRESSIVO = AP.RIFPROGRESSIVO AND
        TL.ESERCIZIO = AP.ESERCIZIO AND
        TL.TIPODOC = AP.TIPODOC AND
        TL.NUMERODOC = AP.NUMERODOC AND
        TL.CODDEPOSITO = AP.CODDEPOSITO AND
        TL.NRRIFPARTITA = AP.NRRIFPARTITA AND
        TL.CODART = AP.CODART*/





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_TRASPORTO_ACQ_DETTAGLIO_ARTICOLO_LOTTO] TO [Metodo98]
    AS [dbo];
