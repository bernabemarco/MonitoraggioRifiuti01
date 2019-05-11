﻿
CREATE VIEW [dbo].[EC_VISTACLIFORGEN] AS
SELECT 
       AF.TIPOCONTO,
       AF.CODCONTO,
       AF.DSCCONTO1, 
       AF.CODMASTRO, 
       AF.NOTE,
       RF.NOTE1,
       AF.CODFISCALE, AF.PARTITAIVA,
       RF.CODBANCA, 
       RF.CODAGENTE1, 
       RF.CODAGENTE2, 
       RF.CODAGENTE3,
       RF.CODCAMBIO, 
       RF.CODPAG, 
       RF.PROGDICHINTENTO
FROM
       ANAGRAFICACF AF, 
       ANAGRAFICARISERVATICF RF, 
       TABUTENTI 
WHERE (AF.CODCONTO = RF.CODCONTO) AND (USERDB = CAST(USER_NAME() AS VARCHAR(25))) 
       AND RF.ESERCIZIO = ESERCIZIOATTIVO AND AF.TIPOCONTO IN('C','F')
       AND ((AF.CODCONTO=TABUTENTI.CODCLIFOR) OR (TABUTENTI.CODCLIFOR=''))
       AND RF.STATOCONTABILITA <> 2
UNION
SELECT 
        'G' AS TIPOCONTO,
        ANAGRAFICAGENERICI.CODCONTO, 
        ANAGRAFICAGENERICI.DSCCONTO1, 
        ANAGRAFICAGENERICI.CODMASTRO, 
        ANAGRAFICAGENERICI.NOTE, 
        ANAGRAFICAGENERICI.NOTE1,
        '' AS CODFISCALE,
        '' AS PARTITAIVA,
        '' AS CODBANCA,
        '' AS CODAGENTE1,
        '' AS CODAGENTE2,
        '' AS CODAGENTE3,
        0 AS CODCAMBIO,
        '' AS CODPAG,
        0 AS PROGDICHINTENTO
        FROM ANAGRAFICAGENERICI, TABESERCIZI
        WHERE ANAGRAFICAGENERICI.DATAFINEVALIDITA >= TABESERCIZI.DATAINICONT
        AND ANAGRAFICAGENERICI.DATAINIVALIDITA <= TABESERCIZI.DATAFINECONT
        AND TABESERCIZI.CODICE = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25)))

GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_VISTACLIFORGEN] TO [Metodo98]
    AS [dbo];
