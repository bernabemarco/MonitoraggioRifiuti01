
CREATE PROCEDURE BudBudgetModelloVariante5_Dup_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @AmbienteDup Decimal(5), @AmbienteGen Decimal(5), @Azzera INT) AS

BEGIN
    
    IF @Azzera = 0
        
        BEGIN
            
            INSERT INTO BudBudgetModelloVariante5 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Variante3, Variante4, Variante5, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino ) 
            SELECT Stagione, AnnoStagione, TipologiaProdotto, @AmbienteGen, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Variante3, Variante4, Variante5, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino 
            FROM BudBudgetModelloVariante5 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @AmbienteDup
            
        END
        
    ELSE
        
        BEGIN
            
            INSERT INTO BudBudgetModelloVariante5 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Variante3, Variante4, Variante5, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino ) 
            SELECT Stagione, AnnoStagione, TipologiaProdotto, @AmbienteGen, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Variante3, Variante4, Variante5, Tipologia, Variante, 0, 0, 0, 0, UtenteModifica, DataModifica, 0, 0, 0 
            FROM BudBudgetModelloVariante5 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @AmbienteDup
            
        END
        
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante5_Dup_INSERT] TO [Metodo98]
    AS [dbo];

