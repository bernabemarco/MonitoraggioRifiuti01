
CREATE PROCEDURE TP_GiacenzaArticoloPartita(@Codice char(50),
						    @Deposito char(10),
						    @NrRifPartita char(15),
						     @Giacenza decimal(16,6) OUTPUT)
AS
BEGIN

	SET @Giacenza = 0
	
	IF (@NrRifPartita = '') OR (@NrRifPartita IS NULL)
		BEGIN
			SELECT 	@Giacenza = SUM(Carico+ResoDaScarico-Scarico-ResoDaCarico)
			FROM 		VistaGiacenze 
			WHERE 	CodArt=@Codice and coddeposito=@Deposito
			GROUP BY 	CodArt
		END
	ELSE
		BEGIN
			SELECT 	@Giacenza = SUM(Carico+ResoDaScarico-Scarico-ResoDaCarico)
			FROM 		VistaGiacenzePartiteDepositi 
			WHERE 	CodArticolo=@Codice and coddeposito=@Deposito and codlotto = @NrRifPartita
			GROUP BY	CodArticolo,codlotto
		END
	
	IF (@Giacenza IS NULL)
		BEGIN
			SET @Giacenza = 0
		END
	
	RETURN( @Giacenza )

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_GiacenzaArticoloPartita] TO [Metodo98]
    AS [dbo];

