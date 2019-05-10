
CREATE PROCEDURE BudBudgetLivelloCliente3_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetLivelloCliente3 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetLivelloCliente3 BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetLivelloCliente3.Stagione AND BD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
        BD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetLivelloCliente3 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
          BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2) AND 
          LivelloCliente3 = (SELECT TOP 1 LivelloCliente3 FROM BudBudgetLivelloCliente3 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
          BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2 AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetLivelloCliente3 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
          BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2))
    
    UPDATE BudBudgetLivelloCliente3 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetLivelloCliente3 BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetLivelloCliente3.Stagione AND BD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
        BD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND PercentualeV = 
          (SELECT MAX(PercentualeV) FROM BudBudgetLivelloCliente3 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
          BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2) AND 
          LivelloCliente3 = (SELECT TOP 1 LivelloCliente3 FROM BudBudgetLivelloCliente3 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
          BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2 AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetLivelloCliente3 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente3.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente3.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente3.Ambiente AND 
          BUD.LivelloCliente1 = BudBudgetLivelloCliente3.LivelloCliente1 AND BUD.LivelloCliente2 = BudBudgetLivelloCliente3.LivelloCliente2))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente3_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

