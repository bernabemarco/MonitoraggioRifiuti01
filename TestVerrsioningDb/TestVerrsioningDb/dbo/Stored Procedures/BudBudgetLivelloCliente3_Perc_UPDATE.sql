
CREATE PROCEDURE BudBudgetLivelloCliente3_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetLivelloCliente3 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetLivelloCliente3 BUD 
        WHERE BUD.Stagione = BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente 
        AND BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetLivelloCliente3 BUD WHERE BUD.Stagione = 
        BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
        BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetLivelloCliente3 BUD 
        WHERE BUD.Stagione = BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente 
        AND BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetLivelloCliente3 BUD WHERE BUD.Stagione = 
        BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
        BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente3_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

