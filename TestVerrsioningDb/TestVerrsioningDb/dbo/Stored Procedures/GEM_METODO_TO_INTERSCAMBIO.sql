﻿
CREATE PROCEDURE [dbo].[GEM_METODO_TO_INTERSCAMBIO] (@AZRIF as varchar(3)) AS
BEGIN
	EXEC GEM_METSIC_TO_INTERSCAMBIO
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_METODO_TO_INTERSCAMBIO] TO [Metodo98]
    AS [dbo];
