
CREATE PROCEDURE BudBudgetModelloVariante1_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @TipoCliente VarChar(5), @Ambiente Decimal(5), @Quantita Decimal(16,6), @Percentuale Decimal(16,6), @Valore Decimal(19,6), @PercentualeV Decimal(16,6), @Utente VarChar(25), @Tipologia VarChar(3), @IDSessione Decimal(10)) AS

BEGIN
    
    INSERT INTO BudBudgetModelloVariante1 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino ) 
    SELECT @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, FamigliaBudget, TipoBudget, 
           ModelloBudget, AA.CODICE, V1.TIP1 + SPACE(3 - LEN(V1.TIP1)) + V1.VAR1, V1.TIP1, V1.VAR1, @Quantita, @Percentuale, @Valore, @PercentualeV, @Utente, GETDATE(), 0, 0, 0
    FROM ANAGRAFICAARTICOLI AA, BudVistaBudget1Varianti V1, BudModelloBudget, BudTipoBudget 
    WHERE AA.TipologiaProdotto = @TipologiaProdotto AND AA.ARTTIPOLOGIA = 1 AND EXISTS (SELECT * FROM TIPOLOGIEARTICOLI WHERE CODICEART = AA.CODICE AND CODTIPOLOGIA = V1.TIP1)
          AND ModelloBudget <> '' AND BudModelloBudget.Codice = ModelloBudget AND BudTipoBudget.Codice = TipoBudget AND V1.TIP1 = @Tipologia
          AND EXISTS (SELECT * FROM BudWVariantiValideBudget VV WHERE VV.NrTerminale = @IDSessione
          AND VV.Modello = AA.CODICE AND VV.Tipologia = V1.TIP1 AND VV.Variante = V1.VAR1)
    GROUP BY FamigliaBudget, TipoBudget, ModelloBudget, AA.CODICE, V1.TIP1, V1.VAR1
    ORDER BY FamigliaBudget, TipoBudget, ModelloBudget, AA.CODICE, V1.TIP1, V1.VAR1
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante1_INSERT] TO [Metodo98]
    AS [dbo];

