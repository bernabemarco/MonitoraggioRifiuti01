﻿

create view [dbo].[CRM_VISTA_ANAGRAFICAAGENTI1]
as 
SELECT      (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + ANAGRAFICAAGENTI.CODAGENTE AS CODAGENTE1, ANAGRAFICAAGENTI.DSCAGENTE, ANAGRAFICAAGENTI.INDIRIZZO, 
                      ANAGRAFICAAGENTI.CAP, ANAGRAFICAAGENTI.LOCALITA, ANAGRAFICAAGENTI.PROVINCIA, ANAGRAFICAAGENTI.CODFISCALE, ANAGRAFICAAGENTI.PROVVIGIONI, 
                      ANAGRAFICAAGENTI.TELEFONO, ANAGRAFICAAGENTI.FAX, ANAGRAFICAAGENTI.TELEX, ANAGRAFICAAGENTI.PARTITAIVA, EXTRAAGENTI.TipoAgente, 
                      SL_TipoAgente.Descrizione AS DscTipoAgente, EXTRAAGENTI.Email, EXTRAAGENTI.IdDivisione, SL_TipoAgente.Posizione
FROM         ANAGRAFICAAGENTI INNER JOIN
                      EXTRAAGENTI ON ANAGRAFICAAGENTI.CODAGENTE = EXTRAAGENTI.CODAGENTE INNER JOIN
                      SL_TipoAgente ON EXTRAAGENTI.TipoAgente = SL_TipoAgente.CODICE
WHERE     (SL_TipoAgente.Posizione = 1)


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTA_ANAGRAFICAAGENTI1] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTA_ANAGRAFICAAGENTI1] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTA_ANAGRAFICAAGENTI1] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTA_ANAGRAFICAAGENTI1] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTA_ANAGRAFICAAGENTI1] TO [Metodo98]
    AS [dbo];

