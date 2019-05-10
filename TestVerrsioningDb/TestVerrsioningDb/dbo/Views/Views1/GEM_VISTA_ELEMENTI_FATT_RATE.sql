Create VIEW [dbo].[GEM_VISTA_ELEMENTI_FATT_RATE] AS
	SELECT 
		EF.idcontratto,
		EF.SezioneContratto,
		EF.IdRapporto,
		case EF.TipologiaElemento when 'F' then 'D' else EF.TipologiaElemento end as TipologiaElemento,
		case EF.TipologiaElemento 
		    when 'A' then 1000 
		    when 'M' then 2000 
			when 'O' then 3000 
			when 'R' then 3000 
			when 'F' then 5000 
			when 'D' then 
			    case DscrizioneRiga when 'Riepilogo Attività' then 999 
			                    when 'Riepilogo Materiali accessori al Vs. Contratto di Manutenzione' then 1999 
								when 'Riepilogo Lavoro' then 2999 
								else 0 
				end
		end as IDRIga,
		EF.CodArticolo,
		EF.DscrizioneRiga,
		SUM(EF.QTA) as qta,
		EF.Prezzo,
		EF.Sconto,
		round(isnull(EF.prezzo,0) * (1-(isnull(EF.sconto,0)/100)),5) AS PREZZONETTO,
		round((isnull(EF.prezzo,0) * (1-(isnull(EF.sconto,0)/100))*SUM(EF.QTA)),2) AS TOTNETTORIGA,
		round((isnull(EF.prezzo,0) *SUM(EF.QTA)),2) AS TOTLORDORIGA,
		EF.Provvigione1,
		EF.Provvigione2,
		EF.Provvigione3,
		EF.TipoFatturazione,
		EF.Validita,
		(EF.Posizione+EF.IdRiga) AS Posizione,
		ISNULL(TC.IdDivisione,0) TestaContr_IdDivisione,
		ISNULL(SC.IdDivisione,0) SezContr_IdDivisione
		-- EC PD1500231 PUNTO 5.5.5.3
		,ISNULL(SC.CodIva,0) SezContr_CodIva
		-- FINE EC PD1500231 PUNTO 5.5.5.3
	FROM dbo.GEM_SEZIONE_CONTRATTO_RAPPORTI_ELEMENTI_DA_FATTURARE EF
	LEFT OUTER JOIN dbo.GEM_TESTACONTRATTO TC ON TC.IDCONTRATTO = EF.IDCONTRATTO
	LEFT OUTER JOIN dbo.GEM_SEZIONICONTRATTO SC ON SC.IDCONTRATTO = EF.IDCONTRATTO AND SC.SEZIONECONTRATTO = EF.SezioneContratto
	--where idcontratto = 'S-08-00001237' and idrapporto = 0022
	GROUP BY 
		EF.idcontratto,
		EF.SezioneContratto,
		EF.IdRapporto,
		EF.TipologiaElemento,
		EF.CodArticolo,
		EF.DscrizioneRiga,
		EF.Prezzo,
		EF.Sconto,
		EF.Provvigione1,
		EF.Provvigione2,
		EF.Provvigione3,
		EF.TipoFatturazione,
		EF.Validita,
		(EF.Posizione+EF.IdRiga),
		TC.IdDivisione,
		SC.IdDivisione
		-- EC PD1500231 PUNTO 5.5.5.3
		,SC.CodIva
		-- FINE EC PD1500231 PUNTO 5.5.5.3	


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VISTA_ELEMENTI_FATT_RATE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VISTA_ELEMENTI_FATT_RATE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VISTA_ELEMENTI_FATT_RATE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VISTA_ELEMENTI_FATT_RATE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VISTA_ELEMENTI_FATT_RATE] TO [Metodo98]
    AS [dbo];

