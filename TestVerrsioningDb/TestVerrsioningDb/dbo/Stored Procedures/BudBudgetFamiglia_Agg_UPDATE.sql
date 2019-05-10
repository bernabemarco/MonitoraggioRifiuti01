
CREATE PROCEDURE BudBudgetFamiglia_Agg_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5), @Famiglia VarChar(5), @Quantita Decimal(16,6), @Valore Decimal(19,6)) AS

BEGIN
    
    UPDATE BudBudgetFamiglia 
    SET Quantita = Quantita + @Quantita, Valore = Valore + @Valore 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND Famiglia = @Famiglia
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetFamiglia_Agg_UPDATE] TO [Metodo98]
    AS [dbo];

