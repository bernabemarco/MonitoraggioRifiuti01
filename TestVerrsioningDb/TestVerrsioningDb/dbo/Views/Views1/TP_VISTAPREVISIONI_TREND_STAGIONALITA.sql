

CREATE view dbo.TP_VISTAPREVISIONI_TREND_STAGIONALITA 
as
select 
    *,
    'Dati' as tipo   
from 
    TP_VISTAVENDITEANNIPRECEDENTI 
where 
    esercizio<year(getdate())
union all
select 
    codart,
    coddeposito,
    3000,
    sum([1]),sum([2]),sum([3]),sum([4]),
    sum([5]),sum([6]),sum([7]),sum([8]),
    sum([9]),sum([10]),sum([11]),sum([12]),sum(t_anno),sum(num_per),
    'Totali'
from 
    TP_VISTAVENDITEANNIPRECEDENTI 
where 
    esercizio<year(getdate())
group by 
    codart,
    coddeposito
union all
select 
    codart,
    coddeposito,
    4000,
    avg([1]),avg([2]),avg([3]),avg([4]),
    avg([5]),avg([6]),avg([7]),avg([8]),
    avg([9]),avg([10]),avg([11]),avg([12]),avg(t_anno),0,
    'Medie'
from 
    TP_VISTAVENDITEANNIPRECEDENTI 
where 
    esercizio<year(getdate())
group by 
    codart,
    coddeposito
union all
select 
    codart,
    coddeposito,
    5000,0,0,0,0,0,0,0,0,0,0,0,0,
    (avg([1])+avg([2])+avg([3])+avg([4])+
     avg([5])+avg([6])+avg([7])+avg([8])+
     avg([9])+avg([10])+avg([11])+avg([12]))/12,0,
     'Media_Medie'
from 
    TP_VISTAVENDITEANNIPRECEDENTI 
where 
    esercizio<year(getdate())
group by 
    codart,
    coddeposito
union all
select 
    * 
from 
    TP_VISTAINDICISTAGIONALIZZAZIONE_MINIMIQUADRATI --where codart='1702#10' 
union all
select 
    * 
from 
    TP_VISTACOEFFICIENTI_AB --where codart='1702#10'
union all
select 
    a.codart,
    a.coddeposito,
    8000 as cod,
    s1*([a]+[b]*(num_per+1)) as "1",
    s2*([a]+[b]*(num_per+2)) as "2",
    s3*([a]+[b]*(num_per+3)) as "3",
    s4*([a]+[b]*(num_per+4)) as "4",
    s5*([a]+[b]*(num_per+5)) as "5",
    s6*([a]+[b]*(num_per+6)) as "6",
    s7*([a]+[b]*(num_per+7)) as "7",
    s8*([a]+[b]*(num_per+8)) as "8",
    s9*([a]+[b]*(num_per+9)) as "9",
    s10*([a]+[b]*(num_per+10)) as "11",
    s11*([a]+[b]*(num_per+11)) as "11",
    s12*([a]+[b]*(num_per+12)) as "12",
    s1*([a]+[b]*(num_per+1)) +
    s2*([a]+[b]*(num_per+2)) +
    s3*([a]+[b]*(num_per+3)) +
    s4*([a]+[b]*(num_per+4)) +
    s5*([a]+[b]*(num_per+5)) +
    s6*([a]+[b]*(num_per+6)) +
    s7*([a]+[b]*(num_per+7)) +
    s8*([a]+[b]*(num_per+8)) +
    s9*([a]+[b]*(num_per+9)) +
    s10*([a]+[b]*(num_per+10)) +
    s11*([a]+[b]*(num_per+11)) +
    s12*([a]+[b]*(num_per+12)) as t_anno,
    0,
    'previsioni' as tipo
from 
    TP_VISTACOEFFICIENTI_AB a
inner join 
    TP_VISTAINDICISTAGIONALIZZAZIONE_MINIMIQUADRATI b 
    on a.codart=b.codart and a.coddeposito=b.coddeposito

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAPREVISIONI_TREND_STAGIONALITA] TO [Metodo98]
    AS [dbo];

