
CREATE PROCEDURE BudBudgetModelloBudget_Perc_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloBudget 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetModelloBudget BUD 
        WHERE BUD.Stagione = BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetModelloBudget BUD WHERE BUD.Stagione = 
        BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetModelloBudget BUD 
        WHERE BUD.Stagione = BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetModelloBudget BUD WHERE BUD.Stagione = 
        BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloBudget_Perc_TC_UPDATE] TO [Metodo98]
    AS [dbo];

