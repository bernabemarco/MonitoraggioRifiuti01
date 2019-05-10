
CREATE PROCEDURE BudBudgetModelloBudget_Agg_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5), @Famiglia VarChar(5), @TipoBudget VarChar(5), @ModelloBudget VarChar(5), @Quantita Decimal(16,6), @Valore Decimal(19,6)) AS

BEGIN
    
    UPDATE BudBudgetModelloBudget 
    SET Quantita = Quantita + @Quantita, Valore = Valore + @Valore 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND Famiglia = @Famiglia AND 
          TipoBudget = @TipoBudget AND ModelloBudget = @ModelloBudget
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloBudget_Agg_UPDATE] TO [Metodo98]
    AS [dbo];

