
CREATE PROCEDURE BudBudgetFamiglia_Perc_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetFamiglia 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetFamiglia BUD 
        WHERE BUD.Stagione = BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetFamiglia BUD WHERE BUD.Stagione = 
        BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetFamiglia BUD 
        WHERE BUD.Stagione = BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetFamiglia BUD WHERE BUD.Stagione = 
        BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetFamiglia_Perc_TC_UPDATE] TO [Metodo98]
    AS [dbo];

