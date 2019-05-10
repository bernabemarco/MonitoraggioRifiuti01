

CREATE PROCEDURE [dbo].[MYTHO_GETSKU] 
    @CODSKU VARCHAR(50) Out  
AS
BEGIN

    DECLARE @Result varchar(50)


        BEGIN
            DECLARE @Progressivo Decimal(10,0) = 1
            DECLARE @NumChar int = 10
            DECLARE @Filler char(1) = '0'
            DECLARE @Counter decimal(5,0) = 0
            DECLARE @Esercizio Decimal(5,0) = 0
            DECLARE @Utente varchar(25) = ''
            
            --Recupero i Parametri
            SELECT TOP 1 @Counter = SKU_CODICECONTATORE,@Filler = SKU_RIEMPIMENTO,@NumChar = SKU_LUNGHEZZA FROM MYTHO_PARAMETRI 
            
    

            --Recupero l'Esercizio e l'Utente
            SELECT @Esercizio = ESERCIZIOATTIVO, @Utente = USERID FROM TABUTENTI WHERE USERDB = USER_NAME() 
            
            IF @Esercizio = 0
                SET @Esercizio = YEAR(GETDATE())
            
            --Recupero il Progressivo
            
            DECLARE @Codice decimal(5,0)
            DECLARE @Progr decimal(5,0)

            -- TODO: impostare qui i valori dei parametri.

			EXECUTE [dbo].[Mytho_AllocaContatori] 
				@Progr OUTPUT


            SELECT @Progressivo = @Progr
    
            IF @Progressivo > 0
                SET @Result=REPLACE(STR(@Progressivo,@NumChar),' ',@Filler)
            ELSE
                SET @Result =''          
            
        END
        

 
    SET @CODSKU = @Result
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MYTHO_GETSKU] TO [Metodo98]
    AS [dbo];

