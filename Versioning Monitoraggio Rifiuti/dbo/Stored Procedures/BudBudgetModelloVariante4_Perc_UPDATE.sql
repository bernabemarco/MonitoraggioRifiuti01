
CREATE PROCEDURE BudBudgetModelloVariante4_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante4 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetModelloVariante4 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
        BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetModelloVariante4 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
        BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetModelloVariante4 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
        BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetModelloVariante4 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante4.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante4.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante4.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante4.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante4.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante4.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante4.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante4.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante4.Modello AND BUD.Variante1 = BudBudgetModelloVariante4.Variante1 AND 
        BUD.Variante2 = BudBudgetModelloVariante4.Variante2 AND BUD.Variante3 = BudBudgetModelloVariante4.Variante3)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante4_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

