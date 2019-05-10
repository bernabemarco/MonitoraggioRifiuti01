
CREATE PROCEDURE BudBudgetModelloVariante1_V2_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante1 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetModelloVariante2 BM WHERE BM.Stagione = BudBudgetModelloVariante1.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloVariante1.Ambiente AND BM.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloVariante1.Famiglia AND BM.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BM.Modello = BudBudgetModelloVariante1.Modello AND 
        BM.Variante1 = BudBudgetModelloVariante1.Variante1), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetModelloVariante2 BM WHERE BM.Stagione = BudBudgetModelloVariante1.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloVariante1.Ambiente AND BM.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloVariante1.Famiglia AND BM.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BM.Modello = BudBudgetModelloVariante1.Modello AND 
        BM.Variante1 = BudBudgetModelloVariante1.Variante1) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante1_V2_UPDATE] TO [Metodo98]
    AS [dbo];

