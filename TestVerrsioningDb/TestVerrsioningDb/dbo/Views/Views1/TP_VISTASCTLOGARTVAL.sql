﻿

CREATE VIEW [dbo].[TP_VISTASCTLOGARTVAL]
AS
SELECT    
    TP_TESTE_SCONTI_LOGISTICI.PROGRESSIVO, 
    TP_TESTE_SCONTI_LOGISTICI.DADATA, 
    TP_TESTE_SCONTI_LOGISTICI.ADATA, 
    TP_TESTE_SCONTI_LOGISTICI.CODCLIFOR, 
    TP_TESTE_SCONTI_LOGISTICI.TIPOLOGIADETTAGLIO,
    TP_TESTE_SCONTI_LOGISTICI.TIPOLOGIASCONTO,  
    TP_TESTE_SCONTI_LOGISTICI.TIPO_TOTALE,
    TP_TESTE_SCONTI_LOGISTICI.RifContratto,
    TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO.ARTICOLO, 
    TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO.CODARTRIC,
    TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO.UM, 
    TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO.VALORE, 
    TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO.SCONTO
FROM
    TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO 
INNER JOIN
    TP_TESTE_SCONTI_LOGISTICI ON TP_RIGHE_SCONTI_LOGISTICI_ARTICOLO.RIFPROGRESSIVO = TP_TESTE_SCONTI_LOGISTICI.PROGRESSIVO
WHERE
    (TP_TESTE_SCONTI_LOGISTICI.TIPOLOGIADETTAGLIO = 4)


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTASCTLOGARTVAL] TO [Metodo98]
    AS [dbo];

