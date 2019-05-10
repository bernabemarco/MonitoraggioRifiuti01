
CREATE VIEW [dbo].[ALD_Vista_tempStpAnalisiRedditivitaCommCont]
AS
SELECT    idAnalisi
from 
ALD_tempStpAnalisiRedditivitaCommCont
group by IdAnalisi

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_tempStpAnalisiRedditivitaCommCont] TO [Metodo98]
    AS [dbo];

