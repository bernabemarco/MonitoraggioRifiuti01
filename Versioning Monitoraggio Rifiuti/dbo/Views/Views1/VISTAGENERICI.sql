﻿
CREATE VIEW VISTAGENERICI AS
        SELECT ANAGRAFICAGENERICI.CODCONTO, ANAGRAFICAGENERICI.DSCCONTO1, 
        ANAGRAFICAGENERICI.CODMASTRO, ANAGRAFICAGENERICI.DATAINIVALIDITA, 
        ANAGRAFICAGENERICI.DATAFINEVALIDITA, ANAGRAFICAGENERICI.NOTE, 
        ANAGRAFICAGENERICI.NOTE1,'' AS CODFISCALE,'' AS PARTITAIVA,
        '' AS CODBANCA,'' AS CODAGENTE1,'' AS CODAGENTE2,'' AS CODAGENTE3,0 AS CODCAMBIO,'' AS CODPAG,
        ANAGRAFICAGENERICI.GESTPARTITE,
        ANAGRAFICAGENERICI.CTRLQUADCDC,
        ANAGRAFICAGENERICI.FLGRATEIRISCONTI,
        ANAGRAFICAGENERICI.UTENTEMODIFICA,
        ANAGRAFICAGENERICI.DATAMODIFICA,
        0 AS PROGDICHINTENTO,
        0 AS FLGDOGANA
        FROM ANAGRAFICAGENERICI, TABESERCIZI
        WHERE ANAGRAFICAGENERICI.DATAFINEVALIDITA >= TABESERCIZI.DATAINICONT
        AND ANAGRAFICAGENERICI.DATAINIVALIDITA <= TABESERCIZI.DATAFINECONT
        AND TABESERCIZI.CODICE = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25)))
GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAGENERICI] TO [Metodo98]
    AS [dbo];

