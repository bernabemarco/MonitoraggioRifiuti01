

CREATE VIEW [dbo].[TP_VISTADESTINAZIONIDIVERSE]
AS

    SELECT 
        DD.*,
        ACF.DscConto1 AS DESCRIZIONE
    FROM 
        DestinazioniDiverse DD,
        AnagraficaCF ACF
    WHERE
        ACF.CodConto = DD.CodConto
    


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTADESTINAZIONIDIVERSE] TO [Metodo98]
    AS [dbo];

