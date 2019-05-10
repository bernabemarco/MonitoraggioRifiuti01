
CREATE PROCEDURE BudBudgetTipoBudget_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetTipoBudget 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetModello BM WHERE BM.Stagione = BudBudgetTipoBudget.Stagione AND 
        BM.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND BM.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetTipoBudget.Ambiente AND BM.TipoCliente = BudBudgetTipoBudget.TipoCliente AND 
        BM.Famiglia = BudBudgetTipoBudget.Famiglia AND BM.TipoBudget = BudBudgetTipoBudget.TipoBudget), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetModello BM WHERE BM.Stagione = BudBudgetTipoBudget.Stagione AND 
        BM.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND BM.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetTipoBudget.Ambiente AND BM.TipoCliente = BudBudgetTipoBudget.TipoCliente AND 
        BM.Famiglia = BudBudgetTipoBudget.Famiglia AND BM.TipoBudget = BudBudgetTipoBudget.TipoBudget) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetTipoBudget_UPDATE] TO [Metodo98]
    AS [dbo];

