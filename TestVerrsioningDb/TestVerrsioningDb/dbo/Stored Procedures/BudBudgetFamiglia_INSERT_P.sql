
CREATE PROCEDURE BudBudgetFamiglia_INSERT_P(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @TipoCliente VarChar(5), @Ambiente Decimal(5), @Quantita Decimal(16,6), @Percentuale Decimal(16,6), @Valore Decimal(19,6), @PercentualeV Decimal(16,6), @Utente VarChar(25)) AS

BEGIN
    
    INSERT INTO BudBudgetFamiglia ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
    SELECT @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, FamigliaBudget, @Quantita, @Percentuale, @Valore, @PercentualeV, @Utente, GETDATE()
    FROM ANAGRAFICAARTICOLI, BudModelloBudget, BudTipoBudget 
    WHERE TipologiaProdotto = @TipologiaProdotto AND ((ARTTIPOLOGIA = 0 AND PATINDEX('%#%', ANAGRAFICAARTICOLI.CODICE) > 0) OR (ARTTIPOLOGIA = 0 AND (CODICEPRIMARIO = '' OR CODICEPRIMARIO IS NULL))) 
          AND ModelloBudget <> '' AND BudModelloBudget.Codice = ModelloBudget AND BudTipoBudget.Codice = TipoBudget 
    GROUP BY FamigliaBudget
    ORDER BY FamigliaBudget
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetFamiglia_INSERT_P] TO [Metodo98]
    AS [dbo];

