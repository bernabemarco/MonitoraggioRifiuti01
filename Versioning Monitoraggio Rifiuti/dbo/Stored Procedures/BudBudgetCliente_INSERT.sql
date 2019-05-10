
CREATE PROCEDURE BudBudgetCliente_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @Ambiente Decimal(5), @Quantita Decimal(16,6), @Percentuale Decimal(16,6), @Valore Decimal(19,6), @PercentualeV Decimal(16,6), @Utente VarChar(25)) AS

BEGIN
    
    INSERT INTO BudBudgetCliente ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Cliente, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
    SELECT @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, ANAGRAFICACF.TipoClienteBudget, VISTACLIENTI.CODCONTO, @Quantita, @Percentuale, @Valore, @PercentualeV, @Utente, GETDATE()
    FROM VISTACLIENTI INNER JOIN ANAGRAFICACF ON VISTACLIENTI.CODCONTO = ANAGRAFICACF.CODCONTO
    WHERE ANAGRAFICACF.TipoClienteBudget <> '' AND ANAGRAFICACF.TipoClienteBudget IS NOT NULL AND ANAGRAFICACF.ConsideraBudget <> 0 
    ORDER BY ANAGRAFICACF.TipoClienteBudget, VISTACLIENTI.CODCONTO
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetCliente_INSERT] TO [Metodo98]
    AS [dbo];

