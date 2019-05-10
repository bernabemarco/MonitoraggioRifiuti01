CREATE VIEW BudVistaDatiBudgetCliente AS 
    SELECT Stagione, (SELECT Descrizione FROM BudTabStagione WHERE Codice = Stagione) AS DesStagione, 
           AnnoStagione, (SELECT Descrizione FROM BudTabAnnoStagione WHERE Codice = AnnoStagione) AS DesAnnoStagione, 
           TipologiaProdotto, (SELECT Descrizione FROM BudTipologiaProdotto WHERE Codice = TipologiaProdotto) AS DesTipologiaProdotto, 
           Ambiente, (SELECT Descrizione FROM BudAmbientiBudget WHERE Codice = Ambiente) AS DesAmbiente, 
           (SELECT Tipo FROM BudAmbientiBudget WHERE Codice = Ambiente) AS TipoAmbiente, 
           (SELECT Definitivo FROM BudAmbientiBudget WHERE Codice = Ambiente) AS Definitivo, 
           TipoCliente, (SELECT Descrizione FROM BudTipoClienteBudget WHERE Codice = TipoCliente) AS DesTipoCliente, 
           Cliente, (SELECT DscConto1 FROM AnagraficaCF WHERE CodConto = Cliente) AS DesCliente, 
           Quantita, Percentuale, Valore, PercentualeV
    FROM BudBudgetCliente 

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaDatiBudgetCliente] TO [Metodo98]
    AS [dbo];

