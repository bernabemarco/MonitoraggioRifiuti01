
CREATE PROCEDURE BudBudgetLivelloCliente1_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetLivelloCliente1 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetLivelloCliente1 BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetLivelloCliente1.Stagione AND BD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BD.Ambiente = BudBudgetLivelloCliente1.Ambiente)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetLivelloCliente1 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente) AND 
          LivelloCliente1 = (SELECT TOP 1 LivelloCliente1 FROM BudBudgetLivelloCliente1 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetLivelloCliente1 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente))
    
    UPDATE BudBudgetLivelloCliente1 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetLivelloCliente1 BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetLivelloCliente1.Stagione AND BD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BD.Ambiente = BudBudgetLivelloCliente1.Ambiente)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(PercentualeV) FROM BudBudgetLivelloCliente1 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente) AND 
          LivelloCliente1 = (SELECT TOP 1 LivelloCliente1 FROM BudBudgetLivelloCliente1 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetLivelloCliente1 BUD WHERE BUD.Stagione = 
          BudBudgetLivelloCliente1.Stagione AND BUD.AnnoStagione = BudBudgetLivelloCliente1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetLivelloCliente1.TipologiaProdotto AND BUD.Ambiente = BudBudgetLivelloCliente1.Ambiente))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetLivelloCliente1_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

