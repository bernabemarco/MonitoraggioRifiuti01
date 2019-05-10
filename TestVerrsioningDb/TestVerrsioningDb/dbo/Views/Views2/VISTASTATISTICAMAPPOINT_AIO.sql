CREATE VIEW VISTASTATISTICAMAPPOINT_AIO AS 
   SELECT TD.Progressivo,TD.CodCliFor,TD.TotDocumentoEuro,TD.TipoDoc,TD.NumeroDoc,TD.Esercizio,TD.Bis,TD.CodAgente1,TD.CodAgente2,TD.CodAgente3,
   PD.Tipo AS TIPOPAR,
   PD.CliFor AS TipoParCF,
   (CASE WHEN (PD.Tipo='F' AND PD.CliFor='C') THEN TD.TotDocumentoEuro ELSE 0 END) AS VenditeEuro,
   (CASE WHEN (PD.Tipo='F' AND PD.CliFor='F') THEN TD.TotDocumentoEuro ELSE 0 END) AS AcquistiEuro,   
   (SELECT DscConto1 FROM TabCFG WHERE CodConto=CodCliFor) AS DscConto1,
   (SELECT DscAgente FROM AnagraficaAgenti WHERE CodAgente=TD.CodAgente1) AS DscAgente1,
   (SELECT DscAgente FROM AnagraficaAgenti WHERE CodAgente=TD.CodAgente2) AS DscAgente2,
   (SELECT DscAgente FROM AnagraficaAgenti WHERE CodAgente=TD.CodAgente3) AS DscAgente3,
   (SELECT DESCRIZIONE FROM TABZONE WHERE Codice=(SELECT CodZona FROM AnagraficaRiservatiCF RCF WHERE RCF.CodConto=TD.CodCliFor AND RCF.Esercizio=TD.Esercizio)) AS ZONA,
   (SELECT CodZona FROM AnagraficaRiservatiCF RCF WHERE RCF.CodConto=TD.CodCliFor AND RCF.Esercizio=TD.Esercizio) AS CODZONA,
   (SELECT CodNazione FROM AnagraficaCF WHERE CodConto=TD.CodCliFor) AS CodNazione,
   (SELECT Descrizione FROM TabNazioni WHERE Codice=(SELECT CodNazione FROM AnagraficaCF WHERE CodConto=TD.CodCliFor)) AS Nazione
   FROM TESTEDOCUMENTI TD,ParametriDoc PD WHERE TD.TipoDoc=PD.Codice

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTATISTICAMAPPOINT_AIO] TO [Metodo98]
    AS [dbo];

