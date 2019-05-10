

CREATE FUNCTION [dbo].[FunTipoSconto](@Progressivo Decimal(10,0),@IdRiga INT)
RETURNS nVARCHAR(3)
AS
BEGIN

DECLARE @TipoSconto nVARCHAR(3)
DECLARE @TipoDoc	smallint

	SET @TipoSconto = ''
	SET @TipoDoc = 0

	SELECT TOP 1  @TipoDoc = SEGNO FROM TESTEDOCUMENTI T WHERE T.PROGRESSIVO = @Progressivo;

	Select 	@TipoSconto = 	(Case When @TipoDoc = 1
							 Then (Case TipoRiga
								   When 'N' Then (Case 	When ScontiEstesi <> '100'
												  Then 'L01'
												  Else 'L09'
												  End
												 )
								   When 'O' Then 'L03'
								   else ''
								   End
								   )
							 Else (Case TipoRiga
								   When 'N' Then (Case 	When ScontiEstesi <> '100'
												  Then 'L02'
												  Else 'L09'
												  End
												 )
								   else ''
								   End
								   )
							 End
							 )

	From Righedocumenti Where IdTesta = @Progressivo And IdRiga = @IdRiga

	RETURN(@TipoSconto)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunTipoSconto] TO [Metodo98]
    AS [dbo];

