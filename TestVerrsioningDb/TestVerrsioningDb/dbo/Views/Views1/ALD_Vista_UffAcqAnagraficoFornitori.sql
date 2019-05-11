﻿
CREATE VIEW [dbo].[ALD_Vista_UffAcqAnagraficoFornitori]
AS
SELECT     TABDITTE.DITTA, ANAGRAFICACF.CODCONTO, ANAGRAFICACF.DSCCONTO1, ANAGRAFICACF.INDIRIZZO, ANAGRAFICACF.CAP, 
                      ANAGRAFICACF.LOCALITA, ANAGRAFICACF.TELEFONO, ANAGRAFICACF.PARTITAIVA, ANAGRAFICACF.CODFISCALE
FROM         ANAGRAFICACF CROSS JOIN
                      TABDITTE
WHERE     (ANAGRAFICACF.TIPOCONTO = 'F')

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_UffAcqAnagraficoFornitori] TO [Metodo98]
    AS [dbo];
