

CREATE VIEW [dbo].[VISTAARTICOLITP]
AS
SELECT     TOP (100) PERCENT dbo.ANAGRAFICAARTICOLI.CODICE, dbo.ANAGRAFICAARTICOLI.DESCRIZIONE, dbo.ANAGRAFICAARTICOLI.GRUPPO, 
                      dbo.ANAGRAFICAARTICOLI.CATEGORIA, dbo.ANAGRAFICAARTICOLI.CODCATEGORIASTAT, dbo.ANAGRAFICAARTICOLI.PESONETTO, 
                      dbo.ANAGRAFICAARTICOLI.SUPERFICIE, dbo.ANAGRAFICAARTICOLI.CUBATURA, dbo.ANAGRAFICAARTICOLI.NOMENCLCOMBINATA1, 
                      dbo.ANAGRAFICAARTICOLI.NOMENCLCOMBINATA2, dbo.ANAGRAFICAARTICOLI.ORIGINEINTRA, dbo.ANAGRAFICAARTICOLI.CODICEARTIMBALLO, 
                      dbo.ANAGRAFICAARTICOLI.NRPEZZIIMBALLO, dbo.ANAGRAFICAARTICOLI.RIFERIMIMBALLO, dbo.ANAGRAFICAARTICOLI.AGGIORNAMAG, 
                      dbo.ANAGRAFICAARTICOLI.MOVIMENTAPARTITE, dbo.ANAGRAFICAARTICOLI.MOVIMENTAMATRICOLE, dbo.ANAGRAFICAARTICOLI.CODDEPOSITO, 
                      dbo.ANAGRAFICAARTICOLI.NRTIPRAGGRUPPATE, dbo.ANAGRAFICAARTICOLI.VARESPLICITE, dbo.ANAGRAFICAARTICOLI.CODICEPRIMARIO, 
                      dbo.ANAGRAFICAARTICOLI.ARTTIPOLOGIA, dbo.ANAGRAFICAARTICOLI.UTENTEMODIFICA, dbo.ANAGRAFICAARTICOLI.DATAMODIFICA, 
                      dbo.ANAGRAFICAARTICOLI.ARTCONFIGURATO, dbo.ANAGRAFICAARTICOLI.DESCRESTESA, dbo.ANAGRAFICAARTICOLI.SERIE, dbo.ANAGRAFICAARTICOLI.MODELLO, 
                      dbo.ANAGRAFICAARTICOLI.ModelloBudget, dbo.ANAGRAFICAARTICOLI.TipologiaProdotto, dbo.ANAGRAFICAARTICOLI.APPLICAMAGGIORAZIONI, 
                      dbo.ANAGRAFICAARTICOLI.PRODIGIOUSAPREZZIMETODO, dbo.ANAGRAFICAARTICOLI.PRODIGIORAGGRCODICE, 
                      dbo.ANAGRAFICAARTICOLI.PRODIGIOUSADESCRMETODO, dbo.ANAGRAFICAARTICOLI.PRODIGIOESCLUDIBOX, dbo.ANAGRAFICAARTICOLI.TIPOINTRA, 
                      dbo.ANAGRAFICAARTICOLI.CODSERVIZIOINTRA, dbo.ANAGRAFICAARTICOLI.MODEROGAZINTRA, dbo.TP_ExtraMag.Stato_Rev_Sos_Esa, 
                      dbo.TP_ExtraMag.TP_Promo_com, dbo.TP_ExtraMag.Estemporaneo, dbo.TP_ExtraMag.CodiceOmogeneo, dbo.TP_ExtraMag.TP_Consenti_PrezziSpeciali, 
                      dbo.TP_ExtraMag.TP_SCORPORO, dbo.TP_ExtraMag.TP_PeriododiOsservazione, dbo.TP_ExtraMag.TP_Espositore, dbo.TP_ExtraMag.TP_GgConsegna, 
                      dbo.TP_ExtraMag.TP_MesiScade, dbo.TP_ExtraMag.TP_AssInde, dbo.TP_ExtraMag.TP_CodiceInterno, dbo.TP_ExtraMag.TP_Tsicur, 
                      dbo.TP_ExtraMag.CodFamigliaPOS, dbo.TP_ExtraMag.CodRepartoPOS, dbo.TP_ExtraMag.AttivaPanieri, dbo.TP_ExtraMag.NonAQta, dbo.TP_ExtraMag.NonScontabile, 
                      dbo.TP_ExtraMag.Disattivato, dbo.TP_ExtraMag.ABilancia, dbo.TP_ExtraMag.PrezzoRichiesto, dbo.TP_ExtraMag.AbilitaReso, dbo.TP_ExtraMag.InCampagna, 
                      dbo.TP_ExtraMag.NrBollini, dbo.TP_ExtraMag.NrBolliniDip, dbo.TP_ExtraMag.GruppoSconto, dbo.TP_ExtraMag.GruppoMixMatch, dbo.TP_ExtraMag.GruppoMxN, 
                      dbo.TP_ExtraMag.ConsidAcq, dbo.TP_ExtraMag.EspP1, dbo.TP_ExtraMag.EspP2, dbo.TP_ExtraMag.EspP3, dbo.TP_ExtraMag.EspP4, dbo.TP_ExtraMag.EspLst, 
                      dbo.TP_ExtraMag.Esportabile, dbo.TP_ExtraMag.EspMovMag, dbo.TP_ExtraMag.GestStag, dbo.TP_ExtraMag.DataNascProd, dbo.TP_ExtraMag.DataFineSegn, 
                      dbo.TP_ExtraMag.TIPOGESTESP, dbo.TP_ExtraMag.GESTVARCOMP, dbo.TP_ExtraMag.TipoValKitPadre, dbo.TP_ExtraMag.TipoValKitComponenti, 
                      dbo.TP_ExtraMag.CodiceOmogeneoPassivo, dbo.TabFamigliePOS.Descrizione AS DescrizioneFamiglia, dbo.TabRepartiPOS.Descrizione AS DescrizioneReparto, 
                      dbo.TABGRUPPI.DESCRIZIONE AS DscGruppo, dbo.TABCATEGORIE.DESCRIZIONE AS DscCategoria, 
                      dbo.TABCATEGORIESTAT.DESCRIZIONE AS DscCategoriaStat
FROM         dbo.ANAGRAFICAARTICOLI LEFT OUTER JOIN
                      dbo.TABCATEGORIESTAT ON dbo.ANAGRAFICAARTICOLI.CODCATEGORIASTAT = dbo.TABCATEGORIESTAT.CODICE LEFT OUTER JOIN
                      dbo.TABCATEGORIE ON dbo.ANAGRAFICAARTICOLI.CATEGORIA = dbo.TABCATEGORIE.CODICE LEFT OUTER JOIN
                      dbo.TABGRUPPI ON dbo.ANAGRAFICAARTICOLI.GRUPPO = dbo.TABGRUPPI.CODICE LEFT OUTER JOIN
                      dbo.TabFamigliePOS RIGHT OUTER JOIN
                      dbo.TP_ExtraMag LEFT OUTER JOIN
                      dbo.TabRepartiPOS ON dbo.TP_ExtraMag.CodRepartoPOS = dbo.TabRepartiPOS.Codice ON dbo.TabFamigliePOS.Codice = dbo.TP_ExtraMag.CodFamigliaPOS ON 
                      dbo.ANAGRAFICAARTICOLI.CODICE = dbo.TP_ExtraMag.CodArt
WHERE     (dbo.TP_ExtraMag.EscludiVal = 0) OR (dbo.TP_ExtraMag.EscludiVal IS NULL)


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAARTICOLITP] TO [Metodo98]
    AS [dbo];

