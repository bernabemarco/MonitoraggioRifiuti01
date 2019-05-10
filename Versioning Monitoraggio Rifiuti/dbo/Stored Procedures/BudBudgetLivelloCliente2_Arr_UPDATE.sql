
CREATE PROCEDURE BudBudgetLivelloCliente2_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetLivelloCliente2 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetLivelloCliente2 BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetLivelloCliente2.Stagione AND BD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetLivelloCliente2 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1) AND 
          LivelloCliente2 = (SELECT TOP 1 LivelloCliente2 FROM BudBudgetLivelloCliente2 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1 AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetLivelloCliente2 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1))
    
    UPDATE BudBudgetLivelloCliente2 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetLivelloCliente2 BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetLivelloCliente2.Stagione AND BD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND PercentualeV = 
          (SELECT MAX(PercentualeV) FROM BudBudgetLivelloCliente2 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1) AND 
          LivelloCliente2 = (SELECT TOP 1 LivelloCliente2 FROM BudBudgetLivelloCliente2 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1 AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetLivelloCliente2 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente2.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente2.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente2.Ambiente AND BUD.LivelloCliente1 = BudBudgetLivelloCliente2.LivelloCliente1))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente2_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

