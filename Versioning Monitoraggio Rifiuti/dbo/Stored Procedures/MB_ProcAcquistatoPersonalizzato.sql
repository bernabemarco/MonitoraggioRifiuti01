
CREATE PROCEDURE [dbo].[MB_ProcAcquistatoPersonalizzato](@Action Smallint, 
														 @DATA DECIMAL(8,0) = 0,
 														  @CODARTICOLO VARCHAR(50) = '',
														   @CODDEPOSITO VARCHAR(10) = '',
															@NRIFPARTITA VARCHAR(15) = '',
															 @QTA DECIMAL(16,6) = 0,
															  @UM VARCHAR(3) = '',
															   @IMPORTOTOTNETTOEURO DECIMAL(19,6) = 0,
															    @IMPORTOTOTLORDOEURO DECIMAL(19,6) = 0)
AS

BEGIN

SET NOCOUNT ON

	
   
RETURN

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_ProcAcquistatoPersonalizzato] TO [Metodo98]
    AS [dbo];

