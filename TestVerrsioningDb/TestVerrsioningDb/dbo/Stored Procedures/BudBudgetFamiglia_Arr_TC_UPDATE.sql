
CREATE PROCEDURE BudBudgetFamiglia_Arr_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetFamiglia 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetFamiglia BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetFamiglia.Stagione AND BD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BD.Ambiente = BudBudgetFamiglia.Ambiente AND BD.TipoCliente = BudBudgetFamiglia.TipoCliente)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND 
          Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetFamiglia BUD WHERE BUD.Stagione = 
          BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente) AND 
          Famiglia = (SELECT TOP 1 Famiglia FROM BudBudgetFamiglia BUD WHERE BUD.Stagione = 
          BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetFamiglia BUD WHERE BUD.Stagione = 
          BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente))
    
    UPDATE BudBudgetFamiglia 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetFamiglia BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetFamiglia.Stagione AND BD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BD.Ambiente = BudBudgetFamiglia.Ambiente AND BD.TipoCliente = BudBudgetFamiglia.TipoCliente)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND 
          PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetFamiglia BUD WHERE BUD.Stagione = 
          BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente) AND 
          Famiglia = (SELECT TOP 1 Famiglia FROM BudBudgetFamiglia BUD WHERE BUD.Stagione = 
          BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetFamiglia BUD WHERE BUD.Stagione = 
          BudBudgetFamiglia.Stagione AND BUD.AnnoStagione = BudBudgetFamiglia.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetFamiglia.TipologiaProdotto AND BUD.Ambiente = BudBudgetFamiglia.Ambiente AND BUD.TipoCliente = BudBudgetFamiglia.TipoCliente))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetFamiglia_Arr_TC_UPDATE] TO [Metodo98]
    AS [dbo];

