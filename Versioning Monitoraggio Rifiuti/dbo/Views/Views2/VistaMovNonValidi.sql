CREATE VIEW VistaMovNonValidi AS
SELECT 
   STMAG.Progressivo,
   STMAG.Esercizio,
   STMAG.Codart,
   STMAG.Datamov,
   STMAG.CodDeposito,
   STMAG.CodUbicazione,
   STMAG.CodCliFor,
   STMAG.CodCausale,
   STMAG.Qta1UM,
   STMAG.ImportoTotNetto,
   STMAG.NRifPartita,
   STMAG.DataRifDoc,
   STMAG.NRifDoc,
   STMAG.TipoDoc,
   STMAG.NumeroDoc
   FROM StoricoMag STMAG LEFT OUTER JOIN TabEsercizi ON STMAG.Esercizio = TabEsercizi.Codice 
   WHERE (STMAG.DataMov NOT BETWEEN TabEsercizi.DataIniMag AND TabEsercizi.DataFineMag) OR TabEsercizi.Codice IS NULL

GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaMovNonValidi] TO [Metodo98]
    AS [dbo];

