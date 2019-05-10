

CREATE PROCEDURE [dbo].[PROC_CALCOLO_EOQ]
--ENCRY--
AS

BEGIN

SET NOCOUNT ON

    UPDATE TP_APPROVV_DEPOSITI SET
        TP_APPROVV_DEPOSITI.ScortaMinimaCalcolata = CALCOLI_SCORTE.SCORTASICUREZZAPROPOSTA,
        TP_APPROVV_DEPOSITI.LivelloRiordinoCalcolato = CALCOLI_SCORTE.LIVELLORIORDINO,
        TP_APPROVV_DEPOSITI.LottoRiordinoCalcolato = CALCOLI_SCORTE.LOTTOECONOMICO,
        TP_APPROVV_DEPOSITI.UtenteModifica = USER_NAME(),
        TP_APPROVV_DEPOSITI.DataModifica = GETDATE()
    FROM
        TP_APPROVV_DEPOSITI
    INNER JOIN
        (
            SELECT
                CODARTICOLO,
                CODDEPOSITO,
                CODFORNITORE,
                SCORTASICUREZZAPROPOSTA,
                /*(LOTTOECONOMICO * LEADTIME * FATTORESCOSTAMENTO) AS LIVELLORIORDINO, 09/02/2012 Cambiato In*/
                (((TOTALEPREVISIONE / GIORNILAVORO12PERIODIPREVISTI) * LEADTIME * FATTORESCOSTAMENTO) + SCORTASICUREZZAPROPOSTA) AS LIVELLORIORDINO,
                LOTTOECONOMICO
            FROM
            (
                SELECT
                    CODARTICOLO,
                    CODDEPOSITO,
                    CODFORNITORE,
                    SCORTASICUREZZAPROPOSTA,
                    (CASE WHEN CALCOLOLOTTOECONOMICO < 0 THEN 0 ELSE SQRT(CALCOLOLOTTOECONOMICO) END) AS LOTTOECONOMICO,
                    FATTORESCOSTAMENTO,
                    GIORNILAVOROPERIODOPREVISTI,
                    GIORNILAVORO12PERIODIPREVISTI,
                    LEADTIME,
                    TOTALEPREVISIONE
                FROM
                (
                    SELECT
                        CODARTICOLO,
                        CODDEPOSITO,
                        CODFORNITORE,
                        (ISNULL(VALOREZ,0) * DEVIAZIONESTD * RLEADTIME) AS SCORTASICUREZZAPROPOSTA,
                        (2 * TOTALEPREVISIONE * COSTOORDINAZIONE) / ISNULL(NULLIF((COSTOACQUISTO * ((INDICECOSTOMANTENIMENTO + TASSOMANTENIMENTO) / 100)),0),1) AS CALCOLOLOTTOECONOMICO,                   
                        FATTORESCOSTAMENTO,
                        GIORNILAVOROPERIODOPREVISTI,
                        GIORNILAVORO12PERIODIPREVISTI,
                        LEADTIME,
                        TOTALEPREVISIONE
                    FROM
                    (
                        SELECT 
                            TVPAR.CODARTICOLO,
                            TVPAR.CODDEPOSITO,
                            TVPFR.CODFORNITORE,
                            VALOREZ,
                            TVPAR.TOTALEPREVISIONE,
                            TVPAR.TOTALEVENDUTO,
                            TVPAR.DEVIAZIONESTD,
                            TVPAR.DEVIAZIONESTD_VEN,
                            TVPAR.COSTOORDINAZIONE,
                            TVPAR.INDICECOSTOMANTENIMENTO,
                            TVPAR.TASSOMANTENIMENTO,
                            TVPAR.FATTORESCOSTAMENTO,
                            TVPAR.GIORNILAVOROPERIODOPREVISTI,
                            (TVPAR.GIORNILAVOROPERIODOPREVISTI * 12) AS GIORNILAVORO12PERIODIPREVISTI ,
                            TVPFR.RLEADTIME,
                            TVPFR.LEADTIME,
                            ISNULL(
                                    (CASE COSTOACQUISTO 
                                        WHEN 0 THEN TVPFR.PREZZOEURO
                                        WHEN 1 THEN TG.VALORELIFO
                                        WHEN 2 THEN (SELECT PREZZOEURO FROM LISTINIARTICOLI WHERE NRLISTINO = CODLISTINOCA AND CODART = TVPAR.CODARTICOLO AND UM = (SELECT UM FROM ARTICOLIUMPREFERITE WHERE TIPOUM = 1 AND CODART = TVPAR.CODARTICOLO))
                                     END),
                                  0) AS COSTOACQUISTO
                        FROM
                            TP_VISTAPARAMETRIARTICOLI_RIORDINO TVPAR,
                            TP_VISTAPARAMETRIFORNITORI_RIORDINO TVPFR,
                            TP_GIACENZE TG
                        WHERE
                            TVPFR.CODARTICOLO = TVPAR.CODARTICOLO AND
                            TVPFR.CODDEPOSITO = TVPAR.CODDEPOSITO AND
                            TG.CODARTICOLO = TVPAR.CODARTICOLO AND
                            TG.CODDEPOSITO = TVPAR.CODDEPOSITO
                    ) CALCOLO_1
                ) CALCOLO_2
            )CALCOLO_FINALE
        ) CALCOLI_SCORTE
    ON
        CALCOLI_SCORTE.CODARTICOLO = TP_APPROVV_DEPOSITI.CodArticolo AND
        CALCOLI_SCORTE.CODDEPOSITO = TP_APPROVV_DEPOSITI.CodDeposito AND
        CALCOLI_SCORTE.CODFORNITORE = TP_APPROVV_DEPOSITI.CodFornPref

If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLO_EOQ] TO [Metodo98]
    AS [dbo];

