
CREATE PROCEDURE TP_GiacenzaArticolo(@Codice nvarchar(50),
  					        @Deposito nvarchar(10),
					         @Giacenza decimal(16,6) OUTPUT)
AS

BEGIN

	SET @Giacenza = 0

	SELECT 	@Giacenza = SUM(Carico+ResoDaScarico-Scarico-ResoDaCarico)
	FROM 		VistaGiacenze 
	WHERE 	CodArt=@Codice and coddeposito=@Deposito
	GROUP BY 	CodArt

	IF (@Giacenza IS NULL)
		BEGIN
			SET @Giacenza = 0
		END
	
	RETURN( @Giacenza )
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_GiacenzaArticolo] TO [Metodo98]
    AS [dbo];

