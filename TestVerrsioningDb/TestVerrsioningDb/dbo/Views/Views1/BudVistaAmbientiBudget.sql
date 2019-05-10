CREATE VIEW BudVistaAmbientiBudget AS 
    SELECT Stagione, (SELECT Descrizione FROM BudTabStagione WHERE Codice = Stagione) AS DesStagione, 
           AnnoStagione, (SELECT Descrizione FROM BudTabAnnoStagione WHERE Codice = AnnoStagione) AS DesAnnoStagione, 
           TipologiaProdotto, (SELECT Descrizione FROM BudTipologiaProdotto WHERE Codice = TipologiaProdotto) AS DesTipologiaProdotto, 
           Ambiente, (SELECT Descrizione FROM BudAmbientiBudget WHERE Codice = Ambiente) AS DesAmbiente 
    FROM BudBudgetTipoCliente 
    GROUP BY Stagione, AnnoStagione, TipologiaProdotto, Ambiente

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaAmbientiBudget] TO [Metodo98]
    AS [dbo];

