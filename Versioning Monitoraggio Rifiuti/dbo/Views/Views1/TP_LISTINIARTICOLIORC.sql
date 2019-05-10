﻿

CREATE VIEW TP_LISTINIARTICOLIORC AS
SELECT LISTINIARTICOLI.*,
    ANAGRAFICACF.CODCONTO,
    ANAGRAFICACF.DSCCONTO1, 
    TABLISTINI.DESCRIZIONE AS DescList, 
    ANAGRAFICAARTICOLI.DESCRIZIONE AS DescArt, 
    TABLISTINI.CODCAMBIO,
    TABCAMBI.DIVISA,
    TABCAMBI.DESCRIZIONE as DESCRDIVISA,
    CASE TABLISTINI.TP_Tipo 
	WHEN 'V' THEN 'Vendita'
	WHEN 'A' THEN 'Acquisto'
	WHEN 'N' THEN 'Valutazione'
	ELSE 'Libero'
    END AS TIPO
FROM LISTINIARTICOLI 
    INNER JOIN ANAGRAFICAARTICOLI ON 
	LISTINIARTICOLI.CODART = ANAGRAFICAARTICOLI.CODICE 
    INNER JOIN TABLISTINI ON 
 	LISTINIARTICOLI.NRLISTINO = TABLISTINI.NRLISTINO
    INNER JOIN TABCAMBI ON 
    	TABCAMBI.CODICE = TABLISTINI.CODCAMBIO 
    LEFT JOIN ANAGRAFICACF ON
	ANAGRAFICACF.CODCONTO=LISTINIARTICOLI.TP_CODCONTO

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_LISTINIARTICOLIORC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_LISTINIARTICOLIORC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_LISTINIARTICOLIORC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_LISTINIARTICOLIORC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_LISTINIARTICOLIORC] TO [Metodo98]
    AS [dbo];

