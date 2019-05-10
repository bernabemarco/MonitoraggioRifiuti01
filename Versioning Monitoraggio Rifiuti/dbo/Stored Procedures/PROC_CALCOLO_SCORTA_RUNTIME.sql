

CREATE PROCEDURE [dbo].[PROC_CALCOLO_SCORTA_RUNTIME](@IdSessione as Decimal(5,0))
--ENCRY--
AS

BEGIN

SET NOCOUNT ON

UPDATE TP_ELENCOARTICOLIOF_TEMP SET
    TP_ELENCOARTICOLIOF_TEMP.PropostaLbr = PropostaXLeadTime,
    TP_ELENCOARTICOLIOF_TEMP.LivelloRiordino = CALCOLI_SCORTE.LIVELLORIORDINO,
    TP_ELENCOARTICOLIOF_TEMP.UtenteModifica = USER_NAME(),
    TP_ELENCOARTICOLIOF_TEMP.DataModifica = GETDATE()
FROM
    TP_ELENCOARTICOLIOF_TEMP
INNER JOIN
    (
        SELECT
            IdSessione,
            ModalitaCalcolo,
            CODARTICOLO,
            CODDEPOSITO,
            CODFORNITORE,
            (((TOTALEPREVISIONE / GIORNILAVORO12PERIODIPREVISTI) * LEADTIME) + SCORTASICUREZZA) AS PropostaXLeadTime,
            (((TOTALEPREVISIONE / GIORNILAVORO12PERIODIPREVISTI) * LEADTIME) + SCORTASICUREZZA) AS LIVELLORIORDINO
        FROM
        (
            SELECT DISTINCT
                TEAOT.IdSessione,
                TEAOT.ModalitaCalcolo,
                TEAOT.CodArt AS CodArticolo,
                TEAOT.CodFor As CodFornitore,
                TEAOT.Tp_CodDep AS CodDeposito,
                TVPAR.TOTALEPREVISIONE,
                TVPAR.FATTORESCOSTAMENTO,
                (TVPAR.GIORNILAVOROPERIODOPREVISTI * 12) AS GIORNILAVORO12PERIODIPREVISTI,
                TS.ScortaSicurezza,
                (TVPFR.LEADTIME + TOS.GiorniCopertura) AS LEADTIME
            FROM
                TP_ELENCOARTICOLIOF_TEMP TEAOT
            INNER JOIN
                TP_OF_BUYERS TOB
            ON
                TOB.IDSESSIONE = TEAOT.IdSessione AND
                TOB.CodBuyer = TEAOT.CodBuyer AND
                TOB.SELEZIONATO = TEAOT.Selezionato
            INNER JOIN
                TP_OF_SUPPLIERS TOS
            ON
                TOS.CODBUYER = TOB.CodBuyer AND
                TOS.Selezionato = TOB.Selezionato AND
                TOS.CODFORNITORE = TEAOT.CodFor AND
                TOS.IDSESSIONE = TEAOT.IdSessione
            INNER JOIN
                TP_OF_DOCKS TOD
            ON
                TOD.CODBUYER = TOS.CodBuyer AND
                TOD.CODFORNITORE = TOS.CodFornitore AND
                TOD.Selezionato = TOS.Selezionato AND
                TOD.IDSESSIONE = TOS.IdSessione
            INNER JOIN
                TP_VISTAPARAMETRIFORNITORI_RIORDINO TVPFR
            ON
                TVPFR.CODARTICOLO = TEAOT.CodArt AND
                TVPFR.CODDEPOSITO = TEAOT.Tp_CodDep AND
                TVPFR.CODFORNITORE = TEAOT.CodFor 
            INNER JOIN
                TP_VISTAPARAMETRIARTICOLI_RIORDINO TVPAR
            ON
                TVPAR.CODARTICOLO = TVPFR.CODARTICOLO AND
                TVPAR.CODDEPOSITO = TVPFR.CODDEPOSITO
            INNER JOIN
                TP_SCORTA TS
            ON
                TS.CodArticolo = TVPAR.CODARTICOLO AND
                TS.CodDeposito = TVPAR.CODDEPOSITO

            WHERE
                TEAOT.IdSessione = @IdSessione AND
                TEAOT.Selezionato = 1
        ) DATI_BASE
    ) CALCOLI_SCORTE
ON
    CALCOLI_SCORTE.IdSessione = TP_ELENCOARTICOLIOF_TEMP.IdSessione AND
    CALCOLI_SCORTE.CODARTICOLO = TP_ELENCOARTICOLIOF_TEMP.CodArt AND
    CALCOLI_SCORTE.CODDEPOSITO = TP_ELENCOARTICOLIOF_TEMP.Tp_CodDep AND
    CALCOLI_SCORTE.CODFORNITORE = TP_ELENCOARTICOLIOF_TEMP.CodFor AND
    CALCOLI_SCORTE.MODALITACALCOLO = TP_ELENCOARTICOLIOF_TEMP.ModalitaCalcolo

If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CALCOLO_SCORTA_RUNTIME] TO [Metodo98]
    AS [dbo];

