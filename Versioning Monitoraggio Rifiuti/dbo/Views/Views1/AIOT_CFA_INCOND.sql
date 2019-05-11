﻿
CREATE VIEW AIOT_CFA_INCOND
AS

SELECT     TESTE.DESCRIZIONECONTRATTO AS [DESCRIZIONE CONTRATTO], TESTE.NUMEROCONTRATTO AS [NUMERO CONTRATTO], TESTE.CODICE, 
                      TESTE.DATAINIZIOCONTRATTO AS [DATA INIZIO CONTRATTO], TESTE.DATAFINECONTRATTO AS [DATA FINE CONTRATTO], INCO.TIPOLOGIA, INCO.DESCRIZIONE, 
                      INCO.VALORE, INCO.MERCEVALORE, INCO.TIPODOC AS [DOC LIQUIDAZIONE], INCO.EMESSO AS LIQUIDATO, INCO.DSCPAGAMENTO, 
                      INCO.RIFPROGRESSIVO AS CONTRATTO, INCO.NRRIGA, TESTE.ESERCIZIO AS ESERCIZIOCONTRATTO
FROM         dbo.VISTA_TESTE_CONTRATTI AS TESTE INNER JOIN
                      dbo.AIOT_INCONDIZIONATI AS INCO ON INCO.RIFPROGRESSIVO = TESTE.PROGRESSIVO LEFT OUTER JOIN
                      dbo.ANAGRAFICACF AS CF ON TESTE.CODICE = CF.CODCONTO


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_CFA_INCOND] TO [Metodo98]
    AS [dbo];
