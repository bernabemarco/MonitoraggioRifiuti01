

CREATE PROCEDURE [dbo].[MB_ProcCalcolaSmaltimento]

AS

BEGIN

SET NOCOUNT ON

    /*CANCELLO I DATI GIA CALCOLATI*/
    DELETE TRASPORTO_CALCOLOBATCH_RIGHE
    FROM TRASPORTO_CALCOLOBATCH_RIGHE
    INNER JOIN (
                SELECT 
                     ST.IDTESTA
                    ,ST.RIGADOC
                FROM dbo.STORICOMAG ST
                INNER JOIN dbo.TRASPORTO_CAD SM ON ST.DATAMOV BETWEEN SM.DADATA AND SM.ADATA
                INNER JOIN dbo.TRASPORTO_CAD_PARAMETRIDOC PD ON PD.TIPODOC = ST.TIPODOC
                WHERE pd.CODTIPODOCUMENTO =5 AND SM.ELABORATO = 0
                ) SL
    ON  TRASPORTO_CALCOLOBATCH_RIGHE.IDTESTADOC = SL.IDTESTA AND
        TRASPORTO_CALCOLOBATCH_RIGHE.IDRIGADOC = SL.RIGADOC AND
        TRASPORTO_CALCOLOBATCH_RIGHE.CODICE = 'RI019';
    
    /*INSERISCO I DATI NELLA TABELLA DEI CALCOLI*/
    
    WITH RigheCalcolo AS 
    (SELECT 2 AS FILTRO
        ,SM.CODDEPOSITO
        ,0 Regola
        ,DATAMOV
        ,IDTESTA
        ,RIGADOC
        ,SL.TOTRIGHEDOC 
        ,'RI019' CODICE
        ,SL.QTATOTALE QTATOT
        ,(SM.QTA1UM * FATT.Fattore) QTACONV
        ,SL.VALORE TOTVALORE
        ,SM.IMPORTOTOTNETTOEURO TOTVALORERIGA
        ,((SL.VALORE / SL.QTATOTALE )*(SM.QTA1UM * FATT.Fattore)) TOTVALORE_RIGADOC
        ,3 TipoCalcolo
        ,SL.PROGRESSIVO
        ,SM.CODART
        ,QTA1UM
    
    FROM dbo.STORICOMAG SM
    INNER JOIN  dbo.TRASPORTO_CAD_PARAMETRIDOC PD 
        ON PD.TIPODOC =  SM.TIPODOC
    INNER JOIN (
                    SELECT 
                        SM.PROGRESSIVO 
                        ,SM.DADATA
                        ,SM.ADATA
                        ,SM.DADATA_CORR
                        ,SM.ADATA_CORR
                        ,SUM(QTA1UM * FATT.FATTORE) QTATOTALE
                        ,(SM.VALOREEFFETTIVO)  VALORE 
                        ,SUM(IMPORTOTOTNETTOEURO) TOTRIGHEDOC
                    FROM dbo.STORICOMAG ST
                    INNER JOIN 
                    (
                    SELECT SMALT0.PROGRESSIVO 
                        ,SMALT0.DADATA
                        ,SMALT0.ADATA
                        ,ISNULL(SMALT1.DADATA ,SMALT0.DADATA ) DADATA_CORR
                        ,ISNULL(SMALT1.ADATA, SMALT0.ADATA) ADATA_CORR
                        ,ISNULL(SMALT1.VALOREEFFETTIVO, SMALT0.VALOREEFFETTIVO) VALOREEFFETTIVO
                    FROM (SELECT CODTIPOSERVIZIO,TIPODEPOSITO, CODDEPOSITO, PROGRESSIVO,DADATA,ADATA,VALOREEFFETTIVO, 
                                (SELECT TOP 1  PROGRESSIVO 
                                                FROM  TRASPORTO_CAD CAD 
                                                WHERE SMALT.ADATA  > CAD.ADATA 
                                                AND CAD.CODTIPOSERVIZIO =1 
                                                AND CAD.TIPODEPOSITO=1 
                                                AND CAD.CODDEPOSITO = SMALT.CODDEPOSITO
                                                AND CAD.VALORIANNOPRECEDENTE=0 
                                                AND SMALT.VALORIANNOPRECEDENTE=1
                                                ORDER BY ADATA DESC
                                                ) PROG_PREC 
                                            FROM TRASPORTO_CAD SMALT                
                            ) SMALT0 
                            LEFT OUTER JOIN TRASPORTO_CAD SMALT1 ON SMALT0.PROG_PREC = SMALT1.PROGRESSIVO 
                            WHERE SMALT0.CODTIPOSERVIZIO =1 AND SMALT0.TIPODEPOSITO=1
                
                        ) SM
                    ON ST.DATAMOV BETWEEN SM.DADATA_CORR AND SM.ADATA_CORR
                    
                    INNER JOIN dbo.TRASPORTO_CAD_PARAMETRIDOC PD ON PD.TIPODOC = ST.TIPODOC
                    INNER JOIN dbo.TRASPORTO_CAD CAD ON CAD.PROGRESSIVO = SM.PROGRESSIVO
                    INNER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = ST.CODART AND UMP.TIPOUM=1
                    INNER JOIN dbo.ARTICOLIFATTORICONVERSIONE FATT ON Fatt.CODART = ST.CODART AND FATT.UM1 = UMP.UM 

                    WHERE pd.CODTIPODOCUMENTO =5 
                    AND ST.CODDEPOSITO = CAD.CODDEPOSITO
                        AND FATT.UM2 = CAD.UM
                    GROUP BY SM.PROGRESSIVO
                    ,SM.DADATA
                    , SM.ADATA
                    , SM.VALOREEFFETTIVO
                    ,SM.DADATA_CORR
                    ,SM.ADATA_CORR
                ) SL 
        ON SM.DATAMOV BETWEEN  SL.DADATA AND SL.ADATA
    INNER JOIN dbo.TRASPORTO_CAD TC 
        ON TC.PROGRESSIVO = SL.PROGRESSIVO
    INNER JOIN dbo.ARTICOLIUMPREFERITE UMP 
        ON UMP.CODART = SM.CODART AND UMP.TIPOUM=1
    INNER JOIN dbo.ARTICOLIFATTORICONVERSIONE FATT 
        ON Fatt.CODART = SM.CODART AND FATT.UM1 = UMP.UM 
    WHERE pd.CODTIPODOCUMENTO =5   AND tc.CODDEPOSITO=SM.CODDEPOSITO AND FATT.UM2 = TC.UM)


    INSERT INTO dbo.TRASPORTO_CALCOLOBATCH_RIGHE
            ( 
              IDFILTRO ,
              CODSPEDIZIONIERE ,
              IDREGOLA ,
              DATADOC ,
              IDTESTADOC ,
              IDRIGADOC ,
              TOTRIGHEDOC ,
              CODICE ,
              QTATOT ,
              QTACONV ,
              QTAGEST ,
              QTACALC ,
              TOTVALORE ,
              TOTALERIGADOC ,
              TOTVALORE_RIGADOC ,
              UTENTEMODIFICA ,
              DATAMODIFICA,
              TIPOCALCOLO
            )
        
    SELECT FILTRO
        ,Sm.CODDEPOSITO
        , Regola
        ,DATAMOV
        ,IDTESTA
        ,RIGADOC
        ,TOTRIGHEDOC 
        ,CODICE
        ,QTATOT 
        ,QTACONV 
        ,QTACONV
        ,QTACONV
        ,TOTVALORE
        ,TOTVALORERIGA
        ,TOTVALORE_RIGADOC
        ,'Auto' UtenteModifica
        ,getdate() dataModifica
       , TipoCalcolo 

    FROM RigheCalcolo SM 
  
    /*AGGIORNO IL CAMPO ELABORATO*/
    UPDATE TRASPORTO_CAD SET ELABORATO = 1 WHERE ELABORATO = 0
END
    
GRANT EXECUTE ON [MB_ProcCalcolaSmaltimento] TO METODO98
