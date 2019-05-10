


CREATE VIEW [dbo].[VISTA_MB_DETTAGLIOSCONTIESTESI_XML] WITH SCHEMABINDING
AS
        SELECT DISTINCT  idTesta
                ,IdRiga
            ,T.c.value('@codsconto', 'VARCHAR(5)') Codice
            ,T.c.value('@sconto', 'VARCHAR(max)') Sconto
            ,T.c.value('@tipo', 'CHAR') Tipo
            ,T.c.value('@valsconto', 'decimal(19,6)') Valore
        FROM    dbo.RIGHEDOCUMENTI_BUDGET
        CROSS APPLY
                Sconti.nodes('/scontiestesi/ds') AS T(c)    




GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MB_DETTAGLIOSCONTIESTESI_XML] TO [Metodo98]
    AS [dbo];

