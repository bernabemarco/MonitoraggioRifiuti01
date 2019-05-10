
CREATE PROCEDURE BudBudgetModelloVariante2_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante2 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetModelloVariante2 BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante2.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
        BD.Modello = BudBudgetModelloVariante2.Modello AND BD.Variante1 = BudBudgetModelloVariante2.Variante1)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante2 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1) AND 
          Variante2 = (SELECT TOP 1 Variante2 FROM BudBudgetModelloVariante2 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1 AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante2 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1))
    
    UPDATE BudBudgetModelloVariante2 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetModelloVariante2 BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante2.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
        BD.Modello = BudBudgetModelloVariante2.Modello AND BD.Variante1 = BudBudgetModelloVariante2.Variante1)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND PercentualeV = 
          (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante2 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1) AND 
          Variante2 = (SELECT TOP 1 Variante2 FROM BudBudgetModelloVariante2 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1 AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante2 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante2_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

