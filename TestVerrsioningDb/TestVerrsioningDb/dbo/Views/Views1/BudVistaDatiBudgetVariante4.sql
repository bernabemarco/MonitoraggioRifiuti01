CREATE VIEW BudVistaDatiBudgetVariante4 AS 
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
           Modello, (SELECT Descrizione FROM AnagraficaArticoli WHERE Codice = BudBudgetModelloVariante4.Modello) AS DesModello, 
           LTRIM(RTRIM(SUBSTRING(Variante1,1,3))) AS Tipologia1, 
           (SELECT DESCRIZIONE FROM TABTIPOLOGIE WHERE TIPOLOGIA = LTRIM(RTRIM(SUBSTRING(Variante1,1,3)))) AS DesTipologia1, 
           LTRIM(RTRIM(SUBSTRING(Variante1,4,8))) AS Variante1, 
           (SELECT DESCRIZIONE FROM TABVARIANTI WHERE TIPOLOGIA = LTRIM(RTRIM(SUBSTRING(Variante1,1,3))) AND 
           VARIANTE = LTRIM(RTRIM(SUBSTRING(Variante1,4,8)))) AS DesVariante1, 
           LTRIM(RTRIM(SUBSTRING(Variante2,1,3))) AS Tipologia2, 
           (SELECT DESCRIZIONE FROM TABTIPOLOGIE WHERE TIPOLOGIA = LTRIM(RTRIM(SUBSTRING(Variante2,1,3)))) AS DesTipologia2, 
           LTRIM(RTRIM(SUBSTRING(Variante2,4,8))) AS Variante2, 
           (SELECT DESCRIZIONE FROM TABVARIANTI WHERE TIPOLOGIA = LTRIM(RTRIM(SUBSTRING(Variante2,1,3))) AND 
           VARIANTE = LTRIM(RTRIM(SUBSTRING(Variante2,4,8)))) AS DesVariante2, 
           LTRIM(RTRIM(SUBSTRING(Variante3,1,3))) AS Tipologia3, 
           (SELECT DESCRIZIONE FROM TABTIPOLOGIE WHERE TIPOLOGIA = LTRIM(RTRIM(SUBSTRING(Variante3,1,3)))) AS DesTipologia3, 
           LTRIM(RTRIM(SUBSTRING(Variante3,4,8))) AS Variante3, 
           (SELECT DESCRIZIONE FROM TABVARIANTI WHERE TIPOLOGIA = LTRIM(RTRIM(SUBSTRING(Variante3,1,3))) AND 
           VARIANTE = LTRIM(RTRIM(SUBSTRING(Variante3,4,8)))) AS DesVariante3, 
           LTRIM(RTRIM(SUBSTRING(Variante4,1,3))) AS Tipologia4, 
           (SELECT DESCRIZIONE FROM TABTIPOLOGIE WHERE TIPOLOGIA = LTRIM(RTRIM(SUBSTRING(Variante4,1,3)))) AS DesTipologia4, 
           LTRIM(RTRIM(SUBSTRING(Variante4,4,8))) AS Variante4, 
           (SELECT DESCRIZIONE FROM TABVARIANTI WHERE TIPOLOGIA = LTRIM(RTRIM(SUBSTRING(Variante4,1,3))) AND 
           VARIANTE = LTRIM(RTRIM(SUBSTRING(Variante4,4,8)))) AS DesVariante4, 
           Quantita, Percentuale, Valore, PercentualeV, PrezzoMedio, ValoreListino, PrezzoMedioListino
    FROM BudBudgetModelloVariante4 

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaDatiBudgetVariante4] TO [Metodo98]
    AS [dbo];

