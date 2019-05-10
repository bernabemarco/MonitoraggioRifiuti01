
CREATE PROCEDURE BudBudgetModelloVariante3_Perc_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante3 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetModelloVariante3 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetModelloVariante3 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetModelloVariante3 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetModelloVariante3 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante3.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante3.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante3.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante3.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante3.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante3.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante3.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante3.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante3.Modello AND BUD.Variante1 = BudBudgetModelloVariante3.Variante1 AND BUD.Variante2 = BudBudgetModelloVariante3.Variante2)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante3_Perc_TC_UPDATE] TO [Metodo98]
    AS [dbo];

