﻿

CREATE VIEW dbo.TP_VISTALISTINIACQUISTO
AS
    SELECT 
          LA.*
        , TL.DESCRIZIONE AS DESCLIST
        , ACF.DSCCONTO1 AS DESCCONTO
        , AA.DESCRIZIONE AS DESCART 
        , AA.GRUPPO
        , AA.CATEGORIA
        , AA.CODCATEGORIASTAT
        , AAC.GRUPPOPRZPART
        , TEM.CODFAMIGLIAPOS
        , TEM.CODREPARTOPOS
        , TL.CODCAMBIO
        , TC.DIVISA
        , TC.DESCRIZIONE AS DESCRDIVISA
        , CASE TL.TP_TIPO
            WHEN 'V' 
            THEN 'Vendita' 
            WHEN 'A' 
            THEN 'Acquisto' 
            WHEN 'N' 
            THEN 'Valutazione' 
            ELSE 'Libero' 
          END AS TIPO
    FROM 
          ANAGRAFICAARTICOLI AA
        , ANAGRAFICAARTICOLICOMM AAC
        , TP_EXTRAMAG TEM
        , LISTINIARTICOLI LA
        , TABLISTINI TL
        , ANAGRAFICACF ACF
        , TABCAMBI TC 
        , TABUTENTI TU
    WHERE
            TU.USERDB = USER_NAME()
        AND AAC.CODICEART = AA.CODICE
        AND AAC.ESERCIZIO = TU.ESERCIZIOATTIVO 
        AND TEM.CODART = AA.CODICE
        AND LA.CODART = AA.CODICE
        AND TL.NRLISTINO = LA.NRLISTINO
        AND ACF.CODCONTO = LA.TP_CODCONTO
        AND TC.CODICE = TL.CODCAMBIO
        AND ((LA.TP_CodConto <> '' AND LA.TP_CodConto IS NOT NULL))
        AND TL.TP_Tipo = 'A'

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTALISTINIACQUISTO] TO [Metodo98]
    AS [dbo];

