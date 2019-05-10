
CREATE PROCEDURE BudWVariantiValideBudget5_INSERT(@NrTerminale Decimal(5), @Modello VarChar(50), @Tipologia VarChar(3), @Variante VarChar(8), @Tipologia2 VarChar(3), @Variante2 VarChar(8), @Tipologia3 VarChar(3), @Variante3 VarChar(8), @Tipologia4 VarChar(3), @Variante4 VarChar(8), @Tipologia5 VarChar(3), @Variante5 VarChar(8)) AS

BEGIN
    
    INSERT INTO BudWVariantiValideBudget5 ( NrTerminale, Modello, Tipologia, Variante, Tipologia2, Variante2, Tipologia3, Variante3, Tipologia4, Variante4, Tipologia5, Variante5 ) 
    VALUES ( @NrTerminale, @Modello, @Tipologia, @Variante, @Tipologia2, @Variante2, @Tipologia3, @Variante3, @Tipologia4, @Variante4, @Tipologia5, @Variante5 ) 
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BudWVariantiValideBudget5_INSERT] TO [Metodo98]
    AS [dbo];

