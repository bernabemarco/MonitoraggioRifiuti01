
CREATE PROCEDURE BudBudgetModelloVariante2_Agg_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5), @Famiglia VarChar(5), @TipoBudget VarChar(5), @ModelloBudget VarChar(5), @Modello VarChar(50), @Variante1 VarChar(11), @Variante2 VarChar(11), @Quantita Decimal(16,6), @Valore Decimal(19,6), @ValoreListino Decimal(19,6), @Utente VarChar(25), @Tipologia VarChar(3), @Variante VarChar(8)) AS

BEGIN
    
    DECLARE @Appo VarChar(3)
    
    SET @Appo=(SELECT Stagione FROM BudBudgetModelloVariante2 WHERE Stagione=@Stagione AND AnnoStagione=@AnnoStagione AND TipologiaProdotto=@TipologiaProdotto AND Ambiente=@Ambiente AND TipoCliente=@TipoCliente AND Famiglia=@Famiglia AND TipoBudget=@TipoBudget AND ModelloBudget=@ModelloBudget AND Modello=@Modello AND Variante1=@Variante1 AND Variante2=@Variante2)
    
    IF @Appo IS NULL 
        
        BEGIN
            
            INSERT INTO BudBudgetModelloVariante2 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino ) 
            VALUES ( @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, @Famiglia, @TipoBudget, @ModelloBudget, @Modello, @Variante1, @Variante2, @Tipologia, @Variante, @Quantita, 0, @Valore, 0, @Utente, GETDATE(), 0, @ValoreListino, 0 )
            
        END
        
    ELSE
        
        BEGIN
            
            UPDATE BudBudgetModelloVariante2 
            SET Quantita = Quantita + @Quantita, Valore = Valore + @Valore, ValoreListino = ValoreListino + @ValoreListino 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
                  Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND Famiglia = @Famiglia AND 
                  TipoBudget = @TipoBudget AND ModelloBudget = @ModelloBudget AND Modello = @Modello AND 
                  Variante1 = @Variante1 AND Variante2 = @Variante2
            
        END    
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante2_Agg_UPDATE] TO [Metodo98]
    AS [dbo];

