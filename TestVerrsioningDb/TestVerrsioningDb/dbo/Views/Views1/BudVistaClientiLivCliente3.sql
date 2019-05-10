CREATE VIEW BudVistaClientiLivCliente3 AS 
    SELECT VISTACLIENTI.*, 
           (SELECT TipoClienteBudget FROM ANAGRAFICACF WHERE ANAGRAFICACF.CODCONTO = VISTACLIENTI.CODCONTO) AS TipoClienteBudget, 
           (SELECT BudTipoClienteBudget.Descrizione FROM ANAGRAFICACF INNER JOIN BudTipoClienteBudget 
           ON ANAGRAFICACF.TipoClienteBudget = BudTipoClienteBudget.Codice 
           WHERE ANAGRAFICACF.CODCONTO = VISTACLIENTI.CODCONTO) AS DesTipoClienteBudget 
    FROM VISTACLIENTI 
    WHERE (SELECT TipoClienteBudget FROM ANAGRAFICACF WHERE ANAGRAFICACF.CODCONTO = VISTACLIENTI.CODCONTO) <> ''

GO
GRANT SELECT
    ON OBJECT::[dbo].[BudVistaClientiLivCliente3] TO [Metodo98]
    AS [dbo];

