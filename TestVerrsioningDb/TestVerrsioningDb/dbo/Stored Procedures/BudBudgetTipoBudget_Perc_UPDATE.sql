
CREATE PROCEDURE BudBudgetTipoBudget_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetTipoBudget 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetTipoBudget BUD 
        WHERE BUD.Stagione = BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente 
        AND BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetTipoBudget BUD WHERE BUD.Stagione = 
        BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
        BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetTipoBudget BUD 
        WHERE BUD.Stagione = BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente 
        AND BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetTipoBudget BUD WHERE BUD.Stagione = 
        BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
        BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetTipoBudget_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

