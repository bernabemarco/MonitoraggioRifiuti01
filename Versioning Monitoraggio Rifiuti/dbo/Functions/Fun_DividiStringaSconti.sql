

CREATE FUNCTION [dbo].[Fun_DividiStringaSconti](@RifProgressivo Decimal(10,0))
    RETURNS @Result table 
                (IdTesta DECIMAL(10,0),
                  IdRiga INT,
                   Posizione INT,
                    ScontiEstesi varchar(50),
                     Segno varchar(1),
                      Sconto varchar(10),
                       PrezzoLordo decimal(19,6),
                        PrezzoNetto decimal(19,6)) 
AS 
BEGIN

DECLARE @IdTesta        DECIMAL(10,0)
    
    SET @IdTesta = @RifProgressivo;

    Insert Into @Result
    SELECT 
        R.IDTESTA,
        R.IDRIGA,
        ROW_NUMBER() OVER(PARTITION BY R.IDTESTA,R.IDRIGA ORDER BY R.IDTESTA,R.IDRIGA) AS POSIZIONE,
        R.SCONTIESTESI,
        (CASE WHEN PATINDEX('(%)',S.Item) <> 0 THEN '-' ELSE '+' END) AS SEGNO,
        REPLACE(REPLACE(S.Item,')',''),'(','') AS SCONTO,
        R.PREZZOUNITLORDO,
        R.PREZZOUNITNETTO
    FROM 
        RigheDocumenti R
    INNER JOIN
        TESTEDOCUMENTI TD
    ON
        TD.PROGRESSIVO = R.IDTESTA
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
        dbo.SplitStrings_CTE(ISNULL(NULLIF(R.SCONTIESTESI,''),'0'),'+') S
    where 
        ((R.IDTESTA = @IdTesta) OR(@IdTesta = 0))
        And R.TIPORIGA in ('N','O')

RETURN 

END 


GO
GRANT SELECT
    ON OBJECT::[dbo].[Fun_DividiStringaSconti] TO [Metodo98]
    AS [dbo];

