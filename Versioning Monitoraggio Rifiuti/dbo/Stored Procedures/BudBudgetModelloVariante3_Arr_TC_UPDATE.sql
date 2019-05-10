
CREATE PROCEDURE BudBudgetModelloVariante3_Arr_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante3 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetModelloVariante3 BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante3.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
        BD.Modello = BudBudgetModelloVariante3.Modello AND BD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BD.Variante2 = BudBudgetModelloVariante3.Variante2)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND 
          Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante3 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2) AND 
          Variante3 = (SELECT TOP 1 Variante3 FROM BudBudgetModelloVariante3 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2 AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante3 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2))
    
    UPDATE BudBudgetModelloVariante3 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetModelloVariante3 BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante3.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
        BD.Modello = BudBudgetModelloVariante3.Modello AND BD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BD.Variante2 = BudBudgetModelloVariante3.Variante2)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND 
          PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante3 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2) AND 
          Variante3 = (SELECT TOP 1 Variante3 FROM BudBudgetModelloVariante3 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2 AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante3 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante3_Arr_TC_UPDATE] TO [Metodo98]
    AS [dbo];

