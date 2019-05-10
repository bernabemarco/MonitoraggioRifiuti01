CREATE VIEW VistaCauzioni AS
SELECT 
   MC.IDTesta,
   MC.CodiceVuoto,
   MC.QtaCons,
   MC.CauMagCons,
   MC.CodDepCons,
   MC.CauMagConsColl,
   MC.CodDepConsColl,
   MC.ImportoUnitCons AS ImportoUnitConsValuta,
   MC.ImportoUnitConsEuro,
   MC.QtaResi,
   MC.CauMagResi,
   MC.CodDepResi,
   MC.CauMagResiColl,
   MC.CodDepResiColl,
   MC.ImportoUnitResi AS ImportoUnitResiValuta,
   MC.ImportoUnitResiEuro,
   MC.UM,
   (MC.QtaCons-MC.QtaResi) AS QtaTot,
   ((MC.ImportoUnitCons * MC.QtaCons)-(MC.ImportoUnitResi * MC.QtaResi)) AS ImportoTot,
   ((MC.ImportoUnitConsEuro * MC.QtaCons)-(MC.ImportoUnitResiEuro * MC.QtaResi)) AS ImportoTotEuro,
   (MC.ImportoUnitCons * MC.QtaCons) ImportoTotConsValuta,
   (MC.ImportoUnitResi * MC.QtaResi) ImportoTotResiValuta,
   (MC.ImportoUnitConsEuro * MC.QtaCons) ImportoTotConsEuro,
   (MC.ImportoUnitResiEuro * MC.QtaResi) ImportoTotResiEuro,
   ((CASE WHEN TD.CODCAMBIO = 0 THEN MC.ImportoUnitCons ELSE MC.ImportoUnitCons/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO END) * MC.QtaCons) as ImportoTotCons,
   ((CASE WHEN TD.CODCAMBIO = 0 THEN MC.ImportoUnitResi ELSE MC.ImportoUnitResi/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO END) * MC.QtaResi) as ImportoTotResi,
   TD.TotCauz,
   TD.TotCauzEuro,
   TD.DataDoc,
   TD.CodCliFor,
   TD.TipoDoc,
   TD.NumeroDoc,
   TD.Bis,
   TD.DataConsegna,
   TD.Bloccato,
   TD.Esercizio,
   TD.NumRifDoc,
   TD.DataRifDoc,
   (CASE WHEN TD.CODCAMBIO = 0 THEN MC.ImportoUnitCons ELSE MC.ImportoUnitCons/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO END) as ImportoUnitCons,
   (CASE WHEN TD.CODCAMBIO = 0 THEN MC.ImportoUnitResi ELSE MC.ImportoUnitResi/TD.VALCAMBIO/TC.CAMBIOEURO*TCAM.CAMBIOEURO END) as ImportoUnitResi,
   (SELECT (SUM(QtaCons) - SUM(QtaResi)) Giacenza FROM MovimentiCauzioni MCG, TesteDocumenti TDG 
   	WHERE MCG.IDTesta=TDG.Progressivo AND 
   	      TDG.CodCliFor=TD.CodCliFor AND
              MCG.CodiceVuoto=MC.CodiceVuoto AND 
              TDG.DataDoc <=TD.DataDoc AND
              TDG.Progressivo <> TD.Progressivo) AS Giacenza
   FROM MovimentiCauzioni MC, TesteDocumenti TD, TABCAMBI as TC, TABCAMBI as TCAM, TABUTENTI   
   WHERE MC.IDTesta=TD.Progressivo AND TD.CODCAMBIO = TC.CODICE AND (TCAM.CODICE = 0)
	AND USERDB = CAST(USER_NAME() AS VARCHAR(25))        
	AND ((TD.CODCLIFOR=TABUTENTI.CODCLIFOR) OR (TABUTENTI.CODCLIFOR=''))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaCauzioni] TO [Metodo98]
    AS [dbo];

