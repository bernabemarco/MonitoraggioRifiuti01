﻿create view VISTAANALISILISTEMOVIMP as
select 
	TEMPANALISILISTEMOV.IDSESSIONE,TEMPANALISILISTEMOV.IDTESTALISTA,TEMPANALISILISTEMOV.IDRIGALISTA,
	TESTELISTAMOV.CODICELISTA,TESTELISTAMOV.ESERCIZIO as ANNOLISTA,TESTELISTAMOV.NUMEROLISTA,
	TEMPANALISILISTEMOV.IDTESTACOMM,TEMPANALISILISTEMOV.IDRIGAORD,TEMPANALISILISTEMOV.IDRIGAIMPEGNO,
	TESTEORDINIPROD.TIPOCOM,TESTEORDINIPROD.ESERCIZIO as ANNOCOM,TESTEORDINIPROD.NUMEROCOM,RIGHEORDPROD.CODICEORD,
	TEMPANALISILISTEMOV.ARTICOLO,IMPEGNIORDPROD.DESCRIZIONEART,
	TEMPANALISILISTEMOV.QTALISTA,TEMPANALISILISTEMOV.QTAPROPOSTA,RIGHELISTAMOV.UMGEST,
	TEMPANALISILISTEMOV.FLAGSELEZIONA,TEMPANALISILISTEMOV.FLAGAZIONE
from 
	((TEMPANALISILISTEMOV inner join 
		(TESTEORDINIPROD inner join 
			(RIGHEORDPROD inner join IMPEGNIORDPROD on RIGHEORDPROD.IDTESTA=IMPEGNIORDPROD.IDTESTA and RIGHEORDPROD.IDRIGA=IMPEGNIORDPROD.IDRIGA)
				on TESTEORDINIPROD.PROGRESSIVO=RIGHEORDPROD.IDTESTA) 
		on TEMPANALISILISTEMOV.IDTESTACOMM=IMPEGNIORDPROD.IDTESTA and TEMPANALISILISTEMOV.IDRIGAORD=IMPEGNIORDPROD.IDRIGA and TEMPANALISILISTEMOV.IDRIGAIMPEGNO=IMPEGNIORDPROD.IDIMPEGNO)
	inner join (RIGHELISTAMOV inner join TESTELISTAMOV on TESTELISTAMOV.PROGRESSIVO=RIGHELISTAMOV.IDTESTA) 
		on TEMPANALISILISTEMOV.IDTESTALISTA=RIGHELISTAMOV.IDTESTA and TEMPANALISILISTEMOV.IDRIGALISTA=RIGHELISTAMOV.IDRIGA)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAANALISILISTEMOVIMP] TO [Metodo98]
    AS [dbo];

