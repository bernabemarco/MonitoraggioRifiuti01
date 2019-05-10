

CREATE VIEW [dbo].[VISTA_MB_DETTAGLIOCONTRATTI_XML] WITH SCHEMABINDING
AS
        SELECT DISTINCT  idTesta
                ,IdRiga
            ,T.c.value('@progressivo', 'decimal(10,0)') ProgressivoContratti
            ,T.c.value('@codice', 'NVARCHAR(5)') Codice
            ,T.c.value('@valore', 'decimal(19,6)') Valore
        FROM    dbo.RIGHEDOCUMENTI_BUDGET
        CROSS APPLY
                contratti.nodes('/contratti/rc') AS T(c)    




GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MB_DETTAGLIOCONTRATTI_XML] TO [Metodo98]
    AS [dbo];

