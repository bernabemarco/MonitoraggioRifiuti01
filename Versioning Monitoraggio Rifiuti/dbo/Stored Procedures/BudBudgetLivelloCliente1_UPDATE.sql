
CREATE PROCEDURE BudBudgetLivelloCliente1_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetLivelloCliente1 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetLivelloCliente3 BM WHERE BM.Stagione = BudBudgetLivelloCliente1.Stagione AND 
        BM.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND BM.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetLivelloCliente1.Ambiente AND BM.LivelloCliente1 = BudBudgetLivelloCliente1.LivelloCliente1), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetLivelloCliente3 BM WHERE BM.Stagione = BudBudgetLivelloCliente1.Stagione AND 
        BM.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND BM.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetLivelloCliente1.Ambiente AND BM.LivelloCliente1 = BudBudgetLivelloCliente1.LivelloCliente1) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente 
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente1_UPDATE] TO [Metodo98]
    AS [dbo];

