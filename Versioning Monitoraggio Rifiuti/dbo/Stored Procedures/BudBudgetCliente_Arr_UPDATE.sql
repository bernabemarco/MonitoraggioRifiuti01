
CREATE PROCEDURE BudBudgetCliente_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetCliente 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetCliente BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetCliente.Stagione AND BD.AnnoStagione = BudBudgetCliente.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetCliente.TipologiaProdotto AND BD.Ambiente = BudBudgetCliente.Ambiente AND BD.TipoCliente = BudBudgetCliente.TipoCliente)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetCliente BUD WHERE BUD.Stagione = 
          BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND 
          BUD.TipoCliente = BudBudgetCliente.TipoCliente)  AND Cliente = (SELECT TOP 1 Cliente FROM BudBudgetCliente BUD WHERE BUD.Stagione = 
          BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione AND BUD.TipologiaProdotto = 
          BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND BUD.TipoCliente = 
          BudBudgetCliente.TipoCliente AND BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetCliente BUD WHERE BUD.Stagione = 
          BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione AND BUD.TipologiaProdotto = 
          BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND BUD.TipoCliente = BudBudgetCliente.TipoCliente))
    
    UPDATE BudBudgetCliente 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetCliente BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetCliente.Stagione AND BD.AnnoStagione = BudBudgetCliente.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetCliente.TipologiaProdotto AND BD.Ambiente = BudBudgetCliente.Ambiente AND BD.TipoCliente = BudBudgetCliente.TipoCliente)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND PercentualeV = 
          (SELECT MAX(PercentualeV) FROM BudBudgetCliente BUD WHERE BUD.Stagione = 
          BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND 
          BUD.TipoCliente = BudBudgetCliente.TipoCliente)  AND Cliente = (SELECT TOP 1 Cliente FROM BudBudgetCliente BUD WHERE BUD.Stagione = 
          BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione AND BUD.TipologiaProdotto = 
          BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND BUD.TipoCliente = 
          BudBudgetCliente.TipoCliente AND BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetCliente BUD WHERE BUD.Stagione = 
          BudBudgetCliente.Stagione AND BUD.AnnoStagione = BudBudgetCliente.AnnoStagione AND BUD.TipologiaProdotto = 
          BudBudgetCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetCliente.Ambiente AND BUD.TipoCliente = BudBudgetCliente.TipoCliente))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetCliente_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

