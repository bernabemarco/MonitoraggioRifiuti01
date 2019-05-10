CREATE VIEW BudVistaElencoBudgetLivelloCliente AS 
    SELECT Stagione, (SELECT Descrizione FROM BudTabStagione WHERE Codice = Stagione) AS DesStagione, 
           AnnoStagione, (SELECT Descrizione FROM BudTabAnnoStagione WHERE Codice = AnnoStagione) AS DesAnnoStagione, 
           TipologiaProdotto, (SELECT Descrizione FROM BudTipologiaProdotto WHERE Codice = TipologiaProdotto) AS DesTipologiaProdotto, 
           Ambiente, (SELECT Descrizione FROM BudAmbientiBudget WHERE Codice = Ambiente) AS DesAmbiente 
    FROM BudBudgetLivelloCliente1 
    WHERE Ambiente IN (SELECT Codice FROM BudAmbientiBudget WHERE Definitivo = 0 AND Tipo <> 1)
    GROUP BY Stagione, AnnoStagione, TipologiaProdotto, Ambiente

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaElencoBudgetLivelloCliente] TO [Metodo98]
    AS [dbo];

