﻿
CREATE VIEW ALD_Vista_SEL_GEM_Agente_1
AS
SELECT     ANAGRAFICAAGENTI.CODAGENTE, ANAGRAFICAAGENTI.DSCAGENTE, ANAGRAFICAAGENTI.INDIRIZZO, ANAGRAFICAAGENTI.CAP,
                      ANAGRAFICAAGENTI.LOCALITA, ANAGRAFICAAGENTI.PROVINCIA, ANAGRAFICAAGENTI.CODFISCALE, ANAGRAFICAAGENTI.PROVVIGIONI,
                      ANAGRAFICAAGENTI.TELEFONO, ANAGRAFICAAGENTI.FAX, ANAGRAFICAAGENTI.PARTITAIVA, EXTRAAGENTI.TipoAgente, SL_TipoAgente.Descrizione,
                      SL_TipoAgente.Posizione
FROM         ANAGRAFICAAGENTI INNER JOIN
                      EXTRAAGENTI ON ANAGRAFICAAGENTI.CODAGENTE = EXTRAAGENTI.CODAGENTE INNER JOIN
                      SL_TipoAgente ON EXTRAAGENTI.TipoAgente = SL_TipoAgente.CODICE
WHERE     (SL_TipoAgente.Posizione = 1)


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_SEL_GEM_Agente_1] TO [Metodo98]
    AS [dbo];

