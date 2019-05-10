
CREATE PROCEDURE BudBudgetTipoCliente_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetTipoCliente 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetTipoCliente BUD 
        WHERE BUD.Stagione = BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetTipoCliente BUD WHERE BUD.Stagione = 
        BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetTipoCliente BUD 
        WHERE BUD.Stagione = BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetTipoCliente BUD WHERE BUD.Stagione = 
        BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetTipoCliente_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

