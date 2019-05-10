﻿

CREATE PROCEDURE [dbo].[PROC_ARTICOLI_OFN_SSP](@IDSESSIONE DECIMAL(10,0),
                                                @PROGRESSIVOSSP DECIMAL(10,0))

AS

BEGIN

SET NOCOUNT ON
    
    UPDATE TP_ARTICOLIORDINEFORNITORE_TEMP
    SET TP_ARTICOLIORDINEFORNITORE_TEMP.QtaOrdinata = SOSPESO.QTAORDINATA
    FROM TP_ARTICOLIORDINEFORNITORE_TEMP
    INNER JOIN
    (
        SELECT 
            CODART,
            --CODDEPOSITO,
            SUM(QTAGEST) AS QTAORDINATA
        FROM 
            TP_OFRIGHEDOCUMENTI_TMP
        WHERE
            RIFPROGRESSIVO = @PROGRESSIVOSSP
        GROUP BY
             CODART
            --,CODDEPOSITO
    ) SOSPESO
    ON      
        TP_ARTICOLIORDINEFORNITORE_TEMP.IdSessione = @IDSESSIONE AND
        SOSPESO.CODART = TP_ARTICOLIORDINEFORNITORE_TEMP.CodArt;

    UPDATE TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP
    SET TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.QtaOrdinata = SOSPESO.QTAORDINATA
    FROM TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP
    INNER JOIN
    (
        SELECT 
            TD.CODCLIFOR,
            TD.CODCFFATT,
            RG.CODDEPOSITO,
            RG.CODART,
            SUM(RG.QTAGEST) AS QTAORDINATA
        FROM 
            TP_OFTESTEDOCUMENTI_TMP TD
        INNER JOIN
            TP_OFRIGHEDOCUMENTI_TMP RG
        ON
            RG.IDTESTA = TD.RIFPROGRESSIVO
        WHERE
            RG.RIFPROGRESSIVO = @PROGRESSIVOSSP
        GROUP BY
            TD.CODCLIFOR,
            TD.CODCFFATT,
            RG.CODDEPOSITO,
            RG.CODART
    ) SOSPESO
    ON      
        TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.IdSessione = @IDSESSIONE AND
        SOSPESO.CODART = TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodArt AND
        SOSPESO.CODDEPOSITO = TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodDeposito AND
        SOSPESO.CODCLIFOR = TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodFornitore AND
        SOSPESO.CODCFFATT = TP_ARTICOLIORDINEFORNITOREFILTRO_TEMP.CodFornitoreFatt;
        
    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_ARTICOLI_OFN_SSP] TO [Metodo98]
    AS [dbo];

