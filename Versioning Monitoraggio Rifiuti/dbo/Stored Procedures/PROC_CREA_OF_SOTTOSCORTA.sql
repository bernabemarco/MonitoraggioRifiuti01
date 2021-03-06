﻿

CREATE PROCEDURE [dbo].[PROC_CREA_OF_SOTTOSCORTA]
AS

BEGIN

SET NOCOUNT ON

    /*CALCOLO SCORTE SU PREVISIONI*/
    /*CALCOLO LOTTO ECONOMICO*/
    EXEC PROC_CALCOLO_EOQ;
    
    /*CALCOLO PUNTO FISSO RIORDINO*/
    EXEC PROC_CALCOLO_PFR;
    
    /*CALCOLO SCORTA*/
    EXEC PROC_CALCOLO_SCORTA;
    
    
    /*
    IMPORTANTE: LE PROCEDURE DEVONO ESSERE ESEGUITE NELL'ORDINE RIPORTATO SOPRA
    */
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_SOTTOSCORTA] TO [Metodo98]
    AS [dbo];

