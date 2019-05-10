
CREATE PROCEDURE BudBudgetLivelloCliente3_Agg_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @LivelloCliente1 VarChar(5), @LivelloCliente2 VarChar(5), @LivelloCliente3 VarChar(5), @Quantita Decimal(16,6), @Valore Decimal(19,6), @Utente VarChar(25)) AS

BEGIN
    
    DECLARE @Appo VarChar(3)
    
    SET @Appo=(SELECT Stagione FROM BudBudgetLivelloCliente3 WHERE Stagione=@Stagione AND AnnoStagione=@AnnoStagione AND TipologiaProdotto=@TipologiaProdotto AND Ambiente=@Ambiente AND LivelloCliente1=@LivelloCliente1 AND LivelloCliente2=@LivelloCliente2 AND LivelloCliente3=@LivelloCliente3)
    
    IF @Appo IS NULL 
        
        BEGIN
            
            INSERT INTO BudBudgetLivelloCliente3 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, LivelloCliente1, LivelloCliente2, LivelloCliente3, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
            VALUES ( @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @LivelloCliente1, @LivelloCliente2, @LivelloCliente3, @Quantita, 0, @Valore, 0, @Utente, GETDATE() )
            
        END
        
    ELSE
        
        BEGIN
            
            UPDATE BudBudgetLivelloCliente3 
            SET Quantita = Quantita + @Quantita, Valore = Valore + @Valore 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
                  Ambiente = @Ambiente AND LivelloCliente1 = @LivelloCliente1 AND LivelloCliente2 = @LivelloCliente2 AND 
                  LivelloCliente3 = @LivelloCliente3 
            
        END
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente3_Agg_UPDATE] TO [Metodo98]
    AS [dbo];

