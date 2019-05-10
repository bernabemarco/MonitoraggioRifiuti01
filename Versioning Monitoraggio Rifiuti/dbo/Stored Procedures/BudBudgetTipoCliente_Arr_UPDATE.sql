
CREATE PROCEDURE BudBudgetTipoCliente_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetTipoCliente 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetTipoCliente BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetTipoCliente.Stagione AND BD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BD.Ambiente = BudBudgetTipoCliente.Ambiente)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetTipoCliente BUD WHERE BUD.Stagione = 
          BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente) AND 
          TipoCliente = (SELECT TOP 1 TipoCliente FROM BudBudgetTipoCliente BUD WHERE BUD.Stagione = 
          BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetTipoCliente BUD WHERE BUD.Stagione = 
          BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente))
    
    UPDATE BudBudgetTipoCliente 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetTipoCliente BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetTipoCliente.Stagione AND BD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BD.Ambiente = BudBudgetTipoCliente.Ambiente)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(PercentualeV) FROM BudBudgetTipoCliente BUD WHERE BUD.Stagione = 
          BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente) AND 
          TipoCliente = (SELECT TOP 1 TipoCliente FROM BudBudgetTipoCliente BUD WHERE BUD.Stagione = 
          BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetTipoCliente BUD WHERE BUD.Stagione = 
          BudBudgetTipoCliente.Stagione AND BUD.AnnoStagione = BudBudgetTipoCliente.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoCliente.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoCliente.Ambiente))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetTipoCliente_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

