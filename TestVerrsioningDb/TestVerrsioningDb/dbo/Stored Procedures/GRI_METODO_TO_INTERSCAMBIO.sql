
-- --------------------------------------------------------------------------------------
-- Funzione  : Esegue le procedure per pubblicazione Rapporti Intervento (GEMMAYSYNC)
-- Autore   : Moreno Feletto
-- Data    : 11.04.2016
-- --------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GRI_METODO_TO_INTERSCAMBIO] AS
BEGIN
		EXEC GRI_METSIC_TO_INTERSCAMBIO
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GRI_METODO_TO_INTERSCAMBIO] TO [Metodo98]
    AS [dbo];

