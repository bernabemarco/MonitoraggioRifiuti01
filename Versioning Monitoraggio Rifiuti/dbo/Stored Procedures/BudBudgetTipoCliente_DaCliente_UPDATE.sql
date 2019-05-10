
CREATE PROCEDURE BudBudgetTipoCliente_DaCliente_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetTipoCliente 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetCliente BM WHERE BM.Stagione = BudBudgetTipoCliente.Stagione AND 
        BM.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND BM.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetTipoCliente.Ambiente AND BM.TipoCliente = BudBudgetTipoCliente.TipoCliente), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetCliente BM WHERE BM.Stagione = BudBudgetTipoCliente.Stagione AND 
        BM.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND BM.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetTipoCliente.Ambiente AND BM.TipoCliente = BudBudgetTipoCliente.TipoCliente) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetTipoCliente_DaCliente_UPDATE] TO [Metodo98]
    AS [dbo];

