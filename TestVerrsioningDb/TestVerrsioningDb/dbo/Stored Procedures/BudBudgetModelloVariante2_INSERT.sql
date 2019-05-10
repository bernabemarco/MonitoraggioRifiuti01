
CREATE PROCEDURE BudBudgetModelloVariante2_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @TipoCliente VarChar(5), @Ambiente Decimal(5), @Quantita Decimal(16,6), @Percentuale Decimal(16,6), @Valore Decimal(19,6), @PercentualeV Decimal(16,6), @Utente VarChar(25), @Tipologia VarChar(3), @Tipologia2 VarChar(3), @IDSessione Decimal(10)) AS

BEGIN
    
    INSERT INTO BudBudgetModelloVariante2 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino ) 
    SELECT @Stagione, @AnnoStagione, @TipologiaProdotto, @Ambiente, @TipoCliente, FamigliaBudget, TipoBudget, 
           ModelloBudget, AA.CODICE, V1.TIP1 + SPACE(3 - LEN(V1.TIP1)) + V1.VAR1, V1.TIP2 + SPACE(3 - LEN(V1.TIP2)) + V1.VAR2, 
           V1.TIP2, V1.VAR2, @Quantita, @Percentuale, @Valore, @PercentualeV, @Utente, GETDATE(), 0, 0, 0
    FROM ANAGRAFICAARTICOLI AA, BudVistaBudget2Varianti V1, BudModelloBudget, BudTipoBudget 
    WHERE AA.TipologiaProdotto = @TipologiaProdotto AND AA.ARTTIPOLOGIA = 1 AND EXISTS (SELECT * FROM TIPOLOGIEARTICOLI WHERE CODICEART = AA.CODICE AND CODTIPOLOGIA = V1.TIP2)
          AND ModelloBudget <> '' AND BudModelloBudget.Codice = ModelloBudget AND BudTipoBudget.Codice = TipoBudget AND V1.TIP1 = @Tipologia AND V1.TIP2 = @Tipologia2
          AND EXISTS (SELECT * FROM BudWVariantiValideBudget2 VV WHERE VV.NrTerminale = @IDSessione
          AND VV.Modello = AA.CODICE AND VV.Tipologia = V1.TIP1 AND VV.Variante = V1.VAR1 
          AND VV.Tipologia2 = V1.TIP2 AND VV.Variante2 = V1.VAR2)
    GROUP BY FamigliaBudget, TipoBudget, ModelloBudget, AA.CODICE, V1.TIP1, V1.VAR1, V1.TIP2, V1.VAR2
    ORDER BY FamigliaBudget, TipoBudget, ModelloBudget, AA.CODICE, V1.TIP1, V1.VAR1, V1.TIP2, V1.VAR2
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante2_INSERT] TO [Metodo98]
    AS [dbo];

