




CREATE VIEW [dbo].[Ald_VistaStanziamentiAgenti_Commessa_ASA]
AS
SELECT     TD.CODAGENTE1, TD.CODAGENTE2, TD.CODAGENTE3, CONS_ALD_TABASA.IdPrestazione, RifCommAsa.IdAsaCommessa, RD.RIFCOMMCLI AS RifComm, 
                      AC.CODMASTRO AS MastroCliente, TM.idOrFatt, RD.GENCONTROP, TD.CODCFFATT AS CODCLIFOR, ExC.CodSap, AC.PROVINCIA, 
					  AC.LOCALITA, ExC.ClassCID, 
                      ExC.IdTrust, TD.ESERCIZIO, format(MONTH(TD.DATADOC), '00') AS MESE, TM_Generici.TIPO AS NaturaContoGenerico, 
					  ExTD.IdDivisione, TD.TIPODOC, 
                      --TD.CODPAGAMENTO, 
					  					  td.NUMERODOC,
					  td.codpagamento,
					  (select DESCRIZIONELINGUA6 from TABPAGAMENTI TP where TP.CODICE=td.codpagamento) as ggMediDilazione,
					  					  (Select Tipo  
								from tipieffetti where Effetto = (select TIPOPAG from TABRATEPAG TRP 
								where trp.codice=TD.CODPAGAMENTO and trp.NUMERO=1)) as TipoEff,
													  (Select	descrizione  
								from tipieffetti where Effetto = (select TIPOPAG from TABRATEPAG TRP 
								where trp.codice=TD.CODPAGAMENTO and trp.NUMERO=1)) as DscEff,
					  TD.BLOCCATO, SUM(RD.TOTNETTORIGARES * TD.SEGNO) AS ValStanziamentoEuro
FROM         CONS_ALD_TABASA RIGHT OUTER JOIN
                      Ald_RifCommessa_ASA AS RifCommAsa ON CONS_ALD_TABASA.IdASA = RifCommAsa.IdAsaCommessa RIGHT OUTER JOIN
                      TABMASTRI AS TM INNER JOIN
                      ANAGRAFICACF AS AC ON TM.CODICE = AC.CODMASTRO INNER JOIN
                      RIGHEDOCUMENTI AS RD INNER JOIN
                      TESTEDOCUMENTI AS TD ON RD.IDTESTA = TD.PROGRESSIVO INNER JOIN
                      TABMASTRI AS TM_Generici INNER JOIN
                      ANAGRAFICAGENERICI AS AG ON TM_Generici.CODICE = AG.CODMASTRO ON RD.GENCONTROP = AG.CODCONTO ON AC.CODCONTO = TD.CODCFFATT INNER JOIN
                      CONS_ALD_TabTipoDocStanziamento AS TabTipiDoc ON TD.TIPODOC = TabTipiDoc.TipoDoc LEFT OUTER JOIN
                      EXTRACLIENTI AS ExC ON AC.CODCONTO = ExC.CODCONTO LEFT OUTER JOIN
                      EXTRATESTEDOC AS ExTD ON TD.PROGRESSIVO = ExTD.IDTESTA ON RifCommAsa.RifComm = RD.RIFCOMMCLI
WHERE     (AC.TIPOCONTO = 'C') AND (TD.DOCCHIUSO = 0) AND (RD.TOTNETTORIGARES <> 0) AND (TD.ESERCIZIO >= 2015)
GROUP BY TD.CODAGENTE1, TD.CODAGENTE2, TD.CODAGENTE3, RifCommAsa.IdAsaCommessa, RD.RIFCOMMCLI, AC.CODMASTRO, TM.idOrFatt, RD.GENCONTROP, 
                      TD.CODCFFATT, AC.PROVINCIA, AC.LOCALITA, ExC.ClassCID, ExC.IdTrust, TD.ESERCIZIO, format(MONTH(TD.DATADOC), '00'), TM_Generici.TIPO, ExTD.IdDivisione, 
                      TD.TIPODOC, td.NUMERODOC, TD.CODPAGAMENTO, TD.BLOCCATO, ExC.CodSap, CONS_ALD_TABASA.IdPrestazione






GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaStanziamentiAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaStanziamentiAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaStanziamentiAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaStanziamentiAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaStanziamentiAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];

