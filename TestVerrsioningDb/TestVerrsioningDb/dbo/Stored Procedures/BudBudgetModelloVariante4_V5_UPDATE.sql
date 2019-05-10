
CREATE PROCEDURE BudBudgetModelloVariante4_V5_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante4 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetModelloVariante5 BM WHERE BM.Stagione = BudBudgetModelloVariante4.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloVariante4.Ambiente AND BM.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloVariante4.Famiglia AND BM.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND BM.Modello = BudBudgetModelloVariante4.Modello AND 
        BM.Variante1 = BudBudgetModelloVariante4.Variante1 AND BM.Variante2 = BudBudgetModelloVariante4.Variante2 AND 
        BM.Variante3 = BudBudgetModelloVariante4.Variante3 AND BM.Variante4 = BudBudgetModelloVariante4.Variante4), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetModelloVariante5 BM WHERE BM.Stagione = BudBudgetModelloVariante4.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloVariante4.Ambiente AND BM.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloVariante4.Famiglia AND BM.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND BM.Modello = BudBudgetModelloVariante4.Modello AND 
        BM.Variante1 = BudBudgetModelloVariante4.Variante1 AND BM.Variante2 = BudBudgetModelloVariante4.Variante2 AND 
        BM.Variante3 = BudBudgetModelloVariante4.Variante3 AND BM.Variante4 = BudBudgetModelloVariante4.Variante4) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante4_V5_UPDATE] TO [Metodo98]
    AS [dbo];

