CREATE VIEW BudVistaDatiBudgetModello AS 
    SELECT Stagione, (SELECT Descrizione FROM BudTabStagione WHERE Codice = Stagione) AS DesStagione, 
           AnnoStagione, (SELECT Descrizione FROM BudTabAnnoStagione WHERE Codice = AnnoStagione) AS DesAnnoStagione, 
           TipologiaProdotto, (SELECT Descrizione FROM BudTipologiaProdotto WHERE Codice = TipologiaProdotto) AS DesTipologiaProdotto, 
           Ambiente, (SELECT Descrizione FROM BudAmbientiBudget WHERE Codice = Ambiente) AS DesAmbiente, 
           (SELECT Tipo FROM BudAmbientiBudget WHERE Codice = Ambiente) AS TipoAmbiente, 
           (SELECT Definitivo FROM BudAmbientiBudget WHERE Codice = Ambiente) AS Definitivo, 
           TipoCliente, (SELECT Descrizione FROM BudTipoClienteBudget WHERE Codice = TipoCliente) AS DesTipoCliente, 
           Famiglia, (SELECT Descrizione FROM BudFamigliaBudget WHERE Codice = Famiglia) AS DesFamiglia, 
           TipoBudget, (SELECT Descrizione FROM BudTipoBudget WHERE Codice = TipoBudget) AS DesTipoBudget, 
           ModelloBudget, (SELECT Descrizione FROM BudModelloBudget WHERE Codice = ModelloBudget) AS DesModelloBudget, 
           Modello, (SELECT Descrizione FROM AnagraficaArticoli WHERE Codice = BudBudgetModello.Modello) AS DesModello, 
           Quantita, Percentuale, Valore, PercentualeV, PrezzoMedio
    FROM BudBudgetModello 

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaDatiBudgetModello] TO [Metodo98]
    AS [dbo];

