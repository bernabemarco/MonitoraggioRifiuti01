
CREATE PROCEDURE BudBudgetModelloVariante1_Arr_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante1 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetModelloVariante1 BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante1.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BD.Modello = BudBudgetModelloVariante1.Modello)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND 
          Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante1 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello) AND 
          Variante1 = (SELECT TOP 1 Variante1 FROM BudBudgetModelloVariante1 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante1 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello))
    
    UPDATE BudBudgetModelloVariante1 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetModelloVariante1 BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante1.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BD.Modello = BudBudgetModelloVariante1.Modello)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND 
          PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante1 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello) AND 
          Variante1 = (SELECT TOP 1 Variante1 FROM BudBudgetModelloVariante1 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante1 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante1_Arr_TC_UPDATE] TO [Metodo98]
    AS [dbo];

