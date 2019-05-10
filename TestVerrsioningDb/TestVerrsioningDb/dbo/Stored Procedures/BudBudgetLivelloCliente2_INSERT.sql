
CREATE PROCEDURE BudBudgetLivelloCliente2_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @Utente VarChar(25)) AS

BEGIN
    
    INSERT INTO BudBudgetLivelloCliente2 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, LivelloCliente1, LivelloCliente2, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
    SELECT @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, LivelloCliente1, LivelloCliente2, SUM(Quantita), 0, SUM(Valore), 0, @Utente, GETDATE()
    FROM BudBudgetLivelloCliente3 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente 
    GROUP BY LivelloCliente1, LivelloCliente2
    ORDER BY LivelloCliente1, LivelloCliente2
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente2_INSERT] TO [Metodo98]
    AS [dbo];

