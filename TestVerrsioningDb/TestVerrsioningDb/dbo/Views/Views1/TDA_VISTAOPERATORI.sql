﻿create view TDA_VISTAOPERATORI as 
	select CODICE,(NOME + ' ' + COGNOME) as NOMECOMPLETO,NUMEROBADGE 
	from TABELLADIPENDENTI

GO
GRANT SELECT
    ON OBJECT::[dbo].[TDA_VISTAOPERATORI] TO [Metodo98]
    AS [dbo];

