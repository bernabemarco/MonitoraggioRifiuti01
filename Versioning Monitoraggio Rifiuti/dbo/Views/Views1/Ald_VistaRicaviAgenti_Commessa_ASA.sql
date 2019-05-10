





CREATE VIEW [dbo].[Ald_VistaRicaviAgenti_Commessa_ASA] 
as
SELECT     TD.CODAGENTE1, TD.CODAGENTE2, TD.CODAGENTE3, 
CONS_ALD_TABASA.IdPrestazione,
RifCommAsa.IdAsaCommessa, RifCommAsa.RifComm, ac.codmastro as MastroCliente, TM.idOrFatt, 
RC.CONTO, RC.CPARTITA, ExC.CodSap, AC.PROVINCIA, AC.LOCALITA, ExC.ClassCID, ExC.IdTrust, TC.ESERCIZIO, 
                      format(MONTH(TD.DATADOC), '00') AS MESE,
					  TM_Generici.TIPO as NaturaContoGenerico, 
					  ExTD.IdDivisione,
					  td.tipodoc,
					  td.NUMERODOC,
					  td.codpagamento,
					  (select DESCRIZIONELINGUA6 from TABPAGAMENTI TP where TP.CODICE=td.codpagamento) as ggMediDilazione,

					  					  					  (Select Tipo  
								from tipieffetti where Effetto = (select TIPOPAG from TABRATEPAG TRP 
								where trp.codice=TD.CODPAGAMENTO and trp.NUMERO=1)) as TipoEff,
													  (Select	descrizione  
								from tipieffetti where Effetto = (select TIPOPAG from TABRATEPAG TRP 
								where trp.codice=TD.CODPAGAMENTO and trp.NUMERO=1)) as DscEff,
TD.BLOCCATO,
--in quanto ricavi hanno sempre segno negativo dovrò quindi invertire il segno per avere i valori avere positivi e stornare i valori dare --
					  sum(case when rc.SEGNO=0 then RC.IMPORTOEURO * -1 else  RC.IMPORTOEURO * 1 end) aS ValRicavoEuro
FROM         EXTRATESTEDOC AS ExTD RIGHT OUTER JOIN
                      TABMASTRI AS TM_Generici INNER JOIN
                      ANAGRAFICAGENERICI AS AG ON TM_Generici.CODICE = AG.CODMASTRO INNER JOIN
                      RIGHECONTABILITA AS RC INNER JOIN
                      TESTEDOCUMENTI AS TD INNER JOIN
                      TESTECONTABILITA AS TC ON TD.PROGRESSIVO = TC.IDTESTADOC ON RC.NRREG = TC.PROGRESSIVO INNER JOIN
                      TABMASTRI AS TM INNER JOIN
                      ANAGRAFICACF AS AC ON TM.CODICE = AC.CODMASTRO ON RC.CPARTITA = AC.CODCONTO ON AG.CODCONTO = RC.CONTO INNER JOIN
                      EXTRACLIENTI AS ExC ON AC.CODCONTO = ExC.CODCONTO ON ExTD.IDTESTA = TD.PROGRESSIVO LEFT OUTER JOIN
                      CONS_ALD_TABASA RIGHT OUTER JOIN
                      Ald_RifCommessa_ASA AS RifCommAsa ON CONS_ALD_TABASA.IdASA = RifCommAsa.IdAsaCommessa 
					  ON RC.CODCOMMESSA = RifCommAsa.RifComm  
   where
   TM_Generici.CODICE <> 333 and
                      RC.IMPORTOEURO <> 0 
					  AND RC.CONTO not in 
                          (SELECT     SCIVADEB1
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) 

							AND RC.CONTO NOT IN
                          (SELECT     SCIVADEB2
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVADEB3
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVADEB4
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVADEB5
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVASOSP1
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVASOSP2
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVASOSP3
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVASOSP4
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVASOSP5
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVAAUTOFATT1
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO)) AND RC.CONTO NOT IN
                          (SELECT     SCIVAAUTOFATT2
                            FROM          TABVINCOLIGIC AS TBV_C
                            WHERE      (ESERCIZIO = TD.ESERCIZIO))

group by TD.CODAGENTE1, TD.CODAGENTE2, TD.CODAGENTE3, 
CONS_ALD_TABASA.IdPrestazione,
RifCommAsa.IdAsaCommessa, RifCommAsa.RifComm, ac.codmastro, TM.idOrFatt, 
RC.CONTO, RC.CPARTITA, ExC.CodSap, AC.PROVINCIA, AC.LOCALITA, ExC.ClassCID, ExC.IdTrust, TC.ESERCIZIO, 
                      format(MONTH(TD.DATADOC), '00'),
					  TM_Generici.TIPO, 
					  ExTD.IdDivisione,
					  td.tipodoc,
					  td.NUMERODOC,
					  td.codpagamento,
					  TD.BLOCCATO





GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaRicaviAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaRicaviAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaRicaviAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaRicaviAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaRicaviAgenti_Commessa_ASA] TO [Metodo98]
    AS [dbo];

