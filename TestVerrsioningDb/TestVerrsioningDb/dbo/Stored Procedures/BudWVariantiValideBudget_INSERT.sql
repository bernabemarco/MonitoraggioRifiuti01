
CREATE PROCEDURE BudWVariantiValideBudget_INSERT(@NrTerminale Decimal(5), @Modello VarChar(50), @Tipologia VarChar(3), @Variante VarChar(8)) AS

BEGIN
    
    INSERT INTO BudWVariantiValideBudget ( NrTerminale, Modello, Tipologia, Variante ) 
    VALUES ( @NrTerminale, @Modello, @Tipologia, @Variante ) 
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudWVariantiValideBudget_INSERT] TO [Metodo98]
    AS [dbo];

