﻿CREATE VIEW [dbo].[Vista_MYTHO_Articoli]
As 
SELECT        dbo.ANAGRAFICAARTICOLI.CODICE, dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, dbo.ANAGRAFICAARTICOLI.GRUPPO, dbo.TABGRUPPI.DESCRIZIONE AS DESCRIZIONE_GRUPPO, 
                         dbo.ANAGRAFICAARTICOLI.CATEGORIA, dbo.TABCATEGORIE.DESCRIZIONE AS DESCRIZIONE_CATEGORIA, dbo.ANAGRAFICAARTICOLI.CODCATEGORIASTAT, 
                         dbo.TABCATEGORIESTAT.DESCRIZIONE AS DESCRIZIONE_CATEGORIASTAT, dbo.ANAGRAFICAARTICOLI.PESONETTO, dbo.ANAGRAFICAARTICOLI.SUPERFICIE, dbo.ANAGRAFICAARTICOLI.CUBATURA, 
                         dbo.ANAGRAFICAARTICOLI.NOMENCLCOMBINATA1, dbo.ANAGRAFICAARTICOLI.NOMENCLCOMBINATA2, dbo.ANAGRAFICAARTICOLI.ORIGINEINTRA, dbo.ANAGRAFICAARTICOLI.CODICEARTIMBALLO, 
                         dbo.ANAGRAFICAARTICOLI.NRPEZZIIMBALLO, dbo.ANAGRAFICAARTICOLI.RIFERIMIMBALLO, dbo.ANAGRAFICAARTICOLI.AGGIORNAMAG, dbo.ANAGRAFICAARTICOLI.MOVIMENTAPARTITE, 
                         dbo.ANAGRAFICAARTICOLI.MOVIMENTAMATRICOLE, dbo.ANAGRAFICAARTICOLI.CODDEPOSITO, dbo.ANAGRAFICAARTICOLI.NRTIPRAGGRUPPATE, dbo.ANAGRAFICAARTICOLI.VARESPLICITE, 
                         dbo.ANAGRAFICAARTICOLI.CODICEPRIMARIO, dbo.ANAGRAFICAARTICOLI.ARTTIPOLOGIA, dbo.ANAGRAFICAARTICOLI.ARTCONFIGURATO, dbo.ANAGRAFICAARTICOLI.DESCRESTESA, 
                         dbo.ANAGRAFICAARTICOLI.SERIE, dbo.ANAGRAFICAARTICOLI.MODELLO, dbo.ANAGRAFICAARTICOLI.ModelloBudget, dbo.ANAGRAFICAARTICOLI.TipologiaProdotto, 
                         dbo.ANAGRAFICAARTICOLI.APPLICAMAGGIORAZIONI, dbo.ANAGRAFICAARTICOLI.PRODIGIOUSAPREZZIMETODO, dbo.ANAGRAFICAARTICOLI.PRODIGIORAGGRCODICE, 
                         dbo.ANAGRAFICAARTICOLI.PRODIGIOUSADESCRMETODO, dbo.ANAGRAFICAARTICOLI.PRODIGIOESCLUDIBOX, dbo.ANAGRAFICAARTICOLI.TIPOINTRA, dbo.ANAGRAFICAARTICOLI.CODSERVIZIOINTRA, 
                         dbo.ANAGRAFICAARTICOLI.MODEROGAZINTRA, dbo.ANAGRAFICAARTICOLI.FLGSISTRI, dbo.ANAGRAFICAARTICOLI.TIPART62, dbo.ANAGRAFICAARTICOLI.UMSUPPLNOMCOMB1, 
                         dbo.ANAGRAFICAARTICOLI.FLGQUALITY, dbo.ANAGRAFICAARTICOLI.FAMIGLIAQUALITY, dbo.ANAGRAFICAARTICOLICOMM.CODICEART, dbo.ANAGRAFICAARTICOLICOMM.ESERCIZIO, 
                         dbo.ANAGRAFICAARTICOLICOMM.CODIVA, dbo.ANAGRAFICAARTICOLICOMM.SCONTO1, dbo.ANAGRAFICAARTICOLICOMM.SCONTO2, dbo.ANAGRAFICAARTICOLICOMM.SCONTO3, 
                         dbo.ANAGRAFICAARTICOLICOMM.GRUPPOPRZPART, dbo.ANAGRAFICAARTICOLICOMM.GRUPPOPRVPART, dbo.ANAGRAFICAARTICOLICOMM.PROVV, dbo.ANAGRAFICAARTICOLICOMM.BARCODE, 
                         dbo.ANAGRAFICAARTICOLICOMM.BARCODETYPE, dbo.ANAGRAFICAARTICOLICOMM.BARCODESTRING, dbo.ANAGRAFICAARTICOLICOMM.CODICEALT1, dbo.ANAGRAFICAARTICOLICOMM.CODICEALT2, 
                         dbo.ANAGRAFICAARTICOLICOMM.SCGENVENDITEITA, dbo.ANAGRAFICAARTICOLICOMM.SCGENVENDITEEST, dbo.ANAGRAFICAARTICOLICOMM.SCGENACQUISTIITA, 
                         dbo.ANAGRAFICAARTICOLICOMM.SCGENACQUISTIEST, dbo.ANAGRAFICAARTICOLICOMM.INESAURIMENTO, dbo.ANAGRAFICAARTICOLICOMM.ESAURITO, dbo.ANAGRAFICAARTICOLICOMM.QTAMINCONS, 
                         dbo.ANAGRAFICAARTICOLICOMM.USAPREZZIPART, dbo.ANAGRAFICAARTICOLICOMM.FlagCauzioni, dbo.ANAGRAFICAARTICOLICOMM.FLGBARCODEGENDAPROCAUTOMSTD, 
                         dbo.ANAGRAFICAARTICOLICOMM.OLDBARCODE, dbo.ANAGRAFICAARTICOLICOMM.OLDBARCODETYPE, dbo.ANAGRAFICAARTICOLICOMM.OLDBARCODESTRING, 
                         dbo.ANAGRAFICAARTICOLICOMM.PEZZIPERPALLET, dbo.ANAGRAFICAARTICOLICOMM.EXPORTECOMMERCE, dbo.ANAGRAFICAARTICOLICOMM.CODIVAINTRA,
                         ISNULL(dbo.MYTHO_Articoli_TMP.CHANGED,0) CHANGED,
                         CASE WHEN  ISNULL(dbo.MYTHO_ProductEntities.ItemSKU,0)  = 0 THEN 0 ELSE 1 END As Sincronizzato
FROM            dbo.ANAGRAFICAARTICOLI INNER JOIN
                         dbo.ANAGRAFICAARTICOLICOMM ON dbo.ANAGRAFICAARTICOLI.CODICE = dbo.ANAGRAFICAARTICOLICOMM.CODICEART INNER JOIN
                         dbo.TABUTENTI ON dbo.ANAGRAFICAARTICOLICOMM.ESERCIZIO = dbo.TABUTENTI.ESERCIZIOATTIVO INNER JOIN
                         dbo.TABGRUPPI ON dbo.ANAGRAFICAARTICOLI.GRUPPO = dbo.TABGRUPPI.CODICE INNER JOIN
                         dbo.TABCATEGORIE ON dbo.ANAGRAFICAARTICOLI.CATEGORIA = dbo.TABCATEGORIE.CODICE INNER JOIN
                         dbo.TABCATEGORIESTAT ON dbo.ANAGRAFICAARTICOLI.CODCATEGORIASTAT = dbo.TABCATEGORIESTAT.CODICE LEFT OUTER JOIN
                         dbo.MYTHO_Articoli_TMP ON dbo.MYTHO_Articoli_TMP.CODICEMETODO = dbo.ANAGRAFICAARTICOLI.CODICE LEFT OUTER JOIN
                         dbo.MYTHO_ProductEntities ON dbo.MYTHO_ProductEntities.ItemSKU = dbo.MYTHO_Articoli_TMP.ItemSKU 
WHERE        (dbo.TABUTENTI.USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND (dbo.TABUTENTI.SUPERVISOR = 1)


GO
GRANT SELECT
    ON OBJECT::[dbo].[Vista_MYTHO_Articoli] TO [Metodo98]
    AS [dbo];

