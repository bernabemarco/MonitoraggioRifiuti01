﻿CREATE VIEW VISTALIVPRODCALC_LEGAMI AS
-- Legami distinta base e livello di produzione in calcolo per il codice composto
-- Come codice composto viene sempre riportato il codice articolo riferimento, quindi il codice
-- neutro per gli articoli a tipologie ed il codice generato per gli articoli generati
-- I codici componenti a tipologie vengono sostituiti dal relativo neutro a meno che non siano 
-- codici generati (viene testato che sia contenuto il carattere '$')
SELECT DISTINCT	
	DBC.RIFARTICOLO AS CODCOMPOSTO,
	CASE 	CHARINDEX('$', DBN.CODARTCOMPONENTE)
		WHEN 0 THEN DBN.CODARTCOMPONENTE
		ELSE 
			CASE CHARINDEX('#', DBN.CODARTCOMPONENTE)
			WHEN 0 THEN DBN.CODARTCOMPONENTE 
			ELSE LEFT(DBN.CODARTCOMPONENTE, CHARINDEX('#', DBN.CODARTCOMPONENTE)-1) END
		END	
	AS CODCOMPONENTE, 
	TLP.LIVPRODNUM AS LIVPRODCOMPOSTO
FROM 
	DISTINTAARTCOMPOSTI DBC 
	INNER JOIN TEMPLIVPROD_ARTICOLI TLP ON DBC.RIFARTICOLO = TLP.CODART
	INNER JOIN DISTINTABASE DBN ON DBN.RIFPROGRESSIVO=DBC.PROGRESSIVO 
	INNER JOIN TABSTATOVERSIONEDBA SVD ON DBC.STATOVERSIONE = SVD.CODICE
WHERE
	SVD.USAVERSIONE < 2
--
--
UNION

-- I legami dove i codici componenti sono articoli generati, vengono interpretati anche come legami
-- con i corrispettivi neutri. In sostanza viene preso in considerazione sia il legame con il generato (select precedente) 
-- che quello con il neutro (query corrente)
SELECT DISTINCT	
	DBC.RIFARTICOLO AS CODCOMPOSTO,
	LEFT(DBN.CODARTCOMPONENTE, CHARINDEX('#', DBN.CODARTCOMPONENTE)-1) 
			AS CODCOMPONENTE, 
	TLP.LIVPRODNUM AS LIVPRODCOMPOSTO
FROM 
	DISTINTAARTCOMPOSTI DBC 
	INNER JOIN TEMPLIVPROD_ARTICOLI TLP ON DBC.RIFARTICOLO = TLP.CODART
	INNER JOIN DISTINTABASE DBN ON DBN.RIFPROGRESSIVO=DBC.PROGRESSIVO 
	INNER JOIN TABSTATOVERSIONEDBA SVD ON DBC.STATOVERSIONE = SVD.CODICE
WHERE
	SVD.USAVERSIONE < 2 AND
	CHARINDEX('$', DBN.CODARTCOMPONENTE) = 0 AND
	CHARINDEX('#', DBN.CODARTCOMPONENTE) <> 0

--
--
UNION

-- Legami fittizi generati dagli esaurimenti
-- parte in esaurimento = codice composto, parte sostitutiva = codice componente,
-- ivello di produzione in calcolo per il codice composto
SELECT DISTINCT
	AAC.CODICEART AS CODCOMPOSTO,
	AAP.ARTALTERNATIVO AS CODCOMPONENTE,
	TLP.LIVPRODNUM AS LIVPRODCOMPOSTO
FROM
	ANAGRAFICAARTICOLICOMM AAC
	INNER JOIN ANAGRAFICAARTICOLIPROD AAP ON AAC.CODICEART = AAP.CODICEART AND AAP.ESERCIZIO=AAC.ESERCIZIO
	INNER JOIN TEMPLIVPROD_ARTICOLI TLP ON AAC.CODICEART = TLP.CODART
WHERE
	AAC.ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE 
       	USERDB = USER_NAME()) AND 
	(AAC.ESAURITO=1 OR AAC.INESAURIMENTO=1)AND
	AAP.ARTALTERNATIVO IS NOT NULL AND 
	AAP.ARTALTERNATIVO<>''

--
--
UNION
-- Legami fittizi generati dagli esaurimenti
-- in questa query vengono solo considerate le parti sostitutive che sono articoli generati
-- il codice sostitutivo viene sostituito con il suo neutro
SELECT DISTINCT
	AAC.CODICEART AS CODCOMPOSTO,
	LEFT(AAP.ARTALTERNATIVO, CHARINDEX('#', AAP.ARTALTERNATIVO)-1) 
			AS CODCOMPONENTE, 
	TLP.LIVPRODNUM AS LIVPRODCOMPOSTO
FROM
	ANAGRAFICAARTICOLICOMM AAC
	INNER JOIN ANAGRAFICAARTICOLIPROD AAP ON AAC.CODICEART = AAP.CODICEART AND AAP.ESERCIZIO=AAC.ESERCIZIO
	INNER JOIN TEMPLIVPROD_ARTICOLI TLP ON AAC.CODICEART = TLP.CODART
WHERE
	AAC.ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE 
       	USERDB = USER_NAME()) AND 
	(AAC.ESAURITO=1 OR AAC.INESAURIMENTO=1)AND
	AAP.ARTALTERNATIVO IS NOT NULL AND 
	AAP.ARTALTERNATIVO<>'' AND
	CHARINDEX('#', AAP.ARTALTERNATIVO) <> 0

--
--
UNION

-- Legami a regole, valutati dalla procedura nella tabella temporanea
-- Livello di produzione in calcolo per il codice composto
SELECT DISTINCT
	TLL.CODCOMPOSTO AS CODCOMPOSTO, TLL.CODCOMPONENTE AS CODCOMPONENTE, 
	TLP.LIVPRODNUM AS LIVPRODCOMPOSTO
FROM
	TEMPLIVPROD_LEGAMI TLL
	INNER JOIN TEMPLIVPROD_ARTICOLI TLP ON TLL.CODCOMPOSTO = TLP.CODART


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTALIVPRODCALC_LEGAMI] TO [Metodo98]
    AS [dbo];

