﻿
CREATE VIEW ALD_VistaPrelievoOrdFor AS
	SELECT			
							PARAMETRIDOC.DESCRIZIONE AS DescrizioneParDoc,
							TESTEDOCUMENTI.PROGRESSIVO, 
							TESTEDOCUMENTI.DATADOC, 
							TESTEDOCUMENTI.DOCCHIUSO, 
							TESTEDOCUMENTI.CODCLIFOR, 
							TESTEDOCUMENTI.NUMRIFDOC, 
							TESTEDOCUMENTI.DATARIFDOC, 
							TESTEDOCUMENTI.CODLISTINO, 
							TESTEDOCUMENTI.CODCAMBIO, 
							TESTEDOCUMENTI.CODLINGUA, 
							TESTEDOCUMENTI.CODAGENTE1, 
							TESTEDOCUMENTI.CODAGENTE2,
							TESTEDOCUMENTI.CODAGENTE3,
							TESTEDOCUMENTI.CODPAGAMENTO, 
							TESTEDOCUMENTI.DATACONSEGNA TD_DATACONSEGNA, 
							TESTEDOCUMENTI.TRASPACURA, 
							TESTEDOCUMENTI.CAUSALETRASP, 
							TESTEDOCUMENTI.MODOTRASP, 
							TESTEDOCUMENTI.ASPETTOBENI, 
							TESTEDOCUMENTI.PORTO, 
							TESTEDOCUMENTI.CODCFFATT, 
							TESTEDOCUMENTI.BLOCCATO,
							TESTEDOCUMENTI.NUMDESTDIVERSAMERCI, 
							TESTEDOCUMENTI.CODICECUP,
							TESTEDOCUMENTI.CODICECIG,
							(CASE WHEN DATADEC = DATADOC THEN NULL ELSE DATADEC END) AS DECORRENZA, 
							(CASE WHEN (PARAMETRIDOC.DOCTRASPORTO <> 0 AND PARAMETRIDOC.CLIFOR = 'C') THEN (CASE WHEN ANNOLIQUIDAZ = 0 THEN YEAR(TESTEDOCUMENTI.DATADOC) ELSE ANNOLIQUIDAZ END) ELSE NULL END) AS FLAGANNOLIQUIDAZ,
							(CASE WHEN (PARAMETRIDOC.DOCTRASPORTO <> 0 AND PARAMETRIDOC.CLIFOR = 'C') THEN (CASE WHEN MESELIQUIDAZ = 0 THEN MONTH(TESTEDOCUMENTI.DATADOC) ELSE MESELIQUIDAZ END) ELSE NULL END)  AS FLAGMESELIQUIDAZ,
							(CASE WHEN (PARAMETRIDOC.DOCTRASPORTO <> 0 AND PARAMETRIDOC.CLIFOR = 'F') THEN (CASE WHEN ANNOPLAFOND = 0 THEN YEAR(TESTEDOCUMENTI.DATADOC) ELSE ANNOPLAFOND END) ELSE NULL END) AS FLAGANNOPLAFOND,
							(CASE WHEN (PARAMETRIDOC.DOCTRASPORTO <> 0 AND PARAMETRIDOC.CLIFOR = 'F') THEN (CASE WHEN MESEPLAFOND = 0 THEN MONTH(TESTEDOCUMENTI.DATADOC) ELSE MESEPLAFOND END) ELSE NULL END) AS FLAGMESEPLAFOND,
							RIGHEDOCUMENTI.*
	FROM TESTEDOCUMENTI
		INNER JOIN PARAMETRIDOC ON TESTEDOCUMENTI.TIPODOC = PARAMETRIDOC.CODICE 
		INNER JOIN RIGHEDOCUMENTI ON RIGHEDOCUMENTI.IDTESTA = TESTEDOCUMENTI.PROGRESSIVO
	WHERE (TESTEDOCUMENTI.BLOCCATO = 0) 
	--	AND (TESTEDOCUMENTI.DOCCHIUSO = 0)

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_VistaPrelievoOrdFor] TO [Metodo98]
    AS [dbo];

