

Create view [dbo].[TP_VISTAVENDITEANNIPRECEDENTI] 
as
select 
    strm.codart,
    strm.coddeposito,
    strm.esercizio,
    sum(case when month(strm.datamov)= 1 then strm.qta1um else 0 end) as "1",
    sum(case when month(strm.datamov)= 2 then strm.qta1um else 0 end) as "2",
    sum(case when month(strm.datamov)= 3 then strm.qta1um else 0 end) as "3",
    sum(case when month(strm.datamov)= 4 then strm.qta1um else 0 end) as "4",
    sum(case when month(strm.datamov)= 5 then strm.qta1um else 0 end) as "5",
    sum(case when month(strm.datamov)= 6 then strm.qta1um else 0 end) as "6",
    sum(case when month(strm.datamov)= 7 then strm.qta1um else 0 end) as "7",
    sum(case when month(strm.datamov)= 8 then strm.qta1um else 0 end) as "8",
    sum(case when month(strm.datamov)= 9 then strm.qta1um else 0 end) as "9",
    sum(case when month(strm.datamov)= 10 then strm.qta1um else 0 end) as "10",
    sum(case when month(strm.datamov)= 11 then strm.qta1um else 0 end) as "11",
    sum(case when month(strm.datamov)= 12 then strm.qta1um else 0 end) as "12",
    sum(strm.qta1um) as t_anno,12 as num_per
from 
    storicomag strm
inner join
    TP_ExtraMag x
on
    x.CodArt = strm.CODART
where
    x.ConsidAcq = 1 and    
    strm.CodCausale In(Select Items from SplitCCVMCAU('VEN')) And
    strm.TipoDoc In(Select Items from SplitCCVMDOC('VEN'))
group by 
    strm.codart,
    strm.coddeposito,
    strm.esercizio


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAVENDITEANNIPRECEDENTI] TO [Metodo98]
    AS [dbo];

