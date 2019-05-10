
CREATE PROCEDURE BudBudgetModello_Perc_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetModello 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetModello BUD 
        WHERE BUD.Stagione = BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente 
        AND BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia 
        AND BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetModello BUD WHERE BUD.Stagione = 
        BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente AND 
        BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia AND 
        BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetModello BUD 
        WHERE BUD.Stagione = BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente 
        AND BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia 
        AND BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetModello BUD WHERE BUD.Stagione = 
        BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente AND 
        BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia AND 
        BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModello_Perc_TC_UPDATE] TO [Metodo98]
    AS [dbo];

