
CREATE PROCEDURE BudBudgetModello_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModello 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetModello BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetModello.Stagione AND BD.AnnoStagione = BudBudgetModello.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BD.Ambiente = BudBudgetModello.Ambiente AND 
        BD.TipoCliente = BudBudgetModello.TipoCliente AND BD.Famiglia = BudBudgetModello.Famiglia AND 
        BD.TipoBudget = BudBudgetModello.TipoBudget AND BD.ModelloBudget = BudBudgetModello.ModelloBudget)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetModello BUD WHERE BUD.Stagione = 
          BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente AND 
          BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia AND 
          BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget) AND 
          Modello = (SELECT TOP 1 Modello FROM BudBudgetModello BUD WHERE BUD.Stagione = 
          BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente AND 
          BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia AND 
          BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModello BUD WHERE BUD.Stagione = 
          BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente AND 
          BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia AND 
          BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget))
    
    UPDATE BudBudgetModello 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetModello BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetModello.Stagione AND BD.AnnoStagione = BudBudgetModello.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BD.Ambiente = BudBudgetModello.Ambiente AND 
        BD.TipoCliente = BudBudgetModello.TipoCliente AND BD.Famiglia = BudBudgetModello.Famiglia AND 
        BD.TipoBudget = BudBudgetModello.TipoBudget AND BD.ModelloBudget = BudBudgetModello.ModelloBudget)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND PercentualeV = 
          (SELECT MAX(PercentualeV) FROM BudBudgetModello BUD WHERE BUD.Stagione = 
          BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente AND 
          BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia AND 
          BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget) AND 
          Modello = (SELECT TOP 1 Modello FROM BudBudgetModello BUD WHERE BUD.Stagione = 
          BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente AND 
          BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia AND 
          BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModello BUD WHERE BUD.Stagione = 
          BudBudgetModello.Stagione AND BUD.AnnoStagione = BudBudgetModello.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModello.TipologiaProdotto AND BUD.Ambiente = BudBudgetModello.Ambiente AND 
          BUD.TipoCliente = BudBudgetModello.TipoCliente AND BUD.Famiglia = BudBudgetModello.Famiglia AND 
          BUD.TipoBudget = BudBudgetModello.TipoBudget AND BUD.ModelloBudget = BudBudgetModello.ModelloBudget))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModello_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

