﻿CREATE VIEW [dbo].[TP_VISTASCTLOGGPMVAL]
AS
SELECT     TP_TESTE_SCONTI_LOGISTICI.PROGRESSIVO,  TP_TESTE_SCONTI_LOGISTICI.DADATA, TP_TESTE_SCONTI_LOGISTICI.ADATA, 
                      TP_TESTE_SCONTI_LOGISTICI.CODCLIFOR, TP_TESTE_SCONTI_LOGISTICI.TIPOLOGIADETTAGLIO, TP_TESTE_SCONTI_LOGISTICI.TIPOLOGIASCONTO,
                      TP_TESTE_SCONTI_LOGISTICI.TIPO_TOTALE,TP_TESTE_SCONTI_LOGISTICI.RifContratto,
                      ANAGRAFICAARTICOLICOMM.CODICEART, TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG.UM, 
                      TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG.VALORE, TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG.SCONTO
FROM         TP_TESTE_SCONTI_LOGISTICI INNER JOIN
                      TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG ON 
                      TP_TESTE_SCONTI_LOGISTICI.PROGRESSIVO = TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG.RIFPROGRESSIVO INNER JOIN
                      ANAGRAFICAARTICOLICOMM ON 
                      TP_RIGHE_SCONTI_LOGISTICI_PREZZIMAG.GRPPREZZIPART = ANAGRAFICAARTICOLICOMM.GRUPPOPRZPART AND 
		ANAGRAFICAARTICOLICOMM.ESERCIZIO = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME())
WHERE     (TP_TESTE_SCONTI_LOGISTICI.TIPOLOGIADETTAGLIO = 3) AND (ANAGRAFICAARTICOLICOMM.GRUPPOPRZPART <> 0)

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTASCTLOGGPMVAL] TO [Metodo98]
    AS [dbo];

