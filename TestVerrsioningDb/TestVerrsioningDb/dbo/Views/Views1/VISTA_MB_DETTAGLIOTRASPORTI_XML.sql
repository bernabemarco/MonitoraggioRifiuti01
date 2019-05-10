


CREATE VIEW [dbo].[VISTA_MB_DETTAGLIOTRASPORTI_XML] WITH SCHEMABINDING
AS
        SELECT DISTINCT idTesta
                ,IdRiga
            ,T.c.value('@IdRegola', 'SMALLINT') IdRegola
            ,T.c.value('@Cod', 'VARCHAR(5)') Codice
            ,T.c.value('@QtaTax', 'decimal(10,4)') QtaTax
            ,T.c.value('@Valore', 'decimal(19,6)') Valore
            ,T.c.value('@ValoreTot', 'decimal(19,6)') ValoreTot
            ,S.c.value('@QtaTot', 'Decimal(19,6)')  Qtatot
            ,S.c.value('@QtaUm', 'Decimal(19,6)')  QtaUm
        FROM    dbo.RIGHEDOCUMENTI_BUDGET
        CROSS APPLY
                trasporto.nodes('/Trasporto/td') AS T(c)    
        CROSS APPLY
                trasporto.nodes('/Trasporto') AS S(c)



GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MB_DETTAGLIOTRASPORTI_XML] TO [Metodo98]
    AS [dbo];

