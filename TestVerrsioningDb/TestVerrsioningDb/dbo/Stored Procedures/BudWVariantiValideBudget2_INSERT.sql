
CREATE PROCEDURE BudWVariantiValideBudget2_INSERT(@NrTerminale Decimal(5), @Modello VarChar(50), @Tipologia VarChar(3), @Variante VarChar(8), @Tipologia2 VarChar(3), @Variante2 VarChar(8)) AS

BEGIN
    
    INSERT INTO BudWVariantiValideBudget2 ( NrTerminale, Modello, Tipologia, Variante, Tipologia2, Variante2 ) 
    VALUES ( @NrTerminale, @Modello, @Tipologia, @Variante, @Tipologia2, @Variante2 ) 
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudWVariantiValideBudget2_INSERT] TO [Metodo98]
    AS [dbo];

