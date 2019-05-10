
CREATE PROCEDURE BudBudgetCliente_Dup_INSERT(@Stagione VarChar(3), @AnnoStagione VarChar(3), @TipologiaProdotto VarChar(5), @AmbienteDup Decimal(5), @AmbienteGen Decimal(5), @Azzera INT) AS

BEGIN
    
    IF @Azzera = 0
        
        BEGIN
            
            INSERT INTO BudBudgetCliente ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Cliente, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
            SELECT Stagione, AnnoStagione, TipologiaProdotto, @AmbienteGen, TipoCliente, Cliente, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica 
            FROM BudBudgetCliente 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @AmbienteDup
            
        END
        
    ELSE
        
        BEGIN
            
            INSERT INTO BudBudgetCliente ( Stagione, AnnoStagione, TipologiaProdotto, Ambiente, TipoCliente, Cliente, Quantita, Percentuale, Valore, PercentualeV, UtenteModifica, DataModifica ) 
            SELECT Stagione, AnnoStagione, TipologiaProdotto, @AmbienteGen, TipoCliente, Cliente, 0, 0, 0, 0, UtenteModifica, DataModifica 
            FROM BudBudgetCliente 
            WHERE Stagione = @Stagione AND AnnoStagione = @AnnoStagione AND TipologiaProdotto = @TipologiaProdotto AND Ambiente = @AmbienteDup
            
        END
        
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudBudgetCliente_Dup_INSERT] TO [Metodo98]
    AS [dbo];

