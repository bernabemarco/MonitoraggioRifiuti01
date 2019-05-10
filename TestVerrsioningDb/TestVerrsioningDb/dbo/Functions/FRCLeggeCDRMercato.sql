
CREATE FUNCTION FRCLeggeCDRMercato(@AMBIENTE VARCHAR(3), @SETTORE DECIMAL(5), @ZONA DECIMAL(5), @CATEGORIA DECIMAL(5)) RETURNS VARCHAR(10)
AS
BEGIN
    
    DECLARE @CDRMercato VARCHAR(10)
    
    SET @CDRMercato = ''
    
    SELECT @CDRMercato = CDRMercato FROM FRCMercatoSettoreCliente WHERE ISNULL(CDRMercato, '') <> '' AND Ambiente = @AMBIENTE AND Settore = @SETTORE
    
    IF @CDRMercato = ''
    	
    	BEGIN
    		
    		SELECT @CDRMercato = CDRMercato FROM FRCMercatoZonaCliente WHERE ISNULL(CDRMercato, '') <> '' AND Ambiente = @AMBIENTE AND Zona = @ZONA
    		
    		IF @CDRMercato = ''
    			
    			SELECT @CDRMercato = CDRMercato FROM FRCMercatoCategoriaCliente WHERE ISNULL(CDRMercato, '') <> '' AND Ambiente = @AMBIENTE AND Categoria = @CATEGORIA
    			
    	END
    	
    IF @CDRMercato = ''
    	
    	BEGIN
    		
    		SELECT @CDRMercato = CDRMercato FROM FRCMercatoSettoreCliente WHERE ISNULL(CDRMercato, '') <> '' AND Ambiente = (SELECT TOP 1 Codice FROM CGesAmbienti WHERE Tipo = 3) AND Settore = @SETTORE
    		
    		IF @CDRMercato = ''
    			
    			BEGIN
    				
    				SELECT @CDRMercato = CDRMercato FROM FRCMercatoZonaCliente WHERE ISNULL(CDRMercato, '') <> '' AND Ambiente = (SELECT TOP 1 Codice FROM CGesAmbienti WHERE Tipo = 3) AND Zona = @ZONA
    				
    				IF @CDRMercato = ''
    					
    					SELECT @CDRMercato = CDRMercato FROM FRCMercatoCategoriaCliente WHERE ISNULL(CDRMercato, '') <> '' AND Ambiente = (SELECT TOP 1 Codice FROM CGesAmbienti WHERE Tipo = 3) AND Categoria = @CATEGORIA
    					
    			END
    			
    	END
    	
    RETURN @CDRMercato
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FRCLeggeCDRMercato] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCLeggeCDRMercato] TO [Metodo98]
    AS [dbo];

