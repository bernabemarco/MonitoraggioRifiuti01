
CREATE PROCEDURE BudBudgetModello_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5), @Famiglia VarChar(5), @TipoBudget VarChar(5), @ModelloBudget VarChar(5), @Modello VarChar(50)) AS

BEGIN
    
    UPDATE BudBudgetModello 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetModelloVariante1 BM WHERE BM.Stagione = BudBudgetModello.Stagione AND 
        BM.AnnoStagione = BudBudgetModello.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModello.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModello.Ambiente AND BM.TipoCliente = BudBudgetModello.TipoCliente AND 
        BM.Famiglia = BudBudgetModello.Famiglia AND BM.TipoBudget = BudBudgetModello.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModello.ModelloBudget AND BM.Modello = BudBudgetModello.Modello), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetModelloVariante1 BM WHERE BM.Stagione = BudBudgetModello.Stagione AND 
        BM.AnnoStagione = BudBudgetModello.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModello.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModello.Ambiente AND BM.TipoCliente = BudBudgetModello.TipoCliente AND 
        BM.Famiglia = BudBudgetModello.Famiglia AND BM.TipoBudget = BudBudgetModello.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModello.ModelloBudget AND BM.Modello = BudBudgetModello.Modello) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND Famiglia = @Famiglia AND
          TipoBudget = @TipoBudget AND ModelloBudget = @ModelloBudget AND Modello = @Modello
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModello_TC_UPDATE] TO [Metodo98]
    AS [dbo];

