CREATE VIEW VISTARISTAMPAANTICIPI AS
SELECT TS.*,DE.DATAEMISS,DE.DESCRIZIONE AS DSCDISTINTA,DE.CODBANCA AS CODBANCADIST,
   (SELECT TOP 1 ImportoScEuro FROM TabScadenze WHERE TabScadenze.Progressivo=TS.ProgScadAnticipo) AS ImpScadOriginale,
   (SELECT TOP 1 CodCliFor FROM TabScadenze WHERE TabScadenze.Progressivo=TS.ProgScadAnticipo) AS ClienteScadOriginale,
   (SELECT TOP 1 RagSocCognome + ' ' + RagSocNome  FROM TabDitte) AS RagSocDitta,
   (SELECT TOP 1 ViaSedeFiscale + ' ' + NumSedeFiscale FROM TabDitte) AS SedeFiscaleDitta,
   (SELECT TOP 1 CAPSedeFiscale + ' ' + ComuneSedeFiscale + ' (' + ProvSedeFiscale + ')' FROM TabDitte) AS ComuneFiscaleDitta,
   (SELECT DscBanca FROM AnagraficaBanche WHERE CodBanca=TS.BancaInc) AS DscBanca,
   (SELECT Abi FROM AnagraficaBanche WHERE CodBanca=TS.BancaInc) AS AbiBanca,
   (SELECT Cab FROM AnagraficaBanche WHERE CodBanca=TS.BancaInc) AS CabBanca
   FROM TabScadenze TS, DistinteEffetti DE
   WHERE TS.NrDistinta=DE.Progressivo AND LEFT(TS.CodCliFor,1)='G' AND TS.NrDistinta<>0


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARISTAMPAANTICIPI] TO [Metodo98]
    AS [dbo];

