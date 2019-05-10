
CREATE View TipoRigaDettaglio
As
Select 	IdTesta,
	IdRiga,
	TipoRiga,
	Valore1 = 	(Case TipoRiga
				When 'N' Then 	(Case 	When ScontiEstesi <> '100'
							Then 'L01'
							Else 'L09'
							End
						)
				When 'O' Then 'L03'
				else ''
				End
			),
	ScontiEstesi
From
(
select IdTesta,IdRiga,TipoRiga,ScontiEstesi
from Righedocumenti where tipodoc in (select codice from TabDocumentiEuritmo)
                      and Esercizio in (select codice from TabeserciziEuritmo) 
                      and tiporiga <> 'R' and tiporiga <> 'D' and tiporiga <> 'S' and tiporiga <> 'V'
) AS TabellaValori

GO
GRANT SELECT
    ON OBJECT::[dbo].[TipoRigaDettaglio] TO [Metodo98]
    AS [dbo];

