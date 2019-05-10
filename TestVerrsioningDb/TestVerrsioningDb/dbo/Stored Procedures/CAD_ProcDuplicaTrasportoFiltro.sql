
CREATE PROCEDURE [dbo].[CAD_ProcDuplicaTrasportoFiltro](@PROGRESSIVO_CFG DECIMAL(10,0),
														 @PROGRESSIVO_TRV_UP_OLD DECIMAL(10,0),
														  @PROGRESSIVO_TRV_UP_NEW DECIMAL(10,0))
AS

BEGIN

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

DECLARE @PROGRESSIVO_FLT_CUR		DECIMAL(10,0)
DECLARE @PROGRESSIVO_FLT_NEW		DECIMAL(10,0)
	
	SET @PROGRESSIVO_FLT_CUR = 0
	SET @PROGRESSIVO_FLT_NEW = 0

	/*Filtri Inizio*/
	DECLARE Trasporti_Flt_Cursor CURSOR LOCAL FORWARD_ONLY FOR
		SELECT ISNULL(PROGRESSIVO,0) 
		FROM TRASPORTO_CAD_FILTRI 
		WHERE RIFPROGRESSIVOTV = @PROGRESSIVO_TRV_UP_OLD
	OPEN Trasporti_Flt_Cursor

	FETCH NEXT FROM Trasporti_Flt_Cursor
		INTO @PROGRESSIVO_FLT_CUR

	WHILE @@FETCH_STATUS = 0
		BEGIN
			EXEC NUOVOPROGRESSIVO 'TRASPORTO_CAD_FILTRI',1,@PROGRESSIVO_FLT_NEW OUTPUT
			
			INSERT INTO [TRASPORTO_CAD_FILTRI]([PROGRESSIVO],[RIFPROGRESSIVOTV],[RIFPROGRESSIVOSPED],[CodZonaSpedizione],[CodZona],[CodRegione],[Provincia],[CodSettore],[CodCategoria],[CodGruppoPrezzi],[CodClienteFatt],[CodCliente],[CodDestinazione],[CodGruppoArt],[CodCategoriaArt],[CodCategoriaStat],[CodGruppoPrezziArt],[CodFamiglia],[CodReparto],[CodArt],[CodDeposito1],[CodDeposito2],[UTENTEMODIFICA],[DATAMODIFICA])
										SELECT @PROGRESSIVO_FLT_NEW,@PROGRESSIVO_TRV_UP_NEW,@PROGRESSIVO_CFG,[CodZonaSpedizione],[CodZona],[CodRegione],[Provincia],[CodSettore],[CodCategoria],[CodGruppoPrezzi],[CodClienteFatt],[CodCliente],[CodDestinazione],[CodGruppoArt],[CodCategoriaArt],[CodCategoriaStat],[CodGruppoPrezziArt],[CodFamiglia],[CodReparto],[CodArt],[CodDeposito1],[CodDeposito2],USER_NAME(),GETDATE() FROM [TRASPORTO_CAD_FILTRI] WHERE [PROGRESSIVO] = @PROGRESSIVO_FLT_CUR


			
			FETCH NEXT FROM Trasporti_Flt_Cursor
				INTO @PROGRESSIVO_FLT_CUR
		END
	CLOSE Trasporti_Flt_Cursor
	DEALLOCATE Trasporti_Flt_Cursor
	/*Filtri Fine*/
	
RETURN
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CAD_ProcDuplicaTrasportoFiltro] TO [Metodo98]
    AS [dbo];

