CREATE VIEW  VISTAANACESPITI AS SELECT 
    AC.*,
    (SELECT DtaDocumento FROM MovimentiCes MO WHERE MO.Cespite=AC.Codice AND (MO.Tipo=2)) DtaRip, 
    (SELECT DtaEffettiva FROM MovimentiCes MO WHERE MO.Cespite=AC.Codice AND (MO.Tipo=3)) DtaAcq, 
    (CASE WHEN (SELECT DtaDocumento FROM MovimentiCes MO WHERE MO.Cespite=AC.Codice AND (MO.Tipo=2)) IS NULL THEN (SELECT DtaEffettiva FROM MovimentiCes MO WHERE MO.Cespite=AC.Codice AND (MO.Tipo=3)) ELSE (SELECT DtaDocumento FROM MovimentiCes MO WHERE MO.Cespite=AC.Codice AND (MO.Tipo=2)) END) DtaAcquisizione,
    (SELECT DtaEffettiva FROM MovimentiCes MO WHERE MO.Cespite=AC.Codice AND MO.Tipo=5) DtaAttivazione
FROM AnagraficaCespiti AS AC    

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAANACESPITI] TO [Metodo98]
    AS [dbo];

