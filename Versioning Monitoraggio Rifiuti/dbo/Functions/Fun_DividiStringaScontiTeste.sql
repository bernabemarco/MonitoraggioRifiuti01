

CREATE FUNCTION [dbo].[Fun_DividiStringaScontiTeste](@RifProgressivo Decimal(10,0))
    RETURNS @Result table 
                (Progressivo DECIMAL(10,0),
                  Posizione INT,
                   ScontoFinale varchar(50),
                    Segno varchar(1),
                     Sconto varchar(10),
                      ImponibileLordo decimal(19,6),
                       ImponibileNetto decimal(19,6)) 
AS 
BEGIN

DECLARE @Progressivo        DECIMAL(10,0)
    
    SET @Progressivo = @RifProgressivo;

    Insert Into @Result
    SELECT 
        TD.Progressivo,
        ROW_NUMBER() OVER(PARTITION BY TD.PROGRESSIVO ORDER BY TD.PROGRESSIVO) AS POSIZIONE,
        TD.SCONTOFINALE,
        (CASE WHEN PATINDEX('(%)',S.Item) <> 0 THEN '-' ELSE '+' END) AS SEGNO,
        REPLACE(REPLACE(S.Item,')',''),'(','') AS SCONTO,
        TD.TOTMERCE     As IMPONIBILELORDO,
        TD.TOTIMPONIBILE As IMPONIBILENETTO
    FROM
        TESTEDOCUMENTI TD
    INNER JOIN
        TabEserciziEuritmo TEE
    ON
        TEE.CODICE = TD.ESERCIZIO
    INNER JOIN
        TabCliforEuritmo TCE
    ON
        TCE.CODICE = TD.CODCLIFOR
    INNER JOIN
        TabDocumentiEuritmo TDE
    ON
      TDE.CODICE = TD.TIPODOC   
    CROSS APPLY
        dbo.SplitStrings_CTE(ISNULL(NULLIF(TD.SCONTOFINALE,''),'0'),'+') S
    where 
        ((TD.Progressivo = @Progressivo) OR (@Progressivo = 0))

RETURN 

END 


GO
GRANT SELECT
    ON OBJECT::[dbo].[Fun_DividiStringaScontiTeste] TO [Metodo98]
    AS [dbo];

