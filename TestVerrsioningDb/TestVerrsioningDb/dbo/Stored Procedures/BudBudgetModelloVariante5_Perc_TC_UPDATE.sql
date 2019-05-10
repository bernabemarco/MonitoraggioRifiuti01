
CREATE PROCEDURE BudBudgetModelloVariante5_Perc_TC_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @TipoCliente VarChar(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante5 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetModelloVariante5 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
        BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetModelloVariante5 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
        BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetModelloVariante5 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
        BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetModelloVariante5 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante5.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante5.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante5.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante5.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante5.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante5.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante5.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante5.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante5.Modello AND BUD.Variante1 = BudBudgetModelloVariante5.Variante1 AND 
        BUD.Variante2 = BudBudgetModelloVariante5.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante5.Variante3 AND BUD.Variante4 = BudBudgetModelloVariante5.Variante4)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND 
          Ambiente = @Ambiente AND TipoCliente = @TipoCliente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante5_Perc_TC_UPDATE] TO [Metodo98]
    AS [dbo];

