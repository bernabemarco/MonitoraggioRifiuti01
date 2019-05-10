

CREATE FUNCTION [dbo].[Fun_DividiStringaScontiExt](@RifProgressivo Decimal(10,0))
    RETURNS @Result table 
                (IdTesta DECIMAL(10,0),
                  IdRiga INT,
                   Posizione INT,
                    ScontiEstesi varchar(50),
                     Segno varchar(1),
                      Sconto varchar(10),
                       PrezzoLordo decimal(19,6),
                        PrezzoNetto decimal(19,6),
                         PrezzoNettoPosizione decimal(19,6),
                          ValoreSconto decimal(19,6)) 
AS 
BEGIN

DECLARE @Table table 
                (IdTesta DECIMAL(10,0),
                  IdRiga INT,
                   Posizione INT,
                    ScontiEstesi varchar(50),
                     Segno varchar(1),
                      Sconto varchar(10),
                       PrezzoLordo decimal(19,6),
                        PrezzoNetto decimal(19,6));

DECLARE @IdTesta        DECIMAL(10,0)
    
    SET @IdTesta = @RifProgressivo;

    INSERT INTO @Table
    SELECT * FROM [dbo].[Fun_DividiStringaSconti](@IdTesta);

    WITH CTE_SCONTO(IDTESTA,IDRIGA,POSIZIONE,SCONTIESTESI,SEGNO,SCONTO,PREZZOLORDO,PREZZONETTO,PREZZONETTOPOSIZIONE,VALORESCONTO)
    AS
    (
        SELECT 
            V1.IdTesta,
            V1.IdRiga,
            V1.Posizione,
            V1.ScontiEstesi,
            V1.Segno,
            V1.Sconto,
            V1.PrezzoLordo, 
            V1.PrezzoNetto,
            CAST((
            CASE V1.Segno
                WHEN '+' THEN (V1.PrezzoLordo - (V1.PrezzoLordo * (dbo.FunCalcSconti(V1.Sconto) / 100))) 
                WHEN '-' THEN (V1.PrezzoLordo + (V1.PrezzoLordo * (dbo.FunCalcSconti(V1.Sconto) / 100))) 
            END
            ) AS DECIMAL(19,6)) AS PrezzoNettoPosizione,
            CAST((V1.PrezzoLordo * (dbo.FunCalcSconti(V1.Sconto) / 100)) AS DECIMAL(19,6)) AS ValoreSconto
        FROM 
            @Table V1
        WHERE
            V1.Posizione = 1 
        UNION ALL
        SELECT 
            V2.IdTesta,
            V2.IdRiga,
            V2.Posizione,
            V2.ScontiEstesi,
            V2.Segno,
            V2.Sconto,
            CTE_SCONTO.PrezzoNettoPosizione AS PrezzoLordo, 
            V2.PrezzoNetto,
            CAST((
            CASE V2.Segno
                WHEN '+' THEN (CTE_SCONTO.PrezzoNettoPosizione - (CTE_SCONTO.PrezzoNettoPosizione * (dbo.FunCalcSconti(V2.Sconto) / 100)))
                WHEN '-' THEN (CTE_SCONTO.PrezzoNettoPosizione + (CTE_SCONTO.PrezzoNettoPosizione * (dbo.FunCalcSconti(V2.Sconto) / 100))) 
            END
            ) AS DECIMAL(19,6))  AS PrezzoNettoPosizione,
            CAST((CTE_SCONTO.PrezzoNettoPosizione * (dbo.FunCalcSconti(V2.Sconto) / 100)) AS DECIMAL(19,6)) AS ValoreSconto
        FROM 
            @Table V2
        INNER JOIN
            CTE_SCONTO
        ON 
            V2.IDTESTA = CTE_SCONTO.IDTESTA AND V2.IDRIGA = CTE_SCONTO.IDRIGA AND V2.POSIZIONE = (CTE_SCONTO.POSIZIONE + 1)
    )
    Insert Into @Result
    Select * From CTE_SCONTO 

RETURN 

END 


GO
GRANT SELECT
    ON OBJECT::[dbo].[Fun_DividiStringaScontiExt] TO [Metodo98]
    AS [dbo];

