
CREATE PROCEDURE BudBudgetModello_Dup_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @AmbienteDup Decimal(5), @AmbienteGen Decimal(5), @Azzera INT) AS

BEGIN
    
    IF @Azzera = 0
        
        BEGIN
            
            INSERT INTO BudBudgetModello ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Quantita, Percentuale, Valore, PercentualeV, PrezzoMedio, UtenteModifica, DataModifica ) 
            SELECT Stagione, AnnoStagione, TipologiaProdotto, @AmbienteGen, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Quantita, Percentuale, Valore, PercentualeV, PrezzoMedio, UtenteModifica, DataModifica 
            FROM BudBudgetModello 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @AmbienteDup
            
        END
        
    ELSE
        
        BEGIN
            
            INSERT INTO BudBudgetModello ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, Quantita, Percentuale, Valore, PercentualeV, PrezzoMedio, UtenteModifica, DataModifica ) 
            SELECT Stagione, AnnoStagione, TipologiaProdotto, @AmbienteGen, TipoCliente, Famiglia, TipoBudget, ModelloBudget, Modello, 0, 0, 0, 0, 0, UtenteModifica, DataModifica 
            FROM BudBudgetModello 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @AmbienteDup
            
        END
        
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetModello_Dup_INSERT] TO [Metodo98]
    AS [dbo];

