
CREATE FUNCTION FRCLeggeCDRProdotto(@AMBIENTE VARCHAR(3), @GRUPPO DECIMAL(5), @CATEGORIA DECIMAL(5), @CATEGORIASTAT DECIMAL(5), @SERIE VARCHAR(20), @MODELLO VARCHAR(20)) RETURNS VARCHAR(10)
AS
BEGIN
    
    DECLARE @CDRProdotto VARCHAR(10)
    
    SET @CDRProdotto = ''
    
    SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoGruppoArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = @AMBIENTE AND Gruppo = @GRUPPO
    
    IF @CDRProdotto = ''
    	
    	BEGIN
    		
    		SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoCategoriaArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = @AMBIENTE AND Categoria = @CATEGORIA
    		
    		IF @CDRProdotto = ''
    			
    			BEGIN
    				
    				SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoCategoriaStatArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = @AMBIENTE AND CategoriaStat = @CATEGORIASTAT
    				
    				IF @CDRProdotto = ''
    					
    					BEGIN
    						
    						SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoSerieArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = @AMBIENTE AND Serie = @SERIE
    						
    						IF @CDRProdotto = ''
    							
    							BEGIN
    								
    								SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoModelloArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = @AMBIENTE AND Modello = @MODELLO
    								
    							END
    						
    					END
    				
    			END
    			
    	END
    	
    IF @CDRProdotto = ''
    	
    	BEGIN
    		
		SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoGruppoArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = (SELECT TOP 1 Codice FROM CGesAmbienti WHERE Tipo = 3)  AND Gruppo = @GRUPPO
		
		IF @CDRProdotto = ''
			
			BEGIN
				
				SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoCategoriaArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = (SELECT TOP 1 Codice FROM CGesAmbienti WHERE Tipo = 3)  AND Categoria = @CATEGORIA
				
				IF @CDRProdotto = ''
					
					BEGIN
						
						SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoCategoriaStatArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = (SELECT TOP 1 Codice FROM CGesAmbienti WHERE Tipo = 3)  AND CategoriaStat = @CATEGORIASTAT
						
						IF @CDRProdotto = ''
							
							BEGIN
								
								SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoSerieArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = (SELECT TOP 1 Codice FROM CGesAmbienti WHERE Tipo = 3)  AND Serie = @SERIE
								
								IF @CDRProdotto = ''
									
									BEGIN
										
										SELECT @CDRProdotto = CDRProdotto FROM FRCProdottoModelloArticolo WHERE ISNULL(CDRProdotto, '') <> '' AND Ambiente = (SELECT TOP 1 Codice FROM CGesAmbienti WHERE Tipo = 3)  AND Modello = @MODELLO
										
									END
								
							END
						
					END
				
			END
    		
    	END
    	
    RETURN @CDRProdotto
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FRCLeggeCDRProdotto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCLeggeCDRProdotto] TO [Metodo98]
    AS [dbo];

