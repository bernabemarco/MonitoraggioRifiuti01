﻿CREATE VIEW ALD_VISTA_COERENZACONTO AS 
    SELECT codconto,CodSap,(SELECT NaturaConto from consmfm..CONS_ALD_PDC_MFM AS PDC WHERE PDC.CodSap=EXG.CodSap) as NatPdcMFM
    FROM EXTRAGENERICI as EXG

GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_VISTA_COERENZACONTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_VISTA_COERENZACONTO] TO [Metodo98]
    AS [dbo];

