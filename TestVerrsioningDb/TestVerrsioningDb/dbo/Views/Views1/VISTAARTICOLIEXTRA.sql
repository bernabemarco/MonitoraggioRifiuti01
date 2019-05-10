﻿

CREATE VIEW [dbo].[VISTAARTICOLIEXTRA]
AS

SELECT     dbo.ANAGRAFICAARTICOLI.CODICE, dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, dbo.ANAGRAFICAARTICOLI.GRUPPO, 
                      dbo.ANAGRAFICAARTICOLI.CATEGORIA, dbo.ANAGRAFICAARTICOLI.CODCATEGORIASTAT, dbo.ANAGRAFICAARTICOLI.PESONETTO, 
                      dbo.ANAGRAFICAARTICOLI.SUPERFICIE, dbo.ANAGRAFICAARTICOLI.CUBATURA, dbo.ANAGRAFICAARTICOLI.NOMENCLCOMBINATA1, 
                      dbo.ANAGRAFICAARTICOLI.NOMENCLCOMBINATA2, dbo.ANAGRAFICAARTICOLI.ORIGINEINTRA, dbo.ANAGRAFICAARTICOLI.CODICEARTIMBALLO, 
                      dbo.ANAGRAFICAARTICOLI.NRPEZZIIMBALLO, dbo.ANAGRAFICAARTICOLI.RIFERIMIMBALLO, dbo.ANAGRAFICAARTICOLI.AGGIORNAMAG, 
                      dbo.ANAGRAFICAARTICOLI.MOVIMENTAPARTITE, dbo.ANAGRAFICAARTICOLI.MOVIMENTAMATRICOLE, dbo.ANAGRAFICAARTICOLI.CODDEPOSITO, 
                      dbo.ANAGRAFICAARTICOLI.NRTIPRAGGRUPPATE, dbo.ANAGRAFICAARTICOLI.VARESPLICITE, dbo.ANAGRAFICAARTICOLI.CODICEPRIMARIO, 
                      dbo.ANAGRAFICAARTICOLI.ARTTIPOLOGIA, dbo.ANAGRAFICAARTICOLI.UTENTEMODIFICA, dbo.ANAGRAFICAARTICOLI.DATAMODIFICA, 
                      dbo.ANAGRAFICAARTICOLI.ARTCONFIGURATO, dbo.ANAGRAFICAARTICOLI.DESCRESTESA, dbo.ANAGRAFICAARTICOLI.SERIE, 
                      dbo.ANAGRAFICAARTICOLI.MODELLO, dbo.ANAGRAFICAARTICOLI.ModelloBudget, dbo.ANAGRAFICAARTICOLI.TipologiaProdotto, 
                      dbo.ANAGRAFICAARTICOLI.APPLICAMAGGIORAZIONI, dbo.ANAGRAFICAARTICOLI.PRODIGIOUSAPREZZIMETODO, 
                      dbo.ANAGRAFICAARTICOLI.PRODIGIORAGGRCODICE, dbo.ANAGRAFICAARTICOLI.PRODIGIOUSADESCRMETODO, 
                      dbo.ANAGRAFICAARTICOLI.PRODIGIOESCLUDIBOX, dbo.ANAGRAFICAARTICOLI.TIPOINTRA, 
                      dbo.ANAGRAFICAARTICOLI.CODSERVIZIOINTRA, dbo.ANAGRAFICAARTICOLI.MODEROGAZINTRA, dbo.TP_ExtraMag.CodMarchio, 
                      dbo.ANAGRAFICAARTICOLICOMM.ESERCIZIO,
                      dbo.ANAGRAFICAARTICOLICOMM.CODIVA
FROM         dbo.ANAGRAFICAARTICOLI INNER JOIN
                      dbo.TP_ExtraMag ON dbo.ANAGRAFICAARTICOLI.CODICE = dbo.TP_ExtraMag.CodArt INNER JOIN
                      dbo.ANAGRAFICAARTICOLICOMM ON dbo.ANAGRAFICAARTICOLI.CODICE = dbo.ANAGRAFICAARTICOLICOMM.CODICEART


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAARTICOLIEXTRA] TO [Metodo98]
    AS [dbo];

