
CREATE PROCEDURE BudBudgetModello_INSERT_P(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @TipoCliente VarChar(5), @Ambiente Decimal(5), @Quantita Decimal(16,6), @Percentuale Decimal(16,6), @Valore Decimal(19,6), @PercentualeV Decimal(16,6), @PrezzoMedio Decimal(19,6), @Utente VarChar(25)) AS

BEGIN
    
    INSERT INTO BudBudgetModello ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Quantita, Percentuale, Valore, PercentualeV, PrezzoMedio, UtenteModifica, DataModifica ) 
    SELECT @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, FamigliaBudget, TipoBudget, ModelloBudget, ANAGRAFICAARTICOLI.CODICE, @Quantita, @Percentuale, @Valore, @PercentualeV, @PrezzoMedio, @Utente, GETDATE()
    FROM ANAGRAFICAARTICOLI, BudModelloBudget, BudTipoBudget 
    WHERE TipologiaProdotto = @TipologiaProdotto AND ((ARTTIPOLOGIA = 0 AND PATINDEX('%#%', ANAGRAFICAARTICOLI.CODICE) > 0) OR (ARTTIPOLOGIA = 0 AND (CODICEPRIMARIO = '' OR CODICEPRIMARIO IS NULL))) 
          AND ModelloBudget <> '' AND BudModelloBudget.Codice = ModelloBudget AND BudTipoBudget.Codice = TipoBudget 
    GROUP BY FamigliaBudget, TipoBudget, ModelloBudget, ANAGRAFICAARTICOLI.CODICE
    ORDER BY FamigliaBudget, TipoBudget, ModelloBudget, ANAGRAFICAARTICOLI.CODICE
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModello_INSERT_P] TO [Metodo98]
    AS [dbo];

