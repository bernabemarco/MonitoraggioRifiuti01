
CREATE PROCEDURE BudWVariantiValideBudget3_INSERT(@NrTerminale Decimal(5), @Modello VarChar(50), @Tipologia VarChar(3), @Variante VarChar(8), @Tipologia2 VarChar(3), @Variante2 VarChar(8), @Tipologia3 VarChar(3), @Variante3 VarChar(8)) AS

BEGIN
    
    INSERT INTO BudWVariantiValideBudget3 ( NrTerminale, Modello, Tipologia, Variante, Tipologia2, Variante2, Tipologia3, Variante3 ) 
    VALUES ( @NrTerminale, @Modello, @Tipologia, @Variante, @Tipologia2, @Variante2, @Tipologia3, @Variante3 ) 
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudWVariantiValideBudget3_INSERT] TO [Metodo98]
    AS [dbo];

