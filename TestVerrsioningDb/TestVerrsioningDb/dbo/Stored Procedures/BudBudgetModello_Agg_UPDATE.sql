
CREATE PROCEDURE BudBudgetModello_Agg_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5), @Famiglia VarChar(5), @TipoBudget VarChar(5), @ModelloBudget VarChar(5), @Modello VarChar(50), @Quantita Decimal(16,6), @Valore Decimal(19,6), @Utente VarChar(25)) AS

BEGIN
    
    DECLARE @Appo VarChar(3)
    
    SET @Appo=(SELECT Stagione FROM BudBudgetModello WHERE Stagione=@Stagione AND AnnoStagione=@AnnoStagione AND TipologiaProdotto=@TipologiaProdotto AND Ambiente=@Ambiente AND TipoCliente=@TipoCliente AND Famiglia=@Famiglia AND TipoBudget=@TipoBudget AND ModelloBudget=@ModelloBudget AND Modello=@Modello)
    
    IF @Appo IS NULL 
        
        BEGIN
            
            INSERT INTO BudBudgetModello ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Quantita, Percentuale, Valore, PercentualeV, PrezzoMedio, UtenteModifica, DataModifica ) 
            VALUES ( @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, @Famiglia, @TipoBudget, @ModelloBudget, @Modello, @Quantita, 0, @Valore, 0, 0, @Utente, GETDATE() )
            
        END
        
    ELSE
        
        BEGIN
            
            UPDATE BudBudgetModello 
            SET Quantita = Quantita + @Quantita, Valore = Valore + @Valore 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
                  Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND Famiglia = @Famiglia AND 
                  TipoBudget = @TipoBudget AND ModelloBudget = @ModelloBudget AND Modello = @Modello
            
        END
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModello_Agg_UPDATE] TO [Metodo98]
    AS [dbo];

