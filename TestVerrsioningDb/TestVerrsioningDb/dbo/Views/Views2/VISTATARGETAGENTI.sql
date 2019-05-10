

CREATE view VISTATARGETAGENTI AS 
select
	Codagente,
	Anno,Mese,
	TargetEuro,
	Target,
	(
		select
			sum((CASE WHEN ((SCADATTPASS<>0 AND SUBSTRING(CODCLIFOR,1,1)='F') OR(SCADATTPASS=0 AND SUBSTRING(CODCLIFOR,1,1)<>'F')) THEN(Imponibsceuro*-1) ELSE Imponibsceuro END))
		from 
				tabscadenze
		where
			(codage1=targetagenti.codagente or codage2=targetagenti.codagente or codage3=targetagenti.codagente)
			and
			(month(datafattura)=targetagenti.mese) 
			and
			(Year(datafattura)=targetagenti.anno)
	) as VendutoEuro,
	
	(
		select
			sum((CASE WHEN ((SCADATTPASS<>0 AND SUBSTRING(CODCLIFOR,1,1)='F') OR(SCADATTPASS=0 AND SUBSTRING(CODCLIFOR,1,1)<>'F')) THEN(ImponibscLit*-1) ELSE ImponibscLit END))
		from 
			tabscadenze 
		where 	(codage1=targetagenti.codagente or codage2=targetagenti.codagente or codage3=targetagenti.codagente)
			and
			(month(datafattura)=targetagenti.mese)
			and
			(Year(datafattura)=targetagenti.anno)
	) as Venduto 
from targetagenti
GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATARGETAGENTI] TO [Metodo98]
    AS [dbo];

