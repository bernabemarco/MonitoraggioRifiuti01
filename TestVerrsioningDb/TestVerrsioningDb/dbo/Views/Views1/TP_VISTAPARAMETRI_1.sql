
Create view TP_VISTAPARAMETRI_1 
as

select 
	a.codart,
	a.coddeposito,
	a.esercizio,
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-1))*"1"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-2))*"2"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-3))*"3"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-4))*"4"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-5))*"5"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-6))*"6"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-7))*"7"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-8))*"8"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-9))*"9"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-10))*"10"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-11))*"11"+
	((select sum(num_per) from TP_VISTAVENDITEANNIPRECEDENTI b where b.codart=a.codart and b.coddeposito=a.coddeposito and b.esercizio<year(getdate()) group by codart,coddeposito)-(((year(getdate())- a.esercizio)*12)-12))*"12" as somma_tdt
from 
	TP_VISTAVENDITEANNIPRECEDENTI a 
where  
	a.esercizio<year(getdate())

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTAPARAMETRI_1] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTAPARAMETRI_1] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VISTAPARAMETRI_1] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAPARAMETRI_1] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTAPARAMETRI_1] TO [Metodo98]
    AS [dbo];

