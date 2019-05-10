
CREATE PROCEDURE BudBudgetModelloVariante3_V4_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante3 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetModelloVariante4 BM WHERE BM.Stagione = BudBudgetModelloVariante3.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloVariante3.Ambiente AND BM.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloVariante3.Famiglia AND BM.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND BM.Modello = BudBudgetModelloVariante3.Modello AND 
        BM.Variante1 = BudBudgetModelloVariante3.Variante1 AND BM.Variante2 = BudBudgetModelloVariante3.Variante2 AND 
        BM.Variante3 = BudBudgetModelloVariante3.Variante3), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetModelloVariante4 BM WHERE BM.Stagione = BudBudgetModelloVariante3.Stagione AND 
        BM.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND BM.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetModelloVariante3.Ambiente AND BM.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND 
        BM.Famiglia = BudBudgetModelloVariante3.Famiglia AND BM.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND 
        BM.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND BM.Modello = BudBudgetModelloVariante3.Modello AND 
        BM.Variante1 = BudBudgetModelloVariante3.Variante1 AND BM.Variante2 = BudBudgetModelloVariante3.Variante2 AND 
        BM.Variante3 = BudBudgetModelloVariante3.Variante3) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante3_V4_UPDATE] TO [Metodo98]
    AS [dbo];

