
CREATE PROCEDURE BudBudgetLivelloCliente2_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetLivelloCliente2 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetLivelloCliente2 BUD 
        WHERE BUD.Stagione = BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetLivelloCliente2 BUD WHERE BUD.Stagione = 
        BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetLivelloCliente2 BUD 
        WHERE BUD.Stagione = BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetLivelloCliente2 BUD WHERE BUD.Stagione = 
        BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente2_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

