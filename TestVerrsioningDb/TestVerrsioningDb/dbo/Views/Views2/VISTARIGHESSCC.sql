﻿create view VISTARIGHESSCC as
	select 		
		RDOC.IDTESTA as IDTESTADOCUMENTO,
		RDOC.IDRIGA as IDRIGADOCUMENTO,
		SSCC.SSCC as BARCODESSCC,
		RDOC.CODART as CODICEPRODOTTO,
		ART.BARCODE as BARCODEPRODOTTO,
		ART.DESCRIZIONE as DESCRIZIONEPRODOTTO,
		SSCC.QTAGEST as QUANTITAPRODOTTO,
		RDOC.NRRIFPARTITA as LOTTO,		
		right('0000' + cast(day(RDOC.DATACONSEGNA) as varchar(2)),2) + right('0000' + cast(month(RDOC.DATACONSEGNA) as varchar(2)),2) + substring(cast(year(RDOC.DATACONSEGNA) as varchar(4)),3,2) as SCADENZA
	from ((RIGHEDOCUMENTI RDOC inner join TABLEGAMISSCC SSCC
		on RDOC.IDTESTA=SSCC.IDTESTA and RDOC.IDRIGA=SSCC.IDRIGA)
		inner join VISTAANAGRAFICAARTICOLI ART on ART.CODICE=RDOC.CODART)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARIGHESSCC] TO [Metodo98]
    AS [dbo];

