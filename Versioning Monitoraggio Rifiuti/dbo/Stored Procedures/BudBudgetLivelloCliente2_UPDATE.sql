
CREATE PROCEDURE BudBudgetLivelloCliente2_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetLivelloCliente2 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetLivelloCliente3 BM WHERE BM.Stagione = BudBudgetLivelloCliente2.Stagione AND 
        BM.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND BM.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BM.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1 AND 
        BM.LivelloCliente2 = BudBudgetLivelloCliente2.LivelloCliente2), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetLivelloCliente3 BM WHERE BM.Stagione = BudBudgetLivelloCliente2.Stagione AND 
        BM.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND BM.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BM.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1 AND 
        BM.LivelloCliente2 = BudBudgetLivelloCliente2.LivelloCliente2) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente 
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente2_UPDATE] TO [Metodo98]
    AS [dbo];

