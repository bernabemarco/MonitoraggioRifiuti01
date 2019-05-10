
CREATE FUNCTION [dbo].[Fun_DividiStringaScontiTesteExt](@RifProgressivo Decimal(10,0))
    RETURNS @Result table 
                (Progressivo DECIMAL(10,0),
                  Totale INT,
                   Posizione INT,
                    ScontoFinale varchar(50),
                     Segno varchar(1),
                      Sconto varchar(10),
                       ImponibileLordo decimal(19,6),
                        ImponibileNetto decimal(19,6),
                         ImponibileNettoPosizione decimal(19,6),
                          ValoreSconto decimal(19,6)) 
AS 
BEGIN

DECLARE @Table table 
                (Progressivo DECIMAL(10,0),
                 Posizione INT,
                  ScontoFinale varchar(50),
                   Segno varchar(1),
                    Sconto varchar(10),
                     ImponibileLordo decimal(19,6),
                      ImponibileNetto decimal(19,6)) 

DECLARE @Progressivo        DECIMAL(10,0)
                
        SET @Progressivo = @RifProgressivo;

        INSERT INTO @Table(Progressivo,Posizione,ScontoFinale,Segno,Sconto,ImponibileLordo,ImponibileNetto)
        Select Progressivo,Posizione,ScontoFinale,Segno,Sconto,ImponibileLordo,ImponibileNetto from [dbo].[Fun_DividiStringaScontiTeste](@RifProgressivo);

        WITH CTE_SCONTO(PROGRESSIVO,POSIZIONE,SCONTOFINALE,SEGNO,SCONTO,IMPONIBILELORDO,IMPONIBILENETTO,IMPONIBILENETTOPOSIZIONE,VALORESCONTO)
        AS
        (
           SELECT 
               V1.Progressivo,
               V1.Posizione,
               V1.ScontoFinale,
               V1.Segno,
               V1.Sconto,
               V1.ImponibileLordo, 
               V1.ImponibileNetto,
               CAST((
               CASE V1.Segno
                               WHEN '+' THEN (V1.ImponibileLordo - (V1.ImponibileLordo * (dbo.FunCalcSconti(V1.Sconto) / 100))) 
                               WHEN '-' THEN (V1.ImponibileNetto + (V1.ImponibileNetto * (dbo.FunCalcSconti(V1.Sconto) / 100))) 
               END
               ) AS DECIMAL(19,6)) AS PrezzoNettoPosizione,
               CAST((V1.ImponibileLordo * (dbo.FunCalcSconti(V1.Sconto) / 100)) AS DECIMAL(19,6)) AS ValoreSconto
           FROM 
               @Table V1
           WHERE
               V1.Posizione = 1
           UNION ALL
           SELECT 
               V2.Progressivo,
               V2.Posizione,
               V2.ScontoFinale,
               V2.Segno,
               V2.Sconto,
               CTE_SCONTO.IMPONIBILENETTOPOSIZIONE AS ImponibileLordo, 
               V2.ImponibileNetto,
               CAST((
               CASE V2.Segno
                               WHEN '+' THEN (CTE_SCONTO.ImponibileNettoPosizione - (CTE_SCONTO.ImponibileNettoPosizione * (dbo.FunCalcSconti(V2.Sconto) / 100)))
                               WHEN '-' THEN (CTE_SCONTO.ImponibileNettoPosizione + (CTE_SCONTO.ImponibileNettoPosizione * (dbo.FunCalcSconti(V2.Sconto) / 100))) 
               END
               ) AS DECIMAL(19,6))  AS PrezzoNettoPosizione,
               CAST((CTE_SCONTO.ImponibileNettoPosizione * (dbo.FunCalcSconti(V2.Sconto) / 100)) AS DECIMAL(19,6)) AS ValoreSconto
           FROM 
               @Table V2
           INNER JOIN
               CTE_SCONTO
           ON 
               V2.Progressivo = CTE_SCONTO.PROGRESSIVO AND V2.POSIZIONE = (CTE_SCONTO.POSIZIONE + 1)
        )
        Insert Into @Result(Progressivo,Totale,Posizione,ScontoFinale,Segno,Sconto,ImponibileLordo,ImponibileNetto,ImponibileNettoPosizione,ValoreSconto)
        Select PROGRESSIVO,COUNT(PROGRESSIVO) Over(Partition By PROGRESSIVO) As Totale,POSIZIONE,SCONTOFINALE,SEGNO,SCONTO,IMPONIBILELORDO,IMPONIBILENETTO,IMPONIBILENETTOPOSIZIONE,VALORESCONTO
        from
        (
            Select PROGRESSIVO,POSIZIONE,SCONTOFINALE,SEGNO,SCONTO,IMPONIBILELORDO,IMPONIBILENETTO,IMPONIBILENETTOPOSIZIONE,VALORESCONTO From CTE_SCONTO 
            Union
            Select Distinct (CASE WHEN T.TOTSPESETRASP <> 0 THEN T.Progressivo ELSE 0 END) as Progressivo,(S.Posizione + ROW_NUMBER() OVER(PARTITION BY T.PROGRESSIVO ORDER BY T.Progressivo)),'','-','',0,T.TOTIMPONIBILEEURO as IMPONIBILENETTO,0,(CASE WHEN T.TOTSPESETRASP <> 0 THEN T.TOTSPESETRASP ELSE 0 END) as VALORESCONTO 
            From TESTEDOCUMENTI T 
            Inner Join (select Progressivo,Max(Posizione) As Posizione from CTE_SCONTO Group by Progressivo) S ON T.PROGRESSIVO = S.Progressivo
        ) q
RETURN 

END 


GO
GRANT SELECT
    ON OBJECT::[dbo].[Fun_DividiStringaScontiTesteExt] TO [Metodo98]
    AS [dbo];

