
CREATE PROCEDURE BudBudgetModelloVariante2_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante2 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetModelloVariante2 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetModelloVariante2 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetModelloVariante2 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetModelloVariante2 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante2.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante2.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante2.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante2.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante2.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante2.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante2.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante2.ModelloBudget AND 
        BUD.Modello = BudBudgetModelloVariante2.Modello AND BUD.Variante1 = BudBudgetModelloVariante2.Variante1)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante2_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

