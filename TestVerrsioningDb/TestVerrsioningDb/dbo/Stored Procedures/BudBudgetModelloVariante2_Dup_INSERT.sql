
CREATE PROCEDURE BudBudgetModelloVariante2_Dup_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @AmbienteDup Decimal(5), @AmbienteGen Decimal(5), @Azzera INT) AS

BEGIN
    
    IF @Azzera = 0
        
        BEGIN
            
            INSERT INTO BudBudgetModelloVariante2 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino ) 
            SELECT Stagione, AnnoStagione, TipologiaProdotto, @AmbienteGen, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino 
            FROM BudBudgetModelloVariante2 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @AmbienteDup
            
        END
        
    ELSE
        
        BEGIN
            
            INSERT INTO BudBudgetModelloVariante2 ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Tipologia, Variante, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica, PrezzoMedio, ValoreListino, PrezzoMedioListino ) 
            SELECT Stagione, AnnoStagione, TipologiaProdotto, @AmbienteGen, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Variante1, Variante2, Tipologia, Variante, 0, 0, 0, 0, UtenteModifica, DataModifica, 0, 0, 0 
            FROM BudBudgetModelloVariante2 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @AmbienteDup
            
        END
        
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModelloVariante2_Dup_INSERT] TO [Metodo98]
    AS [dbo];

