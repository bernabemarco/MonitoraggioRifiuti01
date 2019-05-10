
CREATE PROCEDURE BudBudgetCliente_Agg_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5), @Cliente VarChar(7), @Quantita Decimal(16,6), @Valore Decimal(19,6), @Utente VarChar(25)) AS

BEGIN
    
    DECLARE @Appo VarChar(3)
    
    SET @Appo=(SELECT Stagione FROM BudBudgetCliente WHERE Stagione=@Stagione AND AnnoStagione=@AnnoStagione AND TipologiaProdotto=@TipologiaProdotto AND Ambiente=@Ambiente AND TipoCliente=@TipoCliente AND Cliente=@Cliente)
    
    IF @Appo IS NULL 
        
        BEGIN
            
            INSERT INTO BudBudgetCliente ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Cliente, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
            VALUES ( @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, @Cliente, @Quantita, 0, @Valore, 0, @Utente, GETDATE() )
            
        END
        
    ELSE
        
        BEGIN
            
            UPDATE BudBudgetCliente 
            SET Quantita = Quantita + @Quantita, Valore = Valore + @Valore 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
                  Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND Cliente = @Cliente
            
        END
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetCliente_Agg_UPDATE] TO [Metodo98]
    AS [dbo];

