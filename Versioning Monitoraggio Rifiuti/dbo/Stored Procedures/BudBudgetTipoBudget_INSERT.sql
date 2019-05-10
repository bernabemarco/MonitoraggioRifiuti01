
CREATE PROCEDURE BudBudgetTipoBudget_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @TipoCliente VarChar(5), @Ambiente Decimal(5), @Quantita Decimal(16,6), @Percentuale Decimal(16,6), @Valore Decimal(19,6), @PercentualeV Decimal(16,6), @Utente VarChar(25)) AS

BEGIN
    
    INSERT INTO BudBudgetTipoBudget ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
    SELECT @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, FamigliaBudget, TipoBudget, @Quantita, @Percentuale, @Valore, @PercentualeV, @Utente, GETDATE()
    FROM ANAGRAFICAARTICOLI, BudModelloBudget, BudTipoBudget 
    WHERE TipologiaProdotto = @TipologiaProdotto AND (ARTTIPOLOGIA = 1 OR (ARTTIPOLOGIA = 0 AND (CODICEPRIMARIO = '' OR CODICEPRIMARIO IS NULL))) 
          AND ModelloBudget <> '' AND BudModelloBudget.Codice = ModelloBudget AND BudTipoBudget.Codice = TipoBudget 
    GROUP BY FamigliaBudget, TipoBudget
    ORDER BY FamigliaBudget, TipoBudget
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetTipoBudget_INSERT] TO [Metodo98]
    AS [dbo];

