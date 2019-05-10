
CREATE PROCEDURE BudBudgetTipoCliente_INSERT_TCF(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5), @Quantita Decimal(16,6), @Percentuale Decimal(16,6), @Valore Decimal(19,6), @PercentualeV Decimal(16,6), @Utente VarChar(25)) AS

BEGIN
    
    INSERT INTO BudBudgetTipoCliente ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
    VALUES ( @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, @Quantita, @Percentuale, @Valore, @PercentualeV, @Utente, GETDATE() )
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetTipoCliente_INSERT_TCF] TO [Metodo98]
    AS [dbo];

