
CREATE VIEW VISTAMOVIMENTIVBANCO AS 
SELECT 
   	TVB.Progressivo 	,
   	TVB.Data 		,
   	TVB.CodCausale 		,
   	TVB.CodCliente 		,
   	TVB.Listino 		,
   	TVB.ScontoFinale 	,
   	TVB.TotImponibile 	,
   	TVB.TotImposta 		,
   	TVB.TotaleNetto 	,
   	TVB.TotImponibileEuro 	,
   	TVB.TotImpostaEuro 	,
   	TVB.TotaleNettoEuro 	,
   	TVB.Incassato 		,
   	TVB.AggMagazzino 	,
   	TVB.Contabilizzato 	,
   	TVB.TipoRigaCont	,
   	TVB.RigaContabile 	,
   	TVB.MODPAGAMENTO 	,
   	TVB.ESERCIZIO		,
	RVB.NrRiga		,
	RVB.Posizione 		,
	RVB.Articolo 		,
	RVB.ControPartita 	,
	RVB.CodNumListino 	,
	RVB.UM 			,
	RVB.Quantita 		,
	RVB.PrezzoUnitLordo 	,
	RVB.PUniImponibile 	,
	RVB.PUniImposta 	,
	RVB.PUniLordoIvato 	,
	RVB.PUniNettoIvato 	,
	RVB.PrezzoUnitLordoEuro ,
	RVB.PUniImponibileEuro 	,
	RVB.PUniImpostaEuro 	,
	RVB.PUniLordoIvatoEuro 	,
	RVB.PUniNettoIvatoEuro 	,
	RVB.ScontiEstesi 	,
	RVB.ScontoCalc 		,
	RVB.CodIVA 		,
	RVB.totImponibile as RTotImponibile 	,
	RVB.totImposta as RtotImposta		,
	RVB.TotLordoIvato 	,
	RVB.TotNettoIvato 	,
	RVB.totImponibileEuro as RtotImponibileEuro	,
	RVB.totImpostaEuro as RtotImpostaEuro	,
	RVB.TotLordoIvatoEuro 	,
	RVB.TotNettoIvatoEuro 	,
	RVB.FlagRiga 		,
	RVB.RIFTESTEDOC
    FROM (TESTEVBANCO TVB LEFT OUTER JOIN RIGHEVBANCO RVB ON TVB.PROGRESSIVO = RVB.PROGRESSIVO)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAMOVIMENTIVBANCO] TO [Metodo98]
    AS [dbo];

