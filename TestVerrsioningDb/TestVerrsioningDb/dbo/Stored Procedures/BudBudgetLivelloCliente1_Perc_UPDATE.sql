
CREATE PROCEDURE BudBudgetLivelloCliente1_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetLivelloCliente1 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetLivelloCliente1 BUD 
        WHERE BUD.Stagione = BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetLivelloCliente1 BUD WHERE BUD.Stagione = 
        BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetLivelloCliente1 BUD 
        WHERE BUD.Stagione = BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetLivelloCliente1 BUD WHERE BUD.Stagione = 
        BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente1_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

