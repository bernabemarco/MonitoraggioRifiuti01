
CREATE PROCEDURE BudBudgetTipoBudget_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetTipoBudget 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetTipoBudget BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetTipoBudget.Stagione AND BD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
        BD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BD.Famiglia = BudBudgetTipoBudget.Famiglia)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetTipoBudget BUD WHERE BUD.Stagione = 
          BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia) AND 
          TipoBudget = (SELECT TOP 1 TipoBudget FROM BudBudgetTipoBudget BUD WHERE BUD.Stagione = 
          BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetTipoBudget BUD WHERE BUD.Stagione = 
          BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia))
    
    UPDATE BudBudgetTipoBudget 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetTipoBudget BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetTipoBudget.Stagione AND BD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
        BD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BD.Famiglia = BudBudgetTipoBudget.Famiglia)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND PercentualeV = 
          (SELECT MAX(PercentualeV) FROM BudBudgetTipoBudget BUD WHERE BUD.Stagione = 
          BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia) AND 
          TipoBudget = (SELECT TOP 1 TipoBudget FROM BudBudgetTipoBudget BUD WHERE BUD.Stagione = 
          BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetTipoBudget BUD WHERE BUD.Stagione = 
          BudBudgetTipoBudget.Stagione AND BUD.AnnoStagione = BudBudgetTipoBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetTipoBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetTipoBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetTipoBudget.TipoCliente AND BUD.Famiglia = BudBudgetTipoBudget.Famiglia))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetTipoBudget_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

