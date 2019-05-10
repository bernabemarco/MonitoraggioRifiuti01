
CREATE PROCEDURE BudBudgetCliente_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetCliente 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetCliente BUD 
        WHERE BUD.Stagione = BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND BUD.TipoCliente = BudBudgetCliente.TipoCliente) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetCliente BUD WHERE BUD.Stagione = 
        BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND BUD.TipoCliente = BudBudgetCliente.TipoCliente)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetCliente BUD 
        WHERE BUD.Stagione = BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND BUD.TipoCliente = BudBudgetCliente.TipoCliente) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetCliente BUD WHERE BUD.Stagione = 
        BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND BUD.TipoCliente = BudBudgetCliente.TipoCliente)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetCliente_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

