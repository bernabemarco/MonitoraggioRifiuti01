
CREATE PROCEDURE BudBudgetFamiglia_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetFamiglia 
    SET Quantita = (SELECT SUM(Quantita) FROM BudBudgetModello BM WHERE BM.Stagione = BudBudgetFamiglia.Stagione AND 
        BM.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND BM.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetFamiglia.Ambiente AND BM.TipoCliente = BudBudgetFamiglia.TipoCliente AND 
        BM.Famiglia = BudBudgetFamiglia.Famiglia), 
        Valore = (SELECT SUM(Valore) FROM BudBudgetModello BM WHERE BM.Stagione = BudBudgetFamiglia.Stagione AND 
        BM.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND BM.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto 
        AND BM.Ambiente = BudBudgetFamiglia.Ambiente AND BM.TipoCliente = BudBudgetFamiglia.TipoCliente AND 
        BM.Famiglia = BudBudgetFamiglia.Famiglia) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetFamiglia_TC_UPDATE] TO [Metodo98]
    AS [dbo];

