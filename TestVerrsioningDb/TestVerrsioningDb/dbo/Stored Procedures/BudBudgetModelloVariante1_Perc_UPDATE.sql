
CREATE PROCEDURE BudBudgetModelloVariante1_Perc_UPDATE(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5)) AS

BEGIN
    
    UPDATE BudBudgetModelloVariante1 
    SET Percentuale = (CASE WHEN (SELECT SUM(Quantita) FROM BudBudgetModelloVariante1 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello) = 0 
        THEN 0 ELSE ROUND(((Quantita / (SELECT SUM(Quantita) FROM BudBudgetModelloVariante1 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello)) * 100), 4) END), 
        PercentualeV = (CASE WHEN (SELECT SUM(Valore) FROM BudBudgetModelloVariante1 BUD 
        WHERE BUD.Stagione = BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione 
        AND BUD.TipologiaProdotto = BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente 
        AND BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia 
        AND BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello) = 0 
        THEN 0 ELSE ROUND(((Valore / (SELECT SUM(Valore) FROM BudBudgetModelloVariante1 BUD WHERE BUD.Stagione = 
        BudBudgetModelloVariante1.Stagione AND BUD.AnnoStagione = BudBudgetModelloVariante1.AnnoStagione AND BUD.TipologiaProdotto = 
        BudBudgetModelloVariante1.TipologiaProdotto AND BUD.Ambiente = BudBudgetModelloVariante1.Ambiente AND 
        BUD.TipoCliente = BudBudgetModelloVariante1.TipoCliente AND BUD.Famiglia = BudBudgetModelloVariante1.Famiglia AND 
        BUD.TipoBudget = BudBudgetModelloVariante1.TipoBudget AND BUD.ModelloBudget = BudBudgetModelloVariante1.ModelloBudget AND BUD.Modello = BudBudgetModelloVariante1.Modello)) * 100), 4) END) 
    WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @Ambiente
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante1_Perc_UPDATE] TO [Metodo98]
    AS [dbo];

