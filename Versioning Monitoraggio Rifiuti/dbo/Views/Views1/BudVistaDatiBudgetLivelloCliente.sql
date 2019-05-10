CREATE VIEW BudVistaDatiBudgetLivelloCliente AS 
    SELECT Stagione, (SELECT Descrizione FROM BudTabStagione WHERE Codice = Stagione) AS DesStagione, 
           AnnoStagione, (SELECT Descrizione FROM BudTabAnnoStagione WHERE Codice = AnnoStagione) AS DesAnnoStagione, 
           TipologiaProdotto, (SELECT Descrizione FROM BudTipologiaProdotto WHERE Codice = TipologiaProdotto) AS DesTipologiaProdotto, 
           Ambiente, (SELECT Descrizione FROM BudAmbientiBudget WHERE Codice = Ambiente) AS DesAmbiente, 
           (SELECT Tipo FROM BudAmbientiBudget WHERE Codice = Ambiente) AS TipoAmbiente, 
           (SELECT Definitivo FROM BudAmbientiBudget WHERE Codice = Ambiente) AS Definitivo, 
           LivelloCliente1, (SELECT Descrizione FROM BudLivelloCliente1 WHERE Codice = LivelloCliente1) AS DesLivelloCliente1, 
           LivelloCliente2, (SELECT Descrizione FROM BudLivelloCliente2 WHERE Codice = LivelloCliente2) AS DesLivelloCliente2, 
           LivelloCliente3, (SELECT Descrizione FROM BudLivelloCliente3 WHERE Codice = LivelloCliente3) AS DesLivelloCliente3, 
           Quantita, Percentuale, Valore, PercentualeV 
    FROM BudBudgetLivelloCliente3 

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaDatiBudgetLivelloCliente] TO [Metodo98]
    AS [dbo];

