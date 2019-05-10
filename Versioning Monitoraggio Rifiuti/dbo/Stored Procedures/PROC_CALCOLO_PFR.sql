

CREATE PROCEDURE [dbo].[PROC_CALCOLO_PFR]
--ENCRY--
AS

BEGIN

SET NOCOUNT ON

UPDATE TP_PUNTOFISSORIORDINO SET
    TP_PUNTOFISSORIORDINO.ScortaSicurezzaCalcolata = CALCOLI_SCORTE.SCORTASICUREZZAPROPOSTA,
    TP_PUNTOFISSORIORDINO.QtaObiettivoCalcolata = CALCOLI_SCORTE.QTAMAX,
    TP_PUNTOFISSORIORDINO.UtenteModifica = USER_NAME(),
    TP_PUNTOFISSORIORDINO.DataModifica = GETDATE()
FROM
    TP_PUNTOFISSORIORDINO
INNER JOIN
    (
        SELECT
            CODARTICOLO,
            CODDEPOSITO,
            CODFORNITORE,
            SCORTASICUREZZAPROPOSTA,
            ISNULL((CASE WHEN QTAMAX < SCORTASICUREZZAPROPOSTA THEN SCORTASICUREZZAPROPOSTA ELSE QTAMAX END),0) AS QTAMAX
        FROM
        (
            SELECT
                CODARTICOLO,
                CODDEPOSITO,
                CODFORNITORE,
                SCORTASICUREZZAPROPOSTA,
                GG_DATARIORDINODIFF,
                (((TOTALEPREVISIONE / GIORNILAVORO12PERIODIPREVISTI) * (LEADTIME + GG_DATARIORDINODIFF)) + SCORTASICUREZZAPROPOSTA) AS QTAMAX,
                TOTALEPREVISIONE
            FROM
            (
                SELECT
                    CODARTICOLO,
                    CODDEPOSITO,
                    CODFORNITORE,
                    ISNULL((ISNULL(VALOREZ,0) * DEVIAZIONESTD * RLEADTIME),0) AS SCORTASICUREZZAPROPOSTA,
                    LEADTIME,
                    GG_DATARIORDINODIFF,
                    GIORNILAVORO12PERIODIPREVISTI,
                    FATTORESCOSTAMENTO,
                    TOTALEPREVISIONE
                FROM
                (
                    SELECT 
                        TVPAR.CODARTICOLO,
                        TVPAR.CODDEPOSITO,
                        TVPFR.CODFORNITORE,
                        VALOREZ,
                        TVPAR.TOTALEPREVISIONE,
                        TVPAR.FATTORESCOSTAMENTO,
                        TVPAR.DEVIAZIONESTD,
                        TVPAR.DEVIAZIONESTD_VEN,
                        TVR.GG_DATARIORDINODIFF,
                        TVPFR.LEADTIME,
                        (TVPAR.GIORNILAVOROPERIODOPREVISTI * 12) AS GIORNILAVORO12PERIODIPREVISTI ,
                        SQRT(TVPFR.LEADTIME + GG_DATARIORDINODIFF) AS RLEADTIME
                    FROM
                        TP_VISTAPARAMETRIARTICOLI_RIORDINO TVPAR
                    inner join
                        TP_VISTAPARAMETRIFORNITORI_RIORDINO TVPFR
                    on TVPFR.CODARTICOLO = TVPAR.CODARTICOLO AND
                        TVPFR.CODDEPOSITO = TVPAR.CODDEPOSITO
                    inner join
                        TP_GIACENZE TG
                    On TG.CODARTICOLO = TVPAR.CODARTICOLO AND
                        TG.CODDEPOSITO = TVPAR.CODDEPOSITO
                    left join
                        TP_VISTADIFFERENZADATEINGG_RIORDINO TVR
                    on TVR.CODDEPOSITO = TVPAR.CODDEPOSITO AND
                        TVR.CODFORNITORE = TVPFR.CODFORNITORE
                ) CALCOLO_1
            ) CALCOLO_2
        )CALCOLO_FINALE
    ) CALCOLI_SCORTE
    ON
        CALCOLI_SCORTE.CODARTICOLO = TP_PUNTOFISSORIORDINO.CodArticolo AND
        CALCOLI_SCORTE.CODDEPOSITO = TP_PUNTOFISSORIORDINO.CodDeposito AND
        CALCOLI_SCORTE.CODFORNITORE = TP_PUNTOFISSORIORDINO.CodFornPref

If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLO_PFR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PROC_CALCOLO_PFR] TO [Metodo98]
    AS [dbo];

