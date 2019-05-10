
CREATE PROCEDURE BudBudgetModelloBudget_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloBudget 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetModello BM WHERE BM.Stagione = BudBudgetModelloBudget.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloBudget.Ambiente AND BM.TipoCliente = BudBudgetModelloBudget.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloBudget.Famiglia AND BM.TipoBudget = BudBudgetModelloBudget.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloBudget.ModelloBudget), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetModello BM WHERE BM.Stagione = BudBudgetModelloBudget.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloBudget.Ambiente AND BM.TipoCliente = BudBudgetModelloBudget.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloBudget.Famiglia AND BM.TipoBudget = BudBudgetModelloBudget.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloBudget.ModelloBudget) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloBudget_TC_UPDATE] TO [Metodo98]
    AS [dbo];

