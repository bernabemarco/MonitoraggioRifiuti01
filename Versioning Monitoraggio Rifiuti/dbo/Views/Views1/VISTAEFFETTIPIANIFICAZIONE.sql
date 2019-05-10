create view [VISTAEFFETTIPIANIFICAZIONE] as
	select 
		isnull(TF0.IDSESSIONE,TF1.IDSESSIONE) as IDSESSIONE,
		isnull(TF0.TIPORECORD,TF1.TIPORECORD) as TIPORECORD,
		isnull(TF0.CODART,TF1.CODART) as CODART,
		isnull(TF0.CODCLIFOR,TF1.CODCLIFOR) as CODCLIFOR,
		isnull(TF0.QUANTITA,0) as QTAFASE0,isnull(TF1.QUANTITA,0) as QTAFASE1,
		(case when (not TF0.CODART is null) and (not TF1.CODART is null) then 
			case when (TF0.QUANTITA=TF1.QUANTITA) then
				0 /*record uguali*/
			else
				case when TF1.QUANTITA>TF0.QUANTITA then
					1 /*aumentata quantità*/
				else
					-1 /*diminuita quantità*/
				end				
			end
		else
			case when (TF0.CODART is null) then
				2 /*record aggiunto*/
			else
				3 /*record eliminato*/
			end
		end) as STATO
	from 
		VISTAEFFETTIPIANIFICAZIONE_FASE0 TF0 full join VISTAEFFETTIPIANIFICAZIONE_FASE1 TF1
		on TF0.IDSESSIONE=TF1.IDSESSIONE and TF0.TIPORECORD=TF1.TIPORECORD and TF0.CODART=TF1.CODART and TF0.CODCLIFOR=TF1.CODCLIFOR

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAEFFETTIPIANIFICAZIONE] TO [Metodo98]
    AS [dbo];

