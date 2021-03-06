﻿

CREATE PROCEDURE [dbo].[PROC_TRASPORTO_CL_DETTAGLIOCOSTI](@RIFPROGRESSIVO DECIMAL(18,0),
                                                           @RIFPROGRESSIVODOC DECIMAL(18,0))

 AS
    DELETE FROM TRASPORTO_CL_RIGHE_DETTAGLIO_COSTI WHERE RIFPROGRESSIVO = @RIFPROGRESSIVO AND ((RIFPROGRESSIVODOC = @RIFPROGRESSIVODOC) OR (@RIFPROGRESSIVODOC = 0));
    
    INSERT INTO TRASPORTO_CL_RIGHE_DETTAGLIO_COSTI(RIFPROGRESSIVO,RIFPROGRESSIVODOC,CODICE,UM,TOTALEQUANTITA,TOTALECOSTOCALCOLATO,FLGSTANDARD,UTENTEMODIFICA,DATAMODIFICA)
    SELECT
        T.PROGRESSIVO,
        R.RIFPROGRESSIVODOC,
        TD.CODICE,
        R.UM,
        R.TOTALEQUANTITA,
        (CASE WHEN T.TOTALEQUANTITA > 0 THEN ((TD.VALORE / T.TOTALEQUANTITA) * R.TOTALEQUANTITA) ELSE 0 END) AS TOTALECOSTOCALCOLATO,
        1 AS FLGSTANDARD,
        USER_NAME() AS UTENTEMODIFICA,
        GETDATE() AS DATAMODIFICA
    FROM
        TRASPORTO_CL_TESTE T
    INNER JOIN
        TRASPORTO_CL_RIGHE R
    ON
        R.RIFPROGRESSIVO = T.PROGRESSIVO
    INNER JOIN 
        TRASPORTO_CL_TESTE_DETTAGLIO_COSTI TD
    ON
        TD.RIFPROGRESSIVO = R.RIFPROGRESSIVO
    WHERE
        T.PROGRESSIVO = @RIFPROGRESSIVO AND
        ((R.RIFPROGRESSIVODOC = @RIFPROGRESSIVODOC) OR (@RIFPROGRESSIVODOC = 0))


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_TRASPORTO_CL_DETTAGLIOCOSTI] TO [Metodo98]
    AS [dbo];

