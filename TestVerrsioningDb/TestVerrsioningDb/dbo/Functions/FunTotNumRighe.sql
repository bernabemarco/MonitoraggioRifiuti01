
CREATE FUNCTION FunTotNumRighe(@ProgressivoRP Decimal(10,0)) RETURNS DECIMAL
AS
BEGIN

DECLARE @TotNumRighe DECIMAL(10,0)
	
	SET @TotNumRighe = 0

	SELECT @TotNumRighe=(SELECT count(*) FROM RIGHEDOCUMENTI 
                           WHERE IDTesta = @ProgressivoRP AND TIPORIGA = 'N' 
                           AND   Codart <> '')

	RETURN(@TotNumRighe)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunTotNumRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunTotNumRighe] TO [Metodo98]
    AS [dbo];

