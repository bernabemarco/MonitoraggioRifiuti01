
CREATE PROCEDURE TP_ImpegnatoArticoloPartita(@Codice varchar(50),
  						      @Deposito varchar(10),
						       @NrRifPartita varchar(15),
						        @Impegnato decimal(16,6) OUTPUT)

AS

BEGIN
  
DECLARE @Imp1 	decimal(16,6)
DECLARE @Imp2 	decimal(16,6)

	SET @Impegnato=0

 	SELECT 	@Imp1 = Impegnato 
	FROM 		TP_GOI 
	WHERE 	CodArt = @Codice and deposito = @Deposito
	
	IF (@NrRifPartita = '') OR (@NrRifPartita IS NULL)
		BEGIN
		  	SELECT 	@Imp2 = SUM(Impegnato)
		    	FROM 		VistaGiacenze
			WHERE 	CodArt=@Codice and coddeposito=@Deposito
			GROUP BY 	CodArt
		END
	ELSE
		BEGIN
			SELECT 	@Imp2 = SUM(Impegnato)
		    	FROM 		VistaGiacenzePartiteDepositi
			WHERE 	CodArticolo=@Codice and coddeposito=@Deposito and codlotto = @NrRifPartita
			GROUP BY 	CodArticolo,codlotto
		END

  	IF (@Imp1 is null)
		BEGIN
			SET @Imp1 = 0
		END

	IF (@Imp2 is null)
		BEGIN
    			SET @Imp2 = 0
		END

  	SET @Impegnato = (@Imp1+@Imp2)
	
	RETURN(@Impegnato)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_ImpegnatoArticoloPartita] TO [Metodo98]
    AS [dbo];

