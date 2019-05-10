﻿CREATE VIEW VISTASTAMPALETTERERIEMISS AS
SELECT 
   VS.*,
   (SELECT INDIRIZZO FROM ANAGRAFICACF WHERE CODCONTO=VS.CODCLIFOR) AS INDIRIZZO,
   (SELECT CAP FROM ANAGRAFICACF WHERE CODCONTO=VS.CODCLIFOR) AS CAP,
   (SELECT LOCALITA FROM ANAGRAFICACF WHERE CODCONTO=VS.CODCLIFOR) AS LOCALITA,
   (SELECT PROVINCIA FROM ANAGRAFICACF WHERE CODCONTO=VS.CODCLIFOR) AS PROVINCIA,
   (SELECT DESCRIZIONE FROM TABNAZIONI WHERE CODICE=VS.NAZIONE) AS DSCNAZIONE,
   (SELECT DATASCADENZA FROM TABSCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS DATASCADRIEMISS,
   (SELECT DATAFATTURA FROM TABSCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS DATAFATTRIEMISS,
   (SELECT NUMEROPROT FROM TABSCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS NUMPROTRIEMISS,
   (SELECT NUMRIF FROM TABSCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS NUMRIFRIEMISS,
   (SELECT DSCESITO FROM VISTASCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS DSCESITORIEMISS,
   (SELECT ESITO FROM TABSCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS ESITORIEMISS,
   (SELECT IMPORTOSCADEURO FROM VISTASCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS IMPSCADEURORIEMISS,
   (SELECT IMPORTOSCADLIRE FROM VISTASCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS IMPSCADLIRERIEMISS,
   (SELECT IMPORTOSCADVALUTA FROM VISTASCADENZE WHERE PROGRESSIVO=VS.RIFSCADRIEMISSIONE) AS IMPSCADVALRIEMISS
   FROM VISTASCADENZE VS 

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTAMPALETTERERIEMISS] TO [Metodo98]
    AS [dbo];

