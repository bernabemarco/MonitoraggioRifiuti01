
CREATE PROCEDURE BudBudgetModelloVariante5_Arr_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante5 
    SET Percentuale = Percentuale + (100 - (SELECT SUM(Percentuale) 
        FROM BudBudgetModelloVariante5 BD WHERE BD.Percentuale <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante5.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
        BD.Modello = BudBudgetModelloVariante5.Modello AND BD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
        BD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BD.Variante4 = BudBudgetModelloVariante5.Variante4)) 
    WHERE Percentuale <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND Percentuale = 
          (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante5 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4) AND 
          Variante5 = (SELECT TOP 1 Variante5 FROM BudBudgetModelloVariante5 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4 AND 
          BUD.Percentuale = (SELECT MAX(Percentuale) FROM BudBudgetModelloVariante5 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4))
    
    UPDATE BudBudgetModelloVariante5 
    SET PercentualeV = PercentualeV + (100 - (SELECT SUM(PercentualeV) 
        FROM BudBudgetModelloVariante5 BD WHERE BD.PercentualeV <> 0 AND 
        BD.Stagione = BudBudgetModelloVariante5.Stagione AND BD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND 
        BD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
        BD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
        BD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
        BD.Modello = BudBudgetModelloVariante5.Modello AND BD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
        BD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BD.Variante4 = BudBudgetModelloVariante5.Variante4)) 
    WHERE PercentualeV <> 0 AND Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND 
          TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente AND PercentualeV = 
          (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante5 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4) AND 
          Variante5 = (SELECT TOP 1 Variante5 FROM BudBudgetModelloVariante5 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4 AND 
          BUD.PercentualeV = (SELECT MAX(PercentualeV) FROM BudBudgetModelloVariante5 BUD WHERE BUD.Stagione = 
          BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND 
          BUD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
          BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
          BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
          BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
          BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4))
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante5_Arr_UPDATE] TO [Metodo98]
    AS [dbo];

