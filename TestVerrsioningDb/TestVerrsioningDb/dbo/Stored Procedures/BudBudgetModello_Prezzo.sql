
CREATE PROCEDURE BudBudgetModello_Prezzo(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @ArrDecimal INT) AS

BEGIN
    
    UPDATE BudBudgetModello 
    SET PrezzoMedio = ROUND((Valore / Quantita), @ArrDecimal) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Quantita <> 0
    
    UPDATE BudBudgetModelloVariante1 
    SET PrezzoMedio = ROUND((Valore / Quantita), @ArrDecimal), 
        PrezzoMedioListino = ROUND((ValoreListino / Quantita), @ArrDecimal) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Quantita <> 0
    
    UPDATE BudBudgetModelloVariante2 
    SET PrezzoMedio = ROUND((Valore / Quantita), @ArrDecimal), 
        PrezzoMedioListino = ROUND((ValoreListino / Quantita), @ArrDecimal) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Quantita <> 0
    
    UPDATE BudBudgetModelloVariante3 
    SET PrezzoMedio = ROUND((Valore / Quantita), @ArrDecimal), 
        PrezzoMedioListino = ROUND((ValoreListino / Quantita), @ArrDecimal) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Quantita <> 0
    
    UPDATE BudBudgetModelloVariante4 
    SET PrezzoMedio = ROUND((Valore / Quantita), @ArrDecimal), 
        PrezzoMedioListino = ROUND((ValoreListino / Quantita), @ArrDecimal) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Quantita <> 0
    
    UPDATE BudBudgetModelloVariante5 
    SET PrezzoMedio = ROUND((Valore / Quantita), @ArrDecimal), 
        PrezzoMedioListino = ROUND((ValoreListino / Quantita), @ArrDecimal) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Quantita <> 0
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModello_Prezzo] TO [Metodo98]
    AS [dbo];

