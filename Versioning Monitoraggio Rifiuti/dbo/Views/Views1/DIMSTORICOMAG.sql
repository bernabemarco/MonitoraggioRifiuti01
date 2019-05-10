﻿
CREATE VIEW DIMSTORICOMAG AS
SELECT
	STMAG.DATAMOV DATA_MOVIMENTO,
    (CASE WHEN CAUMAG.CODICE IS NULL THEN -1 ELSE CAUMAG.CODICE END) CODICE_CAUSALE,
    (CASE WHEN CAUMAG.CODICE IS NULL THEN '- Non Specificato' ELSE CAUMAG.DESCRIZIONE END) CAUSALE_MAGAZZINO,
	STMAG.CODART CODICE_ARTICOLO,
    (CASE WHEN AA.CODICE IS NULL THEN '- Non Specificato' ELSE AA.DESCRIZIONE END) DESCRIZIONE_ARTICOLO,
	SUBSTRING(STMAG.CODCLIFOR,1,1) CLIFOR,
	STMAG.CODCLIFOR CODICE_CLIFOR,
    CLIFOR.DSCCONTO1 RAGIONE_SOCIALE,
    CLIFOR.PROVINCIA,
    (CASE WHEN TABNAZIONI.CODICE IS NULL THEN -1 ELSE TABNAZIONI.CODICE END) CODICE_NAZIONE,
    (CASE WHEN TABNAZIONI.DESCRIZIONE IS NULL THEN '- Non Specificato' ELSE TABNAZIONI.DESCRIZIONE END) NAZIONE,
    (CASE WHEN TABZONE.CODICE IS NULL THEN -1 ELSE TABZONE.CODICE END) CODICE_ZONA,
    (CASE WHEN TABZONE.DESCRIZIONE IS NULL THEN '- Non Specificato' ELSE TABZONE.DESCRIZIONE END) ZONA,
    (CASE WHEN CATEGORIECF.CODCATEGORIA IS NULL THEN -1 ELSE CATEGORIECF.CODCATEGORIA END) CODICE_CATEGORIA_CF,
    (CASE WHEN CATEGORIECF.DSCCATEGORIA IS NULL THEN '- Non Specificato' ELSE CATEGORIECF.DSCCATEGORIA END) CATEGORIA_CF,
	(CASE WHEN TABSETTORI.CODICE IS NULL THEN -1 ELSE TABSETTORI.CODICE END) CODICE_SETTORE_CF,
	(CASE WHEN TABSETTORI.DESCRIZIONE IS NULL THEN '- Non Specificato' ELSE TABSETTORI.DESCRIZIONE END) SETTORE_CF,
    (CASE WHEN TABGRUPPI.CODICE IS NULL THEN -1 ELSE TABGRUPPI.CODICE END) CODICE_GRUPPO_ARTICOLO,
    (CASE WHEN TABGRUPPI.DESCRIZIONE IS NULL THEN '- Non Specificato' ELSE TABGRUPPI.DESCRIZIONE END) GRUPPO_ARTICOLO,
    (CASE WHEN TABCATEGORIE.CODICE IS NULL THEN -1 ELSE TABCATEGORIE.CODICE END)CODICE_CATEGORIA_ARTICOLO,
    (CASE WHEN TABCATEGORIE.DESCRIZIONE IS NULL THEN '- Non Specificato' ELSE TABCATEGORIE.DESCRIZIONE END) CATEGORIA_ARTICOLO,
    (CASE WHEN TABCATEGORIESTAT.CODICE IS NULL THEN -1 ELSE TABCATEGORIESTAT.CODICE END) CODICE_CATEGORIA_STAT_ARTICOLO,
    (CASE WHEN TABCATEGORIESTAT.DESCRIZIONE IS NULL THEN '- Non Specificato' ELSE TABCATEGORIESTAT.DESCRIZIONE END)CATEGORIA_STAT_ARTICOLO,
   	(CASE WHEN ANADEP.CODICE IS NULL THEN '-' ELSE ANADEP.CODICE END) CODICE_DEPOSITO,
	(CASE WHEN ANADEP.DESCRIZIONE IS NULL THEN '- Non Specificato' ELSE ANADEP.DESCRIZIONE END) DEPOSITO,
    (CASE WHEN ANADEP.CODICE IS NULL THEN -1 ELSE ANADEP.TIPODEPOSITO END) TIPODEPOSITO,
	(CASE WHEN TABCAMBI.CODICE IS NULL THEN '--' ELSE TABCAMBI.DIVISA END) DIVISA,
	(CASE WHEN AFUM.UM2 IS NULL THEN '--' ELSE AFUM.UM2 END) UM_STATISTICA,
    (CASE WHEN AFUM.UM2 IS NULL THEN CAST(STMAG.QTA1UM*STMAG.QUANTITACARICO AS DECIMAL(19,4)) ELSE CAST(STMAG.QTA1UM*STMAG.QUANTITACARICO*AFUM.FATTORE AS DECIMAL(19,4)) END) AS CARICO,
    (CASE WHEN AFUM.UM2 IS NULL THEN CAST(STMAG.QTA1UM*STMAG.QUANTITASCARICO AS DECIMAL(19,4)) ELSE CAST(STMAG.QTA1UM*STMAG.QUANTITASCARICO*AFUM.FATTORE AS DECIMAL(19,4)) END) AS SCARICO,
    (CASE WHEN AFUM.UM2 IS NULL THEN CAST(STMAG.QTA1UM*STMAG.ORDINATO AS DECIMAL(19,4)) ELSE CAST(STMAG.QTA1UM*STMAG.ORDINATO*AFUM.FATTORE AS DECIMAL(19,4)) END) AS ORDINATO,
    (CASE WHEN AFUM.UM2 IS NULL THEN CAST(STMAG.QTA1UM*STMAG.IMPEGNATO AS DECIMAL(19,4)) ELSE CAST(STMAG.QTA1UM*STMAG.IMPEGNATO*AFUM.FATTORE AS DECIMAL(19,4)) END) AS IMPEGNATO,
	(CASE WHEN AFUM.UM2 IS NULL THEN CAST(STMAG.QTA1UM*STMAG.GIACENZA AS DECIMAL(19,4)) ELSE CAST(STMAG.QTA1UM*STMAG.GIACENZA*AFUM.FATTORE AS DECIMAL(19,4)) END) AS GIACENZA,
    CAST((STMAG.IMPORTOTOTNETTO*STMAG.QUANTITACARICO) AS DECIMAL(19,4)) AS VALORECARICO,
    CAST((STMAG.IMPORTOTOTNETTOEURO*STMAG.QUANTITACARICO) AS DECIMAL(19,4)) AS VALORECARICOEURO,
    CAST((STMAG.IMPORTOTOTNETTOVAL*STMAG.QUANTITACARICO) AS DECIMAL(19,4)) AS VALORECARICOVALUTA,
    CAST((STMAG.IMPORTOTOTNETTO*STMAG.QUANTITASCARICO) AS DECIMAL(19,4)) AS VALORESCARICO,
    CAST((STMAG.IMPORTOTOTNETTOEURO*STMAG.QUANTITASCARICO) AS DECIMAL(19,4)) AS VALORESCARICOEURO,
    CAST((STMAG.IMPORTOTOTNETTOVAL*STMAG.QUANTITASCARICO) AS DECIMAL(19,4)) AS VALORESCARICOVALUTA
    FROM
    (((((((((((((STORICOMAG STMAG INNER JOIN TABCAUSALIMAG CAUMAG ON STMAG.CODCAUSALE=CAUMAG.CODICE)
    INNER JOIN ANAGRAFICACF CLIFOR ON STMAG.CODCLIFOR=CLIFOR.CODCONTO)
    LEFT OUTER JOIN ANAGRAFICARISERVATICF RISCLIFOR ON RISCLIFOR.ESERCIZIO=STMAG.ESERCIZIO AND RISCLIFOR.CODCONTO=STMAG.CODCLIFOR)
	LEFT OUTER JOIN TABNAZIONI ON CLIFOR.CODNAZIONE=TABNAZIONI.CODICE)
	LEFT OUTER JOIN TABSETTORI ON RISCLIFOR.CODSETTORE=TABSETTORI.CODICE)
	LEFT OUTER JOIN TABZONE ON RISCLIFOR.CODZONA=TABZONE.CODICE)
	LEFT OUTER JOIN CATEGORIECF ON RISCLIFOR.CODCATEGORIA=CATEGORIECF.CODCATEGORIA)
	LEFT OUTER JOIN TABCAMBI ON TABCAMBI.CODICE=STMAG.CODCAMBIO)
    INNER JOIN ANAGRAFICAARTICOLI AA ON STMAG.CODART=AA.CODICE)
	LEFT OUTER JOIN TABGRUPPI ON AA.GRUPPO=TABGRUPPI.CODICE)
	LEFT OUTER JOIN TABCATEGORIE ON AA.CATEGORIA=TABCATEGORIE.CODICE)
	LEFT OUTER JOIN TABCATEGORIESTAT ON AA.CODCATEGORIASTAT=TABCATEGORIESTAT.CODICE)
	LEFT OUTER JOIN ANAGRAFICADEPOSITI ANADEP ON STMAG.CODDEPOSITO=ANADEP.CODICE)
    LEFT OUTER JOIN ARTICOLIFATTORICONVERSIONE AFUM ON STMAG.CODART = AFUM.CODART AND 
		(SELECT UM FROM ARTICOLIUMPREFERITE WHERE ARTICOLIUMPREFERITE.CODART=STMAG.CODART AND ARTICOLIUMPREFERITE.TIPOUM=1)=AFUM.UM1 AND
		(SELECT UM FROM ARTICOLIUMPREFERITE WHERE ARTICOLIUMPREFERITE.CODART=STMAG.CODART AND ARTICOLIUMPREFERITE.TIPOUM=8)=AFUM.UM2

GO
GRANT SELECT
    ON OBJECT::[dbo].[DIMSTORICOMAG] TO [Metodo98]
    AS [dbo];

