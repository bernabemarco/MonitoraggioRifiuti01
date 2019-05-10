

CREATE VIEW dbo.TP_VISTAINDICISTAGIONALIZZAZIONE_WINTER
AS
Select
    codart as CodArticolo,
    coddeposito,
    ( case when (Totale * num_per)<> 0 Then ([1] / (Totale * num_per)) else 0 end) AS [D1], 
    ( case when (Totale * num_per)<> 0 Then ([2] / (Totale * num_per)) else 0 end) AS [D2], 
    ( case when (Totale * num_per)<> 0 Then ([3] / (Totale * num_per)) else 0 end) AS [D3], 
    ( case when (Totale * num_per)<> 0 Then ([4] / (Totale * num_per)) else 0 end) AS [D4], 
    ( case when (Totale * num_per)<> 0 Then ([5] / (Totale * num_per)) else 0 end) AS [D5], 
    ( case when (Totale * num_per)<> 0 Then ([6] / (Totale * num_per)) else 0 end) AS [D6], 
    ( case when (Totale * num_per)<> 0 Then ([7] / (Totale * num_per)) else 0 end) AS [D7], 
    ( case when (Totale * num_per)<> 0 Then ([8] / (Totale * num_per)) else 0 end) AS [D8], 
    ( case when (Totale * num_per)<> 0 Then ([9] / (Totale * num_per)) else 0 end) AS [D9], 
    ( case when (Totale * num_per)<> 0 Then ([10] / (Totale * num_per)) else 0 end) AS [D10], 
    ( case when (Totale * num_per)<> 0 Then ([11] / (Totale * num_per)) else 0 end) AS [D11], 
    ( case when (Totale * num_per)<> 0 Then ([12] / (Totale * num_per)) else 0 end) AS [D12],
    Totale,
    num_per
From
(
    Select 
        codart,
        coddeposito,
        ISNULL([1],0) As [1], 
        ISNULL([2],0) As [2], 
        ISNULL([3],0) As [3], 
        ISNULL([4],0) As [4], 
        ISNULL([5],0) As [5], 
        ISNULL([6],0) As [6], 
        ISNULL([7],0) As [7], 
        ISNULL([8],0) As [8], 
        ISNULL([9],0) As [9], 
        ISNULL([10],0) As [10], 
        ISNULL([11],0) As [11], 
        ISNULL([12],0) As [12],
        (ISNULL([1],0) + ISNULL([2],0) + ISNULL([3],0) + ISNULL([4],0)  + ISNULL([5],0)  + ISNULL([6],0) +
         ISNULL([7],0) + ISNULL([8],0) + ISNULL([9],0) + ISNULL([10],0) + ISNULL([11],0) + ISNULL([12],0)) As Totale,
        num_per
    from
    (
        select
            codart,
            coddeposito,
            sum(qta1um) as Venduto,
            (case when (month(datamov) - month(GETDATE())) < 0
                  then (12 - abs(month(datamov) - month(GETDATE())))
                  else (month(datamov) - month(GETDATE())) 
             end) + 1 As Periodo,
            num_per
        From
        (
            select 
                codart,
                coddeposito,
                DATAMOV,
                qta1um,
                12 as num_per
            from 
                storicomag
            Inner Join
                (
                    Select 
                        C.Items As Causale,
                        D.Items As Dcoumento
                    from 
                        SplitCCVMCAU('VEN') C,
                        SplitCCVMDOC('VEN') D
                ) PARAMETRI
            ON
                storicomag.CODCAUSALE = PARAMETRI.Causale AND
                storicomag.TIPODOC = PARAMETRI.Dcoumento
            where 
                DATAMOV BetWeen DATEADD(yy,-3,(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0))) and 
                                DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0))
        ) Venduti
        group by 
            codart,
            coddeposito,
            num_per,
            Month(Datamov)
    ) Venduti
    PIVOT
        (
            Max(Venduto)
            FOR Periodo IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
        ) PVT
) IndiciDestagionalizzazione

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAINDICISTAGIONALIZZAZIONE_WINTER] TO [Metodo98]
    AS [dbo];

