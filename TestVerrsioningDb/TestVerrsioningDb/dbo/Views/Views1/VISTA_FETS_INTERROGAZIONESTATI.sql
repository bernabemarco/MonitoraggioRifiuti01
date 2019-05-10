﻿

CREATE VIEW VISTA_FETS_INTERROGAZIONESTATI
AS
SELECT     dbo.FETS_ELENCODOCUMENTI.Progressivo, dbo.FETS_ELENCODOCUMENTI.HubFile, dbo.FETS_ELENCODOCUMENTI.NomeFile, 
                      dbo.FETS_ELENCODOCUMENTI.CliFor, dbo.FETS_ELENCODOCUMENTI.CodiceB2b, dbo.FETS_ELENCODOCUMENTI.CodiceCarattB2b, 
                      dbo.FETS_ELENCODOCUMENTI.CodiceFepa, dbo.FETS_ELENCODOCUMENTI.Data, dbo.FETS_ELENCODOCUMENTI.Stato, 
                      dbo.FETS_ELENCODOCUMENTI.ProgressivoDoc, dbo.FETS_ELENCODOCUMENTI.Tipo, dbo.FETS_ELENCODOCUMENTI.TransmitterId, 
                      dbo.FETS_ELENCODOCUMENTI.STATOELAB, dbo.TESTEDOCUMENTI.TIPODOC, dbo.TESTEDOCUMENTI.ESERCIZIO, dbo.TESTEDOCUMENTI.NUMERODOC, 
                      dbo.TESTEDOCUMENTI.BIS, dbo.TESTEDOCUMENTI.DATADOC, dbo.TESTEDOCUMENTI.NUMRIFDOC, dbo.TESTEDOCUMENTI.DATARIFDOC, dbo.FETS_ELENCODOCUMENTI.CONSSOSTSENDED
FROM         dbo.FETS_ELENCODOCUMENTI LEFT OUTER JOIN
                      dbo.TESTEDOCUMENTI ON dbo.TESTEDOCUMENTI.PROGRESSIVO = dbo.FETS_ELENCODOCUMENTI.ProgressivoDoc

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_FETS_INTERROGAZIONESTATI] TO [Metodo98]
    AS [dbo];

