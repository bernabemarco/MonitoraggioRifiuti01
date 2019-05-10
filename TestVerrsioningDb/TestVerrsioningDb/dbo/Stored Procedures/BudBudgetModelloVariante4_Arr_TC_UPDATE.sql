
CREATE PROCEDURE BudBudgetModelloVariante4_Arr_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante4 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetModelloVariante4 BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante4.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
        BD.Modello = BudBudgetModelloVariante4.Modello AND BD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
        BD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BD.Variante3 = BudBudgetModelloVariante4.Variante3)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND 
          Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante4 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3) AND 
          Variante4 = (SELECT TOP 1 Variante4 FROM BudBudgetModelloVariante4 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3 AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante4 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3))
    
    UPDATE BudBudgetModelloVariante4 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetModelloVariante4 BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante4.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
        BD.Modello = BudBudgetModelloVariante4.Modello AND BD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
        BD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BD.Variante3 = BudBudgetModelloVariante4.Variante3)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND TipoCliente = @TipoCliente AND 
          PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante4 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3) AND 
          Variante4 = (SELECT TOP 1 Variante4 FROM BudBudgetModelloVariante4 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3 AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante4 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante4_Arr_TC_UPDATE] TO [Metodo98]
    AS [dbo];

