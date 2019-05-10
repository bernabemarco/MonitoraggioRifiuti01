
Create view TP_VISTACOEFFICIENTI_AB as 
select 
	codart,
	coddeposito,
	7000 as cod,(
	sum(num_per)*(sum(num_per)+1))/2 as sum_n,
	sum(t_anno) as sum_dati,
	(sum(num_per)*(sum(num_per)+1)*(2*sum(num_per)+1))/6 as sum_n_2,
	(select sum(p.somma_tdt) from TP_VISTAPARAMETRI_1 p where p.codart=a.codart group by p.codart) as sum_nxdati,
	power(((sum(num_per)*(sum(num_per)+1))/2),2) as sum_2_n,
	((sum(t_anno) - ((sum(num_per)*(select sum(p.somma_tdt) from TP_VISTAPARAMETRI_1 p where p.codart=a.codart group by p.codart)-(((sum(num_per)*(sum(num_per)+1))/2)*sum(t_anno)))/((sum(num_per)-((sum(num_per)*(sum(num_per)+1)*(2*sum(num_per)+1))/6))-power(((sum(num_per)*(sum(num_per)+1))/2),2))*((sum(num_per)*(sum(num_per)+1))/2)))/(sum(num_per)))as "a", 
	(sum(num_per)*(select sum(p.somma_tdt) from TP_VISTAPARAMETRI_1 p where p.codart=a.codart group by p.codart)-(((sum(num_per)*(sum(num_per)+1))/2)*sum(t_anno)))/((sum(num_per)-((sum(num_per)*(sum(num_per)+1)*(2*sum(num_per)+1))/6))-power(((sum(num_per)*(sum(num_per)+1))/2),2)) as "b",
	sum(num_per) as num_per,
	0 as z2,
	0 as z3,
	0 as z4,
	0 as z5,
	0 as z6,
	0 as z7,
	'parametri' as tipo
from TP_VISTAVENDITEANNIPRECEDENTI a 
where 
	esercizio<year(getdate())
group by 
	codart,
	coddeposito

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTACOEFFICIENTI_AB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTACOEFFICIENTI_AB] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VISTACOEFFICIENTI_AB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTACOEFFICIENTI_AB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTACOEFFICIENTI_AB] TO [Metodo98]
    AS [dbo];

