
CREATE PROCEDURE BudBudgetModello_V1_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

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
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND
          (SELECT SUM(Quantita) FROM BudBudgetModelloVariante1 BM WHERE BM.Stagione = BudBudgetModello.Stagione AND 
          BM.AnnoStagione = BudBudgetModello.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModello.TipologiaProdotto 
          AND BM.Ambiente = BudBudgetModello.Ambiente AND BM.TipoCliente = BudBudgetModello.TipoCliente AND 
          BM.Famiglia = BudBudgetModello.Famiglia AND BM.TipoBudget = BudBudgetModello.TipoBudget AND 
          BM.ModelloBudget = BudBudgetModello.ModelloBudget AND BM.Modello = BudBudgetModello.Modello) IS NOT NULL
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModello_V1_UPDATE] TO [Metodo98]
    AS [dbo];

