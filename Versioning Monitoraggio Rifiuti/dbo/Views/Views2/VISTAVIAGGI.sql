﻿CREATE VIEW VISTAVIAGGI AS

SELECT v.PROGRESSIVO, v.RIFTESTATARIFFARIO, v.DESCRIZIONE, v.IDRIGADOC, v.DATAVIAGGIO
       , v.DATARITIROMERCE, v.TIPOLOGIACARICO, v.QUANTITA, v.LUOGOCONSEGNA, v.DESTINAZIONE
       , v.PRIORITA, v.PRENOTAZIONESCARICO, v.MAGGIORAZIONIAPPLICATE, v.DISTANZAVIAGGIO
       , v.COSTOVIAGGIO, v.TEMPOVIAGGIO, v.FILEMPP, v.VOLUMECARICO, v.PESOCARICO, v.IDTAPPA	 
       , v.UM, v.TRATTA, v.RITIRO, v.LUOGOPRESA, v.PRESO
       , CASE WHEN v.automezzo is NULL THEN 0 ELSE 1 END AS ASSEGNATA
       , t.DESCRIZIONE AS DSCTRATTA
       , rd.TOTLORDORIGAEURO AS PREZZO, rd.IDTESTA AS IDTESTA, rd.IDRIGA
       , acf.CODCONTO, acf.DSCCONTO1
       , aa.CODICE, aa.DESCRIZIONE DSCCAMION, aa.TARGA, aa.PROPRIETARIO, aa.AUTISTA
FROM VIAGGI V 
LEFT JOIN TRATTE t ON v.TRATTA=t.PROGRESSIVO
LEFT JOIN TESTEDOCUMENTI td ON v.IDTESTADOC=td.PROGRESSIVO
LEFT JOIN ANAGRAFICACF acf ON td.CODCLIFOR=acf.CODCONTO
LEFT JOIN ANAGRAFICAAUTOMEZZI aa ON v.AUTOMEZZO=aa.CODICE
LEFT JOIN RIGHEDOCUMENTI rd ON (v.IDTESTADOC=rd.IDTESTA AND v.IDRIGADOC=rd.IDRIGA)

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTAVIAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTAVIAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTAVIAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAVIAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTAVIAGGI] TO [Metodo98]
    AS [dbo];

