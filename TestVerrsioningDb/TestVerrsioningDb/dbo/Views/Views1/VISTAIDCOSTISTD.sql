﻿	create view [dbo].[VISTAIDCOSTISTD]
	as select IDCOSTO,TIPOCOSTO,max(DESCRIZIONE) as DESCRIZIONE
		from TABCOSTIPRODOTTO 
	group by IDCOSTO,TIPOCOSTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAIDCOSTISTD] TO [Metodo98]
    AS [dbo];
