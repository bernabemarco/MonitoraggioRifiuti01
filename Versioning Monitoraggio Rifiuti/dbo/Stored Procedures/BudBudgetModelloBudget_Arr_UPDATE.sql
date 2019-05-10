
CREATE PROCEDURE BudBudgetModelloBudget_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloBudget 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetModelloBudget BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetModelloBudget.Stagione AND BD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BD.Famiglia = BudBudgetModelloBudget.Famiglia AND BD.TipoBudget = BudBudgetModelloBudget.TipoBudget)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetModelloBudget BUD WHERE BUD.Stagione = 
          BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget) AND 
          ModelloBudget = (SELECT TOP 1 ModelloBudget FROM BudBudgetModelloBudget BUD WHERE BUD.Stagione = 
          BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloBudget BUD WHERE BUD.Stagione = 
          BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget))
    
    UPDATE BudBudgetModelloBudget 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetModelloBudget BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetModelloBudget.Stagione AND BD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BD.Famiglia = BudBudgetModelloBudget.Famiglia AND BD.TipoBudget = BudBudgetModelloBudget.TipoBudget)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND PercentualeV = 
          (SELECT MAX(PercentualeV) FROM BudBudgetModelloBudget BUD WHERE BUD.Stagione = 
          BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget) AND 
          ModelloBudget = (SELECT TOP 1 ModelloBudget FROM BudBudgetModelloBudget BUD WHERE BUD.Stagione = 
          BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloBudget BUD WHERE BUD.Stagione = 
          BudBudgetModelloBudget.Stagione AND BUD.AnnoStagione = BudBudgetModelloBudget.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloBudget.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloBudget.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloBudget.TipoCliente AND BUD.Famiglia = BudBudgetModelloBudget.Famiglia AND BUD.TipoBudget = BudBudgetModelloBudget.TipoBudget))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloBudget_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

