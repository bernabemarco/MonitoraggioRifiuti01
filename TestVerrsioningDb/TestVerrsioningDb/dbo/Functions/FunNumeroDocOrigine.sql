

CREATE FUNCTION [dbo].[FunNumeroDocOrigine](@ProgressivoRP Decimal(10,0),@IdRigaRP INT)
RETURNS Varchar(18)
AS
BEGIN

DECLARE @NumeroOrdine Varchar(18)
	
	SET @NumeroOrdine = 0;

	WITH cte
    AS ( SELECT RD.TIPODOC AS Doc ,
                RD.NUMERODOC AS Num ,
				IDTESTA AS Progressivo,
                RD.TIPODOC ,
                RD.NUMERODOC ,
                RD.IDTESTARP ,
                RD.IDRIGARP ,
                0 AS level,
                TD.DATADOC,
                TD.NUMRIFDOC,
                TD.DATARIFDOC
        FROM     RIGHEDOCUMENTI RD INNER JOIN TESTEDOCUMENTI TD ON RD.IDTESTA=TD.PROGRESSIVO
        WHERE    IDTESTA = @ProgressivoRP AND IDRIGA = @IdRigaRP
        UNION ALL
        SELECT  cte.TIPODOC AS Doc ,
                cte.NUMERODOC AS Num ,
				R2.IDTESTA AS Progressivo,
                R2.TIPODOC ,
                R2.NUMERODOC ,
                R2.IDTESTARP ,
                R2.IDRIGARP ,
                cte.level + 1,
                T2.DATADOC,
                T2.NUMRIFDOC,
                T2.DATARIFDOC
        FROM     RIGHEDOCUMENTI R2 INNER JOIN TESTEDOCUMENTI T2 ON R2.IDTESTA=T2.PROGRESSIVO
                INNER JOIN cte ON cte.IDTESTARP = r2.IDTESTA AND cte.IDRIGARP = r2.IDRIGA
        )
    SELECT @NumeroOrdine = NUMERODOC FROM cte INNER JOIN (select max(level) as level from cte) cte_g on cte_g.level = cte.level

	RETURN(@NumeroOrdine)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunNumeroDocOrigine] TO [Metodo98]
    AS [dbo];

