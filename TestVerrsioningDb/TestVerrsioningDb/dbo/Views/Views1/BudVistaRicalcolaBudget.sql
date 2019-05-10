CREATE VIEW BudVistaRicalcolaBudget AS 
    SELECT Stagione, (SELECT Descrizione FROM BudTabStagione WHERE Codice = Stagione) AS DesStagione, 
           AnnoStagione, (SELECT Descrizione FROM BudTabAnnoStagione WHERE Codice = AnnoStagione) AS DesAnnoStagione, 
           TipologiaProdotto, (SELECT Descrizione FROM BudTipologiaProdotto WHERE Codice = TipologiaProdotto) AS DesTipologiaProdotto, 
           Ambiente, (SELECT Descrizione FROM BudAmbientiBudget WHERE Codice = Ambiente) AS DesAmbiente, 
           (CASE WHEN (SELECT Definitivo FROM BudAmbientiBudget WHERE Codice = Ambiente) = 1 THEN 'Definitivo' ELSE 'In Modifica' END) AS StatoBudget
    FROM BudBudgetTipoCliente 
    WHERE Ambiente IN (SELECT Codice FROM BudAmbientiBudget WHERE (Tipo = 2 OR Tipo = 3) AND Definitivo = 0)
    GROUP BY Stagione, AnnoStagione, TipologiaProdotto, Ambiente

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaRicalcolaBudget] TO [Metodo98]
    AS [dbo];

