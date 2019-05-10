
CREATE PROCEDURE BudBudgetModelloVariante2_V3_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante2 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetModelloVariante3 BM WHERE BM.Stagione = BudBudgetModelloVariante2.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloVariante2.Ambiente AND BM.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloVariante2.Famiglia AND BM.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND BM.Modello = BudBudgetModelloVariante2.Modello AND 
        BM.Variante1 = BudBudgetModelloVariante2.Variante1 AND BM.Variante2 = BudBudgetModelloVariante2.Variante2), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetModelloVariante3 BM WHERE BM.Stagione = BudBudgetModelloVariante2.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloVariante2.Ambiente AND BM.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloVariante2.Famiglia AND BM.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND BM.Modello = BudBudgetModelloVariante2.Modello AND 
        BM.Variante1 = BudBudgetModelloVariante2.Variante1 AND BM.Variante2 = BudBudgetModelloVariante2.Variante2) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante2_V3_UPDATE] TO [Metodo98]
    AS [dbo];

