﻿

CREATE VIEW TP_VISTARELAZIONICFVDO
AS
	SELECT 
	    RELAZIONICFV.CODCLIFOR,
	    RELAZIONICFV.RIFERIMENTO,
	    RELAZIONICFV.ARTICOLO,
	    RELAZIONICFV.VARIANTI,
	    ANAGRAFICAARTICOLI.DESCRIZIONE,
	    RELAZIONICFV.TIPOREL,
	    RELAZIONICFV.MOSTRAVARIANTI,
	    (CASE WHEN VARIANTI<>'' THEN (SELECT Descrizione FROM AnagraficaArticoli WHERE Codice=ARTICOLO+'#'+VARIANTI) ELSE (SELECT Descrizione FROM AnagraficaArticoli WHERE Codice=ARTICOLO) END) AS DSCART,
	    (CASE WHEN VARIANTI<>'' THEN (SELECT ArtTipologia FROM AnagraficaArticoli WHERE Codice=ARTICOLO+'#'+VARIANTI) ELSE (SELECT ArtTipologia FROM AnagraficaArticoli WHERE Codice=ARTICOLO) END) AS ARTTIPOLOGIA,
	    (CASE WHEN VARIANTI<>'' THEN (SELECT CodicePrimario FROM AnagraficaArticoli WHERE Codice=ARTICOLO+'#'+VARIANTI) ELSE (SELECT CodicePrimario FROM AnagraficaArticoli WHERE Codice=ARTICOLO) END) AS CODICEPRIMARIO,
	    (CASE WHEN TIPOREL=1 THEN ARTICOLO ELSE RIFERIMENTO END) AS CODICERIF,
	    (CASE WHEN Varianti = '' or Varianti is null THEN Articolo ELSE (Articolo+'#'+ Varianti) END) CodArticolo,
	    ANAGRAFICAARTICOLI.GRUPPO,
	    ANAGRAFICAARTICOLI.CATEGORIA,
	    ANAGRAFICAARTICOLI.CODCATEGORIASTAT,
	    ANAGRAFICAARTICOLICOMM.GRUPPOPRZPART,
   	    ANAGRAFICAARTICOLICOMM.ESERCIZIO
	FROM RELAZIONICFV
	INNER JOIN ANAGRAFICAARTICOLI ON ANAGRAFICAARTICOLI.CODICE=(CASE WHEN Varianti = '' or Varianti is null THEN Articolo ELSE (Articolo+'#'+ Varianti) END)
	INNER JOIN ANAGRAFICAARTICOLICOMM ON ANAGRAFICAARTICOLICOMM.CODICEART=(CASE WHEN Varianti = '' or Varianti is null THEN Articolo ELSE (Articolo+'#'+ Varianti) END)

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTARELAZIONICFVDO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTARELAZIONICFVDO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VISTARELAZIONICFVDO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTARELAZIONICFVDO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTARELAZIONICFVDO] TO [Metodo98]
    AS [dbo];
